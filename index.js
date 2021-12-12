const express = require('express');
const session = require('express-session');
const path = require('path');
const PORT = process.env.PORT || 5000;

require('dotenv').config();

express()
  .use(express.static('public'))
  // .use(express.static(path.join(__dirname, 'public')))
  // .use(function(){
  //     express.static(__dirname + '/public');
  //     session({
  //     secret: process.env.sec,
  //     resave: true,
  //     saveUninitialized: true
  //     });
  // })
  .set('views', path.join(__dirname, 'views'))
  .set('view engine', 'ejs')
  .get('/', (req, res) => {
      var imgFolder= path.join(__dirname, 'public/img')
      res.render('pages/index');
      res.send(imgFolder);
        }
      )
  .get('/test', (req, res) => res.render('pages/test'))
  .get('/about', (req, res, next) => {
      res.render('pages/about');
      // res.locals.user = req.session.user;
      // next();
  })
  .listen(PORT, () => console.log(`Listening on ${ PORT }`))
