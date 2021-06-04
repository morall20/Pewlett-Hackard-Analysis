--- Deliverable 1 - Query 1 
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO retirement_titles
From employees e
INNER JOIN titles ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31');

--- Deliverable 1 - Query 2
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles rt
ORDER BY rt.emp_no, rt.to_date DESC;

--- Deliverable 1 - Query 3
SELECT COUNT(ut.title), ut.title
INTO retiring_titles
FROM unique_titles ut
GROUP BY ut.title
ORDER BY COUNT DESC;

--- Deliverable 2 - Query 1
SELECT DISTINCT ON (e.emp_no) e.emp_no,
    e.first_name,
	e.last_name,
    e.birth_date,
	de.from_date,
	de.to_date,
    ti.title
INTO mentorship_eligibilty
FROM employees e
INNER JOIN dept_emp de
ON (e.emp_no = de.emp_no)
INNER JOIN titles ti
ON (e.emp_no = ti.emp_no)
WHERE (de.to_date = '9999-01-01') AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;



