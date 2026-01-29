#!/bin/bash

# Настройки
CACHE_FILE="/tmp/polybar_bluetooth_cache"
CACHE_TTL=2
TIMEOUT=3

# Функция получения уровня батареи через разные методы
get_battery_level() {
    local mac="$1"
    local battery=""
    
    # Способ 1: Через bluetoothctl (если поддерживается устройством)
    battery=$(timeout $TIMEOUT bluetoothctl info "$mac" 2>/dev/null | \
        grep -i "battery" | \
        sed -n 's/.*(\([0-9]*\)%).*/\1/p')
    
    # Если не получили через bluetoothctl, пробуем через DBus
    if [ -z "$battery" ]; then
        # Способ 2: Через DBus (для устройств с поддержкой Battery Level)
        battery=$(dbus-send --system --dest=org.bluez --print-reply=literal \
            "/org/bluez/hci0/dev_$(echo $mac | tr ':' '_')" \
            org.freedesktop.DBus.Properties.Get \
            string:"org.bluez.Battery1" string:"Percentage" 2>/dev/null | \
            grep -o "[0-9]*" | head -1)
    fi
    
    # Способ 3: Через upower (если устройство отображается как устройство питания)
    if [ -z "$battery" ] && command -v upower &> /dev/null; then
        battery=$(upower -d | grep -A 10 "$mac" | grep -i "percentage" | \
            grep -o "[0-9]*" | head -1)
    fi
    
    echo "$battery"
}

# Функция получения иконки батареи
get_battery_icon() {
    local level="$1"
    
    # Nerd Fonts иконки батареи
    if [ -z "$level" ]; then
        echo ""
    elif [ "$level" -ge 95 ]; then
        echo "󰁹 "
    elif [ "$level" -ge 90 ]; then
        echo "󰂂 "
    elif [ "$level" -ge 80 ]; then
        echo "󰂁 "
    elif [ "$level" -ge 70 ]; then
        echo "󰂀 "
    elif [ "$level" -ge 60 ]; then
        echo "󰁿 "
    elif [ "$level" -ge 50 ]; then
        echo "󰁾 "
    elif [ "$level" -ge 40 ]; then
        echo "󰁽 "
    elif [ "$level" -ge 30 ]; then
        echo "󰁼 "
    elif [ "$level" -ge 20 ]; then
        echo "󰁻 "
    elif [ "$level" -ge 10 ]; then
        echo "󰁺 "
    elif [ "$level" -ge 5 ]; then
        echo "󰁺 "
    else
        echo "󰂎 "
    fi
}

# Основная функция отображения
update_bluetooth_data() {
    local output=""
    
    # Проверка статуса Bluetooth
    if ! systemctl is-active "bluetooth.service" --quiet 2>/dev/null; then
        echo "󰂲" > "$CACHE_FILE"
        return
    fi
    
    if ! timeout $TIMEOUT bluetoothctl show 2>/dev/null | grep -q "Powered: yes"; then
        echo "󰂲" > "$CACHE_FILE"
        return
    fi
    
    # Получаем подключенные устройства
    local connected_count=0
    local device_list=""
    local devices_info=""
    
    # Используем массив для хранения информации
    declare -A devices_array
    
    # Получаем список подключенных устройств
    while IFS= read -r line; do
        if [[ "$line" =~ ^Device\ ([0-9A-F:]+)\ (.*)$ ]]; then
            mac="${BASH_REMATCH[1]}"
            name="${BASH_REMATCH[2]}"
            
            # Проверяем, подключено ли устройство
            device_info=$(timeout $TIMEOUT bluetoothctl info "$mac" 2>/dev/null)
            if echo "$device_info" | grep -q "Connected: yes"; then
                # Получаем Alias (если есть)
                alias_name=$(echo "$device_info" | grep "Alias" | cut -d' ' -f2-)
                [ -n "$alias_name" ] && name="$alias_name"
                
                # Получаем уровень батареи
                battery_level=$(get_battery_level "$mac")
                battery_icon=$(get_battery_icon "$battery_level")
                
                # Формируем строку устройства
                device_display="$name"
                if [ -n "$battery_icon" ] && [ -n "$battery_level" ]; then
                    device_display="$name $battery_icon$battery_level%"
                fi
                
                devices_array["$mac"]="$device_display"
                connected_count=$((connected_count + 1))
                
                # Сохраняем детальную информацию
                devices_info="$devices_info$name|$battery_level|$mac;"
            fi
        fi
    done < <(timeout $TIMEOUT bluetoothctl devices 2>/dev/null)
    
    # Формируем вывод для Polybar
    if [ $connected_count -eq 0 ]; then
        output="󰂯"
    elif [ $connected_count -eq 1 ]; then
        # Берем первое (и единственное) устройство из массива
        for key in "${!devices_array[@]}"; do
            output="󰂱 ${devices_array[$key]}"
            break
        done
    else
        # Для нескольких устройств
        first_device=""
        for key in "${!devices_array[@]}"; do
            if [ -z "$first_device" ]; then
                first_device="${devices_array[$key]}"
                break
            fi
        done
        output="󰂱 $first_device (+$(($connected_count - 1)))"
    fi
    
    # Сохраняем информацию для кликов
    echo "$devices_info" > "/tmp/bluetooth_devices_info"
    echo "$connected_count" > "/tmp/bluetooth_connected_count"
    
    # Выводим результат
    echo "$output" > "$CACHE_FILE"
}

