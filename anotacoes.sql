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
--- IN

SELECT *
FROM Production.Product
WHERE ProductID IN (1,3,19)

--- LIKE

SELECT * 
FROM Person.Person 
WHERE FirstName 
like '%es' --% antes para achar letras no fim - % depois para achar letras no começo

--1.
SELECT *
FROM Production.Product
WHERE ListPrice > 1500 ORDER BY ListPrice ASC

--2.
SELECT count(LastName)
FROM Person.Person
WHERE LastName like 'p%'

--3.
SELECT COUNT(DISTINCT City)
FROM Person.Address

--4.
SELECT Distinct City	
FROM Person.Address

--5. 
SELECT COUNT(Color)
FROM Production.Product
WHERE Color = 'RED' and ListPrice BETWEEN 500 and 1000

--6
SELECT COUNT(NAME)
FROM Production.Product
WHERE Name like '%road%'

--- GROUP BY

SELECT FirstName, COUNT(FirstName) AS "contagem"
FROM Person.Person
GROUP BY FirstName
ORDER BY contagem DESC

SELECT Color, AVG(ListPrice) AS "prata"
FROM Production.Product
WHERE Color = 'Silver'
GROUP BY Color

SELECT MiddleName, COUNT(MiddleName)
FROM PERSON.Person
GROUP BY MiddleName

SELECT ProductID, COUNT(OrderQty) as "qnt",AVG(OrderQty) as "media"
FROM Sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY qnt asc

SELECT TOP 10 ProductID,Sum(LineTotal) as "SOMA"
FROM Sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY SOMA DESC;


SELECT ProductID,COUNT(ProductID) as "Quantidade", AVG(OrderQty)as "Media"
FROM Production.WorkOrder
GROUP BY ProductID


---HAVING

SELECT COUNT(STATEPROVINCEID)
FROM PERSON.Address
GROUP BY StateProvinceID 
HAVING count(stateprovinceid) > 1000



SELECT AVG(LineTotal) as "MEDIA"
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING AVG(LineTotal) < 1000000

---AS

SELECT FirstName AS "Nome", LastName AS "Sobrenome"
FROM Person.Person


SELECT ProductNumber AS "Nome do produto"
FROM Production.Product


SELECT UnitPrice AS "Preco Unitario"
FROM Sales.SalesOrderDetail

---INNER JOIN

SELECT p.BusinessEntityID, p.FirstName,p.LastName, pe.EmailAddress
FROM Person.Person AS "P"
INNER JOIN Person.EmailAddress PE on p.BusinessEntityID = pe.BusinessEntityID

--Achar a coluna que é paralela a outra tabela, criar os apelidos e identificar quais colunas quer puxar de determinada tabela


SELECT p.ListPrice, pe.Name, p.Name
FROM Production.Product as "P"
INNER JOIN Production.ProductSubcategory PE on p.ProductSubcategoryID = pe.ProductSubcategoryID


SELECT be.BusinessEntityID,be.AddressTypeID, a.AddressID, a.AddressLine1	,a.City
FROM Person.BusinessEntityAddress AS "be"
INNER JOIN person.Address a on be.AddressID = a.AddressID

SELECT top 50 pnt.PhoneNumberTypeID, pnt.Name, pp.PhoneNumber 
FROM person.PhoneNumberType AS "PNT"
INNER JOIN Person.PersonPhone PP on  pnt.PhoneNumberTypeID = pp.PhoneNumberTypeID

SELECT psp.Name, PSP.stateprovincecode, pa.city,pa.addressline1 
FROM Person.StateProvince AS "psp"
INNER JOIN Person.Address PA on psp.StateProvinceID = PA.StateProvinceID
