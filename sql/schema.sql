CREATE TABLE
    genre (id SERIAL, name VARCHAR(150), PRIMARY KEY (id))
    
CREATE TABLE
    music_album (
        id SERIAL,
        publish_date date,
        id_author int,
        id_genre int,
        id_label int,
        on_spotify BOOLEAN,
        CONSTRAINT fk_author_game FOREIGN KEY (id_author) REFERENCES author (id),
        CONSTRAINT fk_genre_game FOREIGN KEY (id_genre) REFERENCES genre (id),
        CONSTRAINT fk_label_game FOREIGN KEY (id_label) REFERENCES label (id)
    )