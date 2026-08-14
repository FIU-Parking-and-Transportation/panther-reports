-- SELECT 'redirect' AS component, 'login.sql' AS link
-- WHERE NOT EXISTS (SELECT 1 FROM Sessions WHERE session_token = sqlpage.cookie('session_token'));
SELECT
  'shell' AS component,
  'FIU Parking' AS title,
  'paw' AS icon,
  '/' AS link,
  5 AS refresh,
  'dark' AS theme,
  JSON('[{"link":"/","title":"Manual Count Form","active":false},{"link":"/manual_counts_reports.sql","title":"Manual Count Reports","active":false},{"link":"/monitor.sql","title":"DMS Monitoring","active":true},{"link":"/sis_physical_check.sql","title":"SIS Physical Check","active":false},{"link":"/sis_reports.sql","title":"SIS Reports","active":false},{"link":"/elevator_check.sql","title":"Elevator Check","active":false},{"link":"/elevator_reports.sql","title":"Elevator Check Reports","active":false}]') AS menu_item,
  TRUE AS sidebar,
  'https://www.fiu.edu/_assets/images/favicon.ico' AS favicon;
SELECT
  'card' AS component,
  'Digital Signage Monitoring',
  5 AS columns;
SELECT
  'dynamic' AS component,
  jsonb_agg(json_build_object(
    'description_md',
    '# '||sign_name,
    'top_image',
    sqlpage.environment_variable('API_BASE_URL')||'/api/v1/digital-signs/'||sign_id||'/image'
  ) ORDER BY sign_name) AS properties
FROM
  Signs;
