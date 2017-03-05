--------------------------------------------------------------------------------------------
-- �ַ�������
--------------------------------------------------------------------------------------------

-- 1. ����'A'��ASCII��
SELECT ascii('A')
-- 2. ����ASCII��ֵ��65���ַ�
SELECT char(65)
--�Ƚ������ַ��������ƶ�
SELECT DIFFERENCE('hello','h')

-- 3. �����ַ���'RICHARD'����ʼ��4���ַ�
SELECT left('RICHARD',4)

-- 4. �����ַ���'RICHARD'���ҿ�ʼ��4���ַ�
SELECT right('RICHARD',4)

-- 5. �����ַ���'RICHARD'���ַ��ĸ���
SELECT len('RICHARD')

-- 6. ɾ���ַ���'  RICHARD'��ͷ�Ŀո�
SELECT LTRIM('  RICHARD')

-- 7. ɾ���ַ���'RICHARD  '��β�Ŀո�
SELECT RTRIM('RICHARD  ')

-- 8. ���ַ���'ACTION'�е��ַ������������У�������'NOITCA'
SELECT REVERSE('ACTION')

-- 9. �����ַ���'Weather'�ӵڶ����ַ���ʼ�������ַ�
SELECT SUBSTRING('Weather',2,2)

-- 10. ���ַ���'RICHARD'ת��ΪСд
SELECT LOWER('RICHARD')
-- 11. ���ַ���'richard'ת��Ϊ��д
SELECT UPPER('richard')
-- 12. ���ַ���'Richard'��'Hill'����Ϊһ���ַ���
SELECT CONCAT('Richard','Hill')

-- 13. ��Department�����Name��DepartmentID��GroupName�У�Name�е�ֵ�Դ�д��ʽ��ʾ�����еı����Զ���ΪDepartment Name��HumanResources.Department��
SELECT Upper(Name) as 'Department Name',DepartmentID,GroupName 
FROM HumanResources.Department
--Upper(Name)  from HumanResources.Department

-- 14. ��Contact��������ֺ�EmailAddress��
-- ������Mr.G.Achong����ʽ��ʾ������Mr.ΪTitle�е�ֵ��GΪFirstName�ĵ�һ���ַ���AchongΪLastName�е�ֵ
-- �����ã����ӣ�Title�С�FirstName�еĵ�һ���ַ���LastName�������еı����Զ���ΪName��Person.Contact��
SELECT Title + LEFT(FirstName,1)+ '.' + LastName as 'Name' 
FROM Person.Contact
--------------------------------------------------------------------------------------------
-- ת������:�����ݴ�һ������ת��Ϊ��һ������
--------------------------------------------------------------------------------------------

-- 15. ���ַ���'2009-01-09'ת��Ϊdatetime2����
SELECT PARSE('2009-01-09' as datetime2)

-- 16. ��Employee���е�HireDate��������������ת��Ϊ�ַ��������ͣ�HumanResources.Employee��
SELECT CONVERT(varchar,HireDate,2) 
FROM HumanResources.Employee
--------------------------------------------------------------------------------------------
-- ���ں���
--------------------------------------------------------------------------------------------

-- 17. ���ص�ǰ�����ں�ʱ��
SELECT GETDATE()

-- 18. ��2009-04-01�����ϼ�3����
SELECT DATEADD(MM,3,'2009-04-04')

-- 19. ��������'2005-06-06'������'2009-01-01'����
SELECT DATEDIFF(YEAR,'2005-06-06','2009-01-01')
r
-- 20. ��������'2005-6-06'���·ݣ�����ֵΪ�ַ���
SELECT DATENAME(MONTH,'2005-6-06')

-- 21. ��������'2009-09-01'���·ݣ�����ֵΪ��ֵ
SELECT DATENAME(month,convert(varchar,'2009-09-01'))

