## Project Title:
Retail Data Cleaning Using SQL

### Project Overview:
This project involves cleaning a retail sales dataset using SQL queries to improve the quality and consistency of the data. The dataset contains details about invoices, products, quantities sold, customer information and sales amounts. The goal of this project is to ensure the data is accurate, consistent and ready for further analysis or reporting.

### Dataset Description:
The dataset used for this project contains the following columns:

Invoice_No: Unique identifier for each sales transaction (invoice number).      

Stock_Code: Unique code representing the product sold.

Description: A textual description of the product.

Quantity: The number of units sold for each product in each transaction.

Unit_Price: The price of each unit sold.

Customer_ID: Unique identifier for the customer making the purchase.

Country: The country where the customer is located.

InvoiceDate: The date the invoice was generated.

InvoiceTime: The time the invoice was generated.

 ## Data Cleaning Process:
The data cleaning process includes:

Checking and Removing Duplicates:
Identified and removed duplicate rows using SQL ROW_NUMBER() function.

Ensuring Data Consistency:
Standardized the formatting for text fields such as Country and Description.

Validated numerical fields like Quantity and Unit_Price to ensure they contain positive values.

## SQL Queries Used:
Data Cleaning Queries:
Queries to remove duplicates, handle nulls, and ensure data integrity.

Data Validation Queries:
Queries to validate that the cleaning process was successful and that the data is now consistent.

## Technologies Used:

PostgreSQL: To execute SQL queries and manage the database.
