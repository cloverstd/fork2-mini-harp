connect = require 'connect'
serveStatic = require 'serve-static'
makeJade = require './processor/jade'


createMiniHarp = (staticPath)->
  staticPath = if staticPath then staticPath else process.cwd()
  app = connect()
    .use (req, res, next) ->
      requestPath = req.url.slice 1
      if requestPath is 'current-time'
        body = (new Date()).toISOString()
        res.end body
      else
        next()
    .use (serveStatic staticPath)
    .use (makeJade staticPath)


module.exports = createMiniHarp
