fs = require 'fs'
path = require 'path'
url = require 'url'
less = require 'less'

makeLess = (root) ->
  (req, res, next) ->
    filetype = path.extname req.url
    filename = "#{root}#{req.url}"
    if filetype is '.css'

      fs.readFile filename, {'encoding': 'utf8'}, (err, data) ->
        if err
          filename = filename.replace /css$/, 'less'
          fs.readFile filename, {'encoding': 'utf8'}, (err, data) ->
            if err
              next()
            else
              less.render data, (err, css) ->
                if err then next() else res.end css

        else
          # HTML document
          res.end data

    else
      next()


module.exports = makeLess
