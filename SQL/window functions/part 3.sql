WITH get_criteria AS (
    select
        year, month, day, userid, ts, devicetype, deviceid,
  		query, LEAD(query) OVER w AS next_query,
        LEAD(ts) OVER w - ts AS ts_diff
    FROM query
    WINDOW w AS (
        PARTITION BY userid, deviceid
        ORDER BY ts
    )
),
get_is_final AS (
    SELECT 
        year, month, day, userid, ts, devicetype, deviceid, query, next_query,
        CASE
            WHEN ts_diff IS NULL OR ts_diff > 180 THEN 1
            WHEN LENGTH(next_query) < LENGTH(query) AND ts_diff > 60 THEN 2
            ELSE 0
        END AS is_final
    FROM get_criteria
)
SELECT *
FROM get_is_final
WHERE year = 2024 AND month = 11 AND day = 16 AND devicetype = 'android' AND is_final IN (1, 2)
ORDER BY userid, deviceid, ts;