SELECT DISTINCT SUBSTR("PARTNO", 1, 8) "ARTFEA_ARTICLENO",
                TRIM(BOTH
                     FROM "PARTREV") "ARTFEA_SUPNO",
                SUBSTR("PANUM", 1, 2) "ARTBANO",
                "PANUM" "ARTPANO",
                "PARTDSC1" "ARTFEA_ARTICLENAME",
                "HUQTY" "ARTFEA_DEFMLPQTY",
                "SULENGTH" "ARTFEA_STOUNITLEN",
                "SUWIDTH" "ARTFEA_STOUNITWID",
                "SUHEIGHT" "ARTFEA_STOUNITHEI",
                "PARTWGHT" "ARTFEA_PARTWEI",
                TRIM(BOTH
                     FROM "PMHA") "ARTLOC_PREFPICKAREA",
                "PZONE" "ARTLOC_PICKZONE",
                "UMHA" "ARTLOC_PREFPIECEPICKAREA",
                "UZONE" "ARTLOC_PIECEPICKZONE",
                "WMHA" "ARTLOC_PREFSTOCKAREA",
                "WZONE" "ARTLOC_PREFSTORAGEZONE",
                "WBUFMHA" "ARTLOC_BUFSTOCKAREA",
                "WLDCT" "ARTFEA_CLASSPALLET",
                TRIM(BOTH
                     FROM "MHA") "STOPAL_MHA",
                "RACK" "STOPAL_RACK",
                "HORCOOR" "STOPAL_HORCOOR",
                TRIM(BOTH
                     FROM "VERCOOR") "STOPAL_VERCOOR",
                "ECARRNO" "STOPAL_PALLID",
                "DELAMO" "STOPAL_DELQTY",
                "AMOONCR" "STOPAL_PALLQTY",
                "CQUANT" "ARTFEA_DEFPALLQTY",
                "LDCT" "STOPAL_PALLCLASS",
                SUBSTR("ECARRNO", 1, 18) "PALL_ID"
FROM "L62T14",
     "L62T995",
     "G08T1" "G08T1"
WHERE TRIM(BOTH
           FROM "PARTREV")<>'10000'
  AND TRUNC(CAST("REGDATE" AS TIMESTAMP(9)))<TRUNC(CAST(:PQ1 AS TIMESTAMP(9)))
  AND SUBSTR("PARTNO", 1, 8) LIKE '9%'
  AND "SHORTL62"="SHORTL62"
  AND "PARTNO"="PARTNO"
  AND "PARTREV"="PARTREV"
  AND "DIVCODE"="DIVCODE"