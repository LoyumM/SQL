SELECT student_id
FROM sat_scores
WHERE sat_writing = (
    SELECT PERCENTILE_CONT(0.5)
    WITHIN GROUP(ORDER BY sat_writing)
FROM sat_scores)