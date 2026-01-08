-- =========================================================
-- Proyecto 4: SQL
-- Base de datos: Bookings (PostgreSQL Demo)
-- =========================================================


-- 1. Recuperar los vuelos y su identificador que figuren con status "On Time"
SELECT flight_id, status
FROM flights
WHERE status = 'On Time';


-- 2. Extraer todas las reservas cuya cantidad total sea mayor a 1.000.000
-- (Las unidades monetarias son rublos)
SELECT *
FROM bookings
WHERE total_amount > 1000000;


-- 3. Extraer todas las columnas de los modelos de aviones disponibles
SELECT *
FROM aircraft_data;


-- 4. Extraer los identificadores de vuelo que han volado con un Boeing 737
-- Código del modelo: 733
SELECT flight_id
FROM flights
WHERE aircraft_code = '733';


-- 5. Mostrar la información detallada de los tickets comprados
-- por personas que se llaman Irina
SELECT *
FROM tickets
WHERE passenger_name ILIKE 'Irina%';


-- =========================================================
-- QUERIES OPCIONALES
-- =========================================================


-- 6. Mostrar las ciudades con más de un aeropuerto
SELECT city, COUNT(*) AS num_airports
FROM airports_data
GROUP BY city
HAVING COUNT(*) > 1;


-- 7. Mostrar el número de vuelos por modelo de avión
SELECT aircraft_code, COUNT(*) AS total_flights
FROM flights
GROUP BY aircraft_code;


-- 8. Reservas con más de un billete (varios pasajeros)
SELECT book_ref, COUNT(*) AS total_tickets
FROM tickets
GROUP BY book_ref
HAVING COUNT(*) > 1;


-- 9. Vuelos con retraso de salida superior a una hora
SELECT flight_id,
       scheduled_departure,
       actual_departure,
       actual_departure - scheduled_departure AS delay
FROM flights
WHERE actual_departure IS NOT NULL
  AND actual_departure - scheduled_departure > INTERVAL '1 hour';
