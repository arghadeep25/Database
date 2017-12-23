					---######### GEO DATABASE #########---
					 ---######### HOMEWORK 4 #########---
					  ---##### ARGHADEEP MAZUMDER #####---
						---##### 378554 #####---

/* H4.1 Adding a new student without specifying it’s given name and name makes no sense. To avoid this, alter
table students_2016*/


ALTER TABLE tbl_students ALTER COLUMN firstname SET NOT NULL; 
ALTER TABLE tbl_students ALTER COLUMN lastname SET NOT NULL; 

SELECT * FROM tbl_students;

/*For checking*/

INSERT INTO tbl_students(gender, age, country, nbc, hobbies, bachelor, specialization)
VALUES ('M','26','India','New Delhi','photography','Electrical','CV' );

/*H4.2 In your table students_2016 you can put any character in the row gender. Restrict this possibility and
ensure that only f or m are allowed as valid input if you add a new student(Constraint)*/

ALTER TABLE tbl_students ADD CONSTRAINT g_gender CHECK (gender = 'm' AND gender = 'f');

/*Chechking*/
INSERT INTO tbl_students(gender, lastname, firstname, age, country, nbc, hobbies, bachelor, specialization)
VALUES ('P','Mazumder','Arghadeep','26','India','California','photography','Electrical','CV' );


/*H4.3 Make sure, that the age of the student’s is between 17 and 60 years*/

ALTER TABLE tbl_students ADD CONSTRAINT b_age CHECK (age >= 17 AND age <= 60);
	
/*Chechking*/
INSERT INTO tbl_students(gender, lastname, firstname, age, country, nbc, hobbies, bachelor, specialization)
VALUES ('P','Mazumder','Arghadeep','72','India','California','photography','Electrical','CV' );

/*H4.4 Select most often practiced hobbies and list them dependent on students’ nationality*/

SELECT country, hobbies, 
COUNT (hobbies)
AS hobbycount
FROM tbl_students
GROUP BY country, hobbies
ORDER BY hobbycount DESC;


/*H4.5 Create a table HOBBIES where you copy all the hobbies of the students (from table students_2016)
into this new table and make sure that you afterwards still can connect the hobbies to the right person.
Therefore, you can change the table students_2016 the way you need it.*/

CREATE TABLE hobby(
id_hobby serial,
lastname VARCHAR(100),      /*New Table Creation*/
firstname VARCHAR(100),
hobby VARCHAR(50)
);

INSERT INTO hobby(hobby)
SELECT tbl_students.hobbies from tbl_students;


update hobby set lastname = 'Kalpakis' where id_hobby = (select country_id from tbl_students where country_id = '1');
update hobby set lastname = 'Zhihao' where id_hobby = (select country_id from tbl_students where country_id = '2');
update hobby set lastname = 'Wissing' where id_hobby = (select country_id from tbl_students where country_id = '3');
update hobby set lastname = 'Marjolijn' where id_hobby = (select country_id from tbl_students where country_id = '4');
update hobby set lastname = 'Harris' where id_hobby = (select country_id from tbl_students where country_id = '5');
update hobby set lastname = 'Sabeen' where id_hobby = (select country_id from tbl_students where country_id = '6');
update hobby set lastname = 'Jakstat' where id_hobby = (select country_id from tbl_students where country_id = '7');
update hobby set lastname = 'Schmuck' where id_hobby = (select country_id from tbl_students where country_id = '8');
update hobby set lastname = 'Bernardes' where id_hobby = (select country_id from tbl_students where country_id = '9');
update hobby set lastname = 'Hosseinahmadi' where id_hobby = (select country_id from tbl_students where country_id = '10');
update hobby set lastname = 'Rahman' where id_hobby = (select country_id from tbl_students where country_id = '11');
update hobby set lastname = 'Goddard' where id_hobby = (select country_id from tbl_students where country_id = '12');
update hobby set lastname = 'papaefthimiou' where id_hobby = (select country_id from tbl_students where country_id = '13');
update hobby set lastname = 'Sahoo' where id_hobby = (select country_id from tbl_students where country_id = '14');
update hobby set lastname = 'Lutherborrow' where id_hobby = (select country_id from tbl_students where country_id = '15');
update hobby set lastname = 'Gkolias' where id_hobby = (select country_id from tbl_students where country_id = '16');
update hobby set lastname = 'Schulz' where id_hobby = (select country_id from tbl_students where country_id = '17');
update hobby set lastname = 'Hamad' where id_hobby = (select country_id from tbl_students where country_id = '18');
update hobby set lastname = 'Isawi' where id_hobby = (select country_id from tbl_students where country_id = '19');
update hobby set lastname = 'Tamakloe' where id_hobby = (select country_id from tbl_students where country_id = '20');
update hobby set lastname = 'Wojuade' where id_hobby = (select country_id from tbl_students where country_id = '21');
update hobby set lastname = 'Awais' where id_hobby = (select country_id from tbl_students where country_id = '22');
update hobby set lastname = 'Hasnain' where id_hobby = (select country_id from tbl_students where country_id = '23');
update hobby set lastname = 'Kuehnel' where id_hobby = (select country_id from tbl_students where country_id = '24');
update hobby set lastname = 'Wallace' where id_hobby = (select country_id from tbl_students where country_id = '25');
update hobby set lastname = 'Shirotova' where id_hobby = (select country_id from tbl_students where country_id = '26');
update hobby set lastname = 'Abbasi' where id_hobby = (select country_id from tbl_students where country_id = '27');
update hobby set lastname = 'Mazumder' where id_hobby = (select country_id from tbl_students where country_id = '28');

/*For testing*/

update hobby set lastname = 'Batman' where id_hobby = (select country_id from tbl_students where country_id = '53');

SELECT * FROM hobby;