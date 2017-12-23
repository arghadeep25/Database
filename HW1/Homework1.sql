
					---######### GEO DATABASE #########---
					 ---######### HOMEWORK 1 #########---

--- H1.1 CALCULATE HOW MANY FEMALE AND HOW MANY MALE STUDENTS ARE LISTED----

SELECT GENDER, 
COUNT(GENDER) as STUDENTS
FROM tbl_students
GROUP BY GENDER;

--- H1.2 CALCULATE HOW MANT STUDENTS  ARE FROM A CERTAIN COUNTRY. USE THE NUMBER AS FIRST  AND THE COUNTRY  AS SECOND ALPHABETIC SORT CRITERIA---

SELECT COUNTRY, 
COUNT(COUNTRY) as STUDENTS 
FROM tbl_students
GROUP BY COUNTRY 
ORDER BY STUDENTS DESC;

--- H1.3 ADD A NEW STUDENT NOT LISTED IN THE TABLE---

INSERT INTO tbl_students(gender, lastname, firstname, age, country, nbc, hobbies, bachelor, specialization)
VALUES ('M','Mazumder','Arghadeep','26','India','California','photography','Electrical','CV' );


--- H1.4 CHANGE THE NAME OF THIS NEW STUDENT INTO "MUSTERMANN"---

UPDATE tbl_students
SET lastname='MUSTERMANN'
WHERE lastname='Mazumder'

--- H1.5 CREATE TWO NEW TABLES - ONE CALLED f_stduetns AND A SECOND ONE CALLED m_students. THE ATTRIBUTES IN BOTH ARE LASTNAME, FIRSTNAME, COUNTRY 
----AND CITY. NOW INSERT THE FEMALE STUDENTS FROM THE TABLE IN f_students AND THE MALE STUDENTS FROM THE TABLE TO THE m_students

CREATE TABLE f_students(
lastName VARCHAR(100) NOT NULL,
Firstname VARCHAR(100) NOT NULL, ---Table for female students has been created
Country VARCHAR(100) NOT NULL,
CITY VARCHAR(100) NOT NULL
);
CREATE TABLE m_students(
lastName VARCHAR2(100) NOT NULL,
Firstname VARCHAR(100),   	---Table for male students has been created
Country VARCHAR(100),
CITY VARCHAR(100)
);
INSERT INTO f_students(
SELECT lastname, firstname, country, nbc ---Data for female students from original table has been copied to the female students table
FROM tbl_students
WHERE GENDER='f'
);
INSERT INTO m_students(
SELECT lastname, firstname, country, nbc ---Data for male students from original table has been copied to the male students table
FROM tbl_students
WHERE GENDER='m'
);
--- H1.6 SELECT ALL STUDENTS WHICH LIKE TO PLAY FOOTBALL OR READING. WHAT RESULT DO YOU GET AND WHY DO YOU GET IT? 
-------WHICH SOLUTION DO YOU SUGGEST TO GET THE DESIRED RESULT?---

SELECT * 
FROM tbl_students           ----In this case, only football and reading are displaying. But the characters where both of them are included are 
WHERE HOBBIES ='football'   ---- not shwoing
OR HOBBIES ='reading';

---To show the characters where we have to display both of them from the string, 'Like' function has been used to overcome the above problem.
SELECT *
FROM tbl_students
WHERE HOBBIES::text LIKE 'football%'
OR HOBBIES::text LIKE 'reading';

