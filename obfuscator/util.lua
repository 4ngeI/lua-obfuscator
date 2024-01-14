local a = {}

function a.table_find(table,value)
    for i,v in pairs(table) do
        if v == value then
            return true
        end
    end
    return false
end

return a 