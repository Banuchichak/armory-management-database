CREATE DATABASE armory;
USE armory;

CREATE TABLE weapon_types (
    type_id INT AUTO_INCREMENT PRIMARY KEY,
    type_name VARCHAR(100) NOT NULL
);

CREATE TABLE calibers (
    caliber_id INT AUTO_INCREMENT PRIMARY KEY,
    caliber_name VARCHAR(50) NOT NULL
);

CREATE TABLE weapons (
    weapon_id INT AUTO_INCREMENT PRIMARY KEY,
    serial_number VARCHAR(100) UNIQUE NOT NULL,
    type_id INT,
    caliber_id INT,
    purchase_date DATE,
    status VARCHAR(20) DEFAULT 'Available',
    FOREIGN KEY (type_id) REFERENCES weapon_types(type_id),
    FOREIGN KEY (caliber_id) REFERENCES calibers(caliber_id)
);

CREATE TABLE ammunition (
    ammo_id INT AUTO_INCREMENT PRIMARY KEY,
    caliber_id INT,
    quantity INT NOT NULL,
    storage_location VARCHAR(100),
    FOREIGN KEY (caliber_id) REFERENCES calibers(caliber_id)
);

CREATE TABLE personnel (
    person_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(150),
    clearance_level INT
);


CREATE TABLE weapon_issuance (
    issue_id INT AUTO_INCREMENT PRIMARY KEY,
    weapon_id INT,
    person_id INT,
    issue_date DATE,
    return_date DATE,
    FOREIGN KEY (weapon_id) REFERENCES weapons(weapon_id),
    FOREIGN KEY (person_id) REFERENCES personnel(person_id)
);

CREATE TABLE ammo_issuance (
    ammo_issue_id INT AUTO_INCREMENT PRIMARY KEY,
    ammo_id INT,
    person_id INT,
    quantity INT,
    issue_date DATE,
    FOREIGN KEY (ammo_id) REFERENCES ammunition(ammo_id),
    FOREIGN KEY (person_id) REFERENCES personnel(person_id)
);

CREATE TABLE maintenance_records (
    record_id INT AUTO_INCREMENT PRIMARY KEY,
    weapon_id INT,
    maintenance_date DATE,
    performed_by VARCHAR(150),
    notes TEXT,
    FOREIGN KEY (weapon_id) REFERENCES weapons(weapon_id)
);

CREATE TABLE clearance_levels (
    level_id INT PRIMARY KEY,
    description VARCHAR(200)
);

CREATE TABLE suppliers (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_name VARCHAR(150),
    contact_info VARCHAR(200)
);

CREATE TABLE purchase_orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_id INT,
    weapon_id INT,
    order_date DATE,
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id),
    FOREIGN KEY (weapon_id) REFERENCES weapons(weapon_id)
);

INSERT INTO weapon_types (type_name) VALUES
('Assault Rifle'),
('Battle Rifle'),
('Carbine'),
('Sniper Rifle'),
('Designated Marksman Rifle'),
('Submachine Gun'),
('Light Machine Gun'),
('Heavy Machine Gun'),
('Shotgun'),
('Pistol'),
('Revolver'),
('Grenade Launcher'),
('Anti-Material Rifle'),
('Compact SMG'),
('Bullpup Rifle'),
('Precision Rifle'),
('Machine Pistol'),
('Tactical Shotgun'),
('Short-Barrel Rifle'),
('PDW');


INSERT INTO calibers (caliber_name) VALUES
('5.56×45mm NATO'),
('7.62×51mm NATO'),
('7.62×39mm'),
('9×19mm Parabellum'),
('7.65×17mm'),
('.45 ACP'),
('12 Gauge'),
('6.5 Creedmoor'),
('300 Winchester Magnum'),
('.50 BMG'),
('5.45×39mm'),
('.357 Magnum'),
('.44 Magnum'),
('.22 LR'),
('10mm Auto'),
('40 S&W'),
('12.7×108mm'),
('9×18mm Makarov'),
('4.6×30mm'),
('5.7×28mm');

INSERT INTO personnel (full_name, clearance_level) VALUES
('John Reed', 3),
('Michael Torres', 2),
('Aylin Hernandez', 4),
('Daniel Brown', 1),
('Samantha Green', 3),
('Robert Wilson', 5),
('Emily Carter', 2),
('Jason Miller', 4),
('Laura Price', 3),
('Kevin Stewart', 1),
('Maria Lopez', 2),
('Thomas Wright', 4),
('Brian Hall', 5),
('Jennifer Clark', 3),
('David Adams', 2),
('Olivia Walker', 3),
('Victor Young', 4),
('Zara Martinez', 1),
('Evan Brooks', 5),
('Hannah Scott', 2);

INSERT INTO clearance_levels (level_id, description) VALUES
(1, 'Basic Access'),
(2, 'Restricted Access'),
(3, 'Confidential Access'),
(4, 'Secret Access'),
(5, 'Top Secret Access'),
(6, 'Ammunition Handling Special'),
(7, 'Explosives Handling'),
(8, 'Weapons Maintenance Level 1'),
(9, 'Weapons Maintenance Level 2'),
(10,'Armory Supervisor');

