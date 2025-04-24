# 🛒 Ecommerce SQL Data Analysis Project

This project demonstrates how to analyze structured data from an Ecommerce database using SQL (MySQL-compatible). It covers everything from schema creation and data insertion to analytical queries, subqueries, views, and indexing.

---

## 🎯 Objective

- Practice SQL for real-world data analysis
- Learn data modeling and relationships
- Gain proficiency in:
 
- create 📦 Tables:

1)customers

Stores basic customer information

Fields: customer_id, first_name, last_name, email

2)products

Contains product catalog with categories and prices

Fields: product_id, product_name, category, price

3)orders

Represents customer purchases, linked by customer

Fields: order_id, customer_id, order_date

Relationships: customer_id → customers

4)order_items

Details of each product within an order (1 order = many items)

Fields: order_item_id, order_id, product_id, quantity

Relationships: order_id → orders, product_id → products

---solve this all sql queries
  - SELECT, WHERE, ORDER BY, GROUP BY

  - JOINs (INNER, LEFT)

  - Aggregate functions (SUM, AVG)
  
  - Views and indexing

---

## 📁 Repository Contents

