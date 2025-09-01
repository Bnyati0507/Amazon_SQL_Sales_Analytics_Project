# Amazon_SQL_Sales_Analytics_Project
Advanced SQL project analyzing Amazon sales data with 20K+ records — includes schema, queries, outputs, and business insights.

### **Difficulty Level: Advanced**

---

## 📌 Project Overview

This project analyzes **20,000+ sales records** from an Amazon-like e-commerce platform using **PostgreSQL**.

The goal is to answer **real-world business questions**, such as:
- Which products generate the most revenue?
- How do different categories contribute to sales?
- Who are the most valuable customers?
- How can we detect inventory risks and cross-sell opportunities?

I solved **22 advanced SQL business problems** covering:
- **Sales & Revenue Analysis**
- **Customer Analytics**
- **Inventory & Operations**
- **Profitability & Margins**
- **Seller Performance**
- **Automation with Stored Procedures**

An **ERD diagram** is included to represent the schema and table relationships.



---

## 🛠 Database Setup & Design

### Schema Overview
- **Customers** – Customer details (name, location, registration date)  
- **Orders** – Orders placed, linked to customers & sellers  
- **Order_Items** – Line items with product, quantity, and price  
- **Products** – Product catalog with category & cost details  
- **Category** – Product categories  
- **Inventory** – Stock details with warehouses  
- **Payments** – Payment transactions and statuses  
- **Shipping** – Shipping dates and providers  
- **Seller** – Seller details  

**ERD Diagram**
<img width="1827" height="943" alt="ERD2" src="https://github.com/user-attachments/assets/2cde919f-e895-4d08-8fb2-52919c5577a9" />


---

## 📂 Repository Structure

 

  <pre><code>Amazon-SQL-Analytics-Project/
│
├── Dataset/                 — Raw dataset
├── Schema/                  — Database schema &amp; DDL scripts
├── ERD/                     — Entity Relationship Diagram
├── Queries/                 — SQL queries (organized by topic)
│   ├── Sales &amp; Revenue Analysis/
│   ├── Customer Analytics/
│   ├── Inventory &amp; Operations/
│   ├── Profitability &amp; Margins/
│   ├── Sellers &amp; Performance/
│   └── Automation &amp; Advanced/
├── Outputs/                 — Screenshots of query results
</code></pre>
</details>





---

## 🔑 Key Business Problems Solved

1. **Top Selling Products** – Identified top 10 products by revenue  
2. **Revenue by Category** – Measured category contribution to total revenue  
3. **Customer Lifetime Value (CLTV)** – Ranked customers by lifetime spend  
4. **Cross-Sell Opportunities** – Suggested products customers are likely to buy together  
5. **Inventory Stock Alerts** – Flagged products with critically low stock  
6. **Shipping Delays** – Found orders delayed beyond 3 days  
7. **Profit Margins** – Calculated margin per product and ranked them  
8. **Stored Procedure** – Automated stock updates after a sale  

---

## 📊 Sample Output & Insight

**Problem 1: Top Selling Products**

| product_name              | total_quantity_sold | total_sales_value |
|---------------------------|----------------------|-------------------|
| Apple iMac Pro            | 126                  | 629,998.74        |
| Apple iMac 27-Inch Retina | 129                  | 232,198.71        |
| Canon EOS R5 Camera       | 57                   | 222,299.43        |

**Insight:**  
- Apple iMac Pro generated the highest sales (~$630K)  
- Premium Apple desktops dominate top revenue products  
- Professional cameras (Canon, Sony) also contribute strongly → opportunity to **cross-sell accessories**  

---
 

🎓 Learning Outcomes

Through this project, I learned how to:

- Design and implement a normalized database schema
- Write complex SQL queries using CTEs, subqueries, and window functions
- Solve real-world business problems with SQL
- Automate tasks using stored procedures
- Derive actionable insights to support decision-making

📌 Conclusion

This project demonstrates my ability to:

- Work with large datasets (20K+ records)
- Apply advanced SQL techniques
- Translate raw data into business insights
- Communicate findings in a clear, structured way

It reflects how SQL can be used not just for querying data, but for solving real business challenges like "
customer retention, revenue optimization, and inventory management.


<p align="center">© Created by <strong>Bhavya Nyati</strong> 💡 Please credit this repo if you use it.</p>





