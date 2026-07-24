CREATE DATABASE Ecommerce_Database;
USE Ecommerce_Database;

LOAD DATA LOCAL INFILE 'W:/Anil/Infotact Solutions/Project2 Files/Cloning/SaaS-E-Commerce-Cohort-Retention-CLTV-Analysis/Data/Cleaned/Cleaned_Ecommerce.csv'
INTO TABLE cleaned_ecommerce
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select *from cleaned_ecommerce;