INSERT INTO suppliers (supplier_name, contact_info) VALUES
('Armatech Industries', 'armatech@example.com'),
('DefensePro Solutions', 'contact@defensepro.com'),
('Falcon Military Corp', 'falconcorp@example.com'),
('Guardian Arms Ltd', 'support@guardianarms.com'),
('Tactical Systems Group', 'info@tacticalsys.com'),
('NorthForge Armaments', 'service@northforge.com'),
('Precision Ballistics Co.', 'sales@precisionballistics.com'),
('Redline Tactical Supply', 'orders@redlinetac.com'),
('Vertex Defense Group', 'vertexdefense@example.com'),
('IronWall Munitions', 'info@ironwallmunitions.com'),
('Atlas Armory', 'atlasarmory@example.com'),
('Blackstone Military Supply', 'blackstone@example.com'),
('Omega Tactical Industries', 'omega@example.com'),
('Vanguard Weapons Supply', 'vanguard@example.com'),
('Crusader Defense Systems', 'crusader@example.com'),
('Cerberus Arms Corp', 'contact@cerberusarms.com'),
('KnightShield International', 'support@knightshield.com'),
('SteelFront Armaments', 'steelfront@example.com'),
('Bravo Tactical Gear', 'bravotac@example.com'),
('Sentinel Precision Arms', 'sentinel@example.com');

INSERT INTO weapons (serial_number, type_id, caliber_id, purchase_date, status) VALUES
('AR556-001', 1, 1, '2020-03-10', 'Available'),
('BR762-014', 2, 2, '2019-11-22', 'Available'),
('CB556-233', 3, 1, '2021-06-14', 'Available'),
('SR65C-889', 4, 8, '2018-02-09', 'Maintenance'),
('DMR556-120', 5, 1, '2022-01-27', 'Available'),
('SMG9-984', 6, 4, '2020-09-18', 'Issued'),
('LMG762-450', 7, 2, '2017-05-11', 'Available'),
('HMG50-020', 8, 10, '2016-08-03', 'Available'),
('SG12-331', 9, 7, '2021-12-01', 'Issued'),
('PST9-765', 10, 4, '2023-04-18', 'Available'),
('REV357-219', 11, 12, '2019-07-29', 'Available'),
('GL40-052', 12, 16, '2020-10-13', 'Available'),
('AMR50-777', 13, 10, '2015-03-25', 'Maintenance'),
('CSMG9-004', 14, 4, '2022-09-02', 'Available'),
('BP556-421', 15, 1, '2021-03-11', 'Available'),
('PR762-554', 16, 2, '2018-06-19', 'Maintenance'),
('MP10-210', 17, 15, '2023-01-05', 'Available'),
('TSG12-092', 18, 7, '2022-07-22', 'Available'),
('SBR556-840', 19, 1, '2021-08-16', 'Available'),
('PDW57-330', 20, 20, '2023-05-10', 'Issued'),
('AR556-002', 1, 1, '2020-05-22', 'Available'),
('AR556-003', 1, 1, '2020-05-23', 'Available'),
('PST9-766', 10, 4, '2023-04-20', 'Available'),
('PST9-767', 10, 4, '2023-04-21', 'Available'),
('SMG9-985', 6, 4, '2021-01-12', 'Available'),
('SMG9-986', 6, 4, '2021-01-13', 'Issued'),
('SG12-332', 9, 7, '2022-01-30', 'Available'),
('DMR556-121', 5, 1, '2023-02-11', 'Available'),
('REV357-220', 11, 12, '2020-04-01', 'Available'),
('HMG50-021', 8, 10, '2017-08-10', 'Available');

INSERT INTO ammunition (caliber_id, quantity, storage_location) VALUES
(1, 1200, 'Room A1'),
(1, 950, 'Room A2'),
(2, 760, 'Room A1'),
(2, 500, 'Room B1'),
(3, 840, 'Room B2'),
(4, 3000, 'Room C1'),
(4, 2000, 'Room C2'),
(7, 450, 'Room D1'),
(7, 620, 'Room D2'),
(8, 300, 'Room E1'),
(10, 150, 'Room E2'),
(12, 200, 'Room F1'),
(12, 340, 'Room F1'),
(15, 500, 'Room C3'),
(16, 260, 'Room G1'),
(18, 900, 'Room B3'),
(20, 600, 'Room H1'),
(5, 1000, 'Room A3'),
(6, 800, 'Room C3'),
(11, 700, 'Room B4'),
(13, 380, 'Room F3'),
(14, 2400, 'Room C4'),
(17, 180, 'Room E3'),
(19, 550, 'Room H2'),
(3, 920, 'Room B2'),
(4, 3100, 'Room C1'),
(1, 1100, 'Room A1'),
(2, 650, 'Room B1'),
(7, 480, 'Room D2'),
(20, 500, 'Room H1');


