SELECT DISTINCT SUBSTR("INORDNO", 1, 5) "RECT_NO",
                CONCAT(CONCAT(SUBSTR("INORDNO", 1, 5), ' - '), SUBSTR("INORDNO", 6, 3)) "RECT_NO1",
                SUBSTR("INORDNO", 6, 3) "DATA_ITEM2",
                "ORDLINE" "DATA_ITEM1"
FROM "G36T13"
WHERE "ORDLINE">0
  AND SUBSTR("INORDNO", 6, 3) IN ('STO',
                                           'LSC')