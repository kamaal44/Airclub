USE airclub;
SHOW TABLES;

INSERT INTO section (name) VALUES ('airplane');
INSERT INTO section (name) VALUES ('glider');
INSERT INTO section (name) VALUES ('hot air baloon');
INSERT INTO section (name) VALUES ('helicopter');
SELECT * FROM section;

INSERT INTO aircraft (type, tailNumber, sectionID, timeFlown) VALUES ('Cessna 172', 'SP-ARK', 1, 0);
UPDATE aircraft SET timeFlown = 3045.7 WHERE ID = 1;
INSERT INTO aircraft (type, tailNumber, sectionID, timeFlown) VALUES ('Grumman Cheetah', 'N26297', 1, 0);
UPDATE aircraft SET timeFlown = 5241.9 WHERE ID = 2;
INSERT INTO aircraft (type, tailNumber, sectionID, timeFlown) VALUES ('Piper Twin Comanche', 'N329P', 1, 0);
UPDATE aircraft SET timeFlown = 622.0 WHERE ID = 3;
INSERT INTO aircraft (type, tailNumber, sectionID, timeFlown) VALUES ('Bocian', 'SP-3236', 2, 8124.3);
INSERT INTO aircraft (type, tailNumber, sectionID, timeFlown) VALUES ('Puchacz', 'SP-2821', 2, 14506.1);
INSERT INTO aircraft (type, tailNumber, sectionID, timeFlown) VALUES ('Pirat', 'SP-2241', 2, 823.2);
INSERT INTO aircraft (type, tailNumber, sectionID, timeFlown) VALUES ('Junior', 'SP-3304', 2, 286.0);
INSERT INTO aircraft (type, tailNumber, sectionID, timeFlown) VALUES ('Robinson R-22', 'SP-423', 4, 342.3);
SELECT * FROM aircraft;

INSERT INTO airports (code, city, country) VALUES ('EPPK', 'Kobylnica', 'Polska');
INSERT INTO airports (code, city, country) VALUES ('EPLL', 'Łódź', 'Polska');
UPDATE airports SET country = 'Poland' WHERE country = 'Polska';
UPDATE airports SET country = 'Germany' WHERE country = 'Niemcy';
UPDATE airports SET country = 'Spain' WHERE country = 'Hiszpania';
UPDATE airports SET country = 'UK' WHERE country = 'Wielka Brytania';
INSERT INTO airports (code, city, country) VALUES ('KRBD', 'Dallas', 'USA');
INSERT INTO airports (code, city, country) VALUES ('KLNC', 'Lancaster', 'USA');
INSERT INTO airports (code, city, country) VALUES ('EDDF', 'Frankfurt', 'Niemcy');
INSERT INTO airports (code, city, country) VALUES ('LEPA', 'Palma de Mallorca', 'Hiszpania');
INSERT INTO airports (code, city, country) VALUES ('EPLU', 'Lubin', 'Polska');
INSERT INTO airports (code, city, country) VALUES ('EGLL', 'London', 'Wielka Brytania');
SELECT * FROM airports;

INSERT INTO fees (service, hourlyFee) VALUES ('instructor', 80);
INSERT INTO fees (service, hourlyFee) VALUES ('airplane', 690);
INSERT INTO fees (service, hourlyFee) VALUES ('glider', 90);
INSERT INTO fees (service, hourlyFee) VALUES ('hot air baloon', 470);
INSERT INTO fees (service, hourlyFee) VALUES ('helicopter', 2200);
SELECT * FROM fees;