INSERT INTO weapon_issuance (weapon_id, person_id, issue_date, return_date) VALUES
(6, 1, '2023-07-10', NULL),
(9, 5, '2023-06-14', '2023-06-18'),
(20, 3, '2023-08-01', NULL),
(26, 7, '2023-01-20', '2023-02-10'),
(1, 10, '2022-09-11', '2022-10-01'),
(7, 15, '2023-03-24', NULL),
(12, 8, '2023-04-13', '2023-04-20'),
(14, 12, '2022-11-19', NULL),
(15, 6, '2023-02-14', '2023-02-21'),
(23, 3, '2023-09-11', NULL),
(27, 4, '2023-03-30', NULL),
(18, 2, '2022-12-15', '2023-01-02'),
(4, 17, '2023-01-10', NULL),
(8, 19, '2021-11-11', NULL),
(22, 9, '2023-05-05', '2023-06-01'),
(3, 13, '2022-10-17', '2022-10-22'),
(25, 14, '2023-07-21', NULL),
(10, 18, '2023-04-29', NULL),
(11, 20, '2022-09-06', '2022-09-10'),
(30, 7, '2023-03-03', '2023-03-09'),
(2, 11, '2023-02-25', NULL),
(5, 16, '2023-06-05', '2023-06-22'),
(16, 2, '2023-03-09', NULL),
(19, 3, '2023-05-01', '2023-05-11'),
(28, 4, '2023-04-18', NULL),
(29, 7, '2022-08-21', '2022-09-14'),
(17, 6, '2023-06-22', NULL),
(13, 8, '2022-10-10', NULL),
(21, 20, '2023-06-30', '2023-07-14'),
(24, 12, '2023-02-14', NULL);

INSERT INTO ammo_issuance (ammo_id, person_id, quantity, issue_date) VALUES
(1, 1, 120, '2023-07-10'),
(4, 5, 60, '2023-06-14'),
(6, 3, 200, '2023-08-01'),
(8, 7, 40, '2023-01-20'),
(2, 10, 150, '2022-09-11'),
(7, 15, 100, '2023-03-24'),
(10, 8, 50, '2023-04-13'),
(15, 12, 70, '2022-11-19'),
(17, 6, 90, '2023-02-14'),
(22, 3, 200, '2023-09-11'),
(24, 4, 55, '2023-03-30'),
(12, 2, 30, '2022-12-15'),
(19, 17, 80, '2023-01-10'),
(25, 19, 70, '2021-11-11'),
(5, 9, 100, '2023-05-05'),
(13, 13, 40, '2022-10-17'),
(16, 14, 90, '2023-07-21'),
(20, 18, 110, '2023-04-29'),
(30, 20, 75, '2022-09-06'),
(28, 7, 95, '2023-03-03'),
(3, 11, 130, '2023-02-25'),
(9, 16, 150, '2023-06-05'),
(11, 2, 60, '2023-03-09'),
(26, 3, 85, '2023-05-01'),
(14, 4, 70, '2023-04-18'),
(23, 7, 30, '2022-08-21'),
(18, 6, 140, '2023-06-22'),
(21, 8, 40, '2022-10-10'),
(29, 20, 65, '2023-06-30'),
(27, 12, 55, '2023-02-14');

INSERT INTO maintenance_records (weapon_id, maintenance_date, performed_by, notes) VALUES
(4, '2023-01-12', 'Technician A', 'Barrel cleaning and scope adjustment.'),
(7, '2022-11-05', 'Technician B', 'Replaced firing pin.'),
(13, '2023-08-20', 'Technician C', 'Fixed recoil buffer.'),
(16, '2023-04-01', 'Technician A', 'Lubrication and internal cleaning.'),
(3, '2023-03-15', 'Technician D', 'Replaced magazine release.'),
(11, '2022-12-10', 'Technician B', 'Cylinder alignment correction.'),
(14, '2023-02-19', 'Technician A', 'Scope recalibrated.'),
(8, '2021-07-23', 'Technician C', 'Barrel wear inspection.'),
(5, '2023-05-30', 'Technician D', 'Gas tube cleaned.'),
(18, '2022-10-14', 'Technician B', 'Stock replacement.'),
(20, '2023-09-02', 'Technician A', 'Trigger group adjustment.'),
(22, '2023-03-28', 'Technician C', 'Vision sight replaced.'),
(25, '2023-07-19', 'Technician B', 'Lubrication check.'),
(27, '2022-09-07', 'Technician D', 'Chamber cleaning.'),
(30, '2023-04-17', 'Technician A', 'Safety lever inspection.'),
(17, '2023-01-26', 'Technician B', 'Recoil spring replaced.'),
(23, '2022-11-11', 'Technician D', 'No issues found.'),
(19, '2023-05-02', 'Technician C', 'Replaced charging handle.'),
(29, '2023-06-21', 'Technician A', 'Sling mount repaired.'),
(12, '2023-07-11', 'Technician B', 'Grenade launcher hinge lubrication.');

