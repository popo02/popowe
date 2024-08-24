local type         = type
local setmetatable = setmetatable
local load         = load
local assert       = assert
local error        = error
local stringSub    = string.sub
local stringMatch  = string.match
local stringFind   = string.find
local stringUnpack = string.unpack

local m = {}

local mt = {}
mt.__index = mt

local function splitDefine(def, i)
    local k, fmt = stringMatch(def, '^(.-)%:(.+)$')
    local index
    local a, b = stringFind(fmt,'%[.-%]')
    if a then
        index = stringSub(fmt, a + 1, b - 1)
        fmt = stringSub(fmt, 1, a - 1)
    end
    if k == nil or #k == 0 then
        k = i
    end
    return k, fmt, index
end

local function execute(self, code, index)
    local cache = self._cache[code]
    if cache then
        cache.mt.__index = index
    else
        cache = {}
        cache.mt   = { __index = index }
        cache.func = assert(load('return ' .. code, code, 't', setmetatable({}, cache.mt)))
        self._cache[code] = cache
    end
    local res = cache.func()
    return res
end

function mt:decode(hex)
    local define = self._define
    local idx = 1
    local root = {
        _BufferSize = #hex,
    }
    setmetatable(root, { __index = _G })
    local buildExp, buildChunk, buildCase

    local curSize = {}

    buildExp = function (ct, exp, i, stack)
        local k, fmt, index = splitDefine(exp, i)
        local fmtDef = define[fmt]
        --print(idx,exp,fmtDef,fmt,k)
        fmt = define[fmt] or fmt
        if fmtDef then
            if index then
                local cal = stringMatch(index, '^%??(.*)')
                if cal then
                    cal = execute(self, cal, ct)
                else
                    error('格式错误:' .. index)
                end
                ct[k] = setmetatable({}, ct)
                ct[k].__index = ct[k]
                if stringSub(index, 1, 1) == '?' then
                    --cal是size
                    curSize[stack] = cal
                    local idx2 = 1
                    while curSize[stack] > 0 do
                        ct[k][idx2] = setmetatable({}, ct[k])
                        buildChunk(ct[k][idx2], fmtDef, stack)
                        idx2 = idx2 + 1
                    end
                    --assert(cur_size[stack] == 0, cur_size[stack] .. '块大小不符合:' .. index)
                    curSize[stack] = nil
                else
                    if type(fmtDef) == 'table' then
                        for x = 1, cal do
                            ct[k][x] = setmetatable({}, ct[k])
                            buildChunk(ct[k][x], fmtDef, stack)
                        end
                    else
                        --别名(支持数组)
                        for x = 1, cal do
                            buildExp(ct[k], fmtDef, x, ct)
                        end
                    end
                end
                ct[k].__index = nil
            else
                ct[k] = setmetatable({}, ct)
                buildChunk(ct[k], fmtDef, stack)
            end
        else
            local curidx = idx
            ct[k], idx = stringUnpack(fmt, hex, idx)
            --print(ct[k])
            local size = idx - curidx
            for key, value in next, curSize do
                curSize[key] = value - size
                -- print('size',key,cur_size[key])
            end
        end
    end

    buildCase = function (ct, case, i, stack)
        local caseResult = execute(self, case.case, ct)
        if caseResult then
            -- print(case.case..':true')
            buildExp(ct, case.exp, i, stack)
        end
    end

    buildChunk = function (ct, cdef, stack)
        ct.__index = ct
        if type(cdef) == 'string' then
            --别名
            buildExp(ct, cdef, 1, stack + 1)
        else
            for i = 1, #cdef do
                local child = cdef[i]
                if type(child) == 'string' then
                    buildExp(ct, child, i, stack + 1)
                elseif child.type == 'case' then
                    buildCase(ct, child, i, stack + 1)
                end
            end
        end
        ct[''] = nil
        ct.__index = nil
    end

    buildChunk(root, define, 0)

    root._BufferSize = nil

    return root
end
function mt:encode(data)
    local define = self._define
    local buf = {}
    local buildChunk, buildExp, buildCase

	local map = {}

    buildExp = function (ct, exp, i, stack)
        local k, fmt, index = splitDefine(exp, i)
        local fmtDef = define[fmt]
        if fmtDef then
            if index then
                --对象数组
                -- print('1',k,fmt,index,i,stack,fmtDef,#ct[k])
                --管那么多干啥,直接遍历
                local l=#ct[k]
                for x=1,l do
                    buildChunk(ct[k][x], fmtDef, stack)
                end
            else
                --对象
                -- print('2',k,fmt,index,i,stack,fmtDef)
                buildChunk(ct[k], fmtDef, stack)
            end
        else
            --基础类型
            -- print('3',k,fmt,index,i,stack,fmtDef,type(ct)=='table' and ct[k] or ct)
            if type(ct)~='table' then
                buf[#buf+1] = fmt:pack(ct)
            else
                local v = ct[k]
                if v then
                    buf[#buf+1] = fmt:pack(v)
                else
                    if fmt == 'z' then
                        buf[#buf+1] = '\0'
                    else
                        local size = fmt:packsize()
                        buf[#buf+1] = ('\0'):rep(size)
                    end
                end
            end
        end
    end

    buildCase = function (ct, case, i, stack)
        local caseResult = execute(self, case.case, ct)
        -- local caseResult = execute(self, case.case, function (_, k)
        --     for a = stack, 0, -1 do
        --         if map[a] then
        --             local v = map[a][k]
        --             if v then
        --                 return v
        --             end
        --         end
        --     end
        -- end)
        if caseResult then
            buildExp(ct, case.exp, i, stack)
        end
    end

    buildChunk = function (ct, cdef, stack)
		map[stack] = ct
        for i = 1, #cdef do
            if type(cdef)=='string' then
                --别名
                buildExp(ct, cdef, i, stack + 1)
                break
            elseif type(cdef[i]) == 'string' then
                buildExp(ct, cdef[i], i, stack + 1)
            elseif cdef[i].type == 'case' then
                -- TODO
                buildCase(ct, cdef[i], i, stack + 1)
            end
        end
    end

    --进行预处理,设置所有数组的__index
    local function init_obj(obj)
        for key, value in pairs(obj) do
            if type(value)=='table' then
                setmetatable(value,{__index = obj})
                init_obj(value)
            end
        end
    end
    init_obj(data)

    buildChunk(data, define, 0)

    return table.concat(buf)
end

function m.case(case, exp)
    return {
        type = 'case',
        case = case,
        exp  = exp,
    }
end

function m.define(t)
    return setmetatable({
        _define = t,
        _encode = nil,
        _decode = nil,
        _cache  = {},
    }, mt)
end

return m
