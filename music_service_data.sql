INSERT INTO genres (name) VALUES 
('Heavy Metal'),
('Synthpop'),
('Darkwave'),
('Alternative Metal');


INSERT INTO artists (name) VALUES 
('Ария'),
('Depeche Mode'),
('Mr.Kitty'),
('Sleep Token');


INSERT INTO albums (title, release_year) VALUES 
('Генератор зла', 2008),
('Violator', 2000),
('Time', 2014),
('Take Me Back To Eden', 2023);


INSERT INTO tracks (title, duration, album_id) VALUES 
('Генератор зла', 302, 1),
('Чёрный квадрат', 290, 1),
('Personal Jesus', 286, 2),
('Enjoy the Silence', 369, 2),
('Insects', 300, 3),
('Lucid', 251, 3),
('Chokehold', 334, 4),
('The Summoning', 403, 4),
('Aqua Regia', 210, 4),
('Vore', 315, 4);


INSERT INTO compilations (title, release_year) VALUES 
('Best of Russian Metal', 2015),
('80s Synthpop Hits', 2020),
('Darkwave Collection', 2019),
('Modern Metal Essentials', 2023);


INSERT INTO artistgenres (artist_id, genres_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);


INSERT INTO artistalbums (artist_id, album_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);


INSERT INTO compilationtracks (compilation_id, track_id) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(4, 7),
(4, 8),
(4, 9),
(4, 10);