
SELECT sum("G32T1"."DELVOL"/1000) "Volumen",
       TRUNC(cast("G32T1"."STATDATE" AS TIMESTAMP(9))) "Datum",
       "G32T1"."G32STAT" "RctHea_DelStat",
       "G32T1"."STATDATE" "RctHea_StatDate"
FROM "G32T1" "G32T1"
WHERE "G32T1"."G32STAT" IN (40)
  AND "G32T1"."G32STAT" IN (40)
  AND "G32T1"."STATDATE">=to_date('2025-03-25 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
  AND "G32T1"."STATDATE"<(to_date('2025-03-25 00:00:00', 'YYYY-MM-DD HH24:MI:SS') + INTERVAL '1' DAY)
GROUP BY TRUNC(cast("G32T1"."STATDATE" AS TIMESTAMP(9))),
         "G32T1"."G32STAT",
         "G32T1"."STATDATE"