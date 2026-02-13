USE [Supermarket Sales];

DROP PROC IF EXISTS SP_SUPERMARKET_REPORTS;
GO

CREATE PROC SP_SUPERMARKET_REPORTS
AS
BEGIN

---------------------- SALES REPORT BY CITY AND GENDER ----------------------

    DROP TABLE IF EXISTS REPORT_SALES;

    CREATE TABLE REPORT_SALES
    (
        City                VARCHAR(50),
        Gender              VARCHAR(50),
        UnitPrice           NUMERIC(5,2),
        Quantity            INT,
        Tax5Percent         NUMERIC(4,2),
        TotalAmount         NUMERIC(6,2)
    );

    INSERT INTO REPORT_SALES
    (
        City,
        Gender,
        UnitPrice,
        Quantity,
        Tax5Percent,
        TotalAmount
    )
    SELECT
        City,
        Gender,
        [Unit price],
        Quantity,
        [Unit price] * Quantity * 0.05  AS Tax5Percent,
        [Unit price] * Quantity * 1.05  AS TotalAmount
    FROM
        supermarket_sales;

---------------------- CUSTOMER PERCEPTION REPORT (MEMBERS VS NON-MEMBERS) ----------------------

    DROP TABLE IF EXISTS REPORT_CUSTOMER_FEEDBACK;

    CREATE TABLE REPORT_CUSTOMER_FEEDBACK
    (
        City                VARCHAR(50),
        CustomerType        VARCHAR(50),
        AvgRating           FLOAT
    );

    INSERT INTO REPORT_CUSTOMER_FEEDBACK
    (
        City,
        CustomerType,
        AvgRating
    )
    SELECT
        City,
        [Customer type],
        ROUND(AVG(Rating), 2) AS AvgRating
    FROM
        supermarket_sales
    GROUP BY
        City, [Customer type]
    ORDER BY
        City, [Customer type] DESC;

---------------------- PROFITS BY PRODUCT LINE PER CITY ----------------------

    DROP TABLE IF EXISTS REPORT_PRODUCT_PROFITS;

    CREATE TABLE REPORT_PRODUCT_PROFITS
    (
        City            VARCHAR(50),
        ProductLine     VARCHAR(100),
        Profit          NUMERIC(10,2)
    );

    INSERT INTO REPORT_PRODUCT_PROFITS
    (
        City,
        ProductLine,
        Profit
    )
    SELECT
        City,
		[Product line],
        SUM(Total - cogs) AS Profit
    FROM
        supermarket_sales
    GROUP BY 
        City, [Product line]
    ORDER BY 
        City;

--  SELECT * FROM REPORT_SALES;
--  SELECT * FROM REPORT_CUSTOMER_FEEDBACK;
--  SELECT * FROM REPORT_PRODUCT_PROFITS;

END;
GO