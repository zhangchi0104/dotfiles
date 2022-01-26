-- hitokoto.lua
-- Author: Chi Zhang
-- Date 15/01/2022
-- Caches hitokoto from server to local
local M = {}
local sleep = require('plenary.async.util').sleep
local Path = require('plenary.path')
local Job = require('plenary.job')
local a = require('plenary.async.async')
local curl = require('plenary.curl')
local with = require'plenary.context_manager'.with
local open = require'plenary.context_manager'.open

local HITOKOTO_FILE = Path:new(vim.fn.stdpath('data')) / 'hitokoto.txt'
local MAX_LINES = 10

local function format_hitokoto(resp)
  local hitokoto = resp.hitokoto
  local from_who = ''
  if type(resp.from_who) == 'string' then
    from_who = ' ' .. resp.from_who
  end

  local source = ' ' .. resp.from
  return string.format('%s --%s《%s》', hitokoto, from_who, source)
end

local function fetch_hitokoto()
  local resp = curl.get({
    url = 'https://v1.hitokoto.cn/?c=a&encode=json',
    accept = 'application/json'
  })
  local resp_json = vim.fn.json_decode(resp.body)
  local hitokoto = format_hitokoto(resp_json)
  return hitokoto
end

-- Selects a random quote from json
function M.quote()
  if not HITOKOTO_FILE:exists() then
    M.cache()
    return fetch_hitokoto()
  else
    with(open(HITOKOTO_FILE, 'r'), function(reader)
      lines = vim.fn.split(reader:read('*all'), '\n')
    end)
    return lines[math.random(1, 10)]
  end
end

-- Caches 10 quotes to file
function M.cache()
  local hito
  local wrapped =  a.wrap(function(l, cb)
    local hitokoto = fetch_hitokoto()
    table.insert(l, hitokoto)
    cb()
  end, 2)
  local voided = a.void(function()
    local hitokotos = {}
    for i = 1, MAX_LINES, 1
    do
      wrapped(hitokotos)
      sleep(400)
    end
    local s = table.concat(hitokotos, '\n')
    with(open(HITOKOTO_FILE, 'w'), function(reader)
      reader:write(s)
      print('Done caching')
    end)
  end)
  voided()
end


return M
