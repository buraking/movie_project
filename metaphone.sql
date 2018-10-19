SELECT title
FROM movies NATURAL JOIN movies_actors NATURAL JOIN actors
WHERE metaphone(name, 6) % metaphone('askldjlaskdfjlasjfglajslf', 6);
