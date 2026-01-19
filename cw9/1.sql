CREATE TABLE IF NOT EXISTS MergedRasters (
    id serial PRIMARY KEY,
    rast raster
);

WITH ref AS (
    SELECT rast AS base_rast
    FROM "Exports"
    LIMIT 1
)
INSERT INTO MergedRasters (rast)
SELECT ST_Union(ST_Resample(e.rast, r.base_rast)) AS rast
FROM "Exports" e, ref r;