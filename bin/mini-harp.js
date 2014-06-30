#!/usr/bin/env node

var createMiniHarp = require('../lib/index.js');
var argv = require('minimist')(process.argv.slice(2));

var app = createMiniHarp();
var port = argv.port||4000;

console.log('Starting mini-harp on http://localhost:'+ port);
app.listen(port);
