local storm = require 'jass.storm'
-- 测试模式
local is_local = false
if is_local then 
local local_map_path = "D:\\popowe\\WorldEdit v1.2.9c\\jass\\package\\plugin\\"
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
