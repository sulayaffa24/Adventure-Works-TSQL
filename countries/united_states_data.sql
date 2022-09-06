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
    

