					---######### GEO DATABASE #########---
					 ---######### HOMEWORK 2 #########---
					  ---##### ARGHADEEP MAZUMDER #####---
						---##### 378554 #####---

/* H2.1 CREATE A NEW TABLE COUNTRY CONTAINING THE ATTRBUTES: ID_COUNTRY, COUNTRY, CAPITAL(E.G. 1, 'GHANA','ACCRA' )*/


CREATE TABLE country_tbl(
id_country serial, ---Auto update of Country ID is done by using the code seial---
country character(100), ---Table for female students has been created
capital character(100)
);


/* H2.2 TRANSFER THE CONTENT OF THE COLUMN COUNTRY FROM STUDENTS_16 INTO THE NEW TABLE AND FILL THE CORRESPONDING COLUMNS. AVOID REDUNDANT DATA*/

insert into country_tbl(country) ---Countries from tbl_students are inserted into new table country_tbl
select tbl_students.country from tbl_students;

update country_tbl set capital='New Delhi' where country='India';
update country_tbl set capital='Athens' where country='Greece';
update country_tbl set capital='Berlin' where country='Germany';
update country_tbl set capital='Sydney' where country='Australia';
update country_tbl set capital='Dhaka' where country='Bangladesh';
update country_tbl set capital='Islamabad' where country='Pakistan';
update country_tbl set capital='Amsterdam' where country='Netherlands';
update country_tbl set capital='Tehran' where country='Iran';
update country_tbl set capital='London' where country='UK';
update country_tbl set capital='Ottawa' where country='Canada';
update country_tbl set capital='Abuja' where country='Nigeria';
update country_tbl set capital='Accra' where country='Ghana';
update country_tbl set capital='Moscow' where country='Russia';
update country_tbl set capital='Baghdad' where country='Iraq';
update country_tbl set capital='Lisbon' where country='Portugal';
update country_tbl set capital='Beijing' where country='China';

select * from country_tbl
order by id_country asc;


/*H2.3 TO DEFINE A UNIQUE IDENTIFIER CREATE A NEW DATABASE OBJECT(SEQUENCE) FOR GENERATING UNIQUE NUMBERS, AND USE THEM AS NEW ID-VALUES AS FOLLOWS*/

CREATE SEQUENCE country_seq INCREMENT BY 1 ---- A new sequence named country_seq is created---
START WITH 1 MINVALUE 1 CACHE 100;

/*But to generate the sequence I have already used 'serial' above during creation of the table. So the new sequence 'country_seq' is further not required.


/*H2.4 CHANGE THE SCHEMA OF TABLE STUDENTS_16 BY ADDING A NEW ATTRIBUTE NAMED COUNTRY_ID. */
/* ESTABLISH THE RELATIONSHIP OF BOTH TABLES REFRENCING ID_COUNTRY AND COUNTRY_ID. */

ALTER TABLE tbl_students
ADD country_id serial; /*New column in the table 'tbl_students' is created */

SELECT * 
FROM country_tbl, tbl_students
where id_country=country_id;


/*H2.5 IS THE COLUMN COUNTRY IN STUDENTS_16 STILL NECESSARY? EXPLAIN YOUR ANSWER */

/*To check whether we need the coulmn country is required or not, a new table is created without the coulmn country*/

CREATE TABLE public.exp_tbl_students
(
  gender varchar(100),
  lastname varchar(100),
  firstname varchar(100),
  age integer,
  nbc varchar(100), 		/*A new table is created*/
  hobbies varchar(100),
  bachelor varchar(100),
  specialization varchar(100),
  country_id serial
);

/*The data from tbl_students are copied to the new table exp_tbl_students*/
insert into exp_tbl_students(gender, lastname, firstname, age, nbc, hobbies, bachelor, specialization, country_id) 
select tbl_students.gender, tbl_students.lastname, tbl_students.firstname, tbl_students.age, tbl_students.nbc, tbl_students.hobbies, tbl_students.bachelor, tbl_students.specialization, tbl_students.country_id  from tbl_students;

select * from exp_tbl_students;

/*joining both the tables to check whether the coulmn country in exp_tbl_students are required or not*/
SELECT * 
FROM country_tbl, exp_tbl_students
where id_country=country_id;
/*So, from the above result it is confirmed that the column country is not required in the new table exp_tbl_students. */