
#ifndef YDWEXweiObjectSlkIncluded
#define YDWEXweiObjectSlkIncluded

<?import("YDWEXweiObjectSlk.lua")[[
    local slk = require 'jass.slk'
    
    local mt = {}

    --- ID转字符串
    local function id2s(a)
        local suc,id = xpcall(string.pack,function()
            print('错误的pack参数',a,debug.traceback())
        end,'>I4',a)
        return suc and id or '0'
    end
    --- 字符串转ID
    local function s2id(a)
        local suc,id = xpcall(string.unpack,function()
            print('错误的unpack参数',a,debug.traceback())
        end,'>I4',a)
        return suc and id or 0
    end
    --- 字符串转ID
    function string:to256()
        return s2id(self)
    end
    --- ID转字符串
    function math.idToString(id)
        return id2s(id)
    end

    local function isString(object)
        return type(object) == 'string'
    end

    local function split(str, p)
        local rt = {}
        str:gsub('[^'..p..']+', function (w)
            table.insert(rt, w)
        end)
        return rt
    end

    local typeList = {
        ['ability'] = {
            'DataA';
            'DataB';
            'DataC';
            'DataD';
            'DataE';
            'DataF';
            'DataG';
            'Untip';
            'Unubertip';
            'Tip';
            'Ubertip';
            'BuffID';
            'Cast';
            'Cool';
            'targs';
            'EfctID';
            'Dur';
            'HeroDur';
            'Cost';
            'Rng';
            'Area';
        };
        ['upgrade'] = {
            'Requires';
            'Requiresamount';
            'EditorSuffix';
            'Name';
            'HotKey';
            'Tip';
            'Ubertip';
            'Art';
        };
    }

    local levelList = {}
    for type, object in pairs(typeList) do
        levelList[type] = {}
        for index, data in ipairs(object) do
            levelList[type][data] = index
        end
    end

    local slkData = {}

    -- 懒加载
    local function lazyLoadingLevelField(data, type, objectId)
        local list
        local value
        local object = data[objectId]
        local ratingField = typeList[type]
        local objectTable = {}
        for _, Name in ipairs(ratingField) do
            objectTable[Name] = {}
            value = object[Name]
            if value then
                list = split(value, ',')
                for index = 1, #list do
                    objectTable[Name][index] = list[index]
                end
            end
        end
        return objectTable
    end

    --- 单位
    mt.unit = function(id, dataId)
        if isString(id) then
            id = id:to256()
        end
        return slk.unit[id][dataId] or ''
    end;
    --- 物品
    mt.item = function(id, dataId)
        if isString(id) then
            id = id:to256()
        end
        return slk.item[id][dataId] or ''
    end;
    --- 技能
    mt.ability = function(id, dataId)
        if isString(id) then
            id = id:to256()
        end
        local level = tonumber(dataId:sub(-1))
        if levelList.ability[dataId] then
            level = level or 1
        end
        local result = slk.ability[id][dataId .. (level or '')]
        if result == nil and levelList.ability[dataId] then
            level = level or 1
            if not slkData[id] then
                slkData[id] = lazyLoadingLevelField(slk.ability, 'ability', id)
            end
            result = slkData[id][dataId][level] or ''
            if result == nil or result == '' then
                result = slk.ability[id][dataId] or ''
            end
        end
        return result
    end;
    --- 科技
    mt.upgrade = function(id, dataId)
        if isString(id) then
            id = id:to256()
        end
        local level = tonumber(dataId:sub(-1))
        if levelList.ability[dataId] then
            level = level or 1
        end
        local result = slk.upgrade[id][dataId .. (level or '')]
        if result == nil and levelList.upgrade[dataId] then
            level = level or 1
            if not slkData[id] then
                slkData[id] = lazyLoadingLevelField(slk.upgrade, 'upgrade', id)
            end
            result = slkData[id][dataId][level] or ''
            if result == nil or result == '' then
                result = slk.upgrade[id][dataId] or ''
            end
        end
        return result
    end;
    --- 魔法效果
    mt.buff = function(id, dataId)
        if isString(id) then
            id = id:to256()
        end
        return slk.buff[id][dataId] or ''
    end;
    --- 可破坏物
    mt.destructable = function(id, dataId)
        if isString(id) then
            id = id:to256()
        end
        return slk.destructable[id][dataId] or ''
    end;
    --- 地形装饰物
    mt.doodad = function(id, dataId)
        if isString(id) then
            id = id:to256()
        end
        return slk.doodad[id][dataId] or ''
    end;

    return mt
]]?>

#endif /// YDWEXweiObjectSlkIncluded
