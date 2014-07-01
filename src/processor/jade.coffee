fs = require 'fs'
path = require 'path'
url = require 'url'
jade = require 'jade'

makeJade = (root) ->
  (req, res, next) ->
    filetype = path.extname req.url
    filename = "#{root}#{req.url}"
    if filetype is '.html'

      fs.readFile filename, {'encoding': 'utf8'}, (err, data) ->
        if err
          filename = filename.replace /html$/, 'jade'
          fs.readFile filename, {'encoding': 'utf8'}, (err, data) ->
            if err then next()
            res.end do jade.compile data

        else
          # HTML document
          res.end data

    else
      next()


module.exports = makeJade