INSERT INTO purchase_orders (supplier_id, weapon_id, order_date) VALUES
(1, 1, '2020-02-01'),
(3, 4, '2018-01-15'),
(2, 6, '2020-07-22'),
(5, 7, '2017-03-09'),
(10, 8, '2016-06-20'),
(4, 9, '2021-11-11'),
(7, 10, '2023-04-05'),
(9, 11, '2019-06-18'),
(6, 12, '2020-09-30'),
(8, 13, '2015-02-12'),
(12, 14, '2022-10-19'),
(14, 15, '2021-01-16'),
(13, 16, '2018-05-10'),
(11, 17, '2023-02-01'),
(15, 18, '2022-07-09'),
(19, 19, '2021-08-12'),
(20, 20, '2023-04-02'),
(16, 21, '2020-03-28'),
(18, 22, '2023-06-16'),
(17, 23, '2021-03-04');



-- QUERY 1
    SELECT
        P.full_name AS Personnel_Name,
        W.serial_number AS Weapon_Serial_Number,
        WT.type_name AS Weapon_Type,
        WI.issue_date AS Issue_Date
    FROM
        weapon_issuance WI
    JOIN
        personnel P ON WI.person_id = P.person_id
    JOIN
        weapons W ON WI.weapon_id = W.weapon_id
    JOIN
        weapon_types WT ON W.type_id = WT.type_id
    WHERE
        WI.return_date IS NULL
    ORDER BY
        WI.issue_date DESC;
-- +-----------------+----------------------+---------------------------+------------+
-- | Personnel_Name  | Weapon_Serial_Number | Weapon_Type               | Issue_Date |
-- +-----------------+----------------------+---------------------------+------------+
-- | Aylin Hernandez | CSMG9-004            | Compact SMG               | 2025-12-08 |
-- | Daniel Brown    | LMG762-450           | Light Machine Gun         | 2024-04-03 |
-- | Zara Martinez   | CSMG9-004            | Compact SMG               | 2024-03-27 |
-- | Maria Lopez     | PST9-767             | Pistol                    | 2024-03-11 |
-- | Samantha Green  | PST9-765             | Pistol                    | 2024-02-14 |
-- | Laura Price     | PST9-765             | Pistol                    | 2024-01-20 |
-- | Kevin Stewart   | CSMG9-004            | Compact SMG               | 2024-01-11 |
-- | Thomas Wright   | CB556-233            | Carbine                   | 2024-01-05 |
-- | Aylin Hernandez | PST9-767             | Pistol                    | 2024-01-01 |
-- | Aylin Hernandez | PST9-767             | Pistol                    | 2024-01-01 |
-- | Aylin Hernandez | PST9-766             | Pistol                    | 2023-09-11 |
-- | Aylin Hernandez | PDW57-330            | PDW                       | 2023-08-01 |
-- | Jennifer Clark  | SMG9-985             | Submachine Gun            | 2023-07-21 |
-- | John Reed       | SMG9-984             | Submachine Gun            | 2023-07-10 |
-- | Robert Wilson   | MP10-210             | Machine Pistol            | 2023-06-22 |
-- | Zara Martinez   | PST9-765             | Pistol                    | 2023-04-29 |
-- | Daniel Brown    | DMR556-121           | Designated Marksman Rifle | 2023-04-18 |
-- | Daniel Brown    | SG12-332             | Shotgun                   | 2023-03-30 |
-- | David Adams     | LMG762-450           | Light Machine Gun         | 2023-03-24 |
-- | Michael Torres  | PR762-554            | Precision Rifle           | 2023-03-09 |
-- | Maria Lopez     | BR762-014            | Battle Rifle              | 2023-02-25 |
-- | Thomas Wright   | PST9-767             | Pistol                    | 2023-02-14 |
-- | Victor Young    | SR65C-889            | Sniper Rifle              | 2023-01-10 |
-- | Thomas Wright   | CSMG9-004            | Compact SMG               | 2022-11-19 |
-- | Jason Miller    | AMR50-777            | Anti-Material Rifle       | 2022-10-10 |
-- | Evan Brooks     | HMG50-020            | Heavy Machine Gun         | 2021-11-11 |
-- +-----------------+----------------------+---------------------------+------------+
-- 26 rows in set (0.138 sec)


-- QUERY 2
    SELECT
        P.full_name AS Personnel_Name,
        CL.description AS Clearance_Level
    FROM
        personnel P
    JOIN
        clearance_levels CL ON P.clearance_level = CL.level_id
    WHERE
        CL.level_id >= 4
    ORDER BY
        CL.level_id DESC;
-- +-----------------+-------------------+
-- | Personnel_Name  | Clearance_Level   |
-- +-----------------+-------------------+
-- | Evan Brooks     | Top Secret Access |
-- | Brian Hall      | Top Secret Access |
-- | Robert Wilson   | Top Secret Access |
-- | Victor Young    | Secret Access     |
-- | Thomas Wright   | Secret Access     |
-- | Jason Miller    | Secret Access     |
-- | Aylin Hernandez | Secret Access     |
-- +-----------------+-------------------+
-- 7 rows in set (0.028 sec)

-- QUERY 3
SELECT
        C.caliber_name AS Caliber_Name,
        SUM(AI.quantity) AS Total_Quantity_Issued
    FROM
        ammo_issuance AI
    JOIN
        ammunition A ON AI.ammo_id = A.ammo_id
    JOIN
        calibers C ON A.caliber_id = C.caliber_id
    GROUP BY
        C.caliber_name
    ORDER BY
        Total_Quantity_Issued DESC
    LIMIT 5; -- Shows the top 5 most issued calibers
