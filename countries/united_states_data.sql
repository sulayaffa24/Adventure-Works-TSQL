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
    
-- How many times did a StateProvince appear in the dataset
SELECT
    COUNT(*) AS number_of_times,
    [StateProvince]
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
GROUP BY 
    [StateProvince]
ORDER BY 
    number_of_times DESC  -- California showed up the most with 65 times followed by Washington with 48
    
-- Let's explore the customers in the state of California 
SELECT
    CONCAT_WS(' ', FirstName, MiddleName, LastName) AS FullName,
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
    [StateProvince] = 'California'
    AND ([AddressLine1] LIKE '%Blvd%' OR [AddressLine1] LIKE '%Boulevard%')  -- And there are 13 customers in California who have 'Blvd' or 'Boulevard' on their address
    
-- Let's go a bit further and search for customers who live in the state of California and has 'Blvd' or 'Boulevard' on their address and has a last name that starts
-- with M
SELECT
    CONCAT_WS(' ', FirstName, MiddleName, LastName) AS FullName,
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
    [StateProvince] = 'California'
    AND ([AddressLine1] LIKE '%Blvd%' OR [AddressLine1] LIKE '%Boulevard%') 
    AND LastName LIKE 'M%'
    
-- I'm curious to find out how many sales persons were involved in the state of California
-- In the SalesPerson column the data starts as adventure-works\sales_person_name I wanted to only extract the name 
-- I located the character index of the '\' and used the SUBSTRING function to pull the sale person's username 
SELECT
    CONCAT_WS(' ', FirstName, MiddleName, LastName) AS FullName,
    [EmailAddress],
    [CountryRegion],
    [AddressLine1],
    [AddressLine2],
    [City],
    [StateProvince],
    [AddressType],
    CHARINDEX('\\', SalesPerson) AS char_index, -- I added another backslash here to avoid the backslash call in GitHub!
    SUBSTRING(SalesPerson, 17, 9) AS SalesPerson_username
FROM
    [SalesLT].[Customer] c
JOIN
    [SalesLT].[CustomerAddress] ca
    ON  c.CustomerID = ca.CustomerID
JOIN
    [SalesLT].[Address] a
    ON ca.AddressID = a.AddressID
WHERE
    [StateProvince] = 'California'

-- There were Sales Persons involved in the state of California shu0 and linda3
-- Shu0 has more customers in California
SELECT
    COUNT(*),
    [SalesPerson],
    SUBSTRING(SalesPerson, 17, 9) AS SalesPerson_username
FROM
    [SalesLT].[Customer] c
JOIN
    [SalesLT].[CustomerAddress] ca
    ON  c.CustomerID = ca.CustomerID
JOIN
    [SalesLT].[Address] a
    ON ca.AddressID = a.AddressID
WHERE
    [StateProvince] = 'California'
GROUP BY
    [SalesPerson]
ORDER BY 
    [SalesPerson] DESC  
 
-- We can do the same for the State of Washington
-- How many Sales Persons are involved in the State of Washington
SELECT
    COUNT(*),
    [SalesPerson],
    SUBSTRING(SalesPerson, 17, 9) AS SalesPerson_username
FROM
    [SalesLT].[Customer] c
JOIN
    [SalesLT].[CustomerAddress] ca
    ON  c.CustomerID = ca.CustomerID
JOIN
    [SalesLT].[Address] a
    ON ca.AddressID = a.AddressID
WHERE
    [StateProvince] = 'Washington'
GROUP BY
    [SalesPerson]
ORDER BY 
    [SalesPerson] DESC  -- There were 2 sales persons pamela and david, pamela had 25 customers and david had 23

-- I was also curious to find which salesperson has the most customers in the United States
SELECT
    COUNT(*) AS number_of_times,
    [SalesPerson],
    SUBSTRING(SalesPerson, 17, 9) AS SalesPerson_username
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
GROUP BY
    [SalesPerson]
ORDER BY 
    number_of_times DESC  

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

-- These are the salespersons that have more than 50 customers in the US
SELECT
    COUNT(*) AS number_of_times,
    [SalesPerson],
    SUBSTRING(SalesPerson, 17, 9) AS SalesPerson_username
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
GROUP BY
    [SalesPerson]
HAVING COUNT(*) > 50
ORDER BY 
    number_of_times DESC