# Функция для получения данных (с кэшированием)
get_cached_data() {
    if [ -f "$CACHE_FILE" ]; then
        local cache_age=$(($(date +%s) - $(stat -c %Y "$CACHE_FILE" 2>/dev/null || echo 0)))
        if [ $cache_age -lt $CACHE_TTL ]; then
            cat "$CACHE_FILE"
            return
        fi
    fi
    
    update_bluetooth_data
    cat "$CACHE_FILE" 2>/dev/null || echo "󰂯"
}

# Обработка аргументов
case "$1" in
    --toggle)
        if timeout $TIMEOUT bluetoothctl show 2>/dev/null | grep -q "Powered: no"; then
            bluetoothctl power on
            notify-send -t 2000 "Bluetooth" "Включен" -i bluetooth
        else
            # Отключаем все устройства
            timeout $TIMEOUT bluetoothctl devices Connected 2>/dev/null | \
                while read -r _ mac _; do
                    bluetoothctl disconnect "$mac" >/dev/null 2>&1
                done
            sleep 0.5
            bluetoothctl power off
            notify-send -t 2000 "Bluetooth" "Выключен" -i bluetooth
        fi
        rm -f "$CACHE_FILE"
        sleep 1
        update_bluetooth_data
        ;;
        
    --info)
        # Показываем детальную информацию
        if [ -f "/tmp/bluetooth_devices_info" ]; then
            info=$(cat "/tmp/bluetooth_devices_info")
            message=""
            IFS=';' read -ra DEVICES <<< "$info"
            for device in "${DEVICES[@]}"; do
                if [ -n "$device" ]; then
                    IFS='|' read -ra PARTS <<< "$device"
                    name="${PARTS[0]}"
                    battery="${PARTS[1]}"
                    if [ -n "$battery" ] && [ "$battery" != "" ]; then
                        message="$message$name: $battery%\n"
                    else
                        message="$message$name\n"
                    fi
                fi
            done
            if [ -n "$message" ]; then
                notify-send -t 3000 "Подключенные устройства" "$message" -i bluetooth
            fi
        fi
        ;;
        
    --debug)
        # Режим отладки
        echo "=== Bluetooth Debug ==="
        echo "Service status: $(systemctl is-active bluetooth.service 2>/dev/null || echo 'inactive')"
        echo "Powered: $(timeout $TIMEOUT bluetoothctl show 2>/dev/null | grep 'Powered' || echo 'unknown')"
        echo "--- Connected devices ---"
        timeout $TIMEOUT bluetoothctl devices Connected 2>/dev/null
        echo "--- All paired devices ---"
        timeout $TIMEOUT bluetoothctl devices Paired 2>/dev/null
        echo "--- Battery test for first device ---"
        first_mac=$(timeout $TIMEOUT bluetoothctl devices Paired 2>/dev/null | head -1 | awk '{print $2}')
        if [ -n "$first_mac" ]; then
            echo "Testing battery for: $first_mac"
            get_battery_level "$first_mac"
        fi
        ;;
        
    *)
        get_cached_data
        ;;
esac
