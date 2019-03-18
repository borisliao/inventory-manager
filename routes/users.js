const express = require('express');
const router = express.Router();

/* GET home page. */
router.get('/:id', (req, res, next) => {
  res.send('Hello World');
});

module.exports = router;
