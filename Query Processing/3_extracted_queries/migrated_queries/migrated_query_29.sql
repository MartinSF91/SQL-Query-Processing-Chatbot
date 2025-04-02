SELECT SUBSTR("PARTNO", 1, 8),
       TRIM(BOTH
            FROM "PARTREV"),
       TRUNC(CAST("STATDATE" AS TIMESTAMP(9))),
       "G30STAT",
       "INORDNO",
       "AVIQUANT",
       "DELQUANT",
       TRIM(BOTH
            FROM "PARTNO")
FROM (("G30T1" "G30T1"
       INNER JOIN "G32T1" "G32T1" ON "SHORTG30"="SHORTG30")
      INNER JOIN
        (SELECT "AVIQUANT" "AVIQUANT",
                "DELQUANT" "DELQUANT",
                "INORDNO" "INORDNO",
                "SHORTG32" "SHORTG32",
                "SHORTL62" "SHORTL62"
         FROM "G36T1" "G36T1"
         WHERE TRIM(BOTH
                    FROM "DIVCODE") NOT IN ('055')) "G36T16" ON "SHORTG32"="SHORTG32")
INNER JOIN
  (SELECT "PARTNO" "PARTNO",
          "PARTREV" "PARTREV",
          "SHORTL62" "SHORTL62"
   FROM "L62T1" "L62T1"
   WHERE TRIM(BOTH
              FROM "DIVCODE") NOT IN ('055')) "L62T15" ON "SHORTL62"="SHORTL62"
WHERE TRUNC(CAST("STATDATE" AS TIMESTAMP(9)))>=DATE '2023-11-03'
  AND TRUNC(CAST("STATDATE" AS TIMESTAMP(9)))<=DATE '2023-11-03'
  AND SUBSTR("INORDNO", 1, 4)='6'
  SELECT "PRICE",
         "ITEM_NO",
         "BU_CODE_SUP", (COALESCE("BU_TYPE_SUP", 'SUP'))
  FROM
    (SELECT "ITEM_TYPE" "ITEM_TYPE",
            "ITEM_NO" "ITEM_NO",
            "BU_TYPE_SUP" "BU_TYPE_SUP",
            "BU_CODE_SUP" "BU_CODE_SUP",
            "PRICE" "PRICE"
     FROM "PRICES_VW" "PRICES_VW"
     WHERE "BU_TYPE"='CDC'
       AND "BU_CODE" IN ('003')
       AND "ITEM_TYPE"='ART') "A_PRICES_L62T1"