-- DROP SCHEMA dim;

CREATE SCHEMA dim AUTHORIZATION postgres;

--DROP TABLE IF EXISTS dim.passenger CASCADE;
CREATE TABLE dim.passenger (
    id serial not null primary key,
    passenger_id varchar(20) not null,
    passenger_name varchar(300) not null
);


MERGE INTO dim.passenger dp
USING STAGE.passenger sp
ON sp.passenger_id = dp.passenger_id
WHEN MATCHED and sp.passenger_name <> dp.passenger_name then
update set passenger_name=sp.passenger_name
WHEN NOT MATCHED THEN
  INSERT (passenger_id, passenger_name)
  VALUES (sp.passenger_id, sp.passenger_name);