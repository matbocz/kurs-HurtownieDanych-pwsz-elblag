--Zadanie 2

--Wybierz wszystkie kolumny z tabeli DimGeography
select * from DimGeography;

--Wybierz miasta oraz nazwy pa�stw z tabeli DimGeography
select City,EnglishCountryRegionName from DimGeography;

--Wybierz Miasta z pa�stw  kt�rych nazwy zaczynaj� si� od litery G lub A
select City,EnglishCountryRegionName from DimGeography
where EnglishCountryRegionName like 'A%' or
EnglishCountryRegionName like 'G%';

--Wybierz Miasta z tabeli DimGeography i posegreguj miasta alfabetycznie
select City,EnglishCountryRegionName from DimGeography
order by City;

--Wybierz wszystkich klient�w z tabeli DimCustomer p�ci m�skiej
select FirstName,LastName,Gender from DimCustomer where
Gender = 'M';

/*Wybierz wszystkich klient�w posiadaj�cych miedzy 2 a 4 dzieci oraz minimalnie 4 s�mochody*/
select FirstName,LastName,Gender,TotalChildren,NumberCarsOwned
from DimCustomer
where TotalChildren between 2 and 4
and NumberCarsOwned>=4

--Zapytanie na dw�ch tabelach
--Wybierz maksymaln�, minimaln� i �redni� cen� jednostkowa produktu z ka�dego rozmiaru
select size, max(UnitPrice) from FactInternetSales f
join DimProduct p on f.ProductKey = p.ProductKey
group by Size


--Zadanie 3

--Zapytanie 1
SELECT FirstName, LastName FROM DimEmployee
WHERE LastName LIKE 'B%'

--Zapytanie 2
SELECT c.FirstName, c.LastName, g.StateProvinceName FROM DimCustomer c
JOIN DimGeography g ON c.GeographyKey = g.GeographyKey
GROUP BY FirstName, LastName, g.StateProvinceName

--Zapytanie 3
SELECT EnglishProductName, Color FROM DimProduct
WHERE Color = 'Black'

--Zapytanie 4
SELECT r.ResellerName, g.PostalCode FROM DimReseller r
JOIN DimGeography g ON r.GeographyKey = g.GeographyKey
WHERE r.ResellerName LIKE '%b'
GROUP BY r.ResellerName, g.PostalCode

--Zapytanie 5
SELECT c.FirstName, c.LastName, c.EmailAddress, c.Phone, g.StateProvinceName, g.StateProvinceCode FROM DimCustomer c
JOIN DimGeography g ON c.GeographyKey = g.GeographyKey
WHERE g.StateProvinceCode = 'CA'
GROUP BY c.FirstName, c.LastName, c.EmailAddress, c.Phone, g.StateProvinceName, g.StateProvinceCode