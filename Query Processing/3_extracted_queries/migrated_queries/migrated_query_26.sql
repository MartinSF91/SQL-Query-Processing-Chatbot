SELECT DISTINCT "DSPHSE_STAT" "DSPHSESTAT",
                TO_CHAR(TRUNC(CAST("DSP_DATE_ACT" AS TIMESTAMP(9))), 'YYYY-MM-DD') "DSPDATEACT",
                "TRPT_ID" "DSPTRPTID",
                CONCAT(CONCAT("BU_CODE_CRE", "BU_TYPE_CRE"), "CSM_NO") "DSPCSMID",
                "BU_TYPE_CRE" "DSPBUTYPECRECSM",
                "BU_CODE_CRE" "DSPBUCODECRECSM",
                "BU_TYPE_RCV" "DSPBUTYPERCV",
                "BU_CODE_RCV" "DSPBUCODERCV"
FROM "BO_DSP_HSE_V" "BO_DSP_HSE_V",
     "BO_DISPATCH_V" "BO_DISPATCH_V"
WHERE TRUNC(CAST("DSP_DATE_ACT" AS TIMESTAMP(9)))=TRUNC(CAST(:PQ1 AS TIMESTAMP(9)))
  AND "DSP_NO"="DSP_NO"
  AND "ARC_DATE_FILLED"="ARC_DATE_FILLED"