INSERT INTO instructors (firstName, lastName, birthday, sectionID, totalTime) VALUES ('Robert', 'Fox', '1970-12-09', 1, 488.2);
INSERT INTO instructors (firstName, lastName, birthday, sectionID, totalTime) VALUES ('Anna', 'Kot', '1979-10-20', 1, 637.9);
INSERT INTO instructors (firstName, lastName, birthday, sectionID, totalTime) VALUES ('Michał', 'Pies', '1988-03-12', 1, 746.3);
INSERT INTO instructors (firstName, lastName, birthday, sectionID, totalTime) VALUES ('Wojtek', 'Lew', '1992-06-30', 1, 299.2);
INSERT INTO instructors (firstName, lastName, birthday, sectionID, totalTime) VALUES ('Paul', 'Spears', '1966-11-28', 2, 3890.0);
INSERT INTO instructors (firstName, lastName, birthday, sectionID, totalTime) VALUES ('Arkadiusz', 'Tulipan', '1959-06-23', 2, 2678.3);
INSERT INTO instructors (firstName, lastName, birthday, sectionID, totalTime) VALUES ('Aleksandra', 'Osa', '1988-05-19', 2, 378.1);
INSERT INTO instructors (firstName, lastName, birthday, sectionID, totalTime) VALUES ('Aneta', 'Foka', '1979-10-09', 3, 218.9);
INSERT INTO instructors (firstName, lastName, birthday, sectionID, totalTime) VALUES ('Kamil', 'Sroka', '1974-07-26', 4, 3890.4);
SELECT * FROM instructors;
ALTER TABLE instructors DROP sectionID;
ALTER TABLE instructors
DROP FOREIGN KEY FK_instructors_section1;


INSERT INTO pilots (firstName, lastName, birthday, totalTime) VALUES ('Piotr', 'Dąb', '1998-07-07', 12.3);
INSERT INTO pilots (firstName, lastName, birthday, totalTime) VALUES ('Kamil', 'Papryka', '1988-09-22', 45.3);
INSERT INTO pilots (firstName, lastName, birthday, totalTime) VALUES ('Michalina', 'Leszczyna', '1991-08-04', 0);
INSERT INTO pilots (firstName, lastName, birthday, totalTime) VALUES ('Kaja', 'Szpak', '1987-11-23', 456.1);
INSERT INTO pilots (firstName, lastName, birthday, totalTime) VALUES ('John', 'Deer', '1970-12-12', 3476.3);
INSERT INTO pilots (firstName, lastName, birthday, totalTime) VALUES ('Paloma', 'Jeż', '1989-04-18', 62.7);
INSERT INTO pilots (firstName, lastName, birthday, totalTime) VALUES ('Karol', 'Jodła', '2001-04-26', 2.5);
INSERT INTO pilots (firstName, lastName, birthday, totalTime) VALUES ('Amelia', 'Earhart', '1950-11-24', 6678.9);
INSERT INTO pilots (firstName, lastName, birthday, totalTime) VALUES ('Ernest', 'Wilk', '1979-03-02', 26.5);
INSERT INTO pilots (firstName, lastName, birthday, totalTime) VALUES ('Fabian', 'Jabłonka', '1977-01-03', 98.4);
INSERT INTO pilots (firstName, lastName, birthday, totalTime) VALUES ('Justin', 'Magnolia', '1990-09-30', 207.3);
SELECT * FROM pilots;

