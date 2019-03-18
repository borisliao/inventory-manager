const express = require('express');
const router = express.Router();

router.get('/:id', (req, res, next) => {
  res.send('Hello from items.js');
  console.log(req.params.id);
});

router.post('/:id', (req, res, next) => {});
//router.get('/', (req, res, next) => {
//res.render('index');
//});
module.exports = router;
