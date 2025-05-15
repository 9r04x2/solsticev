Locales = {}

function _(str, ...)
	if Locales[exports["G9-core"]:setLang()] then
		if Locales[exports["G9-core"]:setLang()][str] then
			return string.format(Locales[exports["G9-core"]:setLang()][str], ...)
		else
			return 'Translation [' .. exports["G9-core"]:setLang() .. '][' .. str .. '] does not exist'
		end
	end

	return 'Language [' .. exports["G9-core"]:setLang() .. '] does not exist'
end

function lang(str, ...)
	return tostring(_(str, ...):gsub("^%l", string.upper))
end
