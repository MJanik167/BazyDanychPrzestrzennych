SELECT st_area(
               st_buffer(
                       st_shortestline(
                               obj3.geom,
                               obj4.geom),
                       5))
FROM obiekty AS obj3, obiekty AS obj4
WHERE obj3.nazwa = 'obiekt3' AND obj4.nazwa = 'obiekt4';

SELECT st_makepolygon(st_addpoint(geom,st_startpoint(geom)))
FROM obiekty
where nazwa = 'objekt4';
--linia musi być zamknięta, więc dodany zostaje startpoint

INSERT INTO obiekty (nazwa,geom)
SELECT 'obiekt7',st_collect(obj3.geom, obj4.geom)
FROM obiekty AS obj3, obiekty AS obj4
WHERE obj3. nazwa = 'objekt3' AND obj4.nazwa = 'objekt4';

SELECT sum(st_area(st_buffer(geom, 5)))
FROM obiekty
WHERE NOT st_hasarc(geom)