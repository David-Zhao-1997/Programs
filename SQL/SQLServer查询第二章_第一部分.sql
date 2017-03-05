
---------------------------------------------------------------------
--检索属性
--set language N'简体中文';
---------------------------------------------------------------------
--语法：
-- SELECT [ALL | DISTINCT] select_column_list 	
-- [INTO [new_table_name]] 	
-- [FROM {table_name | view_name} 	
-- [WHERE search_condition] 

--首先将可用数据库选为AdventureWorks数据库
USE AdventureWorks;

--1. 显示雇员的所有详细信息（HumanResources.Employee）
SELECT * FROM HumanResources.Employee

--2. 显示雇员的EmployeeID、ContactID、LoginID和Title（HumanResources.Employee）
SELECT EmployeeID,ContactID,LoginID,Title FROM HumanResources.Employee
--3. 别名：显示Department表的DepartmentID和Name，而标题名为Department Number和Department Name（HumanResources.Department）


--方式一：
SELECT 'Department Number'= DepartmentID,       'Department Name'= Name FROM HumanResources.Department 

--方式二：	
SELECT DepartmentID 'Department Number', Name 'Department Name' FROM HumanResources.Department


--方式三：
SELECT DepartmentID AS 'Department Number', Name AS 'Department Name' FROM HumanResources.Department


--4. 显示雇员的EmployeeID和Title，在它们之间增加一列显示字面值'Designation：'（HumanResources.Employee）
SELECT EmployeeID, 'Designation:', Title
FROM HumanResources.Employee

--5. 显示部门信息，并将Department表的Name列、字面值' department comes under '、GroupName列、字面值' group'
--并置到单独的一列显示，列名为Department（HumanResources.Department）
SELECT Name + ' department comes under ' + GroupName + ' group' AS Department FROM HumanResources.Department  
--6. 显示雇员的EmployeeID、Rate和每天的工资，假设雇员每天工作8小时（HumanResources.EmployeePayHistory）
SELECT EmployeeID, Rate, Per_Day_Rate = 8 * Rate FROM HumanResources.EmployeePayHistory
---------------------------------------------------------------------
--检索行
---------------------------------------------------------------------

--7. 显示组名是'Research and Development'的部门信息（HumanResources.Department）
	SELECT * FROM HumanResources.Department 
	WHERE GroupName = 'Research and Development'

--8. 显示雇员休假小时数小于5的记录，只显示雇员的EmployeeID、NationalIDNumber、Title和VacationHours列（HumanResources.Employee）
SELECT EmployeeID,NationalIDNumber,Title,VacationHours FROM HumanResources.Employee 
	WHERE VacationHours < 5
--or and not
--9. 显示GroupName是Manufacturing或Quality Assurance的部门信息（HumanResources.Department）
SELECT * from HumanResources.Department
where GroupName = 'Manufacturing' or GroupName = 'Quality Assurance'

--10. 显示雇员信息，雇员为已婚并且目标职能是'Production Technician - WC60'的所有员工的详细信息（HumanResources.Employee）

SELECT * FROM HumanResources.Employee
WHERE MaritalStatus = 'M' and Title = 'Production Technician - WC60'

--11. 显示GroupName不是Quality Assurance的部门信息（HumanResources.Department）
SELECT * FROM HumanResources.Department
WHERE NOT GroupName = 'Quality Assurance'

--12. 显示休假小时数在 20 和 50 之间的雇员的记录，只显示EmployeeID、VacationHours列（HumanResources.Employee）
SELECT EmployeeID,VacationHours from HumanResources.Employee
WHERE VacationHours BETWEEN 20 and 50
--13. 显示休假小时数不在 40 和 50 之间的雇员的记录，只显示EmployeeID、VacationHours列（HumanResources.Employee）
SELECT EmployeeID,VacationHours from HumanResources.Employee
WHERE VacationHours NOT BETWEEN 20 and 50
--14. 显示Title属于 Recruiter 、 Stocker或Buyer 的雇员的记录，只显示EmployeeID、Title、LoginID列（HumanResources.Employee）
SELECT EmployeeID,Title,LoginID from HumanResources.Employee
WHERE TITLE = 'Recruiter' or Title = 'Stocker' or Title = 'buyer'

--15. 显示Title不属于 Recruiter 、 Stocker或Buyer 的雇员的记录，只显示EmployeeID、Title、LoginID列（HumanResources.Employee）
SELECT EmployeeID,Title,LoginID from HumanResources.Employee
WHERE NOT TITLE = 'Recruiter' and NOT Title = 'Stocker' and NOT Title = 'buyer'

--16. 显示部门的Name列的值以'Pro'开头的所有记录（HumanResources.Department）
SELECT * FROM HumanResources.Department
WHERE Name LIKE 'Pro%'
--17. 显示部门名称为五个字符且以'Sale'开头，而第五个字符可以随意的所有记录（HumanResources.Department）
SELECT * FROM HumanResources.Department
WHERE Name LIKE 'Sale_'

--18. 显示EmployeeDepartmentHistory表中EndDate列的值为NULL的记录， 只显示EmployeeID和EndDate列（HumanResources.EmployeeDepartmentHistory）

SELECT EmployeeID, EndDate
FROM HumanResources.EmployeeDepartmentHistory  
WHERE EndDate IS NULL

--19. 显示SalesPerson表的SalesPersonID和SalesQuota列，并将SalesQuota列的null值更换为零（Sales.SalesPerson）
SELECT SalesPersonID , ISNULL( SalesQuota, 0.00) AS 'Sales Quota'
FROM Sales.SalesPerson
--20. 显示部门的DepartmentID和GroupName，并按GroupName升序排序（HumanResources.Department）
SELECT DepartmentID,GroupName
FROM HumanResources.Department
ORDER BY GroupName
--21. 显示部门的GroupName、DepartmentID和Name，先按照GroupName的升序排序，然后按照DepartmentID降序排序（HumanResources.Department）
SELECT DepartmentID,GroupName,Name
FROM HumanResources.Department
ORDER BY GroupName,DepartmentID

--22. 显示Employee表的前10行（HumanResources.Employee）
SELECT TOP 10 *
FROM HumanResources.Employee

--23. 显示Employee表的前10%行（HumanResources.Employee）
SELECT TOP 10 PERCENT *
FROM HumanResources.Employee

--24. 显示Employee表中HireDate大于等于1/1/98并且小于等于12/31/98的前三条记录
--而且，记录要基于SickLeaveHours列升序显示（HumanResources.Employee）
SELECT top 3 HireDate
FROM HumanResources.Employee
WHERE HireDate >= 1/1/98 and HireDate <= 12/31/98
ORDER BY SickLeaveHours asc
--25. 显示病假时数排名前10位的雇员的EmployeeID、Title和SickLeaveHours
--此外，结果集应该包含那些病假时数与结果集中包含的最低病假时数匹配的所有雇员（HumanResources.Employee）
SELECT top 10 EmployeeID,Title,SickLeaveHours
FROM HumanResources.Employee
ORDER BY SickLeaveHours desc

--26. 显示Employee表的EmployeeID、NationalIDNumber、ContactID和HireDate列，但排除前15条记录（HumanResources.Employee）
Select EmployeeID,NationalIDNumber,ContactID,HireDate
from HumanResources.Employee Order By EmployeeID        	
OFFSET 15 ROWS
--27. 显示Employee表的EmployeeID、NationalIDNumber、ContactID和HireDate列的10条记录，但排除前15条记录（HumanResources.Employee）
Select EmployeeID,NationalIDNumber,ContactID,HireDate
from HumanResources.Employee Order By EmployeeID
OFFSET 15 ROWS FETCH NEXT 10 ROWS ONLY
--28. 显示Employee表中Title以'PR'开头的所有记录，只显示Title列，且只显示一次（HumanResources.Employee）
SELECT distinct Title FROM
HumanResources.Employee
WHERE Title LIKE 'PR%'

CREATE TABLE Contact
(
	EmployeeID		int,
	Residence		char(5),
	Office			char(9),
	Mobile_Number	char(9)
)

INSERT INTO Contact VALUES
(1, NULL, 945673561, NULL),
(2, 23456, 999991111, NULL),
(3, NULL, NULL, 912345678),
(4, NULL, NULL, 908087657)

SELECT *
FROM Contact

SELECT EmployeeID, COALESCE(Residence, Office, Mobile_Number) AS Contract_Number
FROM Contact