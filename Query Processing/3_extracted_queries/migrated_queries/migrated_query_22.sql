SELECT "C0" "IMR_ASSIGNSTATUS",
       "C1" "IMR_ADMUNIT",
       "C2" "IMR_UNIASSIGNNO",
       "C3" "IMR_PRIO",
       "C4" "IMR_REFKEYL62__ART_",
       "C5" "IMR_REFKEYO08__ORDLIN_",
       "C6" "IMR_REFKEYO06__SUBORD_",
       "C7" "IMR_REFKEYR08__TRIP_ROUT_",
       "C8" "ARTFEA_REFKEY_L62",
       "C9" "COUNT_IMR_UNASSIGN_NO",
       "C10" "COUNT_ART_FEA_REF",
       "C10" "COUNT_ART_FEA_REF1",
       FIRST_VALUE("C9") OVER (PARTITION BY "C0", "C1", "C2", "C3", "C4", "C5", "C6", "C7", "C8") "SUM_",
       SUM(DISTINCT "C10") OVER () "SUM14",
       SUM(DISTINCT "C10") OVER () "SUM1"
FROM
  (SELECT "C0" "C0",
          "C1" "C1",
          "C2" "C2",
          "C3" "C3",
          "C4" "C4",
          "C5" "C5",
          "C6" "C6",
          "C7" "C7",
          "C8" "C8",
          "C9" "C9",
          "C0" "C10"
   FROM
     (SELECT COUNT(DISTINCT "SHORTL62") "C0"
      FROM "L54T1" "L54T1",
           "L62T14",
           "O08T15",
           "O42T2" "O42T2"
      WHERE "ADMUNIT" IN ('14P1',
                                  '14P2')
        AND "L54STATE" IN (1,
                                   2)
        AND TRIM(BOTH
                 FROM TO_CHAR("OCARRNO"))=TRIM(BOTH
                                                       FROM "L54GR2")
        AND "SHORTO08"="SHORTO08"
        AND "SHORTL62"="SHORTL62") "T0",

     (SELECT "L54STATE" "C0",
             "ADMUNIT" "C1",
             "L54UNIQ" "C2",
             "PRIORITY" "C3",
             "SHORTL62" "C4",
             "SHORTO08" "C5",
             "SHORTO06" "C6",
             "SHORTR08" "C7",
             "SHORTL62" "C8",
             COUNT("L54UNIQ") "C9"
      FROM "L54T1" "L54T1",
           "L62T14",
           "O08T15",
           "O42T2" "O42T2"
      WHERE "ADMUNIT" IN ('14P1',
                                  '14P2')
        AND "L54STATE" IN (1,
                                   2)
        AND TRIM(BOTH
                 FROM TO_CHAR("OCARRNO"))=TRIM(BOTH
                                                       FROM "L54GR2")
        AND "SHORTO08"="SHORTO08"
        AND "SHORTL62"="SHORTL62"
      GROUP BY "L54STATE",
               "ADMUNIT",
               "L54UNIQ",
               "PRIORITY",
               "SHORTL62",
               "SHORTO08",
               "SHORTO06",
               "SHORTR08",
               "SHORTL62") "T1") "T0"