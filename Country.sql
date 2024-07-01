CREATE DATABASE DemoAppDB
USE DemoAppDB
CREATE TABLE People(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Name NVARCHAR(50) NOT NULL,
	Surname NVARCHAR(50) NOT NULL,
	PhoneNumber NVARCHAR(50) NOT NULL DEFAULT '994000000000',
	Email NVARCHAR(50) NOT NULL UNIQUE,
	BirthDate DATE NOT NULL,
	Gender CHAR CHECK(Gender ='K'  OR Gender ='Q'),
	HasCitizenship BIT NOT NULL,
	CityId INT FOREIGN KEY REFERENCES Cities(Id)
)
CREATE TABLE Countries(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Name NVARCHAR(50) NOT NULL UNIQUE,
	Area DECIMAL(18,2) NOT NULL CHECK(Area > 0)
)
CREATE TABLE Cities(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Name NVARCHAR(50) NOT NULL,
	Area DECIMAL(18,2) NOT NULL CHECK(Area > 0),
	CountryId INT FOREIGN KEY REFERENCES Countries(Id)
)
INSERT INTO Countries
VALUES
('Italiya', 70000),
('Azerbaycan', 86600),
('Rusiya', 170000),
('Turkiye', 134532)
SELECT * FROM Countries
INSERT INTO Cities
VALUES
('Baku', 15893.6, 1),
('Gence', 12833, 1),
('Ankara', 33521, 3),
('Istambul', 32711, 3),
('Moskva', 32212, 2),
('Sankt-Peterburg', 53311, 2)
SELECT * FROM Countries
SELECT * FROM Cities
INSERT INTO People
VALUES
('Test1', 'Testov1', default, 'ttestov1@code.edu.az', '2000-01-01', 'K', 'True', 1),
('Test2', 'Testov2', default, 'ttestov2@code.edu.az', '2000-11-23', 'Q', 'True', 1),
('Test3', 'Testov3', default, 'ttestov3@code.edu.az', '2003-04-08', 'K', 'True', 2),
('Test4', 'Testov4', default, 'ttestov4@code.edu.az', '2011-02-05', 'K', 'False', 2),
('Test5', 'Testov5', default, 'ttestov5@code.edu.az', '2002-10-11', 'Q', 'True', 3),
('Test6', 'Testov6', default, 'ttestov6@code.edu.az', '2000-01-29', 'Q', 'True', 3),
('Test7', 'Testov7', default, 'ttestov7@code.edu.az', '2001-04-30', 'K', 'True', 4),
('Test8', 'Testov8', default, 'ttestov8@code.edu.az', '2008-11-01', 'K', 'True', 4),
('Test9', 'Testov9', default, 'ttestov9@code.edu.az', '2004-07-08', 'K', 'False', 5),
('Test10', 'Testov10', default, 'ttestov10@code.edu.az', '2006-06-10', 'K', 'True', 5),
('Test11', 'Testov11', default, 'ttestov11@code.edu.az', '2005-11-21', 'Q', 'True', 6),
('Test12', 'Testov12', default, 'ttestov12@code.edu.az', '2000-01-31', 'K', 'True', 6)
SELECT * FROM Countries
SELECT * FROM Cities
SELECT * FROM People
SELECT p.Name AS 'Person Name', ct.Name AS 'City Name' FROM People AS p
INNER JOIN Cities AS ct ON ct.Id = p.CityId
SELECT p.Name AS 'Person Name', ct.Name AS 'City Name', c.Name AS ' Country Name' FROM People AS p
INNER JOIN Cities AS ct ON ct.Id = p.CityId
INNER JOIN Countries AS c ON c.Id = ct.CountryId
SELECT (Area) FROM Countries
ORDER BY Area DESC
SELECT (Name) FROM Cities
ORDER BY Name DESC
SELECT COUNT(Area) FROM Countries
WHERE Area > 20000
SELECT MAX(Area) FROM Countries
WHERE Countries.Name LIKE 'i%'
SELECT Name FROM Countries
UNION
SELECT Name FROM Cities
ALTER TABLE Cities
ADD Population INT
SELECT * FROM Cities
UPDATE Cities
SET Population=74000
WHERE Id = 1
UPDATE Cities
SET Population=37300
WHERE Id =6
UPDATE Cities
SET Population=34000
WHERE Id =2
UPDATE Cities
SET Population=81500
WHERE Id =3
UPDATE Cities
SET Population=11300
WHERE Id =4
UPDATE Cities
SET Population=1300
WHERE Id =5
UPDATE Cities
SET Population=37300
WHERE Id =6
SELECT Name, Population FROM Cities
GROUP BY Population, Name
SELECT Name, Population FROM Cities
GROUP BY  Population, Name
HAVING Population > 50000


