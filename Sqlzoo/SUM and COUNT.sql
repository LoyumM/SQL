-- 1.Show the total population of the world.

SELECT SUM(population)
FROM world;

--2.List all the continents - just once each.

SELECT DISTINCT(continent)
FROM world;

--3.Give the total GDP of Africa

SELECT SUM(gdp) AS total_gdp
FROM world
WHERE continent = 'africa';

-- 4.How many countries have an area of at least 1000000

SELECT COUNT(name) as count
FROM world
WHERE area >= 1000000;

-- 5.What is the total population of ('Estonia', 'Latvia', 'Lithuania')

SELECT SUM(population) AS total_population
FROM world
WHERE name IN ('Estonia', 'Latvia', 'Lithuania');

