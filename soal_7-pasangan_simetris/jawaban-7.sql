SELECT
	DISTINCT a.X, a.Y
FROM xy a
WHERE (SELECT COUNT(*)
	FROM xy b
	WHERE (a.X = b.Y AND a.Y = b.X) OR (a.X = b.X AND a.Y = b.Y) ) > 1
	AND a.X <= a.Y
ORDER BY a.X asc, a.Y asc