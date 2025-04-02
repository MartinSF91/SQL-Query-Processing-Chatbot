/* user=Piratla Manikanta reportPath= report= queryName=GeminiPricesFY24_ALL REMOTE_ADDR= SERVER_NAME=cognosanalytics.apps.ikea.com requestID=qvjhqhvwqh2Cd94sC99jyhjhGw8vd2sChlqw2MG8 */ SELECT DISTINCT TRIM(BOTH
                     FROM "SQL1"."Article") AS "Article",
                "SQL1"."Supplier" AS "Supplier",
                "SQL1"."Line 17 Price" AS "Line_17_Price",
                TRIM(BOTH
                     FROM "SQL1"."FYT") AS "FYT_Price",
                TRIM(BOTH
                     FROM "SQL1"."ARTSUP") AS "ARTSUP",
                "SQL1"."BU Type" AS "BU_Type",
                CASE
                    WHEN NOT ("SQL1"."FYT" IS NULL) THEN 'Gemini East'
                    ELSE 'Missing'
                END AS "Data_Source",
                CASE
                    WHEN CASE
                             WHEN NOT ("SQL1"."FYT" IS NULL) THEN 'Gemini East'
                             ELSE 'Missing'
                         END LIKE 'Gemini East' THEN 'CALC 17'
                    ELSE 'Missing'
                END AS "CALC_Method"
FROM "SQL1"
WHERE "SQL1"."FYT" > 20233
ORDER BY "Article" ASC NULLS LAST,
         "Supplier" ASC NULLS LAST,
         "Line_17_Price" ASC NULLS LAST,
         "FYT_Price" ASC NULLS LAST,
         "ARTSUP" ASC NULLS LAST,
         "BU_Type" ASC NULLS LAST,
         "Data_Source" ASC NULLS LAST,
         "CALC_Method" ASC NULLS LAST