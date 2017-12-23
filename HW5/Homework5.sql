					---######### GEO DATABASE #########---
					 ---######### HOMEWORK 2 #########---
					  ---##### ARGHADEEP MAZUMDER #####---
						---##### 378554 #####---

/*H5.1*/

CREATE TABLE hobbies(
id_student serial,
hobby1 VARCHAR(100),
hobby2 VARCHAR(100),
hobby3 VARCHAR(100)
);


/*5.2*/

INSERT INTO hobbies(hobby1, hobby2, hobby3)
SELECT split_part(hobbies,',',1) AS hobby1,
split_part(hobbies,',',2) AS hobby2,
split_part(hobbies,',',3) AS hobby3

FROM tbl_students;

SELECT * FROM hobbies;

/*5.3*/

SELECT hobby1,
COUNT(hobby1)
AS hobbyCount
FROM hobbies
GROUP BY hobby1
ORDER BY hobbycount DESC;

SELECT hobby2,
COUNT(hobby2)
AS hobbyCount2
FROM hobbies
GROUP BY hobby2
ORDER BY hobbycount2 DESC;

SELECT hobby3,
COUNT(hobby3)
AS hobbycount3
FROM hobbies 
WHERE hobby3 != ''
GROUP BY hobby3
ORDER BY hobbycount3 DESC;





