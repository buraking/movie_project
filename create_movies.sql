DROP TABLE IF EXISTS genres CASCADE;
DROP TABLE IF EXISTS movies CASCADE;
DROP TABLE IF EXISTS actors CASCADE;
DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS movies_actors CASCADE;
DROP TABLE IF EXISTS movies_users CASCADE;
DROP TABLE IF EXISTS votes CASCADE;

CREATE TABLE genres (
  name text UNIQUE,
  position integer
);

CREATE TABLE movies (
  movie_id SERIAL PRIMARY KEY,
  title text,
  genre cube
);

CREATE TABLE actors (
  actor_id SERIAL PRIMARY KEY,
  name text
);

CREATE TABLE users(
  user_id SERIAL PRIMARY KEY,
  name text,
  username text UNIQUE,
  email text,
  password text
);

CREATE TABLE movies_users (
  movie_id integer REFERENCES movies NOT NULL,
  user_id integer REFERENCES users NOT NULL,
  UNIQUE (movie_id, user_id)
);

CREATE TABLE movies_actors (

  movie_id integer REFERENCES movies NOT NULL,
  actor_id integer REFERENCES actors NOT NULL,
  UNIQUE (movie_id, actor_id)
);

CREATE TABLE votes (
  user_id integer REFERENCES users NOT NULL,
  movie_id integer REFERENCES movies NOT NULL,
  vote boolean
);

CREATE INDEX movies_actors_movie_id ON movies_actors (movie_id);
CREATE INDEX movies_actors_actor_id ON movies_actors (actor_id);
CREATE INDEX movies_genres_cube ON movies USING gist (genre);