-- 22. ����Employee���е�Title����ְ��ݣ�������ְ��ݴ�HireDate�����л�ȡ���������еı��ⶨ��Ϊ'Year of Joining'(HumanResources.Employee)
SELECT Title,DATEPART(YY,HireDate) as 'Year of Joining' 
From HumanResources.Employee

-- 23. ����Employee���е�EmployeeID����ְ���ڣ�������ְ���ڴ�HireDate�����л�ȡ�������ԡ�June, 2015����ʽ��ʾ���������еı��ⶨ��Ϊ'Joining'(HumanResources.Employee)
SELECT EmployeeID,DATENAME(mm,hiredate)+','+ CONVERT(varchar,datepart(yyyy,Hiredate)) as 'Joining'
FROM HumanResources.Employee
--------------------------------------------------------------------------------------------
-- ��ѧ����
--------------------------------------------------------------------------------------------
-- 24. ����-87�ľ���ֵ
SELECT ABS(-87)
-- 25. ���ش���14.45����С����
SELECT CEILING(14.45)

-- 26. ����С��14.45���������
SELECT FLOOR(14.45)

-- 27. ����4��3�η�
SELECT POWER(4,3)

-- 28. ��������15.789����ȷ��С�������λ
SELECT ROUND(15.789,2)

-- 29. ��ѯEmployeePayHistory���е�EmployeeID��Rate����Rate����ֵ�������룬��ȷ��С�������λ���������еı���������Ϊ'Hourly Pay Rate'(HumanResources.EmployeePayHistory)
SELECT EmployeeID,ROUND(Rate,2) as 'Hourly Pay Rate'
FROM HumanResources.EmployeePayHistory

--------------------------------------------------------------------------------------------
-- �߼�����
--------------------------------------------------------------------------------------------

-- 30. ��ֵ�б�'Trigger', 'Procedure', 'Index'�з��ص�һ��ֵ'Trigger'
SELECT CHOOSE(1,'Trigger', 'Procedure', 'Index')

-- 31. ʹ��IIF������boolean_expressionΪ5>7��true_valueΪ'True'�� false_valueΪ'False'
SELECT IIF(5>7,'True','False')

-- 32. ��ѯEmployeeDepartmentHistory���е�EmployeeID�͹���״̬������״̬����EndDate�����Ƿ�Ϊ��ֵ��ʾ
-- EndDateΪ��ֵ��ʾ'��ְ'��EndDate��Ϊ����ʾ'��ְ'�����еı��ⶨ��Ϊ'����״̬'(HumanResources.EmployeeDepartmentHistory)
SELECT EmployeeID,F(EndDate IS NULL,N'��ְ',N'��ְ') as N'����״̬'
FROM HumanResources.EmployeeDepartmentHistory

--------------------------------------------------------------------------------------------
-- ��������
--------------------------------------------------------------------------------------------

-- 33. ����EmployeePayHistory���EmployeeID��Rate���ԣ���Rate����ֵ�������У�����ʾ������Rateֵ��ͬ������ֵ��ͬ��HumanResources.EmployeePayHistory��
SELECT EmployeeID,Rate,ROW_NUMBER() OVER(order by rate desc) AS RANK
FROM HumanResources.EmployeePayHistory


-- 34. ����EmployeePayHistory���EmployeeID��Rate���ԣ���Rate����ֵ�������У�����ʾ������Rateֵ��ͬ������ֵ��ͬ���������������������HumanResources.EmployeePayHistory��
SELECT EmployeeID,Rate,RANK() OVER(order by rate desc) AS RANK
FROM HumanResources.EmployeePayHistory

-- 35. ����EmployeePayHistory���EmployeeID��Rate���ԣ���Rate����ֵ�������У�����ʾ������Rateֵ��ͬ������ֵ��ͬ�����������������HumanResources.EmployeePayHistory��
SELECT EmployeeID,Rate,DENSE_RANK() OVER(order by rate desc) AS RANK
FROM HumanResources.EmployeePayHistory

