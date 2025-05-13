local M = {}

local strTest1 = {"Test string", "[ ] Test String 2", "[x] Test String 3"}
table.insert(strTest1, "		[][ ][ ] Test String x")

function M.markString(s)
	local arrCheck = {"%[%]","%[ %]","%[x%]"} --need to escape [ ] characters
	local checkboxState = { unchecked =1, checked = 2, missing =3}
	local arrCheckDict = {[checkboxState.unchecked] ="%[%]",[checkboxState.unchecked]="%[ %]",
	[checkboxState.checked]="%[x%]"} --need to escape [ ] characters
	local search, searchend = nil, nil
	local updatedString = nil
	local leadingSpaces = nil
	--print string
	print("String to check")
	print(s)
	--check if [] or [ ] or [x] is in string
	--check that is the first thing on the string
	for i, v in ipairs(arrCheckDict) do
		search, searchend = string.find(s,v)
		leadingSpaces = s:match("^%s+") -- : passes self as first parameter
		if search ~= nil then
			print("string "..v .." found")
			--print("key value " ..  i)
			local sub = v.gsub(v, "%%", "")
			print(sub)	--this will print only first return value of gsub
			print(v.gsub(v, "%%", "")) --replace %% with ""
			if i == checkboxState.unchecked then
			--	print("##checking line##)
			--	print(string.sub(s,searchend+1,#(s)))
				updatedString =  arrCheckDict[checkboxState.checked]..string.sub(s,searchend+1,#(s))
				updatedString = string.gsub(updatedString,"%%","")
				--print(updatedString)
			elseif i == checkboxState.checked then
				updatedString = arrCheckDict[checkboxState.unchecked]..string.sub(s,searchend+1,#(s))
				updatedString = string.gsub(updatedString,"%%","")
				--print(updatedString)
			end
			break
		else
				updatedString = arrCheckDict[checkboxState.unchecked]..string.sub(s,1,#(s))
				updatedString = string.gsub(updatedString,"%%","")
				--print(updatedString)
		end
	end
	if search == nil then
		print("marker strings not found")
		updatedString = arrCheckDict[checkboxState.unchecked] .. s
		updatedString = string.gsub(updatedString,"%%","")
	elseif leadingSpaces ~= nil then
		updatedString = leadingSpaces .. updatedString
		print(updatedString)
	end
	vim.api.nvim_buf_set_lines(0, vim.fn.line('.') - 1, vim.fn.line('.'), false, {updatedString})

	return updatedString
end

function M.checkLine()
	M.markString(tostring(vim.api.nvim_get_current_line()))
end

-- to set a keybind
-- vim.keymap.set('n', '<leader>i', function()
	--     require('checkLine').checkLine()
	--     end, { desc = 'Checkbox a line' })

return M

--M.markString(strTest1[1])
--M.markString(strTest1[2])
--M.markString(strTest1[3])
--M.markString(strTest1[#strTest1])