-- +--------------------+-----------------------+
-- | Caliber_Name       | Total_Quantity_Issued |
-- +--------------------+-----------------------+
-- | 5.56×45mm NATO     |                   425 |
-- | 9×19mm Parabellum  |                   385 |
-- | 7.62×51mm NATO     |                   335 |
-- | 12 Gauge           |                   255 |
-- | .22 LR             |                   200 |
-- +--------------------+-----------------------+
-- 5 rows in set (0.060 sec)


-- QUERY 4
SELECT
        W.serial_number AS Weapon_Serial_Number,
        W.status AS Current_Status,
        MAX(MR.maintenance_date) AS Last_Maintenance_Date,
        MR.notes AS Last_Maintenance_Notes
    FROM
        weapons W
    LEFT JOIN
        maintenance_records MR ON W.weapon_id = MR.weapon_id
    WHERE
        W.status = 'Maintenance' OR MR.record_id IS NULL 
    GROUP BY
        W.weapon_id, W.serial_number, W.status, MR.notes -- Group by necessary columns for MAX()
    ORDER BY
        Last_Maintenance_Date ASC;
-- +----------------------+----------------+-----------------------+---------------------------------------+
-- | Weapon_Serial_Number | Current_Status | Last_Maintenance_Date | Last_Maintenance_Notes                |
-- +----------------------+----------------+-----------------------+---------------------------------------+
-- | AR556-001            | Available      | NULL                  | NULL                                  |
-- | BR762-014            | Available      | NULL                  | NULL                                  |
-- | SMG9-984             | Issued         | NULL                  | NULL                                  |
-- | SG12-331             | Issued         | NULL                  | NULL                                  |
-- | PST9-765             | Available      | NULL                  | NULL                                  |
-- | BP556-421            | Available      | NULL                  | NULL                                  |
-- | AR556-002            | Available      | NULL                  | NULL                                  |
-- | PST9-767             | Available      | NULL                  | NULL                                  |
-- | SMG9-986             | Issued         | NULL                  | NULL                                  |
-- | DMR556-121           | Available      | NULL                  | NULL                                  |
-- | SR65C-889            | Maintenance    | 2023-01-12            | Barrel cleaning and scope adjustment. |
-- | PR762-554            | Maintenance    | 2023-04-01            | Lubrication and internal cleaning.    |
-- | AMR50-777            | Maintenance    | 2023-08-20            | Fixed recoil buffer.                  |
-- | SR65C-889            | Maintenance    | 2025-12-08            | Routine check                         |
-- +----------------------+----------------+-----------------------+---------------------------------------+
-- 14 rows in set (0.030 sec)


-- QUERY 5
SELECT
        S.supplier_name AS Supplier_Name,
        MAX(PO.order_date) AS Latest_Order_Date
    FROM
        purchase_orders PO
    JOIN
        suppliers S ON PO.supplier_id = S.supplier_id
    GROUP BY
        S.supplier_name
    ORDER BY
        Latest_Order_Date DESC;
-- +----------------------------+-------------------+
-- | Supplier_Name              | Latest_Order_Date |
-- +----------------------------+-------------------+
-- | SteelFront Armaments       | 2023-06-16        |
-- | Precision Ballistics Co.   | 2023-04-05        |
-- | Sentinel Precision Arms    | 2023-04-02        |
-- | Atlas Armory               | 2023-02-01        |
-- | Blackstone Military Supply | 2022-10-19        |
-- | Crusader Defense Systems   | 2022-07-09        |
-- | Guardian Arms Ltd          | 2021-11-11        |
-- | Bravo Tactical Gear        | 2021-08-12        |
-- | KnightShield International | 2021-03-04        |
-- | Vanguard Weapons Supply    | 2021-01-16        |
-- | NorthForge Armaments       | 2020-09-30        |
-- | DefensePro Solutions       | 2020-07-22        |
-- | Cerberus Arms Corp         | 2020-03-28        |
-- | Armatech Industries        | 2020-02-01        |
-- | Vertex Defense Group       | 2019-06-18        |
-- | Omega Tactical Industries  | 2018-05-10        |
-- | Falcon Military Corp       | 2018-01-15        |
-- | Tactical Systems Group     | 2017-03-09        |
-- | IronWall Munitions         | 2016-06-20        |
-- | Redline Tactical Supply    | 2015-02-12        |
-- +----------------------------+-------------------+
-- 20 rows in set (0.009 sec)


--=========================================================--


-- Stored functions
-- Stored function N1
DELIMITER //

CREATE FUNCTION GET_WEAPON_TOTAL_ISSUANCE_COUNT (
    p_weapon_id INT
)
RETURNS INT
READS SQL DATA
BEGIN
    DECLARE issuance_count INT;
    
    SELECT COUNT(*) INTO issuance_count
    FROM weapon_issuance
    WHERE weapon_id = p_weapon_id;
    
    RETURN issuance_count;
END //

DELIMITER ;

