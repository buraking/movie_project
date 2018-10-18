CREATE INDEX movies_title_pattern ON movies (lower(title) text_pattern_ops);
