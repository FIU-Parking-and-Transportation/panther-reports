SELECT 'redirect' AS component, 'login.sql' AS link
WHERE NOT EXISTS (SELECT 1 FROM Sessions WHERE session_token = sqlpage.cookie('session_token'));

SELECT
  'shell' AS component,
  'FIU Parking' AS title,
  'paw' AS icon,
  '/' AS link,
  JSON('[{"link":"/","title":"Manual Count Form","active":false},{"link":"/reports.sql","title":"Reports","active":false},{"link":"/monitor.sql","title":"DMS Monitoring","active":false},{"link":"/sis_physical_check.sql","title":"SIS Physical Check","active":false},{"link":"/sis_reports.sql","title":"SIS Reports","active":false},{"link":"/elevator_check.sql","title":"Elevator Check","active":false},{"link":"/elevator_reports.sql","title":"Elevator Check Reports","active":false}]') AS menu_item,
  TRUE AS sidebar,
  'https://www.fiu.edu/_assets/images/favicon.ico' AS favicon;

SELECT 'button' AS component;
SELECT 'Return' AS title,
  'arrow-left' AS icon,
  '/elevator_reports.sql' AS link;

SELECT 'csv' AS component,
  'Download report' AS title,
  'file-download' AS icon,
  'green' AS color,
  TRUE AS bom,
  'elevator_check_' || to_char(to_timestamp(:from_date, 'YYYY-MM-DD'), 'YYYYMMDD') || '-' || to_char(to_timestamp(:to_date, 'YYYY-MM-DD'), 'YYYYMMDD') AS filename;
SELECT
  garage AS Garage,
  CASE WHEN stickers THEN 'Yes' ELSE 'No' END AS "Stickers in good condition",
  notes AS Notes,
  to_char((timestamp AT TIME ZONE 'EDT'), 'MM-DD-YYYY HH:MI:SS') AS Time
FROM ElevatorChecks
WHERE timestamp >= to_timestamp(:from_date, 'YYYY-MM-DD')
  AND timestamp <= to_timestamp(:to_date || ' 23:59:59', 'YYYY-MM-DD HH24:MI:SS');

SELECT 'table' AS component,
  TRUE AS small,
  TRUE AS sort,
  TRUE AS striped_rows;
SELECT
  garage AS Garage,
  CASE WHEN stickers THEN 'Yes' ELSE 'No' END AS "Stickers in good condition",
  notes AS Notes,
  to_char((timestamp AT TIME ZONE 'EDT'), 'MM-DD-YYYY HH:MI:SS') AS Time
FROM ElevatorChecks
WHERE timestamp >= to_timestamp(:from_date, 'YYYY-MM-DD')
  AND timestamp <= to_timestamp(:to_date || ' 23:59:59', 'YYYY-MM-DD HH24:MI:SS');
