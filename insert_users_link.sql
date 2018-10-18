CREATE OR REPLACE Function setWatchedMovie(username, movieName)
BEGIN
  INSERT into movies_users(movie_id, user_id)
  VALUES (
    (
    SELECT movie_id
    FROM movies
    WHERE title = movieName
    )
    (
    SELECT user_id
    FROM users
    WHERE username = username
    )
)
END;

watchedMovie('name', 'Star Wars');
