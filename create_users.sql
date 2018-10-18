DROP TABLE IF EXISTS users;

CREATE TABLE users(
  user_id UNIQUE PRIMARY KEY,
  name text,
  username text UNIQUE,
  email text
);