SELECT GET_WEAPON_TOTAL_ISSUANCE_COUNT(1);
-- +------------------------------------+
-- | GET_WEAPON_TOTAL_ISSUANCE_COUNT(1) |
-- +------------------------------------+
-- |                                  1 |
-- +------------------------------------+
-- 1 row in set (0.029 sec)

-- Stored function N2
DELIMITER //

CREATE FUNCTION GET_DAYS_SINCE_LAST_MAINTENANCE (
    p_weapon_id INT
)
RETURNS INT
READS SQL DATA
BEGIN
    DECLARE last_date DATE;
    DECLARE days_passed INT;
    
    SELECT MAX(maintenance_date) INTO last_date
    FROM maintenance_records
    WHERE weapon_id = p_weapon_id;
    
    IF last_date IS NULL THEN
        RETURN NULL;
    ELSE
        SELECT DATEDIFF(CURDATE(), last_date) INTO days_passed;
        RETURN days_passed;
    END IF;
END //

DELIMITER ;

SELECT GET_DAYS_SINCE_LAST_MAINTENANCE(3);
-- +------------------------------------+
-- | GET_DAYS_SINCE_LAST_MAINTENANCE(3) |
-- +------------------------------------+
-- |                                999 |
-- +------------------------------------+
-- 1 row in set (0.042 sec)


-- Stored function N3
DELIMITER //

CREATE FUNCTION GET_PERSONNEL_CLEARANCE_DESCRIPTION (
    p_person_id INT
)
RETURNS VARCHAR(200)
READS SQL DATA
BEGIN
    DECLARE level_desc VARCHAR(200);
    
    SELECT CL.description INTO level_desc
    FROM personnel P
    JOIN clearance_levels CL ON P.clearance_level = CL.level_id
    WHERE P.person_id = p_person_id;
    
    RETURN level_desc;
END //

DELIMITER ;

 SELECT GET_PERSONNEL_CLEARANCE_DESCRIPTION(101);
 SELECT GET_PERSONNEL_CLEARANCE_DESCRIPTION(10);
-- +-----------------------------------------+
-- | GET_PERSONNEL_CLEARANCE_DESCRIPTION(10) |
-- +-----------------------------------------+
-- | Basic Access                            |
-- +-----------------------------------------+
-- 1 row in set (0.001 sec)


--=========================================================--

-- Stored Procedure N1
DELIMITER //

CREATE PROCEDURE ISSUE_WEAPON (
    IN p_weapon_id INT,
    IN p_person_id INT
)
BEGIN
    -- 1. Insert the issuance record
    INSERT INTO weapon_issuance (weapon_id, person_id, issue_date, return_date)
    VALUES (p_weapon_id, p_person_id, CURDATE(), NULL);
    
    -- 2. Update the weapon status
    UPDATE weapons
    SET status = 'Issued'
    WHERE weapon_id = p_weapon_id;
END //

DELIMITER ;


CALL ISSUE_WEAPON(14,3);
-- Query OK, 2 rows affected (0.028 sec)

-- Stored Procedure N2
DELIMITER //

CREATE PROCEDURE RETURN_WEAPON (
    IN p_weapon_id INT,
    IN p_issue_id INT -- Specifically identifies which issuance record to close
)
BEGIN
    -- 1. Update the issuance record with return date
    UPDATE weapon_issuance
    SET return_date = CURDATE()
    WHERE issue_id = p_issue_id AND weapon_id = p_weapon_id;
    
    -- 2. Update the weapon status back to Available
    UPDATE weapons
    SET status = 'Available'
    WHERE weapon_id = p_weapon_id;
END //

DELIMITER ;

CALL RETURN_WEAPON(5, 1);
-- Query OK, 0 rows affected (0.013 sec)

-- Stored Procedure N3
DELIMITER //

CREATE PROCEDURE SEARCH_PERSONNEL_BY_LEVEL (
    IN p_level_id INT
)
BEGIN
    SELECT 
        person_id, 
        full_name, 
        (SELECT description FROM clearance_levels WHERE level_id = p_level_id) AS Clearance_Description
    FROM personnel
    WHERE clearance_level = p_level_id
    ORDER BY full_name;
END //

DELIMITER ;

CALL SEARCH_PERSONNEL_BY_LEVEL(5);
CALL SEARCH_PERSONNEL_BY_LEVEL(2);
-- +-----------+----------------+-----------------------+
-- | person_id | full_name      | Clearance_Description |
-- +-----------+----------------+-----------------------+
-- |        15 | David Adams    | Restricted Access     |
-- |         7 | Emily Carter   | Restricted Access     |
-- |        20 | Hannah Scott   | Restricted Access     |
-- |        11 | Maria Lopez    | Restricted Access     |
-- |         2 | Michael Torres | Restricted Access     |
-- +-----------+----------------+-----------------------+
-- 5 rows in set (0.017 sec)

-- Query OK, 0 rows affected (0.018 sec)


-- Stored Procedure N4
DELIMITER //

