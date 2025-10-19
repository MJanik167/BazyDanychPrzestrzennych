CREATE EXTENSION postgis;

CREATE TABLE buildings (
    id SERIAL PRIMARY KEY,
    geometry geometry(Polygon, 0) NOT NULL,
    name VARCHAR(255) NOT NULL
);
CREATE TABLE roads (
    id SERIAL PRIMARY KEY,
    geometry geometry(Linestring, 0) NOT NULL,
    name VARCHAR(255) NOT NULL
);
CREATE TABLE poi (
    id SERIAL PRIMARY KEY,
    geometry geometry(Point, 0) NOT NULL,
    name VARCHAR(255) NOT NULL
);

INSERT INTO buildings (geometry, name) VALUES
                                           ('POLYGON((9 8, 10 8, 10 9, 9 9, 9 8))', 'BuildingC'),
                                           ('POLYGON((3 8, 5 8, 5 6, 3 6, 3 8))', 'BuildingC'),
                                           ('POLYGON((4 7, 6 7, 6 5, 4 5, 4 7))', 'BuildingB'),
                                           ('POLYGON((8 4,10.5 4, 10.5 1.5, 8 1.5, 8 4))', 'BuildingA');

INSERT INTO roads (geometry, name) VALUES
                                           ('LINESTRING(7.5 10.5, 7.5 0)','RoadY'),
                                           ('LINESTRING(0 4.5, 12 4.5)','RoadX');

INSERT INTO poi (geometry, name) VALUES
                                     ('POINT(6 9.5)','K'),
                                     ('POINT(6.5 6)','J'),
                                     ('POINT(9.5 6)','I'),
                                     ('POINT(1 3.5)','G'),
                                     ('POINT(5.5 1.5)','H');