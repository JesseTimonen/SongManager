-- Check the size of an array
function getLenght(array)
	-- Check is array empty --
	if array == nil then return 0; end
    
    -- Get size --
	local count = 0;
	for a, b in pairs(array) do
		count = count + 1;
    end
    
	return count;
end


-- Check if value is in array --
function inArray(array, value)
	if (array[value] == value) then
		return true;
	end

	return false;
end


-- Check if value is in table --
function inTable(array, value)
	for index, val in ipairs(array) do
		if (val == value) then
			return true;
		end
	end

    return false;
end


-- Remove value from table --
function table_removeKey(table, key)
    local element = table[key]
    table[key] = nil
    return element
end