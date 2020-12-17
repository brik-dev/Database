-- == Homework from lesson 4 == --
-- 1. Создать VIEW на основе запросов, которые вы сделали в ДЗ к уроку 3
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `number_employees` AS
    SELECT 
        `dp`.`dept_name` AS `dept_name`,
        COUNT(`de`.`emp_no`) AS `emp_number`
    FROM
        (`departments` `dp`
        JOIN `dept_emp` `de` ON (((`de`.`dept_no` = `dp`.`dept_no`)
            AND (`de`.`to_date` = '9999-01-01'))))
    GROUP BY `dp`.`dept_name`
    
SELECT * from number_employees;
    
-- 2. Создать функцию, которая найдет менеджера по имени и фамилии
USE `employees`;
DROP function IF EXISTS `get_manager_no`;

USE `employees`;
DROP function IF EXISTS `employees`.`get_manager_no`;
;

DELIMITER $$
USE `employees`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `get_manager_no`(first_name varchar(150), last_name varchar(150)) RETURNS int
    DETERMINISTIC
BEGIN
DECLARE emp_no INT;
SELECT 
    dm.emp_no
INTO emp_no FROM
    employees e
	JOIN dept_emp de 
        ON e.emp_no = de.emp_no
        AND de.to_date = '9999-01-01'
	JOIN dept_manager dm 
		ON de.emp_no = dm.emp_no
        AND dm.to_date = '9999-01-01'
		AND e.first_name = first_name
        AND e.last_name = last_name;
RETURN emp_no;
END$$

DELIMITER ;
;

SELECT get_manager_no ('Margareta', 'Markovitch') as emp_no;

-- 3. Создать триггер, который при добавлении нового сотрудника будет выплачивать ему вступительный бонус, занося запись об этом в таблицу salary.

DROP TRIGGER IF EXISTS `employees`.`employees_BEFORE_INSERT`;

DELIMITER $$
USE `employees`$$
CREATE DEFINER = CURRENT_USER TRIGGER `employees`.`employees_BEFORE_INSERT` BEFORE INSERT ON `employees` FOR EACH ROW
BEGIN
INSERT INTO salaries
		SET emp_no = NEW.emp_no, salary = 10000, from_date = CURDATE(), to_date = '9999-01-01';
END$$
DELIMITER ;


