const express = require('express');
const connection = require('../database');
const router = express.Router();

/* GET home page. */
router.get('/', (req, res, next) => {
  connection.query('SELECT 1 + 1 AS solution', function(err, rows, fields) {
    if (err) throw err;

    console.log('The solution is: ', rows[0].solution);
  });
  res.render('index');
});

router.get('/items', (req, res, next) => {
  res.render('inventory');
});

router.get('/items/:id', (req, res, next) => {
  connection.query(
    'SELECT * FROM items WHERE item_id = ?',
    req.params.id,
    (err, rows, fields) => {
      if (err) throw err;
      res.render('items', {
        name: rows[0].item_name,
        stock: rows[0].stock,
        item_url: rows[0].item_path,
        status: rows[0].stat
      });
    }
  );
});

module.exports = router;
