fs = require 'fs'
path = require 'path'
url = require 'url'
jade = require 'jade'

makeJade = (root) ->
  (req, res, next) ->
    filetype = path.extname req.url
    filename = "#{root}#{req.url}"

    if filetype is '.html'
      filename = filename.replace /html$/, 'jade'
    else
      next()

    fs.readFile filename, {'encoding': 'utf8'}, (err, data) ->
      if err then next()
      res.end jade.compile data

module.exports = makeJade
