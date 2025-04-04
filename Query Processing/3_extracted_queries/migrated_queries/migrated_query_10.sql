SELECT EMPLOYEE_ID,
       DEPARTMENT,
       SUM(HOURS_WORKED) AS TOTAL_HOURS_WORKED
FROM TIMESHEETS
GROUP BY EMPLOYEE_ID,
         DEPARTMENT;