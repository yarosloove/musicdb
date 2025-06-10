SELECT title, duration 
FROM tracks 
ORDER BY duration DESC 
LIMIT 1;


SELECT title 
FROM tracks 
WHERE string_to_array(lower(title), ' ') && ARRAY['my', 'мой'];

SELECT title 
FROM compilations 
WHERE release_year BETWEEN 2018 AND 2020;


SELECT name 
FROM artists 
WHERE name NOT LIKE '% %';


SELECT title 
FROM tracks 
WHERE LOWER(title) LIKE '%мой%' OR LOWER(title) LIKE '%my%';