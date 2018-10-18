CREATE INDEX movies_title_searchable ON movies
USING gin(to_tsvector('english', title));
