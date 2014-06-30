#!/usr/bin/env node

var createMiniHarp = require('../lib/index.js');
var argv = require('minimist')(process.argv.slice(2));

var app = createMiniHarp();
var port = argv.port||4000;

console.log('Starting mini-harp on http://localhost:'+ port);

app.use(function(req, res, next) {
  var currentUrl = req.url.slice(1);

  if (currentUrl === 'current-time') {
    var currentTime = (new Date()).toISOString();
    res.end(currentTime);
  } else {
    next();
  }
});
app.listen(port);
