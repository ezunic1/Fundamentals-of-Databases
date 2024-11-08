-- 1.

SELECT e.first_name || ' ' || e.last_name ime, d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id;

-- 2.

SELECT DISTINCT j.job_title
FROM employees e, departments d, jobs j
WHERE d.department_id = e.department_id AND
      e.job_id = j.job_id  and
      d.department_id = 30;


-- 3.

SELECT e.first_name ime, d.department_id, l.city
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id AND
      d.location_id = l.location_id AND
      e.commission_pct IS NULL;

-- 4.
SELECT e.first_name ime, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id AND
      (e.first_name LIKE '%a%' or e.last_name LIKE '%a%');

-- 5.

SELECT e.first_name, j.job_title, e.phone_number, d.department_name
FROM employees e, departments d, jobs j, locations l
WHERE e.department_id = d.department_id  AND
      e.job_id = j.job_id AND
      d.location_id = l.location_id
      AND l.city IN ('Seattle');

-- 6.

SELECT e1.first_name "Ime zaposlenog", e2.first_name "Ime sefa", l.city
FROM employees e1, employees e2, locations l, departments d
WHERE e1.manager_id = e2.employee_id AND
      e2.department_id = d.department_id and
      d.location_id = l.location_id;

-- 7.

SELECT e1.first_name || ' ' || e1.last_name "Ime zaposlenog", e2.first_name "Ime sefa", l.city "Grad sefa"
FROM employees e1 LEFT OUTER JOIN  employees e2
     ON  e1.manager_id = e2.employee_id
     LEFT OUTER JOIN departments d
     ON d.department_id = e2.department_id
     LEFT OUTER JOIN locations l
     ON d.location_id = l.location_id;

-- 8.

SELECT e1.first_name || ' ' || e1.last_name "Ime zaposlenog", e1.department_id, e2.first_name || ' ' || e2.last_name "Ime kolege"
FROM employees e1 JOIN employees e2
     ON e1.department_id = e2.department_id
     WHERE e1.employee_id <> e2.employee_id;

-- 10.

SELECT e1.first_name  "Ime zaposlenog", e1.hire_date "Datum zaposlenja"
FROM employees e1, employees e2
WHERE e1.hire_date > e2.hire_date
      AND e2.first_name = 'Pat';

-- 11.

SELECT e.first_name  "Ime zaposlenog",
       e.hire_date "Datum zaposlenja",
       sef.first_name "Ime sefa",
       sef.hire_date "Datum zaposlenja sefa"
FROM employees e, employees sef
     WHERE e.manager_id = sef.employee_id
     AND e.hire_date < sef.hire_date;
