SELECT pages.page_id
FROM pages LEFT JOIN page_likes 
  ON pages.page_id = page_likes.page_id
WHERE liked_date IS NULL
ORDER BY 1;