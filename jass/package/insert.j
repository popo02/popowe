//将resource  跟 plugin 导入到地图中
<?
local seach_path
local version = tonumber(tostring(ydwe_version):sub(1, 4)) or 0  --ydwe的版本号
local count = 0
if version == 1.31 or version == 0 then --计算当前地图mpq 的文件数量 扩容512
    local ffi = require 'ffi'
    local stormlib = ffi.load('stormlib')
    local file = __map_handle__:load_file('(listfile)')
    if file then 
        for _ in pairs(__map_handle__) do 
            count = count + 1
        end 
        stormlib.SFileSetMaxFileCount(__map_handle__.handle, count + 512)
    end 
end

function input_file(path, root)
    local full_path = path:string() --文件全路径
    local file_name = path:filename():string() --文件名
    local extension = path:extension():string() --文件后缀
    --if extension == '.lua' then 
        --全路径 替换成 script\ 开头的相对路径
        local target_path = full_path:sub(root:string():len() + 1)
        if target_path:sub(1, 1) == '\\' then 
            target_path = target_path:sub(2)
        end
        if version >= 1.32 then 
            --要先创建一个文件夹
            fs.create_directories((__map_path__ / target_path):parent_path())
             --放到地图文件夹目录下
            fs.copy_file(path, __map_path__ / target_path, true)
        elseif version == 1.31 or version == 0 then
            __map_handle__:add_file(target_path, path)
        end
    --end
end
--搜索文件
local function seach_file(path, root)
    --遍历文件目录
    for child in path:list_directory() do 
        --如果是文件夹 则再进入一层
        if fs.is_directory(child) then 
            seach_file(child, root)
        else 
            --否则 直接处理文件
            input_file(child, root)
        end
    end
end
local function split(str, p)
    local rt = {}
    string.gsub(str, '[^' .. p .. ']+', function (w) table.insert(rt, w) end)
    return rt
end
local function absolute(path)
    local str = path:string()
    local list = split(str, '\\')
    local i = #list 
    local result = {}
    while i > 0 do 
        local s = list[i]
        if s ~= '..' and s ~= '.' then 
            table.insert(result, 1, s)
        end
        if s == '..' then 
            i = i - 1
        end 
        i = i - 1
    end
    table.insert(result, '')
    return table.concat(result, '\\')
end


local root = fs.path([[jass\package\plugin\]])
local code = [[
local storm = require 'jass.storm'

-- 测试模式
local is_local = &debug

if is_local then 
local local_map_path = &path
package.path = package.path .. ";"
.. local_map_path .. "?\\init.lua;"
.. local_map_path .. "scripts\\?.lua;"
.. local_map_path .. "scripts\\?\\init.lua;"
.. local_map_path .. "scripts\\core\\?.lua;"
.. local_map_path .. "scripts\\core\\?\\init.lua;"
package.local_map_path = local_map_path
package.local_test = true
package.load_step = 1
else 
package.path = package.path .. ";"
    .. "?\\init.lua;"
    .. "scripts\\?.lua;"
    .. "scripts\\?\\init.lua;"
    .. "scripts\\core\\?.lua;"
    .. "scripts\\core\\?\\init.lua;"
end

return is_local
]]

if fs.exists(root / 'path.lua') then 
    fs.remove(root / 'path.lua')
end 

local code2 = code:gsub('&path', string.format("%q",absolute(fs.absolute(root))))
if JAPI_DEBUG then 
    code2 = code2:gsub("&debug", "true")
else 
    code2 = code2:gsub("&debug", "false")
end 
io.save(root / 'path.lua', code2)
seach_file(root, root)
?>


//导入内置的jass载入脚本
#include "embedded.j" 



<?local SFDRWJ = true ?> // 是否开启导入 地图目录下的 import  文件

// 导入文件
library DRWJ
      
    <?
    
    --[[
                
            载入地图所在目录  import 下的文件 
            不在文件夹的 路径为 无
            在文件夹内的 按照文件夹名给路径
            
            --]]
    
            if SFDRWJ then
                local root = __map_path__:parent_path()

                local function input_file(file,root)
                    local relative = file:string():gsub(root:string(),'')
                    __map_handle__:add_file(relative,file)
                end
                
                local function import_path(path,root)
                    for p in path:list_directory() do
                        if fs.is_directory(p) then
                        import_path(p,root)
                        else
                        input_file(p,root)
                        end
                    end
                end
                local import_root = root / "import/"
                import_path(import_root,import_root)
            end
    ?>
endlibrary



