path = require 'path'

rejectStuipRequests = ->
  (req, res, next) ->
    filetype = path.extname req.url
    switch filetype
      when '.jade', '.less'
        res.statusCode = 404
        res.end()
      else
        do next


module.exports = rejectStuipRequests
