--------------------------------------------------------------------------------------------
-- 字符串函数
--------------------------------------------------------------------------------------------

-- 1. 返回'A'的ASCII码
SELECT ascii('A')
-- 2. 返回ASCII码值是65的字符
SELECT char(65)
--比较两个字符串的相似度
SELECT DIFFERENCE('hello','h')

-- 3. 返回字符串'RICHARD'从左开始的4个字符
SELECT left('RICHARD',4)

-- 4. 返回字符串'RICHARD'从右开始的4个字符
SELECT right('RICHARD',4)

-- 5. 返回字符串'RICHARD'中字符的个数
SELECT len('RICHARD')

-- 6. 删除字符串'  RICHARD'开头的空格
SELECT LTRIM('  RICHARD')

-- 7. 删除字符串'RICHARD  '结尾的空格
SELECT RTRIM('RICHARD  ')

-- 8. 将字符串'ACTION'中的字符按反方向排列，即返回'NOITCA'
SELECT REVERSE('ACTION')

-- 9. 返回字符串'Weather'从第二个字符开始的两个字符
SELECT SUBSTRING('Weather',2,2)

-- 10. 将字符串'RICHARD'转换为小写
SELECT LOWER('RICHARD')
-- 11. 将字符串'richard'转换为大写
SELECT UPPER('richard')
-- 12. 将字符串'Richard'和'Hill'连接为一个字符串
SELECT CONCAT('Richard','Hill')

-- 13. 从Department表检索Name、DepartmentID和GroupName列，Name列的值以大写形式显示，该列的标题自定义为Department Name（HumanResources.Department）
SELECT Upper(Name) as 'Department Name',DepartmentID,GroupName 
FROM HumanResources.Department
--Upper(Name)  from HumanResources.Department

-- 14. 从Contact表检索名字和EmailAddress列
-- 名字以Mr.G.Achong的形式显示，其中Mr.为Title列的值，G为FirstName的第一个字符，Achong为LastName列的值
-- 即并置（连接）Title列、FirstName列的第一个字符和LastName，名字列的标题自定义为Name（Person.Contact）
SELECT Title + LEFT(FirstName,1)+ '.' + LastName as 'Name' 
FROM Person.Contact
--------------------------------------------------------------------------------------------
-- 转换函数:将数据从一个类型转换为另一个类型
--------------------------------------------------------------------------------------------

-- 15. 将字符串'2009-01-09'转换为datetime2类型
SELECT PARSE('2009-01-09' as datetime2)

-- 16. 将Employee表中的HireDate从日期数据类型转换为字符数据类型（HumanResources.Employee）
SELECT CONVERT(varchar,HireDate,2) 
FROM HumanResources.Employee
--------------------------------------------------------------------------------------------
-- 日期函数
--------------------------------------------------------------------------------------------

-- 17. 返回当前的日期和时间
SELECT GETDATE()

-- 18. 在2009-04-01日期上加3个月
SELECT DATEADD(MM,3,'2009-04-04')

-- 19. 返回日期'2005-06-06'和日期'2009-01-01'相差几年
SELECT DATEDIFF(YEAR,'2005-06-06','2009-01-01')
r
-- 20. 返回日期'2005-6-06'的月份，返回值为字符串
SELECT DATENAME(MONTH,'2005-6-06')

-- 21. 返回日期'2009-09-01'的月份，返回值为数值
SELECT DATENAME(month,convert(varchar,'2009-09-01'))

-- 22. 检索Employee表中的Title、入职年份，其中入职年份从HireDate属性中获取，并将该列的标题定制为'Year of Joining'(HumanResources.Employee)
SELECT Title,DATEPART(YY,HireDate) as 'Year of Joining' 
From HumanResources.Employee

-- 23. 检索Employee表中的EmployeeID和入职日期，其中入职日期从HireDate属性中获取，日期以“June, 2015”形式显示，并将该列的标题定制为'Joining'(HumanResources.Employee)
SELECT EmployeeID,DATENAME(mm,hiredate)+','+ CONVERT(varchar,datepart(yyyy,Hiredate)) as 'Joining'
FROM HumanResources.Employee
--------------------------------------------------------------------------------------------
-- 数学函数
--------------------------------------------------------------------------------------------
-- 24. 返回-87的绝对值
SELECT ABS(-87)
-- 25. 返回大于14.45的最小整数
SELECT CEILING(14.45)

-- 26. 返回小于14.45的最大整数
SELECT FLOOR(14.45)

