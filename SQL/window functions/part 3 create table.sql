CREATE TABLE query (
    searchid SERIAL PRIMARY KEY,
    year SMALLINT,
    month SMALLINT,
    day SMALLINT,
    userid INT,
    ts BIGINT,
    devicetype VARCHAR(50),
    deviceid VARCHAR(50),
    query VARCHAR(255)
);
   
INSERT INTO query (year, month, day, userid, ts, devicetype, deviceid, query)
VALUES
	(2024, 11, 16, 1, 1731715200, 'android', 'dev001', 'к'),
    (2024, 11, 16, 1, 1731715260, 'android', 'dev001', 'ку'),
    (2024, 11, 16, 1, 1731715410, 'android', 'dev001', 'к'),
    (2024, 11, 16, 1, 1731715650, 'android', 'dev001', 'купить'),
    (2024, 11, 16, 1, 1731715660, 'android', 'dev001', 'купить кур'),
    (2024, 11, 16, 1, 1731715720, 'android', 'dev001', 'купить куртку'),
    (2024, 11, 16, 2, 1731718860, 'android', 'dev002', 'категория'),
    (2024, 11, 16, 2, 1731718980, 'android', 'dev002', 'категория одежда'),
    (2024, 11, 16, 2, 1731719040, 'android', 'dev002', 'категория одежда лето'),
    (2024, 11, 16, 3, 1731719200, 'android', 'dev003', 'поиск'),
    (2024, 11, 16, 4, 1731719400, 'ios', 'dev004', 'поиск'),
    (2024, 11, 16, 4, 1731719420, 'ios', 'dev004', 'поиск товаров'),
    (2024, 11, 16, 5, 1731719520, 'android', 'dev005', 'п'),
    (2024, 11, 16, 5, 1731719540, 'android', 'dev005', 'по'),
    (2024, 11, 16, 5, 1731719560, 'android', 'dev005', 'пок'),
    (2024, 11, 16, 5, 1731719700, 'android', 'dev005', 'покупка'),
    (2024, 11, 16, 6, 1731719900, 'android', 'dev006', 'заказ'),
    (2024, 11, 16, 6, 1731719960, 'android', 'dev006', 'заказ куртки'),
    (2024, 11, 16, 6, 1731720080, 'android', 'dev006', 'заказ куртк'),
    (2024, 11, 16, 6, 1731720680, 'android', 'dev006', 'заказ куртки еще');