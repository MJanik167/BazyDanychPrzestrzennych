CREATE EXTENSION IF NOT EXISTS postgis;

SELECT * FROM t2019_kar_buildings b19
JOIN t2018_kar_buildings b18 ON b18.polygon_id = b19.polygon_id
WHERE b19.polygon_id NOT IN (SELECT polygon_id FROM t2018_kar_buildings) OR NOT st_equals(b18.geom, b19.geom);

SELECT  p2019.type ,COUNT(*) FROM t2019_poi p2019
WHERE
    p2019.poi_id NOT IN (SELECT poi_id FROM t2018_poi)
    AND
    st_within(
        st_transform(p2019.geom,25832),
        (SELECT st_union(st_buffer(st_transform(b19.geom, 25832),500)) FROM t2019_kar_buildings b19
        JOIN t2018_kar_buildings b18 ON b18.polygon_id = b19.polygon_id
        WHERE NOT st_equals(b18.geom, b19.geom) OR b19.polygon_id NOT IN (SELECT polygon_id FROM t2018_kar_buildings))
    )
GROUP BY p2019.type;

SELECT *, st_transform(geom,3068) as projection FROM t2019_street_node
WHERE  st_within(
        st_transform(t2019_street_node.geom,25832),
        (SELECT st_buffer(ST_MakeLine(st_transform(geometry, 25832)),500) FROM input_points)
    );


SELECT COUNT(*) FROM t2019_poi p
WHERE st_within(
        st_transform(p.geom, 25832),
        (SELECT st_union(st_buffer(st_transform(l.geom, 25832),200)) FROM t2019_land_use_a l where l.type like 'Park%')
      )
AND
    p.type = 'Sporting Goods Store';


INSERT INTO T2019_KAR_BRIDGES (geom)
SELECT DISTINCT(ST_Intersection(
            ST_Transform(r.geom, 3068),
            ST_Transform(w.geom, 3068)))
FROM t2019_railways r
JOIN t2019_water_lines w ON ST_Intersects(
       ST_Transform(r.geom, 3068),
       ST_Transform(w.geom, 3068)
   );