CREATE PROCEDURE ADD_MAINTENANCE_RECORD (
    IN p_weapon_id INT,
    IN p_performed_by VARCHAR(150),
    IN p_notes TEXT
)
BEGIN
    -- 1. Insert the new maintenance record
    INSERT INTO maintenance_records (weapon_id, maintenance_date, performed_by, notes)
    VALUES (p_weapon_id, CURDATE(), p_performed_by, p_notes);
    
    -- 2. Ensure weapon status is set to Available after maintenance
    UPDATE weapons
    SET status = 'Available'
    WHERE weapon_id = p_weapon_id;
END //

DELIMITER ;

CALL ADD_MAINTENANCE_RECORD(1, 'Maintenance Team A', 'Rifle cleaned and barrel replaced.');
-- Query OK, 3 rows affected (0.022 sec)

-- Stored Procedure N5
DELIMITER //

CREATE PROCEDURE ISSUE_AMMUNITION (
    IN p_ammo_id INT,
    IN p_person_id INT,
    IN p_quantity INT
)
BEGIN
    -- 1. Check if enough quantity is available (Optional: Add a proper transaction check here)
    -- 2. Insert the issuance record
    INSERT INTO ammo_issuance (ammo_id, person_id, quantity, issue_date)
    VALUES (p_ammo_id, p_person_id, p_quantity, CURDATE());
    
    -- 3. Decrease the available stock quantity
    UPDATE ammunition
    SET quantity = quantity - p_quantity
    WHERE ammo_id = p_ammo_id;
END //

DELIMITER ;

CALL ISSUE_AMMUNITION(3, 10, 50);
-- Query OK, 3 rows affected (0.008 sec)

--=========================================================--

-- Triggers
--- Trggier N1
DELIMITER //

CREATE TRIGGER UPDATE_WEAPON_STATUS_ON_MAINTENANCE_INSERT
BEFORE INSERT ON maintenance_records
FOR EACH ROW
BEGIN
    UPDATE weapons
    SET status = 'Maintenance'
    WHERE weapon_id = NEW.weapon_id;
END //

DELIMITER ;

--- Trggier N2
DELIMITER //

CREATE TRIGGER CHECK_AMMUNITION_STOCK
BEFORE INSERT ON ammo_issuance
FOR EACH ROW
BEGIN
    DECLARE available_stock INT;
    
    SELECT quantity INTO available_stock
    FROM ammunition
    WHERE ammo_id = NEW.ammo_id;
    
    -- Check if the issued quantity exceeds the available stock
    IF NEW.quantity > available_stock THEN
        -- MySQL/MariaDB: Signal an error to stop the INSERT operation
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Insufficient ammunition stock for this issuance.';
    END IF;
END //

DELIMITER ;
--- Trggier N3
DELIMITER //

CREATE TRIGGER PREVENT_WEAPON_STATUS_UPDATE
AFTER UPDATE ON weapons
FOR EACH ROW
BEGIN
    DECLARE is_currently_issued BOOLEAN DEFAULT FALSE;
    
    -- Check if the weapon is currently issued (return_date IS NULL)
    SELECT TRUE INTO is_currently_issued
    FROM weapon_issuance
    WHERE weapon_id = NEW.weapon_id AND return_date IS NULL
    LIMIT 1;
    
    -- If currently issued AND someone tried to set status to 'Available'
    IF is_currently_issued AND NEW.status = 'Available' AND OLD.status != 'Available' THEN
        -- Revert status back to 'Issued' (or signal warning)
        UPDATE weapons
        SET status = 'Issued'
        WHERE weapon_id = NEW.weapon_id;
    END IF;
END //

DELIMITER ;

--=========================================================--
--CTEs
--CTE N1
WITH Issued_Weapon_Summary AS (
    SELECT
        W.weapon_id,
        W.serial_number,
        P.full_name AS Current_Holder,
        WT.type_name
    FROM
        weapon_issuance WI
    JOIN
        weapons W ON WI.weapon_id = W.weapon_id
    JOIN
        personnel P ON WI.person_id = P.person_id
    JOIN
        weapon_types WT ON W.type_id = WT.type_id
    WHERE
        WI.return_date IS NULL 
)
SELECT
    IWS.serial_number,
    IWS.Current_Holder,
    IWS.type_name,
    COUNT(MR.record_id) AS Total_Maintenance_Count
FROM
    Issued_Weapon_Summary IWS
LEFT JOIN
    maintenance_records MR ON IWS.weapon_id = MR.weapon_id
GROUP BY
    IWS.weapon_id, IWS.serial_number, IWS.Current_Holder, IWS.type_name
ORDER BY
    Total_Maintenance_Count DESC;
