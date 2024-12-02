-- models/film.sql

-- This model calculates film-related statistics including actor count, release date, genre name,
-- and average rating from different schemas.

-- Part 1: Define film_data CTE
WITH film_data AS (
    SELECT 
        fa.name AS film_name, 
        COUNT(DISTINCT a.*) AS actor_count, 
        f.release_date, 
        gr.name AS genre_name,
        cf.id AS film_id
    FROM {{ source('SC2', 'm_film_actor') }} a
    INNER JOIN {{ source('SC2', 'm_film') }} fa ON a.film_id = fa.id 
    INNER JOIN {{ source('SC1', 'p_film') }} f ON f.name = fa.name 
    INNER JOIN {{ source('SC1', 'p_genre') }} gr ON f.genre_id = gr.id 
    INNER JOIN {{ source('SC3', 'c_films') }} cf ON cf.name = fa.name
    GROUP BY fa.name, f.release_date, gr.name, cf.id
)

-- Part 2: Select film statistics from film_data
SELECT 
    fd.film_name,
    fd.actor_count,
    fd.release_date,
    fd.genre_name,
    COALESCE(ar.avg_rating, 0) AS avg_rating
FROM film_data fd

-- Part 3: Calculate average rating with subquery
LEFT JOIN (
    SELECT 
        cf.id AS film_id, 
        AVG(r.rating) AS avg_rating
    FROM {{ source('SC3', 'c_ratings') }} r
    INNER JOIN {{ source('SC3', 'c_films') }} cf ON r.film_id = cf.id
    GROUP BY cf.id
) ar ON ar.film_id = fd.film_id
