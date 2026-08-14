SELECT 'redirect' AS component, 'login.sql' AS link
WHERE NOT EXISTS (SELECT 1 FROM Sessions WHERE session_token = sqlpage.cookie('session_token'));

SELECT
  'shell' AS component,
  'FIU Parking' AS title,
  'paw' AS icon,
  '/' AS link,
  JSON('[{"link":"/","title":"Manual Count Form","active":false},{"link":"/manual_counts_reports.sql","title":"Manual Count Reports","active":false},{"link":"/monitor.sql","title":"DMS Monitoring","active":false},{"link":"/sis_physical_check.sql","title":"SIS Physical Check","active":false},{"link":"/sis_reports.sql","title":"SIS Reports","active":false},{"link":"/elevator_check.sql","title":"Elevator Check","active":true},{"link":"/elevator_reports.sql","title":"Elevator Check Reports","active":false}]') AS menu_item,
  TRUE AS sidebar,
  'https://www.fiu.edu/_assets/images/favicon.ico' AS favicon;

SELECT 'form' AS component,
  'Elevator Check' AS title,
  'Submit' AS validate,
  'actions.sql?action=elevator_insert' AS action;

SELECT 'garage' AS name,
  'select' AS type,
  'Garage' AS label,
  TRUE AS required,
  'Select a garage...' AS empty_option,
  jsonb_agg(jsonb_build_object('label', garage_label, 'value', garage_label)) AS options
FROM (VALUES
  ('PG1'),
  ('PG2'),
  ('PG3'),
  ('PG4'),
  ('PG5 West'),
  ('PG5 East'),
  ('PG6 West'),
  ('PG6 East')
) AS garages(garage_label);

SELECT 'stickers' AS name,
  'select' AS type,
  'Elevator stickers in good condition?' AS label,
  TRUE AS required,
  'Select...' AS empty_option,
  jsonb_agg(jsonb_build_object('label', label, 'value', value)) AS options
FROM (VALUES ('Yes', 'true'), ('No', 'false')) AS t(label, value);

SELECT 'tvs' AS name,
  'select' AS type,
  'TVs functional?' AS label,
  TRUE AS required,
  'Select...' AS empty_option,
  jsonb_agg(jsonb_build_object('label', label, 'value', value)) AS options
FROM (VALUES ('Yes', 'true'), ('No', 'false')) AS t(label, value);

SELECT 'notes' AS name,
  'textarea' AS type,
  'Notes' AS label,
  FALSE AS required;
