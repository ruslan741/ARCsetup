local M = {}

-- Добавляем путь к внешней папке с цветами
local colors_path = vim.fn.expand("~/config/colors")
package.path = package.path .. ";" .. colors_path .. "/?.lua"

-- Загружаем цвета
M.colors = require("colors")

-- Функция установки цветовой схемы
function M.setup()
	-- Включение поддержки 24-битных цветов
	vim.opt.termguicolors = true

	-- Очистка существующих хайлайтов
	vim.cmd("highlight clear")
	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end

	local c = M.colors

	-- Таб активный (текущий)
	vim.api.nvim_set_hl(0, "TabLineSel", {
		fg = c.green,  -- цвет текста активного таба
		bg = c.green,  -- фон активного таба
	})

	-- Таб неактивный
	vim.api.nvim_set_hl(0, "TabLine", {
		fg = c.green,  -- цвет текста неактивного таба
		bg = c.green,  -- фон неактивного таба
	})

	-- Фон tabline (область справа от табов)
	vim.api.nvim_set_hl(0, "TabLineFill", {
		fg = c.green,  -- цвет текста (обычно не используется)
		bg = c.green,  -- фон пустой области табов
	})

	-- Разделитель между табами
	vim.api.nvim_set_hl(0, "TabLineSeparator", {
		fg = c.green,  -- цвет разделителя
		bg = c.green,  -- фон (должен совпадать с TabLineFill)
	})

	-- Разделитель активного таба
	vim.api.nvim_set_hl(0, "TabLineSelSeparator", {
		fg = c.green,  -- обычно совпадает с фоном активного таба
		bg = c.green,  -- фон
	})

	-- Разделитель при наведении
	vim.api.nvim_set_hl(0, "TabLineSeparatorHover", {
		fg = c.green,
		bg = c.green,
	})

	vim.api.nvim_set_hl(0, "VertSplit", {
		fg = c.gray_30,
	})

	-- Горизонтальный разделитель
	vim.api.nvim_set_hl(0, "WinSeparator", {
		fg = c.gray_30,
	})

	-- Установка имени схемы
	vim.g.colors_name = "mynvimscheme"

	-- Базовые настройки
	vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
	vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })

	-- Номера строк
	vim.api.nvim_set_hl(0, "LineNr", { fg = c.gray_20})
	vim.api.nvim_set_hl(0, "CursorLineNr", { fg = c.bg_20, bg = c.gray_20, bold = true })

	-- Цвет для пробелов
	vim.api.nvim_set_hl(0, "WhitespaceColor", { fg = c.cyan })

	-- Комментарии
	vim.api.nvim_set_hl(0, "Comment", { fg = c.gray_20, italic = true })

	-- Поиск
	vim.api.nvim_set_hl(0, "Search", { fg = c.purple_br, bg = c.gray_20 })
	vim.api.nvim_set_hl(0, "IncSearch", { fg = c.fg, bg = c.purple })

	-- Статусная строка
	vim.api.nvim_set_hl(0, "StatusLine", { fg = c.bg_20, bg = c.blue })

	-- Завершающие и парные скобки
	vim.api.nvim_set_hl(0, "MatchParen", { fg = c.bg_20, bg = c.green, bold = true })
	vim.api.nvim_set_hl(0, "Delimiter", { fg = c.yellow_br })      -- общая для всех скобок
	vim.api.nvim_set_hl(0, "Paren", { fg = c.cyan })        -- круглые ()
	vim.api.nvim_set_hl(0, "Curly", { fg = c.yellow })        -- фигурные {}

	-- Выделение
	vim.api.nvim_set_hl(0, "Visual", { fg = c.bg_20, bg = c.yellow })

	-- Ошибки и предупреждения
	vim.api.nvim_set_hl(0, "Error", { fg = c.red })
	vim.api.nvim_set_hl(0, "WarningMsg", { fg = c.yellow })

	-- Дополнительные синтаксические группы
	vim.api.nvim_set_hl(0, "String", { fg = c.green_br })
	vim.api.nvim_set_hl(0, "Number", { fg = c.purple_br })
	vim.api.nvim_set_hl(0, "Function", { fg = c.blue_br })
	vim.api.nvim_set_hl(0, "Keyword", { fg = c.purple })
	vim.api.nvim_set_hl(0, "Type", { fg = c.yellow_br })
	vim.api.nvim_set_hl(0, "Identifier", { fg = c.fg })
	vim.api.nvim_set_hl(0, "Constant", { fg = c.yellow })


	-- Настройка цветов для разных режимов
	M.setup_mode_colors()
end

-- Настройка цветов для разных режимов редактирования
function M.setup_mode_colors()
	-- Создаем группу autocmd
	local mode_group = vim.api.nvim_create_augroup("ModeColors", { clear = true })

	-- Обработчик изменения режима
	vim.api.nvim_create_autocmd({ "ModeChanged", "VimEnter", "WinEnter" }, {
		group = mode_group,
		callback = function()
			local mode = vim.api.nvim_get_mode().mode
			local color

			-- Выбор цвета в зависимости от режима
			local c = M.colors
			if mode == "n" or mode == "R" then
				color = c.blue
			elseif mode == "i" or mode == "a" then
				color = c.green
			elseif mode:match("[vV]") then
				color = c.yellow
			elseif mode == "c" then
				color = c.purple
			elseif mode == "r" or mode == "R" or mode == "?" then
				color = c.red
			else
				color = c.green
			end

			-- Устанавливаем цвет курсора
			vim.api.nvim_set_hl(0, "Cursor", { fg = c.bg_20, bg = color })
			vim.api.nvim_set_hl(0, "StatusLine", { fg = c.bg_20, bg = color })
			vim.api.nvim_set_hl(0, "Visual", { fg = c.bg_20, bg = color })
			vim.api.nvim_set_hl(0, "ModeMsg", { fg = c.bg_20, bg = color, bold = true })
		end
	})

	-- Вызываем сразу для установки начального цвета
	vim.api.nvim_exec_autocmds("ModeChanged", { group = mode_group })
end

return M
