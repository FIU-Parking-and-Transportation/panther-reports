SELECT 'redirect' AS component, 'login.sql' AS link
WHERE NOT EXISTS (SELECT 1 FROM Sessions WHERE session_token = sqlpage.cookie('session_token'));

SELECT
  'shell' AS component,
  'FIU Parking' AS title,
  'paw' AS icon,
  '/' AS link,
  JSON('[{"link":"/","title":"Manual Count Form","active":false},{"link":"/reports.sql","title":"Reports","active":false},{"link":"/monitor.sql","title":"DMS Monitoring","active":false},{"link":"/sis_physical_check.sql","title":"SIS Physical Check","active":false},{"link":"/sis_reports.sql","title":"SIS Reports","active":false},{"link":"/elevator_check.sql","title":"Elevator Check","active":false},{"link":"/elevator_reports.sql","title":"Elevator Check Reports","active":true}]') AS menu_item,
  TRUE AS sidebar,
  'https://www.fiu.edu/_assets/images/favicon.ico' AS favicon;

SELECT
  'form' AS component,
  'Elevator Check Report' AS title,
  'Create report' AS validate,
  '/elevator_report.sql' AS action;

SELECT
  'from_date' AS name,
  'From date' AS label,
  'date' AS type,
  (SELECT to_char(date_trunc('week', CURRENT_TIMESTAMP AT TIME ZONE 'EDT'), 'YYYY-MM-DD')) AS value;

SELECT
  'to_date' AS name,
  'To date' AS label,
  'date' AS type,
  (SELECT to_char(date_trunc('week', CURRENT_TIMESTAMP AT TIME ZONE 'EDT') + INTERVAL '5 days', 'YYYY-MM-DD')) AS value;
