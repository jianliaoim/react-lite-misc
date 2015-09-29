fs = require 'fs'
getport = require 'getport'

getport 8080, (err, port) ->
  throw new Error(err) if err
  fs.writeFileSync '.port', "#{ port }", 'utf8'