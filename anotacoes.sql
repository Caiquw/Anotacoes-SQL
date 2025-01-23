--- TOP + ORDER BY
SELECT TOP 4 Name, ProductNumber
FROM Production.Product
ORDER BY ProductID asc

--- BETWEEN
SELECT * FROM Production.Product
WHERE Product.ListPrice 
BETWEEN 3000 AND 3600
    
    ---NOT BEETWEEN
    SELECT * FROM Production.Product
    WHERE Product.ListPrice 
    NOT BETWEEN 3000 AND 3600





