# 🛒 Supermarket Sales – SQL Analytical Reporting Suite
This project contains a SQL Server Stored Procedure designed to generate structured analytical reports from the `supermarket_sales` dataset.

Database used:

**Supermarket Sales**

Main procedure:

`SP_SUPERMARKET_REPORTS`

The purpose of this procedure is to transform transactional retail data into structured reporting tables with calculated business KPIs.

## 🎯 Procedure Objective
`SP_SUPERMARKET_REPORTS` generates three analytical reports within a single execution:

* 1️⃣ Sales report including tax calculations

* 2️⃣ Customer satisfaction report

* 3️⃣ Profitability report by product line


Each report creates a physical table populated with calculated metrics.

---

## ⚙️ Stored Procedure: SP_SUPERMARKET_REPORTS

Execution:
```sql
EXEC SP_SUPERMARKET_REPORTS;
```

The procedure generates three reporting tables:

* REPORT_SALES
* REPORT_CUSTOMER_FEEDBACK
* REPORT_PRODUCT_PROFITS

### 📊 1️⃣ Sales Report – City & Gender Segmentation
**🗂 Table Created: `REPORT_SALES`**

|Column |	Description|
|-------|------------|
|City | Sales location|
|Gender	| Customer gender|
|UnitPrice |	Unit price of product|
|Quantity	| Units sold|
|Tax5Percent |	5% tax calculation|
|TotalAmount	| Total amount including tax|

**🧮 Calculations Implemented**

Tax:

``` scss
UnitPrice × Quantity × 0.05

Total including tax:

UnitPrice × Quantity × 1.05
```

**📈 Business Application**

* Revenue segmentation by city
* Sales distribution by gender
* Tax impact modeling
* Gross revenue analysis


### 👥 2️⃣ Customer Feedback Report
**🗂 Table Created: `REPORT_CUSTOMER_FEEDBACK`**

|Column |	Description|
|-------|------------|
|City	| Sales location|
|CustomerType |	Member / Normal|
|AvgRating	| Average customer rating|

**🧮 Calculations Implemented**

Rounded average rating:
``` sql
ROUND(AVG(Rating), 2)
```

Grouped by:

* City
* Customer type

**📊 Business Application**

* Member vs non-member satisfaction comparison
* Customer experience benchmarking
* Performance analysis by city

### 💰 3️⃣ Profit Report – Product Line per City

**🗂 Table Created: `REPORT_PRODUCT_PROFITS`**

|Column |	Description|
|-------|------------|
|City	| Sales location|
|ProductLine |	Product category|
|Profit	| Calculated profit|

**🧮 Calculations Implemented**
Profit formula:
```scss
SUM(Total - cogs)
```

Grouped by:

* City
* Product line

**📊 Business Application**

* Margin analysis
* Product line performance tracking
* Profit center identification
* City-level profitability comparison


### 🧠 Technical Concepts Applied

* Structured Stored Procedure design
* Dynamic report table creation (DROP IF EXISTS pattern)
* Aggregation functions (SUM, AVG)
* Precision control using ROUND
* GROUP BY segmentation
* KPI modeling directly in SQL
* Retail financial metric computation

### 🏗 Design Approach

The procedure follows a sequential reporting workflow:

1. Drop existing report tables if present
2. Create structured reporting tables
3. Insert calculated data
4. Apply aggregations and business formulas
5. Leave tables ready for analytical consumption

This design simulates a lightweight database-layer reporting system.

### 🚀 Skills Demonstrated

* Analytical SQL development
* Retail KPI modeling
* Financial calculation logic
* Business metric computation in T-SQL
* Structured reporting table generation
* Multi-report procedural organization
