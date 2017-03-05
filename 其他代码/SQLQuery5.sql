--1
--查询EmployeeDepartmentHistory表中的EmployeeID和工作状态，工作状态根据EndDate属性是否为空值显示
-- EndDate为空值显示'在职'，EndDate不为空显示'离职'，该列的标题定制为'工作状态'(HumanResources.EmployeeDepartmentHistory)
SELECT EmployeeID,IIF(EndDate IS NULL,N'在职',N'离职') as N'工作状态'
FROM HumanResources.EmployeeDepartmentHistory

--2
SELECT 'Department Number'= DepartmentID,       'Department Name'= Name FROM HumanResources.Department 

--3
--检索EmployeePayHistory表的EmployeeID、Rate属性，按Rate属性值降序排列，并显示排名，Rate值相同的排名值相同，整体的排名连续（HumanResources.EmployeePayHistory）
SELECT EmployeeID,Rate,DENSE_RANK() OVER(order by rate desc) AS RANK
FROM HumanResources.EmployeePayHistory

--4
SELECT Title,Avg_vacation_hours = avg(VacationHours)
FROM HumanResources.Employee
WHERE VacationHours > 30 GROUP BY title
Having avg(VacationHours) > 55

--5
--返回ASCII码值是65的字符
SELECT char(65)

--6
--显示Employee表中Title以'PR'开头的所有记录，只显示Title列，且只显示一次（HumanResources.Employee）
SELECT distinct Title FROM
HumanResources.Employee
WHERE Title LIKE 'PR%'

--7
--返回字符串'Weather'从第二个字符开始的两个字符
SELECT SUBSTRING('Weather',2,2)

--8
SELECT *
FROM Sales.SalesOrderDetail
WHERE ProductID = 843

--9
--将字符串'richard'转换为大写
SELECT UPPER('richard')

--10
--显示GroupName是Manufacturing或Quality Assurance的部门信息（HumanResources.Department）
SELECT * from HumanResources.Department
where GroupName = 'Manufacturing' or GroupName = 'Quality Assurance'

-- 11. 从Contact表检索名字和EmailAddress列
-- 名字以Mr.G.Achong的形式显示，其中Mr.为Title列的值，G为FirstName的第一个字符，Achong为LastName列的值
-- 即并置（连接）Title列、FirstName列的第一个字符和LastName，名字列的标题自定义为Name（Person.Contact）
SELECT Title + LEFT(FirstName,1)+ '.' + LastName as 'Name',EmailAddress
FROM Person.Contact

--12 删除字符串'RICHARD  '结尾的空格
SELECT RTRIM('RICHARD  ')

--13
SELECT ProductID,sum(distinct(UnitPrice))AS'总单价',sum(linetotal)as'总金额'
FROM Sales.SalesOrderDetail
WHERE ProductID = 774 or ProductID = 777
group by cube(ProductID)

--14
--四舍五入15.789，精确到小数点后两位
SELECT ROUND(15.789,2)

--15
SELECT * FROM HumanResources.Department
WHERE NOT GroupName = 'Quality Assurance'

--16
SELECT EmployeeID,ContactID,LoginID,Title
FROM HumanResources.Employee

--17
SELECT * FROM Sales.SalesOrderHeader
WHERE OrderDate = '2004-06-06'

--18
SELECT * FROM HumanResources.Employee
WHERE MaritalStatus = 'M' and Title = 'Production Technician - WC60'

--19
SELECT SUM(DISTINCT(RATE)) AS 'Sum'
FROM HumanResources.EmployeePayHistory

--20
--返回客户机进程的当前主机名
SELECT HOST_NAME()




SELECT COUNT(DISTINCT Rate) AS 'Unique Rate'
FROM HumanResources.EmployeePayHistory
WHERE RATE IS NOT NULL


SELECT DATEDIFF(DD,1997-02-13,getdate())

SELECT min(Rate) AS 'Minimum Rate'
FROM HumanResources.EmployeePayHistory


SELECT *
from Humanresources.Employee
Where Title like 'pr%' or Title like 'pe%'