SELECT 'redirect' AS component, 'login.sql' AS link
WHERE NOT EXISTS (SELECT 1 FROM Sessions WHERE session_token = sqlpage.cookie('session_token'));

SELECT
  'shell' AS component,
  'FIU Parking' AS title,
  'paw' AS icon,
  '/' AS link,
  JSON('[{"link":"/","title":"Manual Count Form","active":false},{"link":"/reports.sql","title":"Reports","active":false},{"link":"/monitor.sql","title":"DMS Monitoring","active":false},{"link":"/sis_physical_check.sql","title":"SIS Physical Check","active":true},{"link":"/sis_reports.sql","title":"SIS Reports","active":false},{"link":"/elevator_check.sql","title":"Elevator Check","active":false},{"link":"/elevator_reports.sql","title":"Elevator Check Reports","active":false}]') AS menu_item,
  TRUE AS sidebar,
  'https://www.fiu.edu/_assets/images/favicon.ico' AS favicon;

SELECT 'form' AS component,
  'SIS Physical Check' AS title,
  'Submit' AS validate,
  'actions.sql?action=sis_insert' AS action;

SELECT 'garage' AS name,
  'select' AS type,
  'Garage' AS label,
  TRUE AS required,
  'Select a garage...' AS empty_option,
  jsonb_agg(jsonb_build_object('label', garage_name, 'value', garage_name)) AS options
FROM (VALUES
  ('PG1'),
  ('PG2'),
  ('PG3'),
  ('PG4'),
  ('PG5'),
  ('PG6')
) AS garages(garage_name);

SELECT 'zone' AS name,
  'select' AS type,
  'Zone' AS label,
  TRUE AS required,
  'Select a zone...' AS empty_option,
  jsonb_agg(jsonb_build_object('label', zone_label, 'value', zone_label)) AS options
FROM (VALUES
  ('N - NE'),
  ('NE - E'),
  ('E - SE'),
  ('SE - S'),
  ('S - SW'),
  ('SW - W'),
  ('W - NW'),
  ('NW - N')
) AS zones(zone_label);

SELECT 'triggered' AS name,
  'select' AS type,
  'Trigger' AS label,
  TRUE AS required,
  'Select...' AS empty_option,
  jsonb_agg(jsonb_build_object('label', label, 'value', value)) AS options
FROM (VALUES ('Yes', 'true'), ('No', 'false')) AS t(label, value);

SELECT 'notes' AS name,
  'textarea' AS type,
  'Notes' AS label,
  FALSE AS required;
