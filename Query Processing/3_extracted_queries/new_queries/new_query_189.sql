
SELECT "OUT_CONSIGNMENT_LINE"."BU_CODE_DT" AS "Bu_Code_Dt",
       "OUT_CONSIGNMENT_LINE"."BU_TYPE_DT" AS "Bu_Type_Dt",
       "OUT_CONSIGNMENT_LINE"."ITEM_ID" AS "Item_Id",
       "OUT_CONSIGNMENT_LINE"."ITEM_TYPE" AS "Item_Type",
       "OUT_CONSIGNMENT_LINE"."BU_CODE_SUP" AS "Bu_Code_Sup",
       "OUT_CONSIGNMENT_LINE"."BU_TYPE_SUP" AS "Bu_Type_Sup",
       SUM("OUT_CONSIGNMENT_LINE"."ITEM_QTY_DSP") AS "Item_Qty_Dsp",
       MAX("OUT_LOADING_UNIT_TRIP"."DSP_DATE_ACT") AS "Dsp_End_Date1",
       MIN("OUT_LOADING_UNIT_TRIP"."DSP_DATE_ACT") AS "Dsp_Start_Date1",
       (TRUNC(CAST(MAX("OUT_LOADING_UNIT_TRIP"."DSP_DATE_ACT") AS TIMESTAMP)) - TRUNC(CAST(MIN("OUT_LOADING_UNIT_TRIP"."DSP_DATE_ACT") AS TIMESTAMP))) + 1 AS "Sold_Days",
       MIN("OUT_LOADING_UNIT_TRIP"."DSP_DATE_ACT") AS "DSP_DATE_ACT",
       MAX("OUT_LOADING_UNIT_TRIP"."DSP_DATE_ACT") AS "DSP_DATE_ACT1",
       to_char(MAX("OUT_LOADING_UNIT_TRIP"."DSP_DATE_ACT"), 'mm/dd/yy hh:mi AM') AS "Dsp_End_Date",
       to_char(MIN("OUT_LOADING_UNIT_TRIP"."DSP_DATE_ACT"), 'mm/dd/yy hh:mi AM') AS "Dsp_Start_Date"
FROM "GEMINI"."OUT_CONSIGNMENT" "OUT_CONSIGNMENT"
INNER JOIN "GEMINI"."OUT_LOADING_UNIT_TRIP" "OUT_LOADING_UNIT_TRIP" ON "OUT_CONSIGNMENT"."SHP_NO" = "OUT_LOADING_UNIT_TRIP"."SHP_NO"
AND "OUT_CONSIGNMENT"."LUTR_NO" = "OUT_LOADING_UNIT_TRIP"."LUTR_NO"
AND "OUT_CONSIGNMENT"."BU_CODE_CRE_SHP" = "OUT_LOADING_UNIT_TRIP"."BU_CODE_CRE_SHP"
AND "OUT_CONSIGNMENT"."BU_TYPE_CRE_SHP" = "OUT_LOADING_UNIT_TRIP"."BU_TYPE_CRE_SHP"
AND "OUT_CONSIGNMENT"."ASTRO_TRIP_ID" = "OUT_LOADING_UNIT_TRIP"."ASTRO_TRIP_ID"
AND "OUT_CONSIGNMENT"."BU_CODE_DT" = "OUT_LOADING_UNIT_TRIP"."BU_CODE_DT"
AND "OUT_CONSIGNMENT"."BU_TYPE_DT" = "OUT_LOADING_UNIT_TRIP"."BU_TYPE_DT"
INNER JOIN "GEMINI"."OUT_CONSIGNMENT_LINE" "OUT_CONSIGNMENT_LINE" ON "OUT_CONSIGNMENT_LINE"."CSM_NO" = "OUT_CONSIGNMENT"."CSM_NO"
AND "OUT_CONSIGNMENT_LINE"."BU_CODE_DT" = "OUT_CONSIGNMENT"."BU_CODE_DT"
AND "OUT_CONSIGNMENT_LINE"."BU_TYPE_DT" = "OUT_CONSIGNMENT"."BU_TYPE_DT"
AND "OUT_CONSIGNMENT_LINE"."BU_CODE_CRE_CSM" = "OUT_CONSIGNMENT"."BU_CODE_CRE_CSM"
AND "OUT_CONSIGNMENT_LINE"."BU_TYPE_CRE_CSM" = "OUT_CONSIGNMENT"."BU_TYPE_CRE_CSM"
WHERE "OUT_CONSIGNMENT_LINE"."ITEM_QTY_DSP" > 0
  AND "OUT_CONSIGNMENT_LINE"."BU_CODE_DT" IN (:Parameter1:)
  AND "OUT_CONSIGNMENT_LINE"."BU_TYPE_DT" IN (:Parameter2:)
  AND "OUT_LOADING_UNIT_TRIP"."DSP_DATE_ACT" BETWEEN {ts '2025-03-18 00:00:00'} AND {ts '2025-03-25 23:59:59.999000000'}
GROUP BY "OUT_CONSIGNMENT_LINE"."BU_CODE_DT",
         "OUT_CONSIGNMENT_LINE"."BU_TYPE_DT",
         "OUT_CONSIGNMENT_LINE"."ITEM_ID",
         "OUT_CONSIGNMENT_LINE"."ITEM_TYPE",
         "OUT_CONSIGNMENT_LINE"."BU_CODE_SUP",
         "OUT_CONSIGNMENT_LINE"."BU_TYPE_SUP"