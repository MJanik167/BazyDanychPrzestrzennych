SELECT SUM(st_length(geometry)) FROM roads;

SELECT st_asewkt(geometry), st_area(geometry), st_perimeter(geometry) FROM buildings
where name = 'BuildingA';

SELECT name, st_area(geometry) FROM buildings
ORDER BY name;

SELECT name, st_area(geometry) FROM buildings
ORDER BY st_area(geometry) DESC
LIMIT 2;

SELECT st_distance(
       (SELECT geometry FROM buildings WHERE name = 'BuildingC'),
       (SELECT geometry FROM poi WHERE name = 'K')
       );

SELECT st_area(
            st_difference(
                c.geometry,
                st_buffer(b.geometry, 0.5)
            )
       ) FROM buildings c
JOIN buildings b ON b.name = 'BuildingB'
WHERE c.name = 'BuildingC';

SELECT * FROM buildings b
JOIN roads r ON r.name='RoadX'
where st_y(st_centroid(b.geometry))>st_y(st_centroid(r.geometry));

SELECT st_area(
               st_difference(
                geometry,
                st_geomfromtext('Polygon((4 7,6 7,6 8,4 8,4 7))')
                ))
FROM buildings
WHERE name = 'BuildingC';
