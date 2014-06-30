connect = require 'connect'


createMiniHarp = ->
  app = connect()
    .use (req, res, next) ->
      requestPath = req.url.slice 1
      if requestPath is 'current-time'
        body = (new Date()).toISOString()
        res.end body
      else
        next()


module.exports = createMiniHarp
