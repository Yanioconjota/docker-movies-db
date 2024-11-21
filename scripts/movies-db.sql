-- Drop existing tables (if they exist)
DROP TABLE IF EXISTS actor_movie;
DROP TABLE IF EXISTS actors;
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS genres;

-- Create the "genres" table
CREATE TABLE genres (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Insert data into the "genres" table
INSERT INTO genres (name) VALUES
('Action'),
('Drama'),
('Comedy'),
('Horror');

-- Create the "movies" table
CREATE TABLE movies (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_year INT NOT NULL,
    genre_id INT REFERENCES genres(id) ON DELETE CASCADE
);

-- Insert data into the "movies" table
INSERT INTO movies (title, release_year, genre_id) VALUES
('Inception', 2010, 1),
('The Dark Knight', 2008, 1),
('Forrest Gump', 1994, 2);

-- Create the "actors" table
CREATE TABLE actors (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL
);

-- Insert data into the "actors" table
INSERT INTO actors (first_name, last_name) VALUES
('Leonardo', 'DiCaprio'),
('Christian', 'Bale'),
('Tom', 'Hanks');

-- Create the "actor_movie" table (many-to-many relationship)
CREATE TABLE actor_movie (
    id SERIAL PRIMARY KEY,
    actor_id INT REFERENCES actors(id) ON DELETE CASCADE,
    movie_id INT REFERENCES movies(id) ON DELETE CASCADE
);

-- Insert data into the "actor_movie" table
INSERT INTO actor_movie (actor_id, movie_id) VALUES
(1, 1), -- Leonardo DiCaprio in Inception
(2, 2), -- Christian Bale in The Dark Knight
(3, 3); -- Tom Hanks in Forrest Gump