INSERT INTO logs (date, flightTime, pilotsID, instructorsID, aircraftID, takeOffAirportsID, landAirportsID)
VALUES ('2017-09-01', 1.4, 3, 4, 1, 5, 5);
INSERT INTO logs (date, flightTime, pilotsID, instructorsID, aircraftID, takeOffAirportsID, landAirportsID)
VALUES ('2017-09-02', 2.8, 7, 9, 4, 4, 4);
INSERT INTO logs (date, flightTime, pilotsID, instructorsID, aircraftID, takeOffAirportsID, landAirportsID)
VALUES ('2017-09-04', 2.1, 3, 3, 2, 1, 1);
INSERT INTO logs (date, flightTime, pilotsID, instructorsID, aircraftID, takeOffAirportsID, landAirportsID)
VALUES ('2017-09-05', 3.0, 7, 1, 2, 2, 2);
INSERT INTO logs (date, flightTime, pilotsID, instructorsID, aircraftID, takeOffAirportsID, landAirportsID)
VALUES ('2017-09-02', 0.8, 3, 3, 2, 1, 2);
INSERT INTO logs (date, flightTime, pilotsID, instructorsID, aircraftID, takeOffAirportsID, landAirportsID)
VALUES ('2017-09-07', 4.2, 3, 1, 5, 3, 4);
INSERT INTO logs (date, flightTime, pilotsID, instructorsID, aircraftID, takeOffAirportsID, landAirportsID)
VALUES ('2017-09-09', 2.7, 5, 5, 5, 5, 5);
INSERT INTO logs (date, flightTime, pilotsID, instructorsID, aircraftID, takeOffAirportsID, landAirportsID)
VALUES ('2017-09-11', 4.1, 3, 1, 5, 6, 6);
INSERT INTO logs (date, flightTime, pilotsID, instructorsID, aircraftID, takeOffAirportsID, landAirportsID)
VALUES ('2017-09-14', 4.8, 2, 4, 2, 3, 4);
INSERT INTO logs (date, flightTime, pilotsID, instructorsID, aircraftID, takeOffAirportsID, landAirportsID)
VALUES ('2017-09-18', 2.3, 2, 1, 2, 2, 1);
INSERT INTO logs (date, flightTime, pilotsID, instructorsID, aircraftID, takeOffAirportsID, landAirportsID)
VALUES ('2017-09-20', 1.0, 1, 1, 2, 2, 2);
INSERT INTO logs (date, flightTime, pilotsID, instructorsID, aircraftID, takeOffAirportsID, landAirportsID)
VALUES ('2017-09-22', 1.0, 1, 1, 1, 1, 1);
SELECT * FROM logs;










SELECT * FROM aircraft;
SELECT * FROM airports;
SELECT * FROM instructors;
SELECT * FROM pilots;
SELECT * FROM fees;
SELECT * FROM logs;
SELECT * FROM section;

#trigger, który po wprowadzeniu zapisu z lotu, dodaje czas tego lotu do nalotu pilota, instruktora i samolotu.
DROP TRIGGER Tafter_insert_logs;

DELIMITER $$
CREATE TRIGGER Tafter_insert_logs
AFTER INSERT ON logs
FOR EACH ROW
BEGIN
UPDATE pilots p SET p.totalTime = p.totalTime + new.flightTime WHERE p.ID = new.pilotsID;
UPDATE instructors i SET i.totalTime = i.totalTime + new.flightTime WHERE i.ID = new.instructorsID;
UPDATE aircraft a SET a.timeFlown = a.timeFlown + new.flightTime WHERE a.ID = new.aircraftID;
END;
$$
DELIMITER ;

#widok, który wyświetli pilotów, którzy latali w ciągu ostatnich 6 miesięcy

CREATE VIEW Vcurrent_pilots AS
SELECT DISTINCT p. ID, p.firstName, p.lastName
FROM pilots p
JOIN logs l ON l.pilotsID = p.ID
WHERE l.date > DATE_SUB(CURDATE(), INTERVAL 6 month);


#widok, który pokaże logi
CREATE VIEW Vlogs AS
SELECT l.ID as 'Flight ID', l.date as Date, l.flightTime as 'Flight time', p.lastName as 'Pilot',
i.lastName as Instructor, a.tailNumber as 'Tail number', ap.code as 'Take off', apt.code as 'Landing'
FROM logs l
JOIN pilots p ON l.pilotsID = p.ID
JOIN instructors i ON l.instructorsID = i.ID
JOIN aircraft a ON l.aircraftID = a.ID
JOIN airports ap ON l.takeOffAirportsID = ap.ID
JOIN airports apt ON l.landAirportsID = apt.ID;

#widok, który pokazuje ceny lotów
CREATE VIEW Vprices AS
    SELECT 
        l.ID, ROUND((l.flightTime * f.hourlyFee), 2) AS Price
    FROM
        logs l,
        fees f
    WHERE
        f.service = (SELECT 
                s.name
            FROM
                section s
            WHERE
                s.id = (SELECT 
                        a.sectionID
                    FROM
                        aircraft a
                    WHERE
                        a.ID = l.aircraftID));
