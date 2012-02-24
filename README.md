Fast static server stack layer for Luvit
=====

Usage
-----

```lua
local Stack = require('stack')
local function handler(req, res)
  return Stack.stack(
    -- serve '/PATH' from the current direcory
    require('static')('/', {
      directory = __dirname,   -- root of static server
      max_age = 24*60*60*1000, -- cache for 1 day
      is_cacheable = function (file)
        return true
      end,                     -- can cache served files
    })
  )
end
require('http').createServer(handler()):listen(8080, '0.0.0.0')
print('Static file server listening at http://localhost:8080/')
```

License
-------

[MIT](luvit-static/license.txt)