-- 36. ����2001��4�º���ְ�Ĺ�Ա��EmployeeID��BirthDate��HireDate��Ϣ������Щ��Ա�ֳ�4�飬Ȼ��������ǵ���ְ����������HumanResources.Employee��
SELECT EmployeeID,BirthDate,HireDate,NTILE(4) OVER(ORDER BY BirthDate) AS RANK
FROM HumanResources.Employee
WHERE DATEPART(MM,HireDate) >= 04 AND DATEPART(YY,HireDate) >= 2001

--------------------------------------------------------------------------------------------
-- ϵͳ����
--------------------------------------------------------------------------------------------

-- 37. �鿴��½�ն˵�����ID
SELECT HOST_ID()

-- 38. ���ؿͻ������̵ĵ�ǰ������
SELECT HOST_NAME()

-- 39. ����'AdventureWorks'���ݿ�ı�ʶ��
SELECT DB_ID('AdventureWorks')

-- 40. �������ݿ�����
SELECT DB_NAME()

--**********************************************************************************************
--�2.2��
--�ϰ��뿴һ��ְλΪMarketing Manager �� Marketing Specialist��Ա���ı�š�����״̬�����䣬
--���л���״̬S��ʾΪ'����',M��ʾΪ'�ѻ�', ���ս������Ա������������� ��HumanResources.Employee��
--**********************************************************************************************
SELECT EmployeeID,IIF(MaritalStatus = 'M',N'�ѻ�',N'����') AS 'MaritalStatus',Age = 2015 - DATEPART(yy,BirthDate) 
FROM HumanResources.Employee

--------------------------------------------------------------------------------------------
-- �ۺϺ���
--------------------------------------------------------------------------------------------
-- 41. ����Employee���VacationHours�У���ʾVacationHours�е�ƽ��ֵ�����Զ������Ϊ'Average Hours'��HumanResources.Employee��
SELECT AVG(VacationHours) AS 'Average Hours'
FROM HumanResources.Employee

-- 42. ����Employee����ʾTitle�й��ж��ٸ�ְλ�����Զ������Ϊ'ְλ����'��HumanResources.Employee��
SELECT COUNT(Title) AS N'ְλ����'
FROM HumanResources.Employee

-- 43. ����Employee����ʾVacationHours�е���Сֵ�����Զ������Ϊ'Minimum Hour'��HumanResources.Employee��
SELECT MIN(VacationHours) AS 'Minimum Hour'
FROM HumanResources.Employee

-- 44. ����Employee����ʾVacationHours�е����ֵ�����Զ������Ϊ'Maximum Hour'��HumanResources.Employee��
SELECT MAX(VacationHours) AS 'Maximum Hour'
FROM HumanResources.Employee

-- 45. ����Employee����ʾVacationHours�е�Ψһֵ���ܺͣ����Զ������Ϊ'Sum Hours'��HumanResources.Employee��
SELECT SUM(DISTINCT(VacationHours)) AS 'Sum Hours'
FROM HumanResources.Employee

--------------------------------------------------------------------------------------------
-- �������� GROUP BY ... HAVING...;
--------------------------------------------------------------------------------------------

-- 46. ��ѯ�ݼ�ʱ�����80Сʱ��Ա����ְͬλ��������С�ݼ�ʱ�䣨HumanResources.Employee��
SELECT Title,Minimum = min(VacationHours),Maximun = max(VacationHours)
FROM HumanResources.Employee
WHERE VacationHours > 80 GROUP BY title
-- 47. ��ѯ�ݼ�ʱ�䳬��30Сʱ��Ա����ְͬλ��ƽ���ݼ�Сʱ��������ֻ��ʾƽ��ֵ����55Сʱ��ְλ��HumanResources.Employee��
SELECT Title,Avg_vacation_hours = avg(VacationHours)
FROM HumanResources.Employee
WHERE VacationHours > 30 GROUP BY title
Having avg(VacationHours) > 55
-- 48. GROUP BY�Ӿ��Ӧ�õ�����ֶ�
-- ��ѯEmployee����Title��ManagerID���飬��������Title��ManagerID���ݼ�ʱ����ƽ��ֵ��HumanResources.Employee��
SELECT Title,ManagerID,Avg_vacation_hours = avg(VacationHours)
FROM HumanResources.Employee
GROUP BY Title,ManagerID

