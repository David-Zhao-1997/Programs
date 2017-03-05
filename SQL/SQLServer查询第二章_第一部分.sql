
---------------------------------------------------------------------
--��������
--set language N'��������';
---------------------------------------------------------------------
--�﷨��
-- SELECT [ALL | DISTINCT] select_column_list 	
-- [INTO [new_table_name]] 	
-- [FROM {table_name | view_name} 	
-- [WHERE search_condition] 

--���Ƚ��������ݿ�ѡΪAdventureWorks���ݿ�
USE AdventureWorks;

--1. ��ʾ��Ա��������ϸ��Ϣ��HumanResources.Employee��
SELECT * FROM HumanResources.Employee

--2. ��ʾ��Ա��EmployeeID��ContactID��LoginID��Title��HumanResources.Employee��
SELECT EmployeeID,ContactID,LoginID,Title FROM HumanResources.Employee
--3. ��������ʾDepartment���DepartmentID��Name����������ΪDepartment Number��Department Name��HumanResources.Department��


--��ʽһ��
SELECT 'Department Number'= DepartmentID,       'Department Name'= Name FROM HumanResources.Department 

--��ʽ����	
SELECT DepartmentID 'Department Number', Name 'Department Name' FROM HumanResources.Department


--��ʽ����
SELECT DepartmentID AS 'Department Number', Name AS 'Department Name' FROM HumanResources.Department


--4. ��ʾ��Ա��EmployeeID��Title��������֮������һ����ʾ����ֵ'Designation��'��HumanResources.Employee��
SELECT EmployeeID, 'Designation:', Title
FROM HumanResources.Employee

--5. ��ʾ������Ϣ������Department���Name�С�����ֵ' department comes under '��GroupName�С�����ֵ' group'
--���õ�������һ����ʾ������ΪDepartment��HumanResources.Department��
SELECT Name + ' department comes under ' + GroupName + ' group' AS Department FROM HumanResources.Department  
--6. ��ʾ��Ա��EmployeeID��Rate��ÿ��Ĺ��ʣ������Աÿ�칤��8Сʱ��HumanResources.EmployeePayHistory��
SELECT EmployeeID, Rate, Per_Day_Rate = 8 * Rate FROM HumanResources.EmployeePayHistory
---------------------------------------------------------------------
--������
---------------------------------------------------------------------

--7. ��ʾ������'Research and Development'�Ĳ�����Ϣ��HumanResources.Department��
	SELECT * FROM HumanResources.Department 
	WHERE GroupName = 'Research and Development'

--8. ��ʾ��Ա�ݼ�Сʱ��С��5�ļ�¼��ֻ��ʾ��Ա��EmployeeID��NationalIDNumber��Title��VacationHours�У�HumanResources.Employee��
SELECT EmployeeID,NationalIDNumber,Title,VacationHours FROM HumanResources.Employee 
	WHERE VacationHours < 5
--or and not
--9. ��ʾGroupName��Manufacturing��Quality Assurance�Ĳ�����Ϣ��HumanResources.Department��
SELECT * from HumanResources.Department
where GroupName = 'Manufacturing' or GroupName = 'Quality Assurance'

--10. ��ʾ��Ա��Ϣ����ԱΪ�ѻ鲢��Ŀ��ְ����'Production Technician - WC60'������Ա������ϸ��Ϣ��HumanResources.Employee��

SELECT * FROM HumanResources.Employee
WHERE MaritalStatus = 'M' and Title = 'Production Technician - WC60'

--11. ��ʾGroupName����Quality Assurance�Ĳ�����Ϣ��HumanResources.Department��
SELECT * FROM HumanResources.Department
WHERE NOT GroupName = 'Quality Assurance'

--12. ��ʾ�ݼ�Сʱ���� 20 �� 50 ֮��Ĺ�Ա�ļ�¼��ֻ��ʾEmployeeID��VacationHours�У�HumanResources.Employee��
SELECT EmployeeID,VacationHours from HumanResources.Employee
WHERE VacationHours BETWEEN 20 and 50
--13. ��ʾ�ݼ�Сʱ������ 40 �� 50 ֮��Ĺ�Ա�ļ�¼��ֻ��ʾEmployeeID��VacationHours�У�HumanResources.Employee��
SELECT EmployeeID,VacationHours from HumanResources.Employee
WHERE VacationHours NOT BETWEEN 20 and 50
--14. ��ʾTitle���� Recruiter �� Stocker��Buyer �Ĺ�Ա�ļ�¼��ֻ��ʾEmployeeID��Title��LoginID�У�HumanResources.Employee��
SELECT EmployeeID,Title,LoginID from HumanResources.Employee
WHERE TITLE = 'Recruiter' or Title = 'Stocker' or Title = 'buyer'

--15. ��ʾTitle������ Recruiter �� Stocker��Buyer �Ĺ�Ա�ļ�¼��ֻ��ʾEmployeeID��Title��LoginID�У�HumanResources.Employee��
SELECT EmployeeID,Title,LoginID from HumanResources.Employee
WHERE NOT TITLE = 'Recruiter' and NOT Title = 'Stocker' and NOT Title = 'buyer'

--16. ��ʾ���ŵ�Name�е�ֵ��'Pro'��ͷ�����м�¼��HumanResources.Department��
SELECT * FROM HumanResources.Department
WHERE Name LIKE 'Pro%'
--17. ��ʾ��������Ϊ����ַ�����'Sale'��ͷ����������ַ�������������м�¼��HumanResources.Department��
SELECT * FROM HumanResources.Department
WHERE Name LIKE 'Sale_'

--18. ��ʾEmployeeDepartmentHistory����EndDate�е�ֵΪNULL�ļ�¼�� ֻ��ʾEmployeeID��EndDate�У�HumanResources.EmployeeDepartmentHistory��

SELECT EmployeeID, EndDate
FROM HumanResources.EmployeeDepartmentHistory  
WHERE EndDate IS NULL

--19. ��ʾSalesPerson���SalesPersonID��SalesQuota�У�����SalesQuota�е�nullֵ����Ϊ�㣨Sales.SalesPerson��
SELECT SalesPersonID , ISNULL( SalesQuota, 0.00) AS 'Sales Quota'
FROM Sales.SalesPerson
--20. ��ʾ���ŵ�DepartmentID��GroupName������GroupName��������HumanResources.Department��
SELECT DepartmentID,GroupName
FROM HumanResources.Department
ORDER BY GroupName
--21. ��ʾ���ŵ�GroupName��DepartmentID��Name���Ȱ���GroupName����������Ȼ����DepartmentID��������HumanResources.Department��
SELECT DepartmentID,GroupName,Name
FROM HumanResources.Department
ORDER BY GroupName,DepartmentID

--22. ��ʾEmployee���ǰ10�У�HumanResources.Employee��
SELECT TOP 10 *
FROM HumanResources.Employee

--23. ��ʾEmployee���ǰ10%�У�HumanResources.Employee��
SELECT TOP 10 PERCENT *
FROM HumanResources.Employee

--24. ��ʾEmployee����HireDate���ڵ���1/1/98����С�ڵ���12/31/98��ǰ������¼
--���ң���¼Ҫ����SickLeaveHours��������ʾ��HumanResources.Employee��
SELECT top 3 HireDate
FROM HumanResources.Employee
WHERE HireDate >= 1/1/98 and HireDate <= 12/31/98
ORDER BY SickLeaveHours asc
--25. ��ʾ����ʱ������ǰ10λ�Ĺ�Ա��EmployeeID��Title��SickLeaveHours
--���⣬�����Ӧ�ð�����Щ����ʱ���������а�������Ͳ���ʱ��ƥ������й�Ա��HumanResources.Employee��
SELECT top 10 EmployeeID,Title,SickLeaveHours
FROM HumanResources.Employee
ORDER BY SickLeaveHours desc

--26. ��ʾEmployee���EmployeeID��NationalIDNumber��ContactID��HireDate�У����ų�ǰ15����¼��HumanResources.Employee��
Select EmployeeID,NationalIDNumber,ContactID,HireDate
from HumanResources.Employee Order By EmployeeID        	
OFFSET 15 ROWS
--27. ��ʾEmployee���EmployeeID��NationalIDNumber��ContactID��HireDate�е�10����¼�����ų�ǰ15����¼��HumanResources.Employee��
Select EmployeeID,NationalIDNumber,ContactID,HireDate
from HumanResources.Employee Order By EmployeeID
OFFSET 15 ROWS FETCH NEXT 10 ROWS ONLY
--28. ��ʾEmployee����Title��'PR'��ͷ�����м�¼��ֻ��ʾTitle�У���ֻ��ʾһ�Σ�HumanResources.Employee��
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