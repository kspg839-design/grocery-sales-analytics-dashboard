# Grocery Store Chain Sales Dataset

## Dataset Overview

This synthetic dataset contains **1,980 grocery store transactions** from a multi-location retail chain.  
It captures detailed information about **store performance, product sales, customer purchases, and promotional discounts**.

The dataset spans **August 2023 – August 2025**, allowing analysis of **sales trends, product demand, and customer purchasing behavior**.

---

## Dataset Characteristics

- **Total Records:** 1,980 transactions  
- **Time Period:** August 2023 – August 2025  
- **Store Locations:** 9 grocery store branches  
- **Product Categories:** 11 different aisles  
- **Products:** 18 unique products  
- **Data Quality:** Contains realistic missing values and inconsistencies for **data cleaning practice**

---

## Column Descriptions

| Column Name | Data Type | Description | Example Values | Notes |
|-------------|-----------|-------------|---------------|-------|
| customer_id | String | Unique customer identifier | "2824", "5506", "4657" | 4-digit customer IDs |
| store_name | String | Name of the grocery store location | "GreenGrocer Plaza", "ValuePlus Market" | 9 store locations |
| transaction_date | Date | Date of the transaction | "2023-08-26", "2024-02-13" | Range: 2023–2025 |
| aisle | String | Product category / department | "Produce", "Dairy", "Meat & Seafood" | 11 aisles |
| product_name | String | Name of the purchased product | "Pasta", "Cheese", "Bananas" | 18 products |
| quantity | String | Number of items purchased | "2", "1", "4" | Range: 1–5 items (stored as string) |
| unit_price | Float | Price per individual item | 7.46, 1.85, 29.56 | Range: $0.99 – $29.99 |
| total_amount | Float | Total cost before discount | 14.92, 1.85, 29.52 | quantity × unit_price |
| discount_amount | Float | Discount applied to the transaction | 0.0, 3.41, 4.04 | Promotional discounts |
| final_amount | Float | Final amount after discount | 14.92, -1.56, 25.48 | total_amount − discount_amount |
| loyalty_points | Integer | Loyalty points earned by the customer | 377, 111, 301 | Range: 0–500 points |

---

## Potential Analysis Areas

This dataset can be used to analyze:

- Store performance comparison
- Product demand and category trends
- Customer purchasing behavior
- Impact of promotional discounts
- Monthly and seasonal sales trends
