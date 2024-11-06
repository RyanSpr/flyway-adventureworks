CREATE TABLE [dbo].[SocialMedia](
	[InstagramHandle] [NCHAR](10) NULL,
	[FacebookAccount] [NCHAR](10) NULL,
	[MySpaceUsername] [NCHAR](10) NULL
) ON [PRIMARY]
GO



ALTER TABLE Person.Address ADD RoadName varchar(30);
ALTER TABLE Person.Address ADD HouseName varchar(30);
GO



CREATE NONCLUSTERED INDEX [idx_product_ProductNumber_include] ON [Production].[Product]
(
	[ProductNumber] ASC
)
INCLUDE([Name],[ListPrice],[Weight]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO



USE [AutoPilotDev]
GO

/****** Object:  View [Sales].[vSalesPerson]    Script Date: 11/4/2024 11:16:30 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [Sales].[vSalesPerson]
AS
SELECT     s.BusinessEntityID, p.Title, p.FirstName, p.MiddleName, p.LastName, p.Suffix, e.JobTitle, pp.PhoneNumber, pnt.Name AS PhoneNumberType, ea.EmailAddress, p.EmailPromotion, a.AddressLine1, a.AddressLine2, a.City, sp.Name AS StateProvinceName, a.PostalCode, 
                cr.Name AS CountryRegionName, st.Name AS TerritoryName, st.[Group] AS TerritoryGroup, s.SalesQuota, s.SalesYTD, s.SalesLastYear, s.Bonus
FROM        Sales.SalesPerson AS s INNER JOIN
                HumanResources.Employee AS e ON e.BusinessEntityID = s.BusinessEntityID INNER JOIN
                Person.Person AS p ON p.BusinessEntityID = s.BusinessEntityID INNER JOIN
                Person.BusinessEntityAddress AS bea ON bea.BusinessEntityID = s.BusinessEntityID INNER JOIN
                Person.Address AS a ON a.AddressID = bea.AddressID INNER JOIN
                Person.StateProvince AS sp ON sp.StateProvinceID = a.StateProvinceID INNER JOIN
                Person.CountryRegion AS cr ON cr.CountryRegionCode = sp.CountryRegionCode LEFT OUTER JOIN
                Sales.SalesTerritory AS st ON st.TerritoryID = s.TerritoryID LEFT OUTER JOIN
                Person.EmailAddress AS ea ON ea.BusinessEntityID = p.BusinessEntityID LEFT OUTER JOIN
                Person.PersonPhone AS pp ON pp.BusinessEntityID = p.BusinessEntityID LEFT OUTER JOIN
                Person.PhoneNumberType AS pnt ON pnt.PhoneNumberTypeID = pp.PhoneNumberTypeID
GO

