
SELECT "BO_PALL_CHG_LOG_V"."CHG_TYPE" "STOChgTyp",
       TRUNC(cast("BO_PALL_CHG_LOG_V"."CHG_DATE" AS TIMESTAMP(9))) "STOChgDate",
       "BO_PALL_CHG_LOG_V"."ART_NO" "STOChgArtNo",
       "BO_PALL_CHG_LOG_V"."SUP_NO" "STOChgSupNo",
       "BO_PALL_CHG_LOG_V"."PALL_ID" "STOChgPallid",
       "BO_PALL_CHG_LOG_V"."ART_PRICE_INVE" "STOArtPriceInve",
       "BO_PALL_CHG_LOG_V"."ART_QTY" "STOChgQty",
       "BO_PALL_CHG_LOG_V"."ART_PRICE_INVE"*"BO_PALL_CHG_LOG_V"."ART_QTY" "Sum_Price",
       "BO_PALL_CHG_LOG_V"."ART_PRICE_INVE" "Total_STOArtPriceInve_",
       "BO_PALL_CHG_LOG_V"."ART_QTY" "Total_STOChgQty_",
       "BO_PALL_CHG_LOG_V"."ART_PRICE_INVE"*"BO_PALL_CHG_LOG_V"."ART_QTY" "Total_Sum_Price_"
FROM "BO_PALL_CHG_LOG_V" "BO_PALL_CHG_LOG_V"
WHERE TRUNC(cast("BO_PALL_CHG_LOG_V"."CHG_DATE" AS TIMESTAMP(9))) BETWEEN TRUNC(cast(:PQ1 AS TIMESTAMP(9))) AND TRUNC(cast(:PQ2 AS TIMESTAMP(9)))
  AND "BO_PALL_CHG_LOG_V"."CHG_TYPE" IN ('021')