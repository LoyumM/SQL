SELECT
    h.hacker_id
    , h.name
FROM hackers as h
    JOIN submissions as s on h.hacker_id=s.hacker_id
    JOIN challenges as c on s.challenge_id=c.challenge_id
    JOIN difficulty as d ON c.difficulty_level=d.difficulty_level
WHERE s.score=d.score
GROUP BY 
    h.hacker_id
    , h.name
HAVING COUNT(h.hacker_id) >=2
ORDER BY 
    COUNT(h.hacker_id) DESC
    , h.hacker_id ASC;