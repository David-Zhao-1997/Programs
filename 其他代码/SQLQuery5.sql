--1
--��ѯEmployeeDepartmentHistory���е�EmployeeID�͹���״̬������״̬����EndDate�����Ƿ�Ϊ��ֵ��ʾ
-- EndDateΪ��ֵ��ʾ'��ְ'��EndDate��Ϊ����ʾ'��ְ'�����еı��ⶨ��Ϊ'����״̬'(HumanResources.EmployeeDepartmentHistory)
SELECT EmployeeID,IIF(EndDate IS NULL,N'��ְ',N'��ְ') as N'����״̬'
FROM HumanResources.EmployeeDepartmentHistory

--2
SELECT 'Department Number'= DepartmentID,       'Department Name'= Name FROM HumanResources.Department 

--3
--����EmployeePayHistory���EmployeeID��Rate���ԣ���Rate����ֵ�������У�����ʾ������Rateֵ��ͬ������ֵ��ͬ�����������������HumanResources.EmployeePayHistory��
SELECT EmployeeID,Rate,DENSE_RANK() OVER(order by rate desc) AS RANK
FROM HumanResources.EmployeePayHistory

--4
SELECT Title,Avg_vacation_hours = avg(VacationHours)
FROM HumanResources.Employee
WHERE VacationHours > 30 GROUP BY title
Having avg(VacationHours) > 55

--5
--����ASCII��ֵ��65���ַ�
SELECT char(65)

--6
--��ʾEmployee����Title��'PR'��ͷ�����м�¼��ֻ��ʾTitle�У���ֻ��ʾһ�Σ�HumanResources.Employee��
SELECT distinct Title FROM
HumanResources.Employee
WHERE Title LIKE 'PR%'

--7
--�����ַ���'Weather'�ӵڶ����ַ���ʼ�������ַ�
SELECT SUBSTRING('Weather',2,2)

--8
SELECT *
FROM Sales.SalesOrderDetail
WHERE ProductID = 843

--9
--���ַ���'richard'ת��Ϊ��д
SELECT UPPER('richard')

--10
--��ʾGroupName��Manufacturing��Quality Assurance�Ĳ�����Ϣ��HumanResources.Department��
SELECT * from HumanResources.Department
where GroupName = 'Manufacturing' or GroupName = 'Quality Assurance'

-- 11. ��Contact��������ֺ�EmailAddress��
-- ������Mr.G.Achong����ʽ��ʾ������Mr.ΪTitle�е�ֵ��GΪFirstName�ĵ�һ���ַ���AchongΪLastName�е�ֵ
-- �����ã����ӣ�Title�С�FirstName�еĵ�һ���ַ���LastName�������еı����Զ���ΪName��Person.Contact��
SELECT Title + LEFT(FirstName,1)+ '.' + LastName as 'Name',EmailAddress
FROM Person.Contact

--12 ɾ���ַ���'RICHARD  '��β�Ŀո�
SELECT RTRIM('RICHARD  ')

--13
SELECT ProductID,sum(distinct(UnitPrice))AS'�ܵ���',sum(linetotal)as'�ܽ��'
FROM Sales.SalesOrderDetail
WHERE ProductID = 774 or ProductID = 777
group by cube(ProductID)

--14
--��������15.789����ȷ��С�������λ
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
--���ؿͻ������̵ĵ�ǰ������
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