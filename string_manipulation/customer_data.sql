-- Let's find the customers located in the United States
SELECT
    [FirstName],
    [MiddleName],
    [LastName],
    [EmailAddress],
    [CountryRegion],
    [AddressLine1],
    [AddressLine2],
    [City],
    [StateProvince],
    [AddressType]
FROM
    [SalesLT].[Customer] c
JOIN
    [SalesLT].[CustomerAddress] ca
    ON  c.CustomerID = ca.CustomerID
JOIN
    [SalesLT].[Address] a
    ON ca.AddressID = a.AddressID
WHERE
    [CountryRegion] = 'United States'
    
    
-- Let's find all the customers who live in the city 'Seattle'

SELECT
    [FirstName],
    [MiddleName],
    [LastName],
    [EmailAddress],
    [CountryRegion],
    [AddressLine1],
    [AddressLine2],
    [City],
    [StateProvince],
    [AddressType]
FROM
    [SalesLT].[Customer] c
JOIN
    [SalesLT].[CustomerAddress] ca
    ON  c.CustomerID = ca.CustomerID
JOIN
    [SalesLT].[Address] a
    ON ca.AddressID = a.AddressID
WHERE
    [City] = 'Seattle'
    

-- Let's find the customers that are not located in the United States
SELECT
    [FirstName],
    [MiddleName],
    [LastName],
    [EmailAddress],
    [CountryRegion],
    [AddressLine1],
    [AddressLine2],
    [City],
    [StateProvince],
    [AddressType]
FROM
    [SalesLT].[Customer] c
JOIN
    [SalesLT].[CustomerAddress] ca
    ON  c.CustomerID = ca.CustomerID
JOIN
    [SalesLT].[Address] a
    ON ca.AddressID = a.AddressID
WHERE
    [CountryRegion] <> 'United States'  -- I noticed there are two other countries where are customers are from The United Kingdom and Canada
    
-- How many customers were from The United Kingdom
SELECT
    [FirstName],
    [MiddleName],
    [LastName],
    [EmailAddress],
    [CountryRegion],
    [AddressLine1],
    [AddressLine2],
    [City],
    [StateProvince],
    [AddressType]
FROM
    [SalesLT].[Customer] c
JOIN
    [SalesLT].[CustomerAddress] ca
    ON  c.CustomerID = ca.CustomerID
JOIN
    [SalesLT].[Address] a
    ON ca.AddressID = a.AddressID
WHERE
    [CountryRegion] = 'United Kingdom'

-- Which City from The United Kingdom showed up the most from the dataset
SELECT
    COUNT(*) AS number_of_times,
    [CountryRegion],
    [City],
    [StateProvince],
    [AddressType]
FROM
    [SalesLT].[Customer] c
JOIN
    [SalesLT].[CustomerAddress] ca
    ON  c.CustomerID = ca.CustomerID
JOIN
    [SalesLT].[Address] a
    ON ca.AddressID = a.AddressID
WHERE
    [CountryRegion] = 'United Kingdom'
GROUP BY 
    [CountryRegion],
    [City],
    [StateProvince],
    [AddressType]      -- Most of the customers were from London