-- 49. ��ѯTitleΪ'Recruiter'��'Stocker'��'Design Engineer'��Ա����Ϣ����Title���з��飬��ʾTitle��ÿ��ͷ�ε��ݼ�ʱ�����ܺ�
-- ����ʾ������������������¼����󣬰��ݼ�ʱ�����ܺͽ��е�������
SELECT Title,Avg_vacation_hours = sum(VacationHours)
FROM HumanResources.Employee
WHERE Title IN ('Recruiter','Stocker','Design Engineer')
GROUP BY ALL Title
ORDER BY SUM(VacationHours)DESC
-- 50. GROOUPING SETS
--������EmpTable(Ա����),�����������,Ա������,����,����,����

CREATE TABLE EmpTable 
( 
      EmpName nchar(3), 
      Region nvarchar(5), 
      Department nvarchar(10), 
      Salary money 
)

--��EmpTable���в������м�¼
INSERT INTO EmpTable VALUES
(N'���',N'ɽ��',N'��Ϣ������',20000),
(N'����',N'�㶫',N'��Ϣ������',30000),
(N'����',N'ɽ��',N'������Դ��',25000),
(N'����',N'�㶫',N'������Դ��',40000),
(N'����',N'�ӱ�',N'��Ϣ������',50000),
(N'����',N'ɽ��',N'��Ϣ������',50000)

SELECT *
FROM EmpTable;
--����������ѯԱ���Ĺ����ܺͣ�����ֻ��ʾ�����ܺʹ���50000������

SELECT Region,sum(Salary) as 'Sum_Salary'
FROM EmpTable
GROUP BY Region
HAVING sum(Salary) > 50000

-- �������Ͳ��ŷ����ѯԱ����ƽ������
SELECT Region,Department,avg(Salary) as 'Avg_Salary'
FROM EmpTable
GROUP BY Region,Department

-- �����������ѯԱ����ƽ������
SELECT Region,avg(Salary) as 'Avg_Salary'
FROM EmpTable
GROUP BY Region

-- �����ŷ����ѯԱ����ƽ������
SELECT Region,avg(Salary) as 'Avg_Salary'
FROM EmpTable
GROUP BY Region
-- ʹ��GROUPING SET�Ӿ䣬��һ��������в鿴��������������ѯ�Ľ��
SELECT Region,Department,AVG(Salary) AverageSalary
FROM EmpTable
GROUP BY
GROUPING SETS
(
(Region,Department),(Region),(Department)
)

-- 51. ROLLUP
--����������ʷ�����������У�Ա����ţ�������ݺ����۽��
CREATE TABLE SalesHistory 
(
	EmployeeID int,
	YearOfSale int,
	SalesAmount money
)

INSERT INTO SalesHistory VALUES  --��SalesHistory���в���������¼
(101,2007,120000),
(101,2008,140000),
(101,2009,250000),
(102,2007,150000),
(102,2008,120000),
(102,2009,110000),
(103,2007,105000),
(103,2008,180000),
(103,2009,160000),
(104,2007,170000),
(104,2008,120000),
(104,2009,150000)

SELECT * FROM SalesHistory

-- ��ѯ����ÿ����Ա׬ȡ�����۶��ܺ�
-- ���Ҳ�ѯ���й�Ա׬ȡ�����۶��ܺ�
SELECT EmployeeID,YearOfSale,SUM(SalesAmount) AS SalesAmount
FROM SalesHistory
GROUP BY ROLLUP(EmployeeID,YearOfSale)

