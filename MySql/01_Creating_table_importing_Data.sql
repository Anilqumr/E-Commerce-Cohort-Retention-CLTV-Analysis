CREATE DATABASE Ecommerce_Database;
USE Ecommerce_Database;

Create table cleaned_ecommerce(order_id varchar(20),customer_id varchar(20), transaction_date date, product_category varchar(20),quantity int, unit_price float, revenue float, signup_date date, acquisition_channel varchar(20),country varchar(20), Cohort_Month varchar(20), First_transaction_date date);

LOAD DATA LOCAL INFILE 'W:/Anil/Infotact Solutions/Project2 Files/Cloning/SaaS-E-Commerce-Cohort-Retention-CLTV-Analysis/Data/Cleaned/Cleaned_Ecommerce.csv'
INTO TABLE cleaned_ecommerce
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

select *from cleaned_ecommerce;