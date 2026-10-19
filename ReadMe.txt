# Music Store Sales Analysis (SQL)

SQL analysis of the **Chinook** digital music store database using MySQL. I explored the data, checked its quality, and answered business questions about sales by country, year, genre, artist and sales representative.

## Dataset
- Chinook sample database by Luis Rocha: https://github.com/lerocha/chinook-database
- 11 tables, 412 invoices, 2,240 invoice lines, 59 customers, 3,503 tracks, 275 artists
- Total sales in the data: **2,328.60**

## Database structure


![ER diagram](er_diagram.png)



## What I did
1. **Data check:** row counts for every table, and missing values (`Company` is empty for 49 of 59 customers, `Fax` for 47, `State` for 29).
2. **Basic queries:** customers per country, longest tracks, tracks per genre.
3. **Aggregation:** sales by country, sales by year, earnings by genre.
4. **JOINs across tables:** top artists by revenue (`Artist -> Album -> Track -> InvoiceLine`), top customers, and sales per support representative (`Employee -> Customer -> Invoice`).

## Key findings
- **USA is the biggest market** with 523.06 in sales (22.5% of the total). USA, Canada and France together make up about 44%.
- **Rock earns the most:** 826.65, or 35.5% of all sales. The top four genres (Rock, Latin, Metal, Alternative & Punk) bring in about 73%.
- Top artists by revenue:** Iron Maiden (138.60), U2 (105.93), Metallica (90.09), Led Zeppelin (86.13) and Lost (81.59). Together they are about 21.6% of sales, so revenue is not concentrated in one artist.
- Yearly sales are stable:** between 449 and 481 each year from 2021 to 2025 (within about 7% of each other).
- Only 3 of the 8 employees support customers:** Jane Peacock (35.8% of sales), Margaret Park (33.3%) and Steve Johnson (30.9%).

## SQL concepts used
`SELECT`, `GROUP BY`, `HAVING`, `ORDER BY`, `LIMIT`, `INNER JOIN`, `LEFT JOIN`, `SUM`, `COUNT(DISTINCT)`, `ROUND`, `COALESCE`, `CONCAT`, `YEAR()`, `UNION ALL`

## How to run
1. Install MySQL 8 and MySQL Workbench.
2. Download `Chinook_MySql.sql` from the Chinook repository linked above and run it in Workbench to create the `chinook` database.
3. Open `chinook_analysis.sql` in Workbench and run the queries one by one.

## Files
- `chinook_analysis.sql`: all queries, grouped by topic
- `er_diagram.png`: database diagram

## Next steps
Window functions (`RANK`, `LAG`, running totals) will be covered in my next SQL project.