-- 1.List the films where the yr is 1962 [Show id, title]

SELECT id, title
FROM movie
WHERE yr=1962;

-- 2.Give year of 'Citizen Kane'.

SELECT yr
FROM movie
WHERE title = 'citizen kane';

-- 3.List all of the Star Trek movies, include the id, title and yr (all of these movies include the words Star Trek in the title). Order results by year.

SELECT id, title, yr
FROM movie
WHERE title LIKE '%star trek%'
ORDER BY yr;

-- 4.What id number does the actor 'Glenn Close' have?

SELECT id
FROM actor
WHERE name = 'glenn close';

-- 5. What is the id of the film 'Casablanca'

SELECT id
FROM movie
WHERE title = 'casablanca';

-- 6. Obtain the cast list for 'Casablanca'.

SELECT name
FROM actor JOIN casting ON actorid = actor.id
    JOIN movie ON movieid = movie.id
WHERE title = 'casablanca';

-- 7.Obtain the cast list for the film 'Alien'

SELECT name
FROM actor JOIN casting ON actorid = actor.id
    JOIN movie ON movieid = movie.id
WHERE title = 'alien';

-- 8.List the films in which 'Harrison Ford' has appeared

SELECT title
FROM movie JOIN casting ON movieid = movie.id
    JOIN actor ON actorid = actor.id
WHERE name = 'harrison ford';

-- 9.List the films where 'Harrison Ford' has appeared - but not in the starring role. [Note: the ord field of casting gives the position of the actor. If ord=1 then this actor is in the starring role]

SELECT title
FROM movie JOIN casting ON movieid = movie.id
    JOIN actor ON actorid = actor.id
WHERE name = 'harrison ford'
    AND ord <> 1;

-- 10.List the films together with the leading star for all 1962 films.

