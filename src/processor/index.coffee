makeIndex = ->
  (req, res, next) ->
    if req.url is '/'
      req.url = '/index.html'
    next()

module.exports = makeIndex
