CREATE TABLE genres (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);


CREATE TABLE artistgenres (
    artist_id INTEGER NOT NULL REFERENCES artists(id) ON DELETE CASCADE,
    genres_id INTEGER NOT NULL REFERENCES genres(id) ON DELETE CASCADE,
    PRIMARY KEY (artist_id, genres_id)
);


CREATE TABLE artists (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);


CREATE TABLE artistalbums (
    artist_id INTEGER REFERENCES artists(id) ON DELETE CASCADE,
    album_id INTEGER REFERENCES albums(id) ON DELETE CASCADE,
    PRIMARY KEY (artist_id, album_id)
);


CREATE TABLE albums (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    release_year INTEGER NOT NULL,
    CONSTRAINT chk_album_year_valid CHECK (release_year BETWEEN 2000 AND EXTRACT(YEAR FROM CURRENT_DATE))
);


CREATE TABLE tracks (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    duration INTEGER NOT NULL,
    album_id INTEGER NOT NULL REFERENCES albums(id) ON DELETE CASCADE,
    CONSTRAINT chk_track_duration CHECK (duration BETWEEN 1 AND 3600)
);


CREATE TABLE compilationtracks (
    compilation_id INTEGER REFERENCES compilations(id) ON DELETE CASCADE,
    track_id INTEGER REFERENCES tracks(id) ON DELETE CASCADE,
    PRIMARY KEY (compilation_id, track_id)
);


CREATE TABLE compilations (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    release_year INTEGER NOT NULL,
    CONSTRAINT chk_compilation_year CHECK (release_year BETWEEN 2000 AND EXTRACT(YEAR FROM CURRENT_DATE))
);
