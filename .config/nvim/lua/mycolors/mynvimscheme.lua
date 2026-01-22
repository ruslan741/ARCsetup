local M = {}

-- Добавляем путь к внешней папке с цветами
local colors_path = vim.fn.expand("~/.config/config/colors")
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

	-- -- Для CSS
	-- vim.api.nvim_set_hl(0, "cssTagName", { fg = c.green })
	-- vim.api.nvim_set_hl(0, "cssClassName", { fg = c.green })
	-- vim.api.nvim_set_hl(0, "cssIdentifier", { fg = c.green })
	-- vim.api.nvim_set_hl(0, "cssProp", { fg = c.green })
	-- vim.api.nvim_set_hl(0, "cssDefinition", { fg = c.green })
	-- vim.api.nvim_set_hl(0, "cssAttr", { fg = c.green })
	-- vim.api.nvim_set_hl(0, "cssAttrRegion", { fg = c.green })
	-- vim.api.nvim_set_hl(0, "cssColor", { fg = c.green })
	-- vim.api.nvim_set_hl(0, "cssValueNumber", { fg = c.green })
	-- vim.api.nvim_set_hl(0, "cssUnitDecorators", { fg = c.green })


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

	-- =============================================
	-- TREESITTER ХАЙЛАЙТЫ ДЛЯ JSX/LSX (РЕАКТ/РЕЗОРМ)
	-- =============================================

	-- Основные теги JSX
	vim.api.nvim_set_hl(0, "@tag", { fg = c.blue_br }) -- JSX теги в целом (div, span, etc)
	vim.api.nvim_set_hl(0, "@tag.delimiter", { fg = c.blue_br }) -- Разделители тегов: < > </>
	vim.api.nvim_set_hl(0, "@tag.builtin", { fg = c.cyan }) -- Встроенные HTML теги (div, p, span, etc)
	vim.api.nvim_set_hl(0, "@tag.attribute", { fg = c.yellow }) -- Атрибуты JSX: className, onClick, etc
	vim.api.nvim_set_hl(0, "@tag.attribute.builtin", { fg = c.orange }) -- Встроенные атрибуты: key, ref, children

	-- React компоненты
	vim.api.nvim_set_hl(0, "@constructor", { fg = c.yellow_br }) -- Пользовательские компоненты: <MyComponent>
	vim.api.nvim_set_hl(0, "@constructor.jsx", { fg = c.yellow_br }) -- То же что @constructor
	vim.api.nvim_set_hl(0, "@constructor.tsx", { fg = c.yellow_br }) -- Для TypeScript компонентов

	-- JSX выражения и интерполяция
	vim.api.nvim_set_hl(0, "@punctuation.special", { fg = c.cyan, bold = true }) -- Фигурные скобки: {expression}
	vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = c.fg }) -- Скобки внутри выражений: {() => {}}
	vim.api.nvim_set_hl(0, "@punctuation.delimiter", { fg = c.gray_30 }) -- Двоеточия, точки с запятой в выражениях

	-- Строки и литералы в JSX
	vim.api.nvim_set_hl(0, "@string", { fg = c.green_br }) -- Строковые литералы в атрибутах
	vim.api.nvim_set_hl(0, "@string.special", { fg = c.green }) -- Специальные строки (URL, пути)
	vim.api.nvim_set_hl(0, "@string.escape", { fg = c.orange }) -- Экранированные символы в строках

	-- Функции и методы в JSX
	vim.api.nvim_set_hl(0, "@function", { fg = c.blue_br }) -- Функции внутри JSX
	vim.api.nvim_set_hl(0, "@function.call", { fg = c.blue_br }) -- Вызовы функций: {myFunction()}
	vim.api.nvim_set_hl(0, "@function.builtin", { fg = c.purple }) -- Встроенные функции: console.log, require
	vim.api.nvim_set_hl(0, "@method", { fg = c.blue }) -- Методы объектов: {obj.method()}
	vim.api.nvim_set_hl(0, "@method.call", { fg = c.blue }) -- Вызовы методов

	-- Переменные и свойства
	vim.api.nvim_set_hl(0, "@variable", { fg = c.fg }) -- Переменные: {variable}
	vim.api.nvim_set_hl(0, "@variable.builtin", { fg = c.purple }) -- Встроенные переменные: this, props, state
	vim.api.nvim_set_hl(0, "@property", { fg = c.cyan }) -- Свойства объектов: {obj.prop}
	vim.api.nvim_set_hl(0, "@field", { fg = c.cyan }) -- Поля объектов (аналогично @property)
	vim.api.nvim_set_hl(0, "@variable.member", { fg = c.cyan }) -- Члены объектов

	-- Ключевые слова
	vim.api.nvim_set_hl(0, "@keyword", { fg = c.purple }) -- Ключевые слова: if, else, return
	vim.api.nvim_set_hl(0, "@keyword.conditional", { fg = c.purple }) -- Условные: if, else, switch
	vim.api.nvim_set_hl(0, "@keyword.loop", { fg = c.purple }) -- Циклы: for, while, do
	vim.api.nvim_set_hl(0, "@keyword.return", { fg = c.purple, bold = true }) -- return
	vim.api.nvim_set_hl(0, "@keyword.function", { fg = c.purple }) -- function, arrow
	vim.api.nvim_set_hl(0, "@keyword.operator", { fg = c.purple }) -- new, typeof, instanceof

	-- Операторы
	vim.api.nvim_set_hl(0, "@operator", { fg = c.green }) -- Операторы: +, -, *, /
	vim.api.nvim_set_hl(0, "@operator.special", { fg = c.orange }) -- Специальные операторы: spread (...), optional (?.)
	vim.api.nvim_set_hl(0, "@operator.ternary", { fg = c.green }) -- Тернарный оператор: ? :

	-- Константы и литералы
	vim.api.nvim_set_hl(0, "@constant", { fg = c.yellow }) -- Константы
	vim.api.nvim_set_hl(0, "@constant.builtin", { fg = c.purple }) -- Встроенные константы: true, false, null
	vim.api.nvim_set_hl(0, "@constant.macro", { fg = c.orange }) -- Макросы/константы верхнего уровня
	vim.api.nvim_set_hl(0, "@number", { fg = c.purple_br }) -- Числа: 1, 2.5, 0xFF
	vim.api.nvim_set_hl(0, "@number.float", { fg = c.purple_br }) -- Числа с плавающей точкой
	vim.api.nvim_set_hl(0, "@boolean", { fg = c.purple }) -- Булевы значения: true, false
	vim.api.nvim_set_hl(0, "@null", { fg = c.purple }) -- null
	vim.api.nvim_set_hl(0, "@undefined", { fg = c.purple }) -- undefined

	-- Комментарии
	vim.api.nvim_set_hl(0, "@comment", { fg = c.gray_20, italic = true }) -- Комментарии
	vim.api.nvim_set_hl(0, "@comment.documentation", { fg = c.gray_30, italic = true }) -- JSDoc комментарии
	vim.api.nvim_set_hl(0, "@comment.error", { fg = c.red }) -- Ошибочные комментарии
	vim.api.nvim_set_hl(0, "@comment.warning", { fg = c.yellow }) -- Предупреждающие комментарии
	vim.api.nvim_set_hl(0, "@comment.todo", { fg = c.blue, bold = true }) -- TODO, FIXME, NOTE

	-- Параметры и аргументы
	vim.api.nvim_set_hl(0, "@parameter", { fg = c.orange }) -- Параметры функций: (param) => {}
	vim.api.nvim_set_hl(0, "@parameter.reference", { fg = c.orange }) -- Ссылки на параметры
	vim.api.nvim_set_hl(0, "@parameter.builtin", { fg = c.purple }) -- Встроенные параметры: event, e

	-- Типы (для TypeScript)
	vim.api.nvim_set_hl(0, "@type", { fg = c.yellow_br }) -- Типы: string, number, boolean
	vim.api.nvim_set_hl(0, "@type.builtin", { fg = c.yellow_br }) -- Встроенные типы
	vim.api.nvim_set_hl(0, "@type.definition", { fg = c.yellow_br }) -- Определения типов
	vim.api.nvim_set_hl(0, "@type.qualifier", { fg = c.purple }) -- Квалификаторы: const, let, readonly
	vim.api.nvim_set_hl(0, "@namespace", { fg = c.cyan }) -- Пространства имен

	-- Модули и импорты/экспорты
	vim.api.nvim_set_hl(0, "@module", { fg = c.cyan }) -- Модули
	vim.api.nvim_set_hl(0, "@module.builtin", { fg = c.cyan }) -- Встроенные модули
	vim.api.nvim_set_hl(0, "@include", { fg = c.blue }) -- Директивы импорта: import, require
	vim.api.nvim_set_hl(0, "@include.call", { fg = c.blue }) -- Вызовы импортов

	-- Специальные группы для JSX
	vim.api.nvim_set_hl(0, "@tag.fragment", { fg = c.blue_br }) -- JSX фрагменты: <> </>
	vim.api.nvim_set_hl(0, "@tag.fragment.delimiter", { fg = c.blue_br }) -- Разделители фрагментов
	vim.api.nvim_set_hl(0, "@tag.attribute.event", { fg = c.orange }) -- Обработчики событий: onClick, onChange
	vim.api.nvim_set_hl(0, "@tag.attribute.style", { fg = c.yellow }) -- Атрибут style
	vim.api.nvim_set_hl(0, "@tag.attribute.class", { fg = c.yellow }) -- Классы: className, class
	vim.api.nvim_set_hl(0, "@tag.attribute.id", { fg = c.yellow }) -- ID: id
	vim.api.nvim_set_hl(0, "@tag.attribute.href", { fg = c.yellow }) -- Ссылки: href, src
	vim.api.nvim_set_hl(0, "@tag.attribute.aria", { fg = c.green }) -- ARIA атрибуты

	-- Специальные символы JSX
	vim.api.nvim_set_hl(0, "@symbol", { fg = c.cyan }) -- Символы
	vim.api.nvim_set_hl(0, "@character", { fg = c.green_br }) -- Одиночные символы
	vim.api.nvim_set_hl(0, "@character.special", { fg = c.orange }) -- Специальные символы

	-- Декораторы и аннотации
	vim.api.nvim_set_hl(0, "@attribute", { fg = c.orange }) -- Декораторы (TypeScript)
	vim.api.nvim_set_hl(0, "@annotation", { fg = c.blue }) -- Аннотации

	-- Группы для отладки и разработки
	vim.api.nvim_set_hl(0, "@debug", { fg = c.red }) -- Отладочные директивы
	vim.api.nvim_set_hl(0, "@define", { fg = c.blue }) -- Директивы определения
	vim.api.nvim_set_hl(0, "@preproc", { fg = c.purple }) -- Препроцессорные директивы

	-- Контекстные группы
	vim.api.nvim_set_hl(0, "@context", { fg = c.gray_30 }) -- Контекстные ключевые слова
	vim.api.nvim_set_hl(0, "@text", { fg = c.fg }) -- Обычный текст
	vim.api.nvim_set_hl(0, "@text.strong", { fg = c.fg, bold = true }) -- Жирный текст
	vim.api.nvim_set_hl(0, "@text.emphasis", { fg = c.fg, italic = true }) -- Курсив
	vim.api.nvim_set_hl(0, "@text.underline", { fg = c.fg, underline = true }) -- Подчеркнутый
	vim.api.nvim_set_hl(0, "@text.strike", { fg = c.gray_30, strikethrough = true }) -- Зачеркнутый
	vim.api.nvim_set_hl(0, "@text.title", { fg = c.purple, bold = true }) -- Заголовки в комментариях
	vim.api.nvim_set_hl(0, "@text.literal", { fg = c.green_br }) -- Буквальный текст
	vim.api.nvim_set_hl(0, "@text.uri", { fg = c.blue, underline = true }) -- URI/ссылки
	vim.api.nvim_set_hl(0, "@text.math", { fg = c.cyan }) -- Математические выражения
	vim.api.nvim_set_hl(0, "@text.reference", { fg = c.blue }) -- Ссылки
	vim.api.nvim_set_hl(0, "@text.environment", { fg = c.yellow }) -- Окружение
	vim.api.nvim_set_hl(0, "@text.environment.name", { fg = c.yellow_br }) -- Имена окружений

	-- Списки
	vim.api.nvim_set_hl(0, "@text.list", { fg = c.fg }) -- Списки
	vim.api.nvim_set_hl(0, "@text.list.checked", { fg = c.green }) -- Отмеченные пункты
	vim.api.nvim_set_hl(0, "@text.list.unchecked", { fg = c.gray_30 }) -- Неотмеченные пункты

	-- Ошибки и предупреждения
	vim.api.nvim_set_hl(0, "@error", { fg = c.red }) -- Синтаксические ошибки
	vim.api.nvim_set_hl(0, "@warning", { fg = c.yellow }) -- Предупреждения
	vim.api.nvim_set_hl(0, "@note", { fg = c.blue }) -- Заметки
	vim.api.nvim_set_hl(0, "@danger", { fg = c.red, bold = true }) -- Опасные конструкции

	-- Группы для LSP
	vim.api.nvim_set_hl(0, "@lsp.type.class", { fg = c.yellow_br }) -- Классы (LSP)
	vim.api.nvim_set_hl(0, "@lsp.type.enum", { fg = c.yellow_br }) -- Enum (LSP)
	vim.api.nvim_set_hl(0, "@lsp.type.interface", { fg = c.yellow_br }) -- Интерфейсы (LSP)
	vim.api.nvim_set_hl(0, "@lsp.type.struct", { fg = c.yellow_br }) -- Структуры (LSP)
	vim.api.nvim_set_hl(0, "@lsp.type.type", { fg = c.yellow_br }) -- Типы (LSP)
	vim.api.nvim_set_hl(0, "@lsp.type.typeParameter", { fg = c.orange }) -- Параметры типов (LSP)
	vim.api.nvim_set_hl(0, "@lsp.type.parameter", { fg = c.orange }) -- Параметры (LSP)
	vim.api.nvim_set_hl(0, "@lsp.type.variable", { fg = c.fg }) -- Переменные (LSP)
	vim.api.nvim_set_hl(0, "@lsp.type.property", { fg = c.cyan }) -- Свойства (LSP)
	vim.api.nvim_set_hl(0, "@lsp.type.enumMember", { fg = c.cyan }) -- Члены enum (LSP)
	vim.api.nvim_set_hl(0, "@lsp.type.function", { fg = c.blue_br }) -- Функции (LSP)
	vim.api.nvim_set_hl(0, "@lsp.type.method", { fg = c.blue_br }) -- Методы (LSP)
	vim.api.nvim_set_hl(0, "@lsp.type.macro", { fg = c.orange }) -- Макросы (LSP)
	vim.api.nvim_set_hl(0, "@lsp.type.decorator", { fg = c.orange }) -- Декораторы (LSP)
	vim.api.nvim_set_hl(0, "@lsp.type.namespace", { fg = c.cyan }) -- Пространства имен (LSP)
	vim.api.nvim_set_hl(0, "@lsp.typemod.variable.readonly", { fg = c.purple }) -- Только для чтения (LSP)

	-- Директивы React
	vim.api.nvim_set_hl(0, "@directive", { fg = c.purple }) -- Директивы: "use client", "use strict"
	vim.api.nvim_set_hl(0, "@directive.js", { fg = c.purple }) -- JavaScript директивы
	vim.api.nvim_set_hl(0, "@directive.ts", { fg = c.purple }) -- TypeScript директивы

	-- Специальные выражения JSX
	vim.api.nvim_set_hl(0, "@jsx.expression", { fg = c.cyan }) -- JSX выражения
	vim.api.nvim_set_hl(0, "@jsx.expression.container", { fg = c.cyan, bold = true }) -- Контейнеры выражений
	vim.api.nvim_set_hl(0, "@jsx.text", { fg = c.fg }) -- Текстовое содержимое JSX

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
