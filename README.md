# Pewlett-Hackard-Analysis
## Overview of the analysis

## Resources
Data Files: departments.csv, dept_emp.csv, employees.csv, retirement_titles.csv, dept_manager.csv, titles.csv, unique_titles.csv
Software: postgresql, pgadmin 4 v.5.2, visual studio code v 1.56.2

## Project Overview 
The manager for Pewlett-Hackard (PH) has given you two more assignments: determine the number of retiring employees per title, and identify employees who are eligible to participate in a mentorship program.

## Results from Analysis:
In order to accomplish PH request I was given multiple csv data files that were populated with the PH employee records. I then imported those data files into a pgadmin 4 database and used postgresql to query the data to create, filter, and summarize the data. Here are my results.

1. I first created a "Retirement Titles table" that held all the titles of current employees who were born between January 1, 1952 and December 31, 1955.

2. Then to ensure that I didn't have duplicate records for employee's who got promoted throughout the years and held multiple titles I narrow down the data further by using the DISTINCT ON query. Ensuring that I only captured the lasted held title for each employee. Once that query complete I placed the results in a new table called retiring_titles.

3. Once I was confident I had all the personnel retiring at PH I created another query that summariaze numerically the number of personnel due to retire by there title/seniority.

My finally task was to create a Mentorship Eligibility table that holds the employees who are eligible to participate in a mentorship program.

1. PH specified the only personnel quailified to particpate in the mentorship program had to the born between January 1, 1965 and December 31, 1965.  

2. So I produced the following query to grab field data from 3 separate tables "employee, dept_emp, and titles" then filtering the data to ensure that the query only returned data from still active employees representd by the value "9999-01-01" in to_date field and were born between the dates specified by PH.

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
WHERE (de.to_date = '9999-01-01') AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-
ORDER BY e.emp_no;

3. When the query completed it created a new data table called mentorship_elgibility.

## Summary: 

Pewlett Hackard has nearly 30% of its workforce near retirement age. PH will need to begin a mass hiring campainge or consider restructuring its organization. Developing a mentorship program is a good way to renew the workforce with new blood and energy.

Retiring Employees

As should be expected the biggest hits will come from the senior position across the board especially in the engineering and staff positions.

Thankfully PH still has an ample amount of employees still qualified to train up the new wave of future employees in the mentorship program.

Mentors Available