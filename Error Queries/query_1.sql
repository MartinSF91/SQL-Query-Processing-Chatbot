SELECT "SQL1"."building",
       "SQL1"."ma_group",
       "SQL1"."member",
       "SQL1"."tabrefcd",
       "SQL1"."statdate",
       "SQL1"."trunc(w08t1.statdate)",
       "SQL1"."msysstat",
       "SQL1"."mstat",
       "SQL1"."bookqty",
       Substr("SQL1"."member", 1, 3),
       Trim(both FROM "SQL1"."member")
FROM   ((SELECT w08t1.building,
                w08t1.ma_group,
                w08t1.member,
                w08t1.tabrefcd,
                w08t1.statdate,
                Trunc(w08t1.statdate),
                w08t1.msysstat,
                w08t1.mstat,
                w08t1.bookqty
         FROM   w08t1
         WHERE  ( ( w08t1.ma_group LIKE '%WG%'
                     OR w08t1.ma_group LIKE '%EG%' )
                  AND w08t1.mstat = 1
                  AND w08t1.msysstat IN ( 0, 3 ) )
         UNION
         SELECT w08t1.building,
                w08t1.ma_group,
                w08t1.member,
                w08t1.tabrefcd,
                w08t1.statdate,
                Trunc(w08t1.statdate),
                w08t1.msysstat,
                w08t1.mstat,
                w08t1.bookqty
         FROM   w08t1
         WHERE  ( ( w08t1.ma_group LIKE '%E        '
                     OR w08t1.ma_group LIKE '%W        ' )
                  AND w08t1.mstat IN ( 2, 0 )
                  AND w08t1.member LIKE '%A      ' ))) "SQL1"