-- SELECT 'redirect' AS component, 'login.sql' AS link
-- WHERE NOT EXISTS (SELECT 1 FROM Sessions WHERE session_token = sqlpage.cookie('session_token'));
SELECT
  'shell' AS component,
  'FIU Parking' AS title,
  'paw' AS icon,
  '/' AS link,
  5 AS refresh,
  'dark' AS theme,
  JSON('[{"link":"/","title":"Manual Count Form","active":false},{"link":"/reports.sql","title":"Reports","active":false},{"link":"/monitor.sql","title":"DMS Monitoring","active":true}]') AS menu_item,
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
    'http://'||abbrev(sign_ip) ||'/daktronics/imaging/1.0/GetImage'
  )) AS properties
FROM
  Signs;
