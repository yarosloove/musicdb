SELECT g.name AS genre_name, COUNT(ag.artist_id) AS artist_count
FROM genres g
LEFT JOIN artistgenres ag ON g.id = ag.genres_id
GROUP BY g.name
ORDER BY artist_count DESC;

SELECT COUNT(t.id) AS track_count
FROM tracks t
JOIN albums a ON t.album_id = a.id
WHERE a.release_year BETWEEN 2019 AND 2020;

SELECT 
    a.title AS album_title,
    ROUND(AVG(t.duration)) AS avg_duration_sec,
    CONCAT(FLOOR(AVG(t.duration)/60), ':', LPAD(FLOOR(AVG(t.duration)%60, 2, '0')) AS avg_duration_formatted
FROM albums a
JOIN tracks t ON a.id = t.album_id
GROUP BY a.title
ORDER BY avg_duration_sec DESC;

SELECT a.name AS artist_name
FROM artists a
WHERE a.id NOT IN (
    SELECT aa.artist_id
    FROM artistalbums aa
    JOIN albums al ON aa.album_id = al.id
    WHERE al.release_year = 2020
);

SELECT DISTINCT c.title AS compilation_title
FROM compilations c
JOIN compilationtracks ct ON c.id = ct.compilation_id
JOIN tracks t ON ct.track_id = t.id
JOIN albums a ON t.album_id = a.id
JOIN artistalbums aa ON a.id = aa.album_id
JOIN artists ar ON aa.artist_id = ar.id
WHERE ar.name = 'Depeche Mode';


WITH new_comp AS (
    INSERT INTO compilations (title, release_year) 
    VALUES ('Depeche Mode Hits', 2021)
    RETURNING id
),
existing_tracks AS (
    SELECT id FROM tracks WHERE title IN ('Personal Jesus', 'Enjoy the Silence')
)
INSERT INTO compilationtracks (compilation_id, track_id)
SELECT nc.id, et.id
FROM new_comp nc
CROSS JOIN existing_tracks et
WHERE nc.id IS NOT NULL AND et.id IS NOT NULL;


INSERT INTO genres (name) VALUES ('Pop'), ('Rock') ON CONFLICT DO NOTHING;
INSERT INTO artists (name) VALUES ('New Artist') ON CONFLICT DO NOTHING;
INSERT INTO albums (title, release_year) VALUES ('New Album 2020', 2020) ON CONFLICT DO NOTHING;

INSERT INTO artistgenres (artist_id, genres_id) 
SELECT a.id, g.id 
FROM artists a, genres g 
WHERE a.name = 'Ария' AND g.name = 'Rock'
   OR a.name = 'Depeche Mode' AND g.name = 'Pop'
ON CONFLICT DO NOTHING;

INSERT INTO tracks (title, duration, album_id) 
SELECT 'New Track 1', 240, id FROM albums WHERE title = 'New Album 2020'
UNION ALL
SELECT 'New Track 2', 210, id FROM albums WHERE title = 'New Album 2020'
ON CONFLICT DO NOTHING;