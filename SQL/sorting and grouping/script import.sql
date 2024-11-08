-- Скрипт, с помощью которого создается схема, таблица, и импортируются данные из csv файла
-- Делал с помощью видео: https://www.youtube.com/watch?v=Zeh-Icitlrg&list=LL

create schema users_sch;

CREATE TABLE users (
	id SERIAL PRIMARY KEY,
	gender VARCHAR(10),
	age SMALLINT,
	education VARCHAR(40),
	city VARCHAR(20)
);

copy users
from 'C:\Users\Daniel\Desktop\WB\SQL\data\users.csv'
csv
header;


create schema products_sch;

CREATE TABLE products (
	id SERIAL PRIMARY KEY,
	name VARCHAR(40),
	category VARCHAR(40),
	price NUMERIC(8, 2)
);

copy products
from 'C:\Users\Daniel\Desktop\WB\SQL\data\products.csv'
csv
header;

create schema sellers_sch

CREATE TABLE sellers (
	seller_id smallint,
	category varchar(40),
	date_reg date,
	date date,
	revenue integer,
	rating smallint,
	delivery_days smallint
);

copy sellers
from 'C:\Users\Daniel\Desktop\WB\SQL\data\sellers.csv'
csv
header;