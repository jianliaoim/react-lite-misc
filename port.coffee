fs = require 'fs'
net = require 'net'

getPort = (port, cb) ->
  connect = net.connect port, ->
    connect.destroy()
    getPort port + 1, cb
  connect.on 'error', ->
    cb port

writePort = (port) ->
  getPort port, (port) ->
    fs.writeFileSync '.port', "#{ port }", 'utf8'

writePort 8080
