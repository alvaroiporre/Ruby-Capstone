CREATE TABLE item (
  id SERIAL,
  publish_date date,
  id_author int,
  id_genre int,
  id_label int,
  PRIMARY KEY (id),
  CONSTRAINT fk_author_game FOREIGN KEY (id_author) REFERENCES author (id),
  CONSTRAINT fk_genre_game FOREIGN KEY (id_genre) REFERENCES genre (id),
  CONSTRAINT fk_label_game FOREIGN KEY (id_label) REFERENCES label (id)
);

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

CREATE TABLE author (
  id SERIAL,
  first_name varchar(50),
  last_name varchar(50),
  PRIMARY KEY (id)
);

CREATE TABLE game (
  id int REFERENCES item (id) NOT NULL,
  multiplayer varchar(50),
  last_played_at date,
  PRIMARY KEY (id)
);

CREATE TABLE genre (
  id SERIAL, 
  name VARCHAR(150), 
  PRIMARY KEY (id)
  );
    
CREATE TABLE music_album (
  id SERIAL,
  publish_date date,
  id_author int,
  id_genre int,
  id_label int,
  on_spotify BOOLEAN,
  CONSTRAINT fk_author_game FOREIGN KEY (id_author) REFERENCES author (id),
  CONSTRAINT fk_genre_game FOREIGN KEY (id_genre) REFERENCES genre (id),
  CONSTRAINT fk_label_game FOREIGN KEY (id_label) REFERENCES label (id)
  );