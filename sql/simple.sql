-- 181. 超过经理收入的员工
SELECT
    e.NAME AS Employee
FROM
    Employee e
    LEFT JOIN Employee m ON ( e.ManagerId = m.Id ) 
WHERE
    e.Salary > m.Salary

-- 182. 查找重复的电子邮箱
SELECT 
    Email 
FROM 
    Person 
GROUP BY Email   
HAVING
    COUNT(Email) > 1

-- 183. 从不订购的客户
SELECT 
    c.Name AS Customers 
FROM
    Customers c
    LEFT JOIN Orders o ON (c.Id = o.CustomerId)
WHERE
    o.Id IS NULL
-- 另一种方案 not in
SELECT 
    c.Name AS Customers   
FROM
    Customers c
WHERE NOT EXISTS (
    SELECT 1 FROM Orders o WHERE o.CustomerId = c.Id
) 

-- 196. 删除重复的电子邮箱
DELETE 
FROM
    Person 
WHERE
    id NOT IN (
    SELECT
        * 
FROM
    ( SELECT MIN(id) FROM Person GROUP BY Email ) t)

-- 197. 上升的温度
SELECT
    w.id 
FROM
    Weather w
    LEFT JOIN Weather yesterday ON (
    yesterday.recordDate = date_sub( w.recordDate, INTERVAL 1 DAY )) 
WHERE
    w.temperature > yesterday.temperature

-- 595. 大的国家
select name, population, area 
from World 
where population > 25000000 or area > 3000000

-- 596. 超过5名学生的课
select class 
from courses 
group by class
HAVING
    COUNT(distinct student ) >= 5

-- 620. 有趣的电影
select * from cinema 
where id % 2 = 1 and description <> 'boring'
order by rating desc

-- 627. 变更性别
update salary 
set sex = if(sex='m', 'f', 'm')

-- 1179. 重新格式化部门表
select id,
MIN(if(month = 'Jan', revenue, null)) AS Jan_Revenue,
MIN(if(month = 'Feb', revenue, null)) AS Feb_Revenue,
MIN(if(month = 'Mar', revenue, null)) AS Mar_Revenue,
MIN(if(month = 'Apr', revenue, null)) AS Apr_Revenue,
MIN(if(month = 'May', revenue, null)) AS May_Revenue,
MIN(if(month = 'Jun', revenue, null)) AS Jun_Revenue,
MIN(if(month = 'Jul', revenue, null)) AS Jul_Revenue,
MIN(if(month = 'Aug', revenue, null)) AS Aug_Revenue,
MIN(if(month = 'Sep', revenue, null)) AS Sep_Revenue,
MIN(if(month = 'Oct', revenue, null)) AS Oct_Revenue,
MIN(if(month = 'Nov', revenue, null)) AS Nov_Revenue,
MIN(if(month = 'Dec', revenue, null)) AS Dec_Revenue
from Department
group by id