-- 27. 返回4的3次方
SELECT POWER(4,3)

-- 28. 四舍五入15.789，精确到小数点后两位
SELECT ROUND(15.789,2)

-- 29. 查询EmployeePayHistory表中的EmployeeID和Rate，将Rate属性值四舍五入，精确到小数点后两位，并将该列的标题名定制为'Hourly Pay Rate'(HumanResources.EmployeePayHistory)
SELECT EmployeeID,ROUND(Rate,2) as 'Hourly Pay Rate'
FROM HumanResources.EmployeePayHistory

--------------------------------------------------------------------------------------------
-- 逻辑函数
--------------------------------------------------------------------------------------------

-- 30. 从值列表'Trigger', 'Procedure', 'Index'中返回第一个值'Trigger'
SELECT CHOOSE(1,'Trigger', 'Procedure', 'Index')

-- 31. 使用IIF函数，boolean_expression为5>7，true_value为'True'， false_value为'False'
SELECT IIF(5>7,'True','False')

-- 32. 查询EmployeeDepartmentHistory表中的EmployeeID和工作状态，工作状态根据EndDate属性是否为空值显示
-- EndDate为空值显示'在职'，EndDate不为空显示'离职'，该列的标题定制为'工作状态'(HumanResources.EmployeeDepartmentHistory)
SELECT EmployeeID,F(EndDate IS NULL,N'在职',N'离职') as N'工作状态'
FROM HumanResources.EmployeeDepartmentHistory

--------------------------------------------------------------------------------------------
-- 排名函数
--------------------------------------------------------------------------------------------

-- 33. 检索EmployeePayHistory表的EmployeeID、Rate属性，按Rate属性值降序排列，并显示排名，Rate值相同的排名值不同（HumanResources.EmployeePayHistory）
SELECT EmployeeID,Rate,ROW_NUMBER() OVER(order by rate desc) AS RANK
FROM HumanResources.EmployeePayHistory


-- 34. 检索EmployeePayHistory表的EmployeeID、Rate属性，按Rate属性值降序排列，并显示排名，Rate值相同的排名值相同，但整体的排名不连续（HumanResources.EmployeePayHistory）
SELECT EmployeeID,Rate,RANK() OVER(order by rate desc) AS RANK
FROM HumanResources.EmployeePayHistory

-- 35. 检索EmployeePayHistory表的EmployeeID、Rate属性，按Rate属性值降序排列，并显示排名，Rate值相同的排名值相同，整体的排名连续（HumanResources.EmployeePayHistory）
SELECT EmployeeID,Rate,DENSE_RANK() OVER(order by rate desc) AS RANK
FROM HumanResources.EmployeePayHistory

-- 36. 检索2001年4月后入职的雇员的EmployeeID、BirthDate、HireDate信息，将这些雇员分成4组，然后根据他们的入职日期排名（HumanResources.Employee）
SELECT EmployeeID,BirthDate,HireDate,NTILE(4) OVER(ORDER BY BirthDate) AS RANK
FROM HumanResources.Employee
WHERE DATEPART(MM,HireDate) >= 04 AND DATEPART(YY,HireDate) >= 2001

--------------------------------------------------------------------------------------------
-- 系统函数
--------------------------------------------------------------------------------------------

-- 37. 查看登陆终端的主机ID
SELECT HOST_ID()

-- 38. 返回客户机进程的当前主机名
SELECT HOST_NAME()

-- 39. 返回'AdventureWorks'数据库的标识号
SELECT DB_ID('AdventureWorks')

-- 40. 返回数据库名称
SELECT DB_NAME()

--**********************************************************************************************
--活动2.2：
--老板想看一下职位为Marketing Manager 和 Marketing Specialist的员工的编号、婚姻状态、年龄，
--其中婚姻状态S显示为'单身',M显示为'已婚', 最终结果按照员工编号升序排序 （HumanResources.Employee）
--**********************************************************************************************
SELECT EmployeeID,IIF(MaritalStatus = 'M',N'已婚',N'单身') AS 'MaritalStatus',Age = 2015 - DATEPART(yy,BirthDate) 
FROM HumanResources.Employee

--------------------------------------------------------------------------------------------
-- 聚合函数
--------------------------------------------------------------------------------------------
-- 41. 检索Employee表的VacationHours列，显示VacationHours列的平均值，并自定义标题为'Average Hours'（HumanResources.Employee）
SELECT AVG(VacationHours) AS 'Average Hours'
FROM HumanResources.Employee

