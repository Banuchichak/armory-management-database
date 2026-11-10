# Armory Management Database (MySQL)

A relational database project for tracking equipment inventory, issuance, maintenance and purchasing, built for a Database course. It covers schema design with normalization, sample data, analytical queries, stored functions, stored procedures and triggers.

> **Academic project.** All data is fictional sample data.

## What it models

11 tables: `weapon_types`, `calibers`, `weapons`, `ammunition`, `personnel`, `clearance_levels`, `weapon_issuance`, `ammo_issuance`, `maintenance_records`, `suppliers`, `purchase_orders`.

Main ideas:
- Equipment items and ammunition stock linked to caliber and type lookup tables
- Personnel with clearance levels that control access
- Issuance and return tracking for equipment and ammunition
- Maintenance history per item
- Suppliers and purchase orders for restocking

## Database design

The project includes ER diagrams and relational models both **before and after normalization**:

| | Non-normalized | Normalized |
|---|---|---|
| ER diagram | [diagrams/ER_non_normalized.png](diagrams/ER_non_normalized.png) | [diagrams/ER_normalized.png](diagrams/ER_normalized.png) |
| Relational model | [diagrams/RM_non_normalized.png](diagrams/RM_non_normalized.png) | [diagrams/RM_normalized.png](diagrams/RM_normalized.png) |

Every table, its columns and its relationships are described in [Tables_documentation.docx](Tables_documentation.docx).

## SQL features in `project.sql`

- **Schema:** primary keys, foreign keys, `UNIQUE` and `NOT NULL` constraints, defaults
- **Sample data:** `INSERT` statements for all tables
- **Analytical queries:** joins, grouping, aggregation and subqueries (for example, most-issued calibers and latest maintenance per item)
- **Stored functions (3):**
  - `GET_WEAPON_TOTAL_ISSUANCE_COUNT`
  - `GET_DAYS_SINCE_LAST_MAINTENANCE`
  - `GET_PERSONNEL_CLEARANCE_DESCRIPTION`
- **Stored procedures (5):**
  - `ISSUE_WEAPON`
  - `RETURN_WEAPON`
  - `SEARCH_PERSONNEL_BY_LEVEL`
  - `ADD_MAINTENANCE_RECORD`
  - `ISSUE_AMMUNITION`
- **Triggers (3):**
  - `UPDATE_WEAPON_STATUS_ON_MAINTENANCE_INSERT`
  - `CHECK_AMMUNITION_STOCK`
  - `PREVENT_WEAPON_STATUS_UPDATE`

## How to run

Requires MySQL 8+ (also tested on MariaDB 10.11).

```bash
mysql -u root -p < project.sql
```

or open `project.sql` in MySQL Workbench and run it. It creates a database named `armory`. Sample query outputs from the original lab run are kept in the file as comments.

## Author

**Banuchichak Mammadova** – Computer Engineering student, Baku Higher Oil School
