#!/bin/bash

VPN_NAME="ruslan"
CACHE_FILE="/tmp/polybar_vpn_status"
UPDATE_INTERVAL=2

# Функция проверки реального статуса (без изменения состояния)
check_real_status() {
    if nmcli -t -f NAME connection show --active | grep -q "^${VPN_NAME}$"; then
        echo " On"
        return 0
    else
        echo " Off"
        return 1
    fi
}

# Функция переключения VPN
toggle_vpn() {
    # Сначала проверяем реальный статус
    if check_real_status > /dev/null; then
        # VPN подключен - отключаем
        nmcli connection down "$VPN_NAME" >/dev/null 2>&1
        sleep 1
        echo ""
        notify-send -t 2000 "VPN" "Отключение от $VPN_NAME" -i network-vpn
    else
        # VPN отключен - подключаем
        nmcli connection up "$VPN_NAME" >/dev/null 2>&1
        sleep 2  # Даем больше времени на подключение
        echo ""
        notify-send -t 2000 "VPN" "Подключение к $VPN_NAME..." -i network-vpn
    fi
    
    # Очищаем кэш, чтобы сразу отобразился новый статус
    rm -f "$CACHE_FILE"
}

# Обычное обновление статуса (без переключения)
update_status() {
    status=$(check_real_status)
    echo "$status" > "$CACHE_FILE"
    echo "$status"
}

# Обработка аргументов
case "${1:-}" in
    --toggle)
        # Только переключение по клику
        toggle_vpn
        ;;
    *)
        # Обычный вывод статуса с кэшированием
        if [ -f "$CACHE_FILE" ]; then
            cache_age=$(($(date +%s) - $(stat -c %Y "$CACHE_FILE" 2>/dev/null || echo 0)))
            if [ $cache_age -lt $UPDATE_INTERVAL ]; then
                cat "$CACHE_FILE"
                exit 0
            fi
        fi
        
        update_status
        ;;
esac
