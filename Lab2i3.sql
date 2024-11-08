-- 1.
SELECT first_name AS ime, salary AS plata
FROM employees
WHERE salary > 2456;

--2.
SELECT first_name AS ime, department_id AS "Sifra odjela."
FROM employees
WHERE employee_id = 102;

--3.
SELECT first_name, salary
FROM employees
WHERE salary > 2345 or salary < 1000;

--4.
SELECT first_name || ' ' || last_name AS Zaposleni,
      job_id,
      hire_date
FROM employees
WHERE hire_date > To_Date('11012005', 'ddmmyyyy')
  AND hire_date < To_Date('22022007', 'ddmmyyyy');

--5.

SELECT first_name, department_id
FROM employees
WHERE department_id = 30 OR department_id = 10
ORDER BY last_name ASC;

--6.

SELECT salary AS "Mjesecna plata",
       first_name AS "Ime zaposlenog",
       last_name AS "Prezime zaposlenog",
       commission_pct AS "Dodatak na platu"
FROM employees
WHERE salary > 1500 AND (department_id = 10 OR department_id = 30);


--7.

SELECT first_name
FROM employees
WHERE  hire_date < To_Date('31122005', 'ddmmyyyy');

--8.

SELECT first_name, salary, job_id, manager_id
FROM employees
WHERE manager_id IS NULL;

--9.

SELECT first_name, salary, commission_pct * salary AS "Dodatak"
FROM employees
WHERE commission_pct IS NOT NULL
ORDER BY salary DESC, commission_pct DESC;

--10.

SELECT first_name || ' ' || last_name AS ime
FROM employees
WHERE first_name like '%l%l%'
      OR last_name LIKE '%l%l%'
      OR first_name LIKE '%l%' AND last_name LIKE '%l%';

--11.

SELECT first_name, salary, commission_pct * salary
FROM employees
WHERE (commission_pct * salary) > (salary - salary * 0.8);