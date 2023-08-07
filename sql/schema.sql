CREATE TABLE book (
  id INT REFERENCES item(id) NOT NULL,
  publisher varchar(150),
  cover_state varchar(150)
);

