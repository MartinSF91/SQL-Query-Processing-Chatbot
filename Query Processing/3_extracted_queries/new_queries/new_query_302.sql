
SELECT substr("L62T14"."PARTNO", 1, 8),
       trim(BOTH
            FROM "L62T14"."PARTREV"),
       "L62T14"."PARTUNIT",
       trim(BOTH
            FROM "L62T14"."PARTNO")
FROM
  (SELECT "L62T1"."PARTNO" "PARTNO",
          "L62T1"."PARTREV" "PARTREV",
          "L62T1"."PARTUNIT" "PARTUNIT"
   FROM "L62T1" "L62T1"
   WHERE trim(BOTH
              FROM "L62T1"."DIVCODE") NOT IN ('000',
                                              '055')) "L62T14"
SELECT "A_PRICES_L62T1"."PRICE",
       "A_PRICES_L62T1"."PRICE"/100,
       "A_PRICES_L62T1"."ITEM_NO",
       "A_PRICES_L62T1"."BU_CODE_SUP", (coalesce("A_PRICES_L62T1"."BU_TYPE_SUP", 'SUP'))
FROM
  (SELECT "PRICES_VW"."ITEM_TYPE" "ITEM_TYPE",
          "PRICES_VW"."ITEM_NO" "ITEM_NO",
          "PRICES_VW"."BU_TYPE_SUP" "BU_TYPE_SUP",
          "PRICES_VW"."BU_CODE_SUP" "BU_CODE_SUP",
          "PRICES_VW"."PRICE" "PRICE"
   FROM "PRICES_VW" "PRICES_VW"
   WHERE "PRICES_VW"."BU_TYPE"='CDC'
     AND "PRICES_VW"."BU_CODE" IN ('003')
     AND "PRICES_VW"."ITEM_TYPE"='ART') "A_PRICES_L62T1"