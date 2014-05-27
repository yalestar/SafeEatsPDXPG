CREATE SCHEMA ch01;
CREATE TABLE ch01.lu_franchises(
                   franchise_code char(1) PRIMARY KEY,
                   franchise_name varchar(100));

CREATE TABLE ch01.fastfoods (
  franchise char(1) NOT NULL,
  lat double precision,
  lon double precision
);

-- Using geometry column
SELECT AddGeometryColumn('ch01', 'fastfoods', 'geom', 2163, 'POINT',2);

UPDATE ch01.fastfoods SET geom = ST_Transform(ST_GeomFromText('POINT(' || lon || ' ' || lat || ')',4326), 2163);

CREATE INDEX idx_fastfoods_geom on ch01.fastfoods using gist(geom);

-- Using geography column
UPDATE ch01.fastfoods SET geog = ST_GeogFromText('SRID=4326;POINT(' || lon || ' ' || lat || ')');

CREATE INDEX idx_fastfoods_geog ON ch01.fastfoods USING gist(geog);


ALTER TABLE ch01.fastfoods ADD COLUMN ff_id SERIAL PRIMARY KEY;

ALTER TABLE ch01.fastfoods
                ADD CONSTRAINT fk_fastfoods_franchise
                FOREIGN KEY (franchise)
                REFERENCES ch01.lu_franchises (franchise_code)
           ON UPDATE CASCADE ON DELETE RESTRICT;


update restaurants set location = ST_SetSRID(ST_MakePoint(lon, lat), 4326);
	ST_GeographyFromText('SRID=4326;POINT(' || lon || ' ' || lat || ')');
	ST_SetSRID(ST_MakePoint(long, lat), 4326);