SELECT "ITEM_ID" AS "ITEM_ID",
       "INBOUNDTRIPID" AS "INBOUNDTRIPID",
       TO_CHAR("ACTUNLOADFINISHTIME", 'MM/DD/YY HH:MI AM') AS "C3",
       "TERPRETER" AS "TERPRETER",
       "LU_ID" AS "LU_ID",
       "BU_CODE_CNEE" AS "BU_CODE_CNEE",
       "BU_TYPE_CNEE" AS "BU_TYPE_CNEE",
       "KEEP_NESTED_FLAG" AS "KEEP_NESTED_FLAG",
       "CSM_LINE_TYPE" AS "CSM_LINE_TYPE",
       "ASTRO_CSM_ID" AS "ASTRO_CSM_ID",
       "TRANSITVOL" AS "TRANSITVOL",
       SUM(ROUND("RCVDVOL", 5)) AS "RCVDVOL",
       SUM("TOTALUNLQTY") AS "TOTALUNLQTY",
       "ITEMQTYUNLICL" AS "ITEMQTYUNLICL",
       "ITEMQTYUNLIACL" AS "ITEMQTYUNLIACL",
       "SHP_NO" AS "SHP_NO",
       "BU_CODE_CRE_SHP" AS "BU_CODE_CRE_SHP",
       "BU_TYPE_CRE_SHP" AS "BU_TYPE_CRE_SHP",
       "LUTR_NO" AS "LUTR_NO",
       "TOTALITEMQTYUNLICLIACL" AS "C20",
       "UNIT_SIZE" AS "UNIT_SIZE",
       "PALS" AS "PALS",
       "BU_CODE_START" AS "BU_CODE_START",
       "BU_TYPE_START" AS "BU_TYPE_START",
       "BU_CODE_DT" AS "BU_CODE_DT",
       CASE
           WHEN SUBSTR("UNIT_SIZE", 1, 3) = 'C20'
                OR SUBSTR("UNIT_SIZE", 1, 3) = 'C40'
                OR SUBSTR("UNIT_SIZE", 1, 3) = 'C45' THEN 'CONTAINER'
           WHEN SUBSTR("UNIT_SIZE", 1, 3) = 'C48'
                OR SUBSTR("UNIT_SIZE", 1, 3) = 'C53'
                OR SUBSTR("UNIT_SIZE", 1, 1) = 'T' THEN 'TRUCK'
           ELSE 'TRUCK'
       END AS "UNIT_TYPE",
       SUM(ROUND(NVL("TRANSITVOL", "RCVDVOL"), 5)) AS "TOTAL",
       CASE
           WHEN "ITEMQTYUNLIACL" = '0' THEN "ITEMQTYUNLICL"
           ELSE "ITEMQTYUNLIACL"
       END AS "TOTAL_ITEM_QTY_UNL"
FROM "SQL2"
GROUP BY "ITEM_ID",
         "INBOUNDTRIPID",
         TO_CHAR("ACTUNLOADFINISHTIME", 'MM/DD/YY HH:MI AM'),
         "TERPRETER",
         "LU_ID",
         "BU_CODE_CNEE",
         "BU_TYPE_CNEE",
         "KEEP_NESTED_FLAG",
         "CSM_LINE_TYPE",
         "ASTRO_CSM_ID",
         "TRANSITVOL",
         "ITEMQTYUNLICL",
         "ITEMQTYUNLIACL",
         "SHP_NO",
         "BU_CODE_CRE_SHP",
         "BU_TYPE_CRE_SHP",
         "LUTR_NO",
         "TOTALITEMQTYUNLICLIACL",
         "UNIT_SIZE",
         "PALS",
         "BU_CODE_START",
         "BU_TYPE_START",
         "BU_CODE_DT",
         CASE
             WHEN SUBSTR("UNIT_SIZE", 1, 3) = 'C20'
                  OR SUBSTR("UNIT_SIZE", 1, 3) = 'C40'
                  OR SUBSTR("UNIT_SIZE", 1, 3) = 'C45' THEN 'CONTAINER'
             WHEN SUBSTR("UNIT_SIZE", 1, 3) = 'C48'
                  OR SUBSTR("UNIT_SIZE", 1, 3) = 'C53'
                  OR SUBSTR("UNIT_SIZE", 1, 1) = 'T' THEN 'TRUCK'
             ELSE 'TRUCK'
         END,
         CASE
             WHEN "ITEMQTYUNLIACL" = '0' THEN "ITEMQTYUNLICL"
             ELSE "ITEMQTYUNLIACL"
         END