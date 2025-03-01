-- Create a table named friends with three columns:
--   id that stores INTEGER
--   name that stores TEXT
--   birthday that stores DATE

CREATE TABLE friends (
  id INTEGER, 
  name TEXT, 
  BIRTHDAY DATE
);

-- Beneath your current code, add Ororo Munroe to friends.
-- Her birthday is May 30th, 1940.
INSERT INTO friends (id, name, birthday)
VALUES (1, 'Ororo Munroe', 05301940);

SELECT * FROM friends;

-- Add two of your friends to the table. 

INSERT INTO friends (id, name, birthday)
VALUES (2, 'John Doe', 01301965);

INSERT INTO friends (id, name, birthday)
VALUES (3, 'Jane Doe', 04141955);

SELECT * FROM friends;

-- Ororo Munroe just realized that she can control the weather and decided to change her name. Her new name is “Storm”. 
UPDATE friends
SET name = 'Ororo Storm'
WHERE id = 1;

SELECT * FROM friends;

-- Add a new column named email.
ALTER TABLE friends
ADD email TEXT;

-- Update the email address for everyone in your table. 
UPDATE friends
SET email = 'storm@something.com'
WHERE id = 1;

UPDATE friends
SET email = 'johndoe@something.com'
WHERE name = 'John Doe';

UPDATE friends
SET email = 'janedoe@something.com'
WHERE name = 'Jane Doe';

SELECT * FROM friends

-- Wait, Storm is fictional… Remove her from friends.
DELETE FROM friends
WHERE id = 1;

SELECT * FROM friends;