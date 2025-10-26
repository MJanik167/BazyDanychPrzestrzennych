CREATE TABLE input_points (
    id SERIAL PRIMARY KEY,
    geometry geometry(Point, 0) NOT NULL,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE T2019_KAR_BRIDGES (
    id SERIAL PRIMARY KEY,
    geom geometry(Point, 3068)
);


-- INSERT INTO input_points(geometry, name) VALUES
--                                   ('POINT(8.36093 49.03174)','1'),
--                                   ('POINT(8.39876 49.00644)','2');
--
--
-- UPDATE input_points
-- SET geometry = ST_SetSRID(geometry, 3068);


INSERT INTO input_points(geometry, name) VALUES
                                    (ST_SetSRID(ST_Point(8.36093, 49.03174), 4326),'1'),
                                    (ST_SetSRID(ST_Point(8.39876, 49.00644), 4326),'2');

UPDATE input_points
SET geometry = ST_Transform(geometry, 3068);


