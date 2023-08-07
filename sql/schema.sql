CREATE TABLE book (
  id INT REFERENCES item(id) NOT NULL,
  publisher varchar(150),
  cover_state varchar(150)
);

CREATE TABLE label(
  id SERIAL,
  title varchar(150),
  color varchar(150),
  PRIMARY KEY (id)
);

