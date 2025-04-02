SELECT "SQL1"."Close Date" "Close_Date",
       "SQL1"."Plan Date" "Plan_Date",
       "SQL1"."Route Name" "Route_Name",
       "SQL1"."SHORTR08" "SHORTR08",
       "SQL1"."SHORTO08" "SHORTO08",
       "SQL1"."OCARRNO" "OCARRNO",
       "SQL1"."Package ID" "Package_ID",
       "SQL1"."SHORTO42" "SHORTO42",
       "SQL1"."Astro Order #" "Astro_Order__",
       "SQL1"."ISOM Order #" "ISOM_Order__",
       "SQL1"."Article" "Article",
       "SQL1"."Supplier" "Supplier",
       "SQL1"."Division" "Division",
       "SQL1"."Article Volume" "Article_Volume",
       "SQL1"."PA #" "PA__",
       "SQL1"."HFB #" "HFB__",
       "SQL1"."Article Pieces" "Article_Pieces",
       "SQL1"."Shipment #" "Shipment__",
       "SQL1"."Astro Order Type" "Astro_Order_Type",
       "SQL1"."Receiver" "Receiver",
       "SQL1"."Receiver #" "Receiver__",
       "SQL1"."Ship Qty" "Ship_Qty",
       CASE
           WHEN "SQL1"."Astro Order Type"=12 THEN N'Parcel'
           WHEN "SQL1"."Receiver #" IN (9999,
                                        1943,
                                        1944,
                                        2499,
                                        2629) THEN N'Yellow Line'
           ELSE N'Truck'
       END "c23",
       sum("SQL1"."Shipped Volume"/1000) "Shipped_Volume",
       sum("SQL1"."Order Lines") "Order_Lines",
       sum("SQL1"."Order Sum") "Orders",
       sum("SQL1"."Shipment Sum") "Shipments",
       sum("SQL1"."Packages Sum") "Packages",
       sum("SQL1"."Shipment Sum"*114) "Water_Volume__Shipments___114_",
       sum("SQL1"."OrderLine Sum") "Total_Order_Lines",
       sum("SQL1"."Article Pieces"*"SQL1"."Ship Qty") "Total_Pieces"
FROM "SQL1"
GROUP BY "SQL1"."Close Date",
         "SQL1"."Plan Date",
         "SQL1"."Route Name",
         "SQL1"."SHORTR08",
         "SQL1"."SHORTO08",
         "SQL1"."OCARRNO",
         "SQL1"."Package ID",
         "SQL1"."SHORTO42",
         "SQL1"."Astro Order #",
         "SQL1"."ISOM Order #",
         "SQL1"."Article",
         "SQL1"."Supplier",
         "SQL1"."Division",
         "SQL1"."Article Volume",
         "SQL1"."PA #",
         "SQL1"."HFB #",
         "SQL1"."Article Pieces",
         "SQL1"."Shipment #",
         "SQL1"."Astro Order Type",
         "SQL1"."Receiver",
         "SQL1"."Receiver #",
         "SQL1"."Ship Qty",
         CASE
             WHEN "SQL1"."Astro Order Type"=12 THEN N'Parcel'
             WHEN "SQL1"."Receiver #" IN (9999,
                                          1943,
                                          1944,
                                          2499,
                                          2629) THEN N'Yellow Line'
             ELSE N'Truck'
         END