-- 42. 检索Employee表，显示Title列共有多少个职位，并自定义标题为'职位数量'（HumanResources.Employee）
SELECT COUNT(Title) AS N'职位数量'
FROM HumanResources.Employee

-- 43. 检索Employee表，显示VacationHours列的最小值，并自定义标题为'Minimum Hour'（HumanResources.Employee）
SELECT MIN(VacationHours) AS 'Minimum Hour'
FROM HumanResources.Employee

-- 44. 检索Employee表，显示VacationHours列的最大值，并自定义标题为'Maximum Hour'（HumanResources.Employee）
SELECT MAX(VacationHours) AS 'Maximum Hour'
FROM HumanResources.Employee

-- 45. 检索Employee表，显示VacationHours列的唯一值的总和，并自定义标题为'Sum Hours'（HumanResources.Employee）
SELECT SUM(DISTINCT(VacationHours)) AS 'Sum Hours'
FROM HumanResources.Employee

--------------------------------------------------------------------------------------------
-- 分组数据 GROUP BY ... HAVING...;
--------------------------------------------------------------------------------------------

-- 46. 查询休假时间大于80小时的员工不同职位的最大和最小休假时间（HumanResources.Employee）
SELECT Title,Minimum = min(VacationHours),Maximun = max(VacationHours)
FROM HumanResources.Employee
WHERE VacationHours > 80 GROUP BY title
-- 47. 查询休假时间超过30小时的员工不同职位的平均休假小时数，并且只显示平均值超过55小时的职位（HumanResources.Employee）
SELECT Title,Avg_vacation_hours = avg(VacationHours)
FROM HumanResources.Employee
WHERE VacationHours > 30 GROUP BY title
Having avg(VacationHours) > 55
-- 48. GROUP BY子句可应用到多个字段
-- 查询Employee表，按Title和ManagerID分组，检索所有Title、ManagerID和休假时数的平均值（HumanResources.Employee）
SELECT Title,ManagerID,Avg_vacation_hours = avg(VacationHours)
FROM HumanResources.Employee
GROUP BY Title,ManagerID

-- 49. 查询Title为'Recruiter'或'Stocker'或'Design Engineer'的员工信息，按Title进行分组，显示Title和每个头衔的休假时数的总和
-- 并显示不满足条件的其他记录，最后，按休假时数的总和进行倒序排序。
SELECT Title,Avg_vacation_hours = sum(VacationHours)
FROM HumanResources.Employee
WHERE Title IN ('Recruiter','Stocker','Design Engineer')
GROUP BY ALL Title
ORDER BY SUM(VacationHours)DESC
-- 50. GROOUPING SETS
--创建表EmpTable(员工表),里面包含四列,员工姓名,地区,部门,工资

CREATE TABLE EmpTable 
( 
      EmpName nchar(3), 
      Region nvarchar(5), 
      Department nvarchar(10), 
      Salary money 
)

--向EmpTable表中插入六行记录
INSERT INTO EmpTable VALUES
(N'李刚',N'山东',N'信息技术部',20000),
(N'赵云',N'广东',N'信息技术部',30000),
(N'周宇',N'山东',N'人力资源部',25000),
(N'李想',N'广东',N'人力资源部',40000),
(N'张涛',N'河北',N'信息技术部',50000),
(N'梁浩',N'山东',N'信息技术部',50000)

SELECT *
FROM EmpTable;
--按区域分组查询员工的工资总和，并且只显示工资总和大于50000的区域

SELECT Region,sum(Salary) as 'Sum_Salary'
FROM EmpTable
GROUP BY Region
HAVING sum(Salary) > 50000

-- 按地区和部门分组查询员工的平均工资
SELECT Region,Department,avg(Salary) as 'Avg_Salary'
FROM EmpTable
GROUP BY Region,Department

-- 按地区分组查询员工的平均工资
SELECT Region,avg(Salary) as 'Avg_Salary'
FROM EmpTable
GROUP BY Region

-- 按部门分组查询员工的平均工资
SELECT Region,avg(Salary) as 'Avg_Salary'
FROM EmpTable
GROUP BY Region
-- 使用GROUPING SET子句，在一个结果集中查看所有以上三个查询的结果
SELECT Region,Department,AVG(Salary) AverageSalary
FROM EmpTable
GROUP BY
GROUPING SETS
(
(Region,Department),(Region),(Department)
)

-- 51. ROLLUP
--创建销售历史表，表中有三列，员工编号，销售年份和销售金额
CREATE TABLE SalesHistory 
(
	EmployeeID int,
	YearOfSale int,
	SalesAmount money
)

