const express = require('express');
const router = require('./router');
const helmet = require('helmet');

const cors = require('cors');
const morgan = require('morgan');
const app = express();

const path = require('path');
const port = process.env.PORT || 8000;

app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));
app.use('/static', express.static('static'));

app.use(morgan('combined'));
app.use(cors());
app.use(helmet({
  contentSecurityPolicy: false
}))

app.use(router); // Requests processing will be defined in the file router

app.listen(port, () => {
  console.log('Server app listening on port ' + port);
});

module.exports = app;