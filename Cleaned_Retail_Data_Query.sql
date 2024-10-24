--Make a duplicate of the datasET TO BE CLEANED
CREATE TABLE RetailDuplicate AS (SELECT * FROM Retails) 

--Check the the duplicated dataset 
	SELECT * FROM RetailDuplicate;
	

--Start data cleaning by checking for duplicate row
SELECT 
	*,
ROW_NUMBER() Over (
Partition by Invoice_No, Stock_code, Description, Quantity, Invoice_date, Unit_price, Customer_id, Country
ORDER BY (select null) 
) as row_num
FROM RetailDuplicate



--Adding cte to view the total number of rows that are duplictes
WITH duplicate_cte AS (Select 
*,
ROW_NUMBER() Over (
Partition by Invoice_No, Stock_code, Description, Quantity, Invoice_date, Unit_price, Customer_id, Country
ORDER BY (select null) 
) as row_num
FROM RetailDuplicate)
select  * from duplicate_cte where row_num > 1 /* we have 5,268 rows as duplicates*/

--deleting of duplicate rows
With duplicate_cte as (
Select 
 *, ROW_NUMBER() Over ( 
Partition BY Invoice_No, Stock_code, Description, Quantity, Invoice_date, Unit_price, Customer_id, Country 
ORDER BY (select NULL)) as row_num
From 
	RetailDuplicate)
DELETE FROM RetailDuplicate Where EXISTS (SELECT 1 FROM duplicate_cte 
			WHERE duplicate_cte.customer_id = RetailDuplicate.customer_id
			AND duplicate_cte.row_num>1)
			
			
-- Standardizing Text data types
Update RetailDuplicate
Set 
	Invoice_no = TRIM(Invoice_no), 
	Stock_code = TRIM(Stock_code),
	Description = TRIM(Description),
	Country = TRIM(Country);



--Split the date INTO Time and Date; Create a new Column 

-- Add new columns
 ALTER TABLE RetailDuplicate
 ADD InvoiceDate DATE,
 ADD InvoiceTime TIMESTAMP;



--Update the two column with there values from previous data column
UPDATE RetailDuplicate
SET
	InvoiceDate = CAST(invoice_date AS DATE),
	InvoiceTime = CAST(invoice_date AS TIMESTAMP);



-- Delete previous invoice date column 
 ALTER TABLE RetailDuplicate
 DROP COLUMN invoice_date
 
--Checking for Nulls and empty in customer_id
SELECT 
	* 
FROM 
	RetailDuplicate
WHERE 
	Customer_id Is Null 



--Drop the null in customer_id
DELETE 
FROM 
	RetailDuplicate
WHERE
	customer_id is NULL



--check for null values in invoice_number
SELECT
	* 
FROM 
	RetailDuplicate
WHERE 
	invoice_no Is Null



----check for null values in stock code
SELECT 
	* 
FROM
	RetailDuplicate
WHERE 
	Stock_code Is Null



----check for null values in Decription
SELECT
	* 
FROM 
	RetailDuplicate
where 
	Description Is Null



--check for null values in Quantity
SELECT
	* 
from 
	RetailDuplicate
where 
	Quantity Is Null



--cHECK FOR NULL VALUES IN UNIT_PRICE 
SELECT 
	* 
FROM 
	RetailDuplicate
WHERE 
	 unit_price is null



--cHECK FOR NULL VALUES IN invoicedate 
SELECT 
	* 
FROM 
	RetailDuplicate
WHERE 
	invoicedate is null




--cHECK FOR NULL VALUES IN invoicetime 
SELECT 
	* 
FROM 
	RetailDuplicate
WHERE 
	invoicetime is null



--check for 0 values in unit_privce
SELECT 
	* 
FROM  
	RetailDuplicate
WHERE 
	unit_price = 0



--Delete where unit_price is 0
DELETE 
FROM 
	RetailDuplicate
WHERE
	unit_price = 0



--Checking for negative value
SELECT
	* 
FROM
	RetailDuplicate
WHERE 
	quantity < 1



-- converting negtive numbers to positve
UPDATE RetailDuplicate
Set 
	quantity = ABS(quantity);




---Changing to 2 deimal place--
Update RetailDuplicate
Set 
	unit_price = ROUND(CAST(unit_price AS numeric), 2)



--check the data after the cleaning
SELECT 
	* 
FROM 
	RetailDuplicate








	
