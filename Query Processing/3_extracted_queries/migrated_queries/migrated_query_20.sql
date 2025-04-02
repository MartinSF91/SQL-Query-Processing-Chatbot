SELECT "L54STATE" "IMR_ASSIGNSTATUS",
       "ADMUNIT" "IMR_ADMUNIT",
       "PRIORITY" "IMR_PRIO",
       "L54UNIQ" "IMR_UNIASSIGNNO",
       "L54TYPE" "IMR_TYPE",
       "MHA" "IMR_MHA",
       SUBSTR("PRIORITY", 1, 8) "C7",
       COUNT("L54UNIQ") "COUNT_IMR_UNASSIGN_NO"
FROM "L54T1" "L54T1"
WHERE "ADMUNIT" IN ('O301',
                            'O303',
                            'O305',
                            'O307',
                            'O309',
                            'O311',
                            'O312',
                            'O315',
                            'O317',
                            'O319',
                            'O321')
  AND "L54STATE" IN (1,
                             2)
GROUP BY "L54STATE",
         "ADMUNIT",
         "PRIORITY",
         "L54UNIQ",
         "L54TYPE",
         "MHA",
         SUBSTR("PRIORITY", 1, 8)