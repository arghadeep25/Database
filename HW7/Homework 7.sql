					---######### GEO DATABASE #########---
					 ---######### HOMEWORK 7 #########---
					  ---##### ARGHADEEP MAZUMDER #####---
						---##### 378554 #####---

/*TABLE 1*/

CREATE TABLE geom1 (
gid integer,
id integer,
geom geometry
);

COPY geom1 FROM 'E:\TU Berlin\3rd Semester\Geo Database\Exercise\Exercise 10\geom1.csv'
DELIMITER ';'
CSV HEADER;

SELECT * FROM  geom1;

/*TABLE 2*/

CREATE TABLE geom2 (
gid integer,
id integer,
geom geometry
);

COPY geom2 FROM 'E:\TU Berlin\3rd Semester\Geo Database\Exercise\Exercise 10\geom2.csv'
DELIMITER ';'
CSV HEADER;

SELECT * FROM  geom2;

/*TABLE 3*/
CREATE TABLE geom3 (
gid integer,
id integer,
geom geometry
);

COPY geom3 FROM 'E:\TU Berlin\3rd Semester\Geo Database\Exercise\Exercise 10\geom3.csv'
DELIMITER ';'
CSV HEADER;

/*TABLE 4*/

CREATE TABLE geom4 (
gid integer,
id integer,
geom geometry
);

COPY geom4 FROM 'E:\TU Berlin\3rd Semester\Geo Database\Exercise\Exercise 10\geom4.csv'
DELIMITER ';'
CSV HEADER;

select * from geom4;

/* ################################################################################### */

/*H7.1 Select all intersections with geom1 and delete them*/

select inter1.id,inter2.id from geom1 inter1, geom1 inter2 where st_intersects(inter1.geom,inter2.geom) and inter1.id<inter2.id;
/*This only shows the intersection within geom1*/

delete from geom1 where geom1.geom=(select inter1.id,inter2.id from geom1 inter1, geom1 inter2 where st_intersects(inter1.geom,inter2.geom) and inter1.id<inter2.id);

/*This only shows the intersection within geom1 after deletion*/

/*7.2 Select all intersections with geom1 and delete them */

select inter2.id,inter1.id from geom2 inter2, geom1 inter1 where st_intersects(inter2.geom,inter1.geom) and inter2.id<inter1.id;

/*This only shows the intersection within geom2*/

delete from geom1 where geom2.geom=(select inter2.id,inter1.id from geom2 inter2, geom1 inter1 where st_intersects(inter2.geom,inter1.geom) and inter2.id<inter1.id;)

/*This only shows the intersection within geom2 after deletion*/

/*H7.3 Put all different geometries from geom2 into geom1*/

select geom from geom1
union select g2.geom as GG
from geom2 g2 left join geom1 g1 on g1.geom=g2.geom
where g1.geom is null;
