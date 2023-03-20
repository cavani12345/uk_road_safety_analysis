/* get Accident Severity and Total Accidents per Vehicle Type */

SELECT vt.label AS "Vehicle Type", ac.accident_severity AS "Accident Severity", COUNT(v.accident_index) AS "Total Accident"
FROM accident ac
JOIN vehicles v ON ac.accident_index = v.accident_index
JOIN vehicle_types vt ON v.vehicle_type = vt.code
GROUP BY vt.label,ac.accident_severity
ORDER BY COUNT(v.accident_index) DESC

/* get Total Accidents and average Accident Severity  per Vehicle Type */

SELECT vt.label AS "Vehicle Type", AVG(ac.accident_severity) AS "Accident Severity", COUNT(v.accident_index) AS "Total Accident"
FROM accident ac
JOIN vehicles v ON ac.accident_index = v.accident_index
JOIN vehicle_types vt ON v.vehicle_type = vt.code
GROUP BY vt.label
ORDER BY COUNT(v.accident_index) DESC

/* Average Severity and Total Accidents by Motorcyle */

SELECT vt.label AS "Vehicle Type", AVG(ac.accident_severity) AS "Average Severity", COUNT(ac.accident_index) AS "Total Accident"
FROM accident ac
JOIN vehicles v ON ac.accident_index = v.accident_index
JOIN vehicle_types vt ON v.vehicle_type = vt.code
WHERE vt.label ILIKE '%Motorcycle%'
GROUP BY vt.label
ORDER BY 2 DESC

/* Average Severity by vehicle type */

SELECT vt.label AS "Vehicle Type", AVG(ac.accident_severity) AS "Average Severity"
FROM accident ac
JOIN vehicles v ON ac.accident_index = v.accident_index
JOIN vehicle_types vt ON v.vehicle_type = vt.code
GROUP BY vt.label
ORDER BY 2 DESC
