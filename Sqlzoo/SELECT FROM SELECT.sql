-- 1.List each country name where the population is larger than that of 'Russia'.

SELECT name
FROM world
WHERE population >
     (SELECT population
FROM world
WHERE name='Russia');

-- 2.Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.

SELECT name
FROM world
WHERE continent = 'Europe'
  AND gdp/population > (
  SELECT gdp/population
  FROM world
  WHERE name = 'United Kingdom');

--3.