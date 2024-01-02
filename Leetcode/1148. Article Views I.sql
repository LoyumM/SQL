-- Write your PostgreSQL query statement below
SELECT DISTINCT(author_id) AS id
FROM Views
WHERE author_id = viewer_id
ORDER by 1;