USE zipo;

SELECT * FROM ipo_table;

SELECT * FROM ipo;

SELECT * FROM  bidorder;

TRUNCATE TABLE ipo;

DELETE FROM ipo_table WHERE today='2021-04-07 00:00:00';

SELECT *,count(*) FROM ipo
GROUP BY symbol,name_
HAVING count(*) > 1;

alter table ipo_table
add today datetime;


UPDATE ipo SET status_='open'  WHERE symbol='RCAN';

ALTER TABLE ipo
MODIFY symbol varchar(255) PRIMARY KEY;

UPDATE ipo SET opendatetime='2021-04-07 10:00:00',closedatetime='2021-04-09 17:00:00' WHERE symbol='LODHA';

Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.