-- +---------------+-----------------+---------------------------+-------------------------+
-- | serial_number | Current_Holder  | type_name                 | Total_Maintenance_Count |
-- +---------------+-----------------+---------------------------+-------------------------+
-- | SR65C-889     | Victor Young    | Sniper Rifle              |                       2 |
-- | CSMG9-004     | Aylin Hernandez | Compact SMG               |                       2 |
-- | SG12-332      | Daniel Brown    | Shotgun                   |                       1 |
-- | CSMG9-004     | Thomas Wright   | Compact SMG               |                       1 |
-- | CSMG9-004     | Zara Martinez   | Compact SMG               |                       1 |
-- | PST9-766      | Aylin Hernandez | Pistol                    |                       1 |
-- | PR762-554     | Michael Torres  | Precision Rifle           |                       1 |
-- | LMG762-450    | David Adams     | Light Machine Gun         |                       1 |
-- | PDW57-330     | Aylin Hernandez | PDW                       |                       1 |
-- | HMG50-020     | Evan Brooks     | Heavy Machine Gun         |                       1 |
-- | AMR50-777     | Jason Miller    | Anti-Material Rifle       |                       1 |
-- | CB556-233     | Thomas Wright   | Carbine                   |                       1 |
-- | CSMG9-004     | Kevin Stewart   | Compact SMG               |                       1 |
-- | SMG9-985      | Jennifer Clark  | Submachine Gun            |                       1 |
-- | MP10-210      | Robert Wilson   | Machine Pistol            |                       1 |
-- | LMG762-450    | Daniel Brown    | Light Machine Gun         |                       1 |
-- | PST9-765      | Laura Price     | Pistol                    |                       0 |
-- | SMG9-984      | John Reed       | Submachine Gun            |                       0 |
-- | PST9-767      | Aylin Hernandez | Pistol                    |                       0 |
-- | PST9-765      | Zara Martinez   | Pistol                    |                       0 |
-- | DMR556-121    | Daniel Brown    | Designated Marksman Rifle |                       0 |
-- | PST9-765      | Samantha Green  | Pistol                    |                       0 |
-- | PST9-767      | Thomas Wright   | Pistol                    |                       0 |
-- | PST9-767      | Maria Lopez     | Pistol                    |                       0 |
-- | BR762-014     | Maria Lopez     | Battle Rifle              |                       0 |
-- +---------------+-----------------+---------------------------+-------------------------+
-- 25 rows in set (0.013 sec)

--CTE N2
WITH Personnel_Clearance_Groups AS (
    SELECT
        P.person_id,
        CL.description AS Clearance_Description
    FROM
        personnel P
    JOIN
        clearance_levels CL ON P.clearance_level = CL.level_id
)
SELECT
    PCG.Clearance_Description,
    SUM(AI.quantity) AS Total_Ammo_Issued
FROM
    ammo_issuance AI
JOIN
    Personnel_Clearance_Groups PCG ON AI.person_id = PCG.person_id
GROUP BY
    PCG.Clearance_Description
ORDER BY
    Total_Ammo_Issued DESC;
-- +-----------------------+-------------------+
-- | Clearance_Description | Total_Ammo_Issued |
-- +-----------------------+-------------------+
-- | Secret Access         |               780 |
-- | Restricted Access     |               675 |
-- | Basic Access          |               535 |
-- | Confidential Access   |               520 |
-- | Top Secret Access     |               340 |
-- +-----------------------+-------------------+
-- 5 rows in set (0.002 sec)

--CTE N3
WITH Weapon_Age_Details AS (
    SELECT
        weapon_id,
        serial_number,
        purchase_date,
        DATEDIFF(CURDATE(), purchase_date) AS Days_Old,
        -- Silahları yaşına görə sıralayır (Ən yaşlı ən üstə çıxır)
        RANK() OVER (ORDER BY purchase_date ASC) AS Age_Rank
    FROM
        weapons
)
SELECT
    WAD.Age_Rank,
    WAD.serial_number,
    WAD.Days_Old,
    WAD.purchase_date,
    MAX(MR.maintenance_date) AS Last_Maintenance_Date
FROM
    Weapon_Age_Details WAD
LEFT JOIN
    maintenance_records MR ON WAD.weapon_id = MR.weapon_id
GROUP BY
    WAD.Age_Rank, WAD.weapon_id, WAD.serial_number, WAD.Days_Old, WAD.purchase_date
ORDER BY
    WAD.Age_Rank ASC
LIMIT 10; 
-- +----------+---------------+----------+---------------+-----------------------+
-- | Age_Rank | serial_number | Days_Old | purchase_date | Last_Maintenance_Date |
-- +----------+---------------+----------+---------------+-----------------------+
-- |        1 | AMR50-777     |     3911 | 2015-03-25    | 2023-08-20            |
-- |        2 | HMG50-020     |     3414 | 2016-08-03    | 2021-07-23            |
-- |        3 | LMG762-450    |     3133 | 2017-05-11    | 2022-11-05            |
-- |        4 | HMG50-021     |     3042 | 2017-08-10    | 2023-04-17            |
-- |        5 | SR65C-889     |     2859 | 2018-02-09    | 2025-12-08            |
-- |        6 | PR762-554     |     2729 | 2018-06-19    | 2023-04-01            |
-- |        7 | REV357-219    |     2324 | 2019-07-29    | 2022-12-10            |
-- |        8 | BR762-014     |     2208 | 2019-11-22    | NULL                  |
-- |        9 | AR556-001     |     2099 | 2020-03-10    | 2025-12-08            |
-- |       10 | REV357-220    |     2077 | 2020-04-01    | 2023-06-21            |
-- +----------+---------------+----------+---------------+-----------------------+
-- 10 rows in set (0.022 sec)
