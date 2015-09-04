var express = require('express');
var morgan = require('morgan');

var app = express();
app.use(morgan('dev'));

app.get('/', function (req, res) {
  res.send(process.env);
});

var server = app.listen(process.env.PORT, function(){
  console.log('[Listening]');
});
