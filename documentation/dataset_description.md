
Grocery Store Chain Sales Dataset

Dataset Overview
This comprehensive synthetic dataset contains 1,980 records from a multi-location grocery store chain, capturing detailed transaction data across various store locations, product categories, customer interactions, and promotional activities. The dataset spans approximately 2 years of sales data (2023-2025) and provides insights into customer purchasing behavior, store performance, product popularity, and promotional effectiveness.

Dataset Characteristics


Total Records: 1,980 transactions

Time Period: August 2023 - August 2025

Store Locations: 9 different grocery store branches

Product Categories: 11 distinct aisles

Data Quality: Includes realistic missing values and data inconsistencies for cleaning practice


Column Descriptions


customer_id	= String Unique customer identifier	"2824", "5506", "4657"	4-digit customer IDs

store_name = String	Name of the grocery store location	"GreenGrocer Plaza", "ValuePlus Market"	9 different store locations

transaction_date = Date	Date of the transaction	"2023-08-26", "2024-02-13"	Range: 2023-2025

aisle =	String Product category/department	"Produce", "Dairy", "Meat & Seafood"	11 different aisles

product_name = String	Name of the purchased product	"Pasta", "Cheese", "Bananas"	18 different products

quantity = String	Number of items purchased	"2", "1", "4"	Range: 1-5 items (stored as string)

unit_price	= Float	Price per individual item	7.46, 1.85, 29.56	Range: $0.99 - $29.99

total_amount	= Float	Total cost before discount	14.92, 1.85, 29.52	quantity × unit_price

discount_amount	= Float	Total discount applied	0.0, 3.41, 4.04	Promotional discounts

final_amount	= Float	Final amount after discount	14.92, -1.56, 25.48	total_amount - discount_amount

loyalty_points = Integer	Customer loyalty points earned	377, 111, 301	Range: 0-500 points
