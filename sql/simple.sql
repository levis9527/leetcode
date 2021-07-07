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

