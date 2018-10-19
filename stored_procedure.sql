CREATE OR REPLACE FUNCTION search_movie(
 name TEXT,
 OUT result TEXT)
RETURNS TEXT AS $$
BEGIN
  SELECt title into result
  FROM movies
  WHERE title = name;

  IF NOT FOUND THEN
  RAISE NOTICE 'Regular Search didnt work, trying Trigram';
    SELECt title into result
    FROM movies
    WHERE title % name;
  END IF;

  IF NOT FOUND THEN
    RAISE NOTICE 'Trigram didnt work, trying Metaphone';
    SELECT title into result
    FROM movies
    WHERE metaphone(title, 6) % metaphone(name, 6);
  END IF;
END; $$

LANGUAGE plpgsql;
