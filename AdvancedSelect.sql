# Occupations
# Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath its corresponding Occupation. The output should consist of four columns (Doctor, Professor, Singer, and Actor) in that specific order, with their respective names listed alphabetically under each column.

#Note: Print NULL when there are no more names corresponding to an occupation.

WITH rankedNames AS (
    SELECT Name, Occupation, ROW_NUMBER() OVER (PARTITION BY Occupation ORDER BY Name) row_num
    FROM Occupations)
SELECT Doctor, Professor, Singer, Actor
FROM rankedNames
PIVOT(MAX(name) FOR Occupation in (Doctor, Professor, Singer, Actor)) AS Pivottable
ORDER BY row_num;

# Binary Three nodes

# You are given a table, BST, containing two columns: N and P, where N represents the value of a node in Binary Tree, and P is the parent of N.

# Write a query to find the node type of Binary Tree ordered by the value of the node. Output one of the following for each node:

# Root: If node is root node.
# Leaf: If node is leaf node.
# Inner: If node is neither root nor leaf node.

WITH typesBase AS (
    SELECT bst.n AS nodes, bst.p AS root, l.p AS leaf
    FROM bst LEFT JOIN bst l ON bst.n = l.p)
    
SELECT DISTINCT(nodes), "NodeTypes" = CASE
    WHEN leaf is NULL THEN "Leaf"
    WHEN root is NULL THEN "Root"
    ELSE "Inner"
    END
FROM typesBase ORDER BY nodes;

# Challenge called New Companies

#NOTE this challenge asks that the code is submitted in a single line

# Given the table schemas below, write a query to print the company_code, founder name, total number of lead managers, total number of senior managers, total number of managers, and total number of employees. Order your output by ascending company_code.

# Input Format
# The following tables contain company data:
#   Company: The company_code is the code of the company and founder is the founder of the company.
#   Lead_Manager: The lead_manager_code is the code of the lead manager, and the company_code is the code of the working company.
#   Senior_Manager: The senior_manager_code is the code of the senior manager, the lead_manager_code is the code of its lead manager, and the company_code is the code of the working company.
#   Manager: The manager_code is the code of the manager, the senior_manager_code is the code of its senior manager, the lead_manager_code is the code of its lead manager, and the company_code is the code of the working company.
#   Employee: The employee_code is the code of the employee, the manager_code is the code of its manager, the senior_manager_code is the code of its senior manager, the lead_manager_code is the code of its lead manager, and the company_code is the code of the working company.

SELECT flsm.code, flsm.founder, flsm.lead, flsm.senior, flsm.manager, COUNT(DISTINCT employee.employee_code) FROM (SELECT fls.code, fls.founder, fls.lead, fls.senior, COUNT(DISTINCT manager.manager_code) manager FROM (SELECT fl.code, fl.founder, fl.lead, COUNT(DISTINCT senior.senior_manager_code) senior FROM (SELECT founder.company_code code, founder.founder founder, COUNT(DISTINCT lead.lead_manager_code) lead FROM company founder LEFT JOIN lead_manager lead ON founder.company_code = lead.company_code GROUP BY founder.company_code, founder.founder) fl LEFT JOIN senior_manager senior ON fl.code = senior.company_code GROUP BY fl.code, fl.founder, fl.lead) fls LEFT JOIN manager ON fls.code = manager.company_code GROUP BY fls.code, fls.founder, fls.lead, fls.senior) flsm LEFT JOIN employee ON flsm.code = employee.company_code GROUP BY flsm.code, flsm.founder, flsm.lead, flsm.senior, flsm.manager ORDER BY flsm.code;