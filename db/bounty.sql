DROP TABLE IF EXISTS bounty_hunter;

  CREATE TABLE bounty_hunter(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  bounty_value INT8,
  homeworld VARCHAR(255),
  favourite_weapon VARCHAR(255)
  );