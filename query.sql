-- 1
SELECT 
Genre.genreName,
ROUND(AVG(MovieRating.rating), 2) AS avg_rating,
COUNT(*) AS rating_count
FROM User JOIN AgeRange ON User.age_id = AgeRange.age_id
JOIN MovieRating ON User.user_id = MovieRating.user_id
JOIN MovieGenre ON MovieRating.movie_id = MovieGenre.movie_id
JOIN Genre ON MovieGenre.genre_id = Genre.genre_id

WHERE AgeRange.age_range = '50-59'
GROUP BY Genre.genreName
ORDER BY avg_rating DESC;

-- 2
select User.gender,
Genre.genreName,
round(AVG(MovieRating.rating), 2) as avg_rating,
count(*) as rating_count
from user join MovieRating on User.user_id = MovieRating.user_id
join MovieGenre on MovieRating.movie_id = MovieGenre.movie_id
join Genre on MovieGenre.genre_id = Genre.genre_id

where User.gender = 'Female'
group by Genre.genreName
order by avg_rating desc;

-- 3
SELECT AgeRange.age_range, 
count(distinct MovieRating.user_id) as review_writer_count
from MovieRating JOIN User ON MovieRating.user_id = User.user_id
JOIN AgeRange ON User.age_id = AgeRange.age_id
WHERE MovieRating.review is not null and MovieRating.review <> ''
GROUP BY AgeRange.age_range
ORDER BY review_writer_count desc;
