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
            if err
              next()
            else
              html = do jade.compile data
              res.setHeader('Content-Length', html.length)
              res.end html

        else
          # HTML document
          res.setHeader('Content-Length', data.length)
          res.end data

    else
      next()


module.exports = makeJade
