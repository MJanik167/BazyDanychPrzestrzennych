CREATE TABLE obiekty (
    id SERIAL PRIMARY KEY,
    nazwa TEXT,
    geom GEOMETRY NOT NULL
);

INSERT INTO obiekty(nazwa, geom) VALUES
                                     ('obiekt1',ST_GeomFromText(
                                            'GEOMETRYCOLLECTION(
                                            LINESTRING(0 1, 1 1),
                                            CIRCULARSTRING(1 1, 2 0, 3 1),
                                            CIRCULARSTRING(3 1, 4 2, 5 1),
                                            LINESTRING(5 1, 6 1))',
                                            0)
                                     ),
                                     ('obiekt2',ST_GeomFromText(
                                            'GEOMETRYCOLLECTION(
                                            LINESTRING(10 6, 14 6),
                                            CIRCULARSTRING(14 6, 16 4,14 2),
                                            CIRCULARSTRING(14 2, 12 0, 12 2),
                                            LINESTRING(10 2, 10 6),
                                            CIRCULARSTRING(11 2, 12 3, 12 2),
                                            CIRCULARSTRING(13 2, 12 1, 11 2))',
                                            0)
                                     ),
                                     ('obiekt3',ST_GeomFromText(
                                            'LINESTRING(10 17,12 13, 7 15)',
                                            0)
                                     ),
                                     ('obiekt4',ST_GeomFromText(
                                            'LINESTRING(20 20,25 25, 27 24,25 22, 26 21, 22 19, 20.5 19.5)',
                                            0)
                                     ),
                                     ('obiekt5',ST_GeomFromText(
                                            'MULTIPOINT Z(30 30 59, 38 32 234)',
                                            0)
                                     ),
                                     ('obiekt6',ST_GeomFromText(
                                            'GEOMETRYCOLLECTION(
                                            LINESTRING(1 1,3 2),
                                            POINT(4 2))',
                                            0)
                                     );

--                                     ('obiekt1',ST_Collect(ARRAY[
--                                         ST_GeomFromText('LINESTRING(0 1, 1 1)'),
--                                         ST_LineToCurve(ST_GeomFromText('LINESTRING(1 1, 2 0, 3 1)')),
--                                         ST_LineToCurve(ST_GeomFromText('LINESTRING(3 1, 4 2, 5 1)')),
--                                         ST_GeomFromText('LINESTRING(5 1, 6 1)')]
--                                         )),
--                                      ('obiekt2',ST_Collect(ARRAY[
--                                         ST_GeomFromText('LINESTRING(10 6, 14 6)', 0),
--                                         ST_LineToCurve(ST_GeomFromText('LINESTRING(14 6, 16 4, 14 2)', 0)),
--                                         ST_LineToCurve(ST_GeomFromText('LINESTRING(14 2, 12 0, 12 2)', 0)),
--                                         ST_GeomFromText('LINESTRING(10 2, 10 6)', 0),
--                                         ST_LineToCurve(ST_GeomFromText('LINESTRING(11 2, 12 3, 12 2)', 0)),
--                                         ST_LineToCurve(ST_GeomFromText('LINESTRING(13 2, 12 1, 11 2)', 0))
--                                     ])



