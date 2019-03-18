DROP TABLE items, orders, users;

CREATE TABLE users(
    psu_id INT(9) NOT NULL PRIMARY KEY
);

CREATE TABLE items (
  item_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  item_name VARCHAR(20),
  item_path VARCHAR(255),
  stock INT, 
  stat BOOLEAN
);

CREATE TABLE orders(
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    item_id INT,
    checkout_time TIMESTAMP,
    checkin_time TIMESTAMP,
    psu_id INT(9) NOT NULL,
    reason VARCHAR(100),
    FOREIGN KEY(psu_id)
    REFERENCES users(psu_id)
    ON DELETE CASCADE,
    FOREIGN KEY(item_id)
    REFERENCES items(item_id)
    ON DELETE CASCADE
);

DESC items;
DESC orders;
DESC users;

INSERT INTO users(psu_id)
VALUES(923390214),
      (931184119),
      (924496002),
      (937843995),
      (942789023);
  

INSERT INTO items(item_name,item_path,stock,stat)
VALUES('PS4','https://pics.me.me/deez-nuts-flavor-when-your-friends-ask-what-flavor-ifunny-co-14366310.png' ,1, 1),
      ('XBox One','https://pics.me.me/deez-nuts-flavor-when-your-friends-ask-what-flavor-ifunny-co-14366310.png', 2, 1),
      ('Vector Bot','https://pics.me.me/deez-nuts-flavor-when-your-friends-ask-what-flavor-ifunny-co-14366310.png', 1, 1),
      ('Curved Monitor','https://pics.me.me/deez-nuts-flavor-when-your-friends-ask-what-flavor-ifunny-co-14366310.png',3, 1),
      ('Nintendo Switch','https://scontent.fagc2-1.fna.fbcdn.net/v/t1.15752-9/s2048x2048/50870479_284317212234139_8727453028136779776_n.jpg?_nc_cat=109&_nc_ht=scontent.fagc2-1.fna&oh=eb5da0b718816bf48e63b4a3e9f89aee&oe=5D0DC52B',10, 1);

INSERT INTO orders (item_id, checkout_time, psu_id, reason) 
VALUES  (1,"2008-01-01 00:00:01", 923390214, 'deez nutz'),
        (2,"2010-01-01 00:10:21", 924496002, 'Git gud'),
        (1,"2018-02-14 18:00:00", 924496002, 'Valentines Day'),
        (4,"2018-02-14 15:40:01", 942789023 , 'Esther Kim');

SELECT * FROM items;
SELECT * FROM users;
SELECT * FROM orders;

SELECT * FROM orders WHERE order_id = 1;
SELECT * FROM orders WHERE checkout_time > "2009-01-14 18:00:00";
SELECT * FROM orders WHERE reason = 'Esther Kim';
SELECT * FROM orders WHERE psu_id = 924496002;