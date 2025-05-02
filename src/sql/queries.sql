-- queries.sql
-- Complete each mission by writing your SQL query below the instructions.
-- Don't forget to end each query with a semicolon ;

SELECT * FROM regions;
SELECT * FROM species;
SELECT * FROM climate;
SELECT * FROM observations;


-- MISSION 1 Queremos conocer la biodiversidad de cada región. ¿Qué regiones tienen más especies registradas?
-- Your query here:
SELECT region, COUNT(DISTINCT species_id) AS species_count
FROM observations
GROUP BY region
ORDER BY species_count DESC;


-- MISSION 2 ¿Qué meses tienen mayor actividad de observación? Agrupa por mes a partir de las fechas de observación reales. Es útil para detectar estacionalidad.
-- Your query here:
SELECT MONTH(observation_date) AS month, COUNT(*) AS observation_count
FROM observations
GROUP BY month
ORDER BY observation_count DESC;

-- MISSION 3 Detecta las especies con pocos individuos registrados (posibles casos raros)
-- Your query here:
SELECT species_id, COUNT(*) AS individual_count
FROM observations
GROUP BY species_id
HAVING individual_count < 10
ORDER BY individual_count ASC;

-- MISSION 4 ¿Qué región tiene el mayor número de especies distintas observadas?
-- Your query here:
SELECT region, COUNT(DISTINCT species_id) AS species_count
FROM observations
GROUP BY region
ORDER BY species_count DESC
LIMIT 1;

-- MISSION 5 ¿Qué especies han sido observadas con mayor frecuencia?
-- Your query here:
SELECT species_id, COUNT(*) AS observation_count
FROM observations
GROUP BY species_id
ORDER BY observation_count DESC;

-- MISSION 6 Queremos identificar a los observadores más activos. ¿Quiénes son las personas que más registros de observación han realizado?
-- Your query here:
SELECT observer_id, COUNT(*) AS observation_count
FROM observations
GROUP BY observer_id
ORDER BY observation_count DESC;

-- MISSION 7 ¿Qué especies no han sido observadas nunca? Comprueba si existen especies en la tabla species que no aparecen en observations.
-- Your query here:
SELECT species_id
FROM species
WHERE species_id NOT IN (SELECT DISTINCT species_id FROM observations);

-- MISSION 8 ¿En qué fechas se observaron más especies distintas? Esta informacion es ideal para explorar la biodiversidad máxima en días específicos.
-- Your query here:
SELECT observation_date, COUNT(DISTINCT species_id) AS species_count
FROM observations
GROUP BY observation_date
ORDER BY species_count DESC;