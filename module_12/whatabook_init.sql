/*
	Chip Gardiner 
	Assignment 10.3 
	whatabook_init.sql
	Final Project, Database creation for whatabook
*/


-- drop test user if exists 
DROP USER IF EXISTS 'whatabook_user'@'localhost';

-- create whatabook_user and grant them all privileges to the whatabook database 
CREATE USER 'whatabook_user'@'localhost' IDENTIFIED WITH mysql_native_password BY 'MySQL8IsGreat!';

-- grant all privileges to the whatabook database to user whatabook_user on localhost 
GRANT ALL PRIVILEGES ON whatabook.* TO'whatabook_user'@'localhost';

-- drop contstraints if they exist
ALTER TABLE wishlist DROP FOREIGN KEY fk_book;
ALTER TABLE wishlist DROP FOREIGN KEY fk_user;

-- drop tables if they exist
DROP TABLE IF EXISTS store;
DROP TABLE IF EXISTS book;
DROP TABLE IF EXISTS wishlist;
DROP TABLE IF EXISTS user;

-- table creation

CREATE TABLE store (
    store_id    INT             NOT NULL    AUTO_INCREMENT,
    locale      VARCHAR(500)    NOT NULL,
    PRIMARY KEY(store_id)
);

CREATE TABLE book (
    book_id     INT             NOT NULL    AUTO_INCREMENT,
    book_name   VARCHAR(200)    NOT NULL,
    author      VARCHAR(200)    NOT NULL,
    details     VARCHAR(500),
    PRIMARY KEY(book_id)
);

CREATE TABLE user (
    user_id         INT         NOT NULL    AUTO_INCREMENT,
    first_name      VARCHAR(75) NOT NULL,
    last_name       VARCHAR(75) NOT NULL,
    PRIMARY KEY(user_id) 
);

CREATE TABLE wishlist (
    wishlist_id     INT         NOT NULL    AUTO_INCREMENT,
    user_id         INT         NOT NULL,
    book_id         INT         NOT NULL,
    PRIMARY KEY (wishlist_id),
    CONSTRAINT fk_book
    FOREIGN KEY (book_id)
        REFERENCES book(book_id),
    CONSTRAINT fk_user
    FOREIGN KEY (user_id)
        REFERENCES user(user_Id)
);

-- insert store 

INSERT INTO store(locale)
    VALUES('1000 Galvin Rd S, Bellevue, NE 68005');

-- insert books

INSERT INTO book(book_name, author, details)
    VALUES('Blankets', 'Craig Thompson', 'Autobiographical graphic novel');

INSERT INTO book(book_name, author, details)
    VALUES('Scott Pilgrim's Precious Little Life', 'Bryan Lee O'Malley', 'The first part of The Scott Pilgrim Series');

INSERT INTO book(book_name, author, details)
    VALUES('The Selection', 'Keira Cass', 'The first part of The Selection Series');

INSERT INTO book(book_name, author)
    VALUES('Shopgirl', 'Steve Martin');

INSERT INTO book(book_name, author)
    VALUES('Dune', 'Frank Herbert', 'Now a Major Motion Picture');

INSERT INTO book(book_name, author)
    VALUES("Charlotee's Web", 'E.B. White');

INSERT INTO book(book_name, author)
    VALUES('The Great Gatsby', 'F. Scott Fitzgerald');

INSERT INTO book(book_name, author)
    VALUES('The Lion, the Witch, and the Wardrobe', 'C.S. Lewis');

INSERT INTO book(book_name, author)
    VALUES('Pollyanna','Eleanor H. Porter');

-- insert users
INSERT INTO user(first_name, last_name) 
    VALUES('Chip', 'Gardiner');

INSERT INTO user(first_name, last_name)
    VALUES('Eliot', 'Wright');

INSERT INTO user(first_name, last_name)
    VALUES('Juliet', 'Marriott');

-- insert wishlist records 
INSERT INTO wishlist(user_id, book_id) 
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'Chip'), 
        (SELECT book_id FROM book WHERE book_name = 'Shopgirl')
    );

INSERT INTO wishlist(user_id, book_id)
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'Eliot'),
        (SELECT book_id FROM book WHERE book_name = 'Dune')
    );

INSERT INTO wishlist(user_id, book_id)
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'Juliet'),
        (SELECT book_id FROM book WHERE book_name = 'Pollyanna')
    );