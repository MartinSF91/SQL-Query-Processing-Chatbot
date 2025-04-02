
SELECT "T0"."C0" "WhsLoc_MhaName",
       "T0"."C1" "WhsLoc_L30_LocType",
       "T0"."C2" "WhsLoc_PlaceCount",
       "T0"."C3" "WhsLoc_Qty",
       "T0"."C2" "Summe_WhsLoc_PlaceCount_"
FROM
  (SELECT trim(BOTH
               FROM "L30T1"."MHA") "C0",
          "L30T1"."LOCTYPE" "C1",
          count(concat(concat("L30T1"."RACK", "L30T1"."HORCOOR"), trim(BOTH
                                                                       FROM "L30T1"."VERCOOR"))) "C2",
          "L30T1"."NOINLOC" "C3"
   FROM "L30T1" "L30T1"
   WHERE trim(BOTH
              FROM "L30T1"."MHA") IN ('53R1')
     AND "L30T1"."LOCTYPE" IN ('ML ')
     AND "L30T1"."NOINLOC" IN (1)
   GROUP BY trim(BOTH
                 FROM "L30T1"."MHA"),
            "L30T1"."LOCTYPE",
            "L30T1"."NOINLOC") "T0"