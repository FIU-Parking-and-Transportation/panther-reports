INSERT INTO Signs (sign_id, sign_name) VALUES
  ('e840abf8-767f-439d-90ad-0aee196e4a83', '107th Ave'),
  ('94e53439-562b-4b6d-96c4-fb7ca279d0ac', '108th Ave'),
  ('006be44d-fe24-472b-aece-de90517a3243', '109th Ave'),
  ('dfc9c620-b917-4c1a-801b-a0295244dfa6', '112th Ave'),
  ('2cd37731-7e9e-48f2-9de0-b255a126603e', '16th St'),
  ('134b5e1e-f71f-41b3-918a-8b69a364127b', 'Lot 1 North'),
  ('5ed30114-35b0-4f9c-9063-eea474344212', 'Lot 1 Traffic'),
  ('2dfeea70-0025-4787-b188-5869c80b209f', 'Lot 3 Presidents House'),
  ('e51f3f5d-57ce-46ad-a2f7-c267f46ae6d7', 'Lot 3 SASC'),
  ('1bd83594-2470-4650-8a1e-0f747d4dff50', 'Lot 5 North'),
  ('1498c272-b2b9-432f-b97e-d4745aef332b', 'Lot 5 South'),
  ('1fd130fa-20f6-4c13-b812-3f240066cd97', 'Lot 7 East'),
  ('71140ca3-7d00-4ba9-a221-424f3da6986f', 'Lot 7 West'),
  ('85f6f0d3-1f3f-4bd7-93dd-4185f105f343', 'Lot 9 Solar House'),
  ('051683d8-681a-4e59-82c4-7ed7b7764be2', 'Lot 9 Traffic'),
  ('c4b99c4c-b171-4342-8a59-d0452462ee87', 'Lot 9 West'),
  ('d55ad231-f55b-41c3-b1ef-30f175b1d70c', 'PG3 Wall'),
  ('235d784d-40ac-498c-b73a-0a6fff3d50d3', 'PG5 Wall'),
  ('f4c3d563-c837-49f2-8915-b53937c5c622', 'PG6 East'),
  ('de8bff49-2272-44ef-84f7-d56624e1e536', 'PG6 West')
ON CONFLICT (sign_id) DO UPDATE SET
  sign_name  = EXCLUDED.sign_name,
  updated_at = CURRENT_TIMESTAMP;