-- 52. CUBE
-- ����SalesHistory���е��������ɱ��档���ɵı���Ӧ��ʾ���й�Ա����������۶���������۶������ÿ����Ա׬ȡ�������۶�
-- ��ҪӦ�����¾ۺϣ�
-- ÿ������۶��ܺ�
-- ��������۶��ܺ�
-- ����ÿ����Ա�����۶��ܺ�
SELECT EmployeeID,YearOfSale,SUM(SalesAmount) AS SalesAmount
FROM SalesHistory
GROUP BY CUBE(EmployeeID,YearOfSale)


--------------------------------------------------------------------------------------------
-- ��������
--------------------------------------------------------------------------------------------

-- ����Emp_SalesData��(Ա���������ݱ�)
CREATE TABLE Emp_SalesData
(
Year int not null, --��һ��,�������,��������Ϊ��������
Month tinyint not null, --�ڶ���,�����·ݣ���������Ϊ΢������
ProductID char(2) not null, --�����У����۲�Ʒ��ţ���������Ϊchar(2)
Amount int not null --�����У����۽���������Ϊ����
)

INSERT INTO Emp_SalesData VALUES
(2012,2,'P1',20000),
(2012,2,'P2',12000),
(2012,3,'P1',15000),
(2012,3,'P2',8000),
(2012,4,'P1',12000),
(2012,4,'P2',14000),
(2012,5,'P3',14000)

--�鿴�������м�¼
SELECT * FROM Emp_SalesData

-- 56. ͬʱ��һ����ʾ�������۶���������۶�
SELECT MONTH,SUM(Amount) AS TotalSale,lead(sum(amount),1)
OVER(ORDER BY MONTH) AS Next_Month_Sales
FROM Emp_SalesData
GROUP BY MONTH
ORDER BY MONTH

-- 57. ͬʱ��һ����ʾ�������۶�ͱ������۶�
SELECT MONTH,SUM(Amount) AS TotalSale,lag(sum(amount),1)
OVER(ORDER BY MONTH) AS Previous_Month_Sales
FROM Emp_SalesData
GROUP BY MONTH
ORDER BY MONTH

-- 58. �鿴ÿ����Ʒ��һ�����۵��·ݣ����������¼���еĵ�һ��ֵ

SELECT DISTINCT ProductID,FIRST_VALUE(Month) OVER (PARTITION BY ProductID ORDER BY MONTH) AS 'FirstMonthCollection'
FROM Emp_SalesData
-- 59. �鿴ÿ����Ʒ���һ�����۵��·ݣ����������¼���е����һ��ֵ
SELECT DISTINCT ProductID,LAST_VALUE(Month) OVER (PARTITION BY ProductID ORDER BY MONTH ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) AS 'RecentMonthCollection'
FROM Emp_SalesData

--------------------------------------------------------------------------------------------
CREATE TABLE WeekIncome
(
	Week NCHAR(3),
	Income DECIMAL
)
INSERT WeekIncome VALUES (N'����һ',1000)
INSERT WeekIncome VALUES (N'���ڶ�',2000)
INSERT WeekIncome VALUES (N'������',3000)
INSERT WeekIncome VALUES (N'������',4000)
INSERT WeekIncome VALUES (N'������',5000)
INSERT WeekIncome VALUES (N'������',6000)
INSERT WeekIncome VALUES (N'������',7000)

SELECT * FROM WeekIncome

SELECT [����һ], [���ڶ�], [������],[������], [������], [������], [������] INTO WeekIncomePivot
FROM WeekIncome
PIVOT
(
	SUM(Income)
	FOR Week IN ([����һ], [���ڶ�], [������], [������], [������], [������], [������])
) AS pvt

SELECT * FROM WeekIncomePivot
--------------------------------------------------------------------------------------------
-- 53. PIVOT

-- 54. UNPIVOT


--**********************************************************************************************
-- �2.3
--�ϰ���鿴��˾ÿ����Ʒ��ƽ���������������Ұ���Ʒ��Ž�������ʹ�ñ�Sales.SalesOrderDetail
--**********************************************************************************************
SELECT ProductID,avg(OrderQty) AS Avg_Qty
FROM Sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY ProductID desc