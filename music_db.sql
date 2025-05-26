CREATE TABLE genres (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE artists (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE albums (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    release_year INTEGER NOT NULL
);

CREATE TABLE artistalbums (
    artist_id INTEGER REFERENCES artists(id) ON DELETE CASCADE,
    album_id INTEGER REFERENCES albums(id) ON DELETE CASCADE,
    PRIMARY KEY (artist_id, album_id)
);

CREATE TABLE tracks (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    duration INTEGER NOT NULL,
    album_id INTEGER REFERENCES albums(id) ON DELETE CASCADE
);

CREATE TABLE compilations (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    release_year INTEGER NOT NULL
);

CREATE TABLE compilationtracks (
    compilation_id INTEGER REFERENCES compilation(id) ON DELETE CASCADE,
    track_id INTEGER REFERENCES tracks(id) ON DELETE CASCADE,
    PRIMARY KEY (compilation_id, track_id)
);