INSERT INTO SalesHistory VALUES  --向SalesHistory表中插入六条记录
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

-- 查询往年每个雇员赚取的销售额总和
-- 并且查询所有雇员赚取的销售额总和
SELECT EmployeeID,YearOfSale,SUM(SalesAmount) AS SalesAmount
FROM SalesHistory
GROUP BY ROLLUP(EmployeeID,YearOfSale)

-- 52. CUBE
-- 检索SalesHistory表中的数据生成报告。生成的报告应显示所有雇员的年度总销售额、往年总销售额和往年每个雇员赚取的总销售额
-- 需要应用以下聚合：
-- 每年的销售额总和
-- 往年的销售额总和
-- 往年每个雇员的销售额总和
SELECT EmployeeID,YearOfSale,SUM(SalesAmount) AS SalesAmount
FROM SalesHistory
GROUP BY CUBE(EmployeeID,YearOfSale)


--------------------------------------------------------------------------------------------
-- 分析函数
--------------------------------------------------------------------------------------------

-- 创建Emp_SalesData表(员工销售数据表)
CREATE TABLE Emp_SalesData
(
Year int not null, --第一列,销售年份,数据类型为整数类型
Month tinyint not null, --第二列,销售月份，数据类型为微型整数
ProductID char(2) not null, --第三列，销售产品编号，数据类型为char(2)
Amount int not null --第四列，销售金额，数据类型为整形
)

INSERT INTO Emp_SalesData VALUES
(2012,2,'P1',20000),
(2012,2,'P2',12000),
(2012,3,'P1',15000),
(2012,3,'P2',8000),
(2012,4,'P1',12000),
(2012,4,'P2',14000),
(2012,5,'P3',14000)

--查看表中所有记录
SELECT * FROM Emp_SalesData

-- 56. 同时在一行显示本月销售额和下月销售额
SELECT MONTH,SUM(Amount) AS TotalSale,lead(sum(amount),1)
OVER(ORDER BY MONTH) AS Next_Month_Sales
FROM Emp_SalesData
GROUP BY MONTH
ORDER BY MONTH

-- 57. 同时在一行显示上月销售额和本月销售额
SELECT MONTH,SUM(Amount) AS TotalSale,lag(sum(amount),1)
OVER(ORDER BY MONTH) AS Previous_Month_Sales
FROM Emp_SalesData
GROUP BY MONTH
ORDER BY MONTH

-- 58. 查看每个产品第一次销售的月份，返回有序记录集中的第一个值

SELECT DISTINCT ProductID,FIRST_VALUE(Month) OVER (PARTITION BY ProductID ORDER BY MONTH) AS 'FirstMonthCollection'
FROM Emp_SalesData
-- 59. 查看每个产品最后一次销售的月份，返回有序记录集中的最后一个值
SELECT DISTINCT ProductID,LAST_VALUE(Month) OVER (PARTITION BY ProductID ORDER BY MONTH ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) AS 'RecentMonthCollection'
FROM Emp_SalesData

--------------------------------------------------------------------------------------------
CREATE TABLE WeekIncome
(
	Week NCHAR(3),
	Income DECIMAL
)
INSERT WeekIncome VALUES (N'星期一',1000)
INSERT WeekIncome VALUES (N'星期二',2000)
INSERT WeekIncome VALUES (N'星期三',3000)
INSERT WeekIncome VALUES (N'星期四',4000)
INSERT WeekIncome VALUES (N'星期五',5000)
INSERT WeekIncome VALUES (N'星期六',6000)
INSERT WeekIncome VALUES (N'星期日',7000)

SELECT * FROM WeekIncome

SELECT [星期一], [星期二], [星期三],[星期四], [星期五], [星期六], [星期日] INTO WeekIncomePivot
FROM WeekIncome
PIVOT
(
	SUM(Income)
	FOR Week IN ([星期一], [星期二], [星期三], [星期四], [星期五], [星期六], [星期日])
) AS pvt

SELECT * FROM WeekIncomePivot
--------------------------------------------------------------------------------------------
-- 53. PIVOT

-- 54. UNPIVOT


--**********************************************************************************************
-- 活动2.3
--老板想查看公司每个产品的平均订购数量，并且按产品编号降序排序，使用表Sales.SalesOrderDetail
--**********************************************************************************************
SELECT ProductID,avg(OrderQty) AS Avg_Qty
FROM Sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY ProductID desc