SELECT "DSPDET_STATDATE" "DSPDET_STATDATE",
       "DSPDET_TRIPSTAT" "DSPDET_TRIPSTAT",
       "DSPDET_VICOLOADSPEC" "DSPDET_VICOLOADSPEC",
       COUNT(DISTINCT "DSPDET_VICOLOADSPEC") "COUNT_DSPDET_VICOLOADSPEC",
       COUNT(DISTINCT "COUNT_ORDGI_COUNTORDER") "ORDGI_COUNTORDER",
       SUM("DSPDET_NOFORDLIN") "DSPDET_NOFORDLIN",
       SUM("DSPDET_CALCVOL"/1000) "DSPDET_CALCVOL"
FROM "RETURN_7"
GROUP BY "DSPDET_STATDATE",
         "DSPDET_TRIPSTAT",
         "DSPDET_VICOLOADSPEC"