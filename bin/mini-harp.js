#!/usr/bin/env node

var createMiniHarp = require('../lib/index.js');
var argv = require('minimist')(process.argv.slice(2));

var port = argv.port||4000;

var app = createMiniHarp(argv._[0]);

console.log('Starting mini-harp on http://localhost:'+ port);
app.listen(port);
