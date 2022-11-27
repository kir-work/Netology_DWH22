-- DROP SCHEMA STAGE;

CREATE SCHEMA STAGE AUTHORIZATION postgres;

--DROP TABLE IF EXISTS STAGE.passenger CASCADE;
CREATE TABLE STAGE.passenger ( passenger_id varchar(20) not null,
    passenger_name varchar(300) not null
);

