#!/usr/bin/env luvit

local Stack = require('stack')
local function handler(req, res)
  return Stack.stack(
    require('static')('/', {
      directory = __dirname,   -- root of static server
      max_age = 24*60*60*1000, -- cache for 1 day
      is_cacheable = function (file)
        return true
      end,                     -- can cache served files
    })
  )
end
require('http').create_server('0.0.0.0', 8080, handler())
print('Static file server listening at http://localhost:8080/')