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
	})

	-- Таб неактивный
	vim.api.nvim_set_hl(0, "TabLine", {
		fg = c.green,  -- цвет текста неактивного таба
	})

	-- Фон tabline (область справа от табов)
	vim.api.nvim_set_hl(0, "TabLineFill", {
		fg = c.green,  -- цвет текста (обычно не используется)
	})

	-- Разделитель между табами
	vim.api.nvim_set_hl(0, "TabLineSeparator", {
		fg = c.green,  -- цвет разделителя
	})

	-- Разделитель активного таба
	vim.api.nvim_set_hl(0, "TabLineSelSeparator", {
		fg = c.green,  -- обычно совпадает с фоном активного таба
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

	vim.api.nvim_set_hl(0, "javaScriptFunction", { fg = c.blue_br })
	vim.api.nvim_set_hl(0, "javaScriptIdentifier", { fg = c.purple })
	vim.api.nvim_set_hl(0, "javaScriptMember", { fg = c.fg })
	vim.api.nvim_set_hl(0, "javaScriptNumber", { fg = c.purple_br })
	vim.api.nvim_set_hl(0, "javaScriptNull", { fg = c.purple })
	vim.api.nvim_set_hl(0, "javaScriptBraces", { fg = c.fg })
	vim.api.nvim_set_hl(0, "javaScriptParens", { fg = c.fg })
	vim.api.nvim_set_hl(0, "javaScriptOperator", { fg = c.fg })
	vim.api.nvim_set_hl(0, "javaScriptType", { fg = c.yellow_br })
	vim.api.nvim_set_hl(0, "javaScriptStatement", { fg = c.purple })
	vim.api.nvim_set_hl(0, "javaScriptConditional", { fg = c.purple })
	vim.api.nvim_set_hl(0, "javaScriptRepeat", { fg = c.purple })
	vim.api.nvim_set_hl(0, "javaScriptLabel", { fg = c.purple })
	vim.api.nvim_set_hl(0, "javaScriptException", { fg = c.purple })
	vim.api.nvim_set_hl(0, "javaScriptGlobal", { fg = c.yellow })
	vim.api.nvim_set_hl(0, "javaScriptMessage", { fg = c.blue_br })
	vim.api.nvim_set_hl(0, "javaScriptBracket", { fg = c.fg })


	-- Для JSX
	vim.api.nvim_set_hl(0, "jsxTag", { fg = c.blue_br }) -- JSX теги
	vim.api.nvim_set_hl(0, "jsxTagName", { fg = c.blue_br }) -- Имена тегов
	vim.api.nvim_set_hl(0, "jsxComponentName", { fg = c.yellow_br }) -- Компоненты React
	vim.api.nvim_set_hl(0, "jsxCloseString", { fg = c.blue_br }) -- />
	vim.api.nvim_set_hl(0, "jsxAttrib", { fg = c.yellow }) -- Атрибуты JSX
	vim.api.nvim_set_hl(0, "jsxString", { fg = c.green_br }) -- Строки в JSX
	vim.api.nvim_set_hl(0, "jsxEqual", { fg = c.fg }) -- = в атрибутах
	vim.api.nvim_set_hl(0, "jsxDot", { fg = c.fg }) -- Точки в className
	vim.api.nvim_set_hl(0, "jsxBraces", { fg = c.fg }) -- {} в JSX
	vim.api.nvim_set_hl(0, "jsxPunct", { fg = c.blue_br }) -- Знаки пунктуации
	vim.api.nvim_set_hl(0, "jsxCloseTag", { fg = c.blue_br }) -- Закрывающие теги
	vim.api.nvim_set_hl(0, "jsxCloseTagName", { fg = c.blue_br }) -- Имена закрывающих тегов
	vim.api.nvim_set_hl(0, "jsxExpressionBlock", { fg = c.fg })

	-- Для CSS
	vim.api.nvim_set_hl(0, "cssTagName", { fg = c.green })
	vim.api.nvim_set_hl(0, "cssClassName", { fg = c.green })
	vim.api.nvim_set_hl(0, "cssIdentifier", { fg = c.green })
	vim.api.nvim_set_hl(0, "cssProp", { fg = c.green })
	vim.api.nvim_set_hl(0, "cssDefinition", { fg = c.green })
	vim.api.nvim_set_hl(0, "cssAttr", { fg = c.green })
	vim.api.nvim_set_hl(0, "cssAttrRegion", { fg = c.green })
	vim.api.nvim_set_hl(0, "cssColor", { fg = c.green })
	vim.api.nvim_set_hl(0, "cssValueNumber", { fg = c.green })
	vim.api.nvim_set_hl(0, "cssUnitDecorators", { fg = c.green })


	-- HTML стандартная разметка (базовая подсветка Vim)
	vim.api.nvim_set_hl(0, "htmlTag", { fg = c.blue_br }) -- < >
	vim.api.nvim_set_hl(0, "htmlEndTag", { fg = c.blue_br }) -- </ >
	vim.api.nvim_set_hl(0, "htmlTagName", { fg = c.blue_br }) -- div, span, a и т.д.
	vim.api.nvim_set_hl(0, "htmlSpecialTagName", { fg = c.blue_br }) -- !DOCTYPE, script, style
	vim.api.nvim_set_hl(0, "htmlArg", { fg = c.yellow }) -- Атрибуты: class, id, href
	vim.api.nvim_set_hl(0, "htmlString", { fg = c.green_br }) -- Значения атрибутов в кавычках
	vim.api.nvim_set_hl(0, "htmlValue", { fg = c.green_br }) -- Значения атрибутов
	vim.api.nvim_set_hl(0, "htmlSpecialChar", { fg = c.orange }) -- &nbsp; &lt; и т.д.
	vim.api.nvim_set_hl(0, "htmlComment", { fg = c.comment }) -- <!-- комментарии -->
	vim.api.nvim_set_hl(0, "htmlCommentPart", { fg = c.comment }) -- Внутри комментариев
	vim.api.nvim_set_hl(0, "htmlLink", { fg = c.blue }) -- Ссылки
	vim.api.nvim_set_hl(0, "htmlH1", { fg = c.purple, bold = true }) -- Заголовки
	vim.api.nvim_set_hl(0, "htmlH2", { fg = c.purple, bold = true })
	vim.api.nvim_set_hl(0, "htmlH3", { fg = c.purple, bold = true })
	vim.api.nvim_set_hl(0, "htmlH4", { fg = c.purple, bold = true })
	vim.api.nvim_set_hl(0, "htmlH5", { fg = c.purple, bold = true })
	vim.api.nvim_set_hl(0, "htmlH6", { fg = c.purple, bold = true })
	vim.api.nvim_set_hl(0, "htmlBold", { fg = c.fg, bold = true }) -- <b>, <strong>
	vim.api.nvim_set_hl(0, "htmlItalic", { fg = c.fg, italic = true }) -- <i>, <em>
	vim.api.nvim_set_hl(0, "htmlUnderline", { fg = c.fg, underline = true }) -- <u>
	vim.api.nvim_set_hl(0, "htmlBoldItalic", { fg = c.fg, bold = true, italic = true })
	vim.api.nvim_set_hl(0, "htmlBoldUnderline", { fg = c.fg, bold = true, underline = true })
	vim.api.nvim_set_hl(0, "htmlBoldItalicUnderline", { fg = c.fg, bold = true, italic = true, underline = true })

	-- Общие улучшения
	vim.api.nvim_set_hl(0, "Comment", { fg = c.gray_30 }) -- Комментарии
	vim.api.nvim_set_hl(0, "Operator", { fg = c.green }) -- Операторы (+, -, =)
	vim.api.nvim_set_hl(0, "Special", { fg = c.green }) -- Специальные символы
	vim.api.nvim_set_hl(0, "PreProc", { fg = c.green }) -- Препроцессорные директивы

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
