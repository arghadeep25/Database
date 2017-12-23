/* Geo Database Exercise 8 - LITTLE FARM */

/*First, I need to make sure, that there are no tables with the same name*/
Drop Table if exists point;
Drop Table if exists polygon;
Drop Table if exists line;


/*Now we can start creating our tables*/

CREATE TABLE polygon(
id_poly integer PRIMARY KEY,
name character(20),
geom geometry
);

CREATE TABLE point(
id_point integer PRIMARY KEY,
name character(20),
geom geometry
);

CREATE TABLE line(
id_line integer PRIMARY KEY,
name character(20),
geom geometry
);


/*Insert some data into the tables*/
------------------------------------

INSERT INTO polygon values (1, 'paddock', ST_BuildArea
(ST_Collect(
	('POLYGON((3 3, 30 1, 32 28, 5 32, 3 3))'),
	('POLYGON((6 24, 7 25, 7 27, 8 28, 9 29, 10 29, 11 29, 12 28, 13 28, 13 27, 14 26, 14 25, 13 24,12 23, 11 22, 10 21, 8 22, 7 23 ,6 24))')
)));

INSERT INTO polygon values (2, 'pond', ST_BuildArea
(ST_Collect(
	('POLYGON((6 24, 7 23, 8 22,10 21,11 22,12 23,13 24,14 25, 14 26, 13 27,13 28,12 28,11 29,10 29,9 29,8 28,7 27,7 25,6 24))'),
	('POLYGON((9 23, 9 26, 12 26, 11 24, 9 23))')
)));

INSERT INTO polygon values (3, 'building', ST_GeomFromText ('POLYGON((22 3, 28 3, 28 11, 22 11, 22 3))'));
INSERT INTO polygon values (4, 'island', ST_GeomFromText ('POLYGON((9 23, 11 24, 12 26, 9 26, 9 23))'));



INSERT INTO point values (1, 'dog1' , ST_GeomFromText ('POINT (10 8)'));
INSERT INTO point values (2, 'dog2' , ST_GeomFromText ('POINT (15 4)'));
INSERT INTO point values (3, 'horse1' , ST_GeomFromText ('POINT (16 12)'));
INSERT INTO point values (4, 'horse2' , ST_GeomFromText ('POINT (18 22)'));
INSERT INTO point values (5, 'horse3' , ST_GeomFromText ('POINT (23 27)'));
INSERT INTO point values (6, 'horse4' , ST_GeomFromText ('POINT (24 9)'));
INSERT INTO point values (7, 'cow1' , ST_GeomFromText ('POINT (9 16)'));
INSERT INTO point values (8, 'cow2' , ST_GeomFromText ('POINT (25 5)'));
INSERT INTO point values (9, 'cow3' , ST_GeomFromText ('POINT (26 7)'));
INSERT INTO point values (10, 'donkey1' , ST_GeomFromText ('POINT (10 25)'));
INSERT INTO point values (11, 'donkey2' , ST_GeomFromText ('POINT (29 24)'));
INSERT INTO point values (12, 'donkey3' , ST_GeomFromText ('POINT (23 19)'));
INSERT INTO point values (13, 'fox' , ST_GeomFromText ('POINT (27 14)'));


INSERT INTO line values (1, 'bridge', ST_GeomFromText ('LINESTRING (11 24, 12 23)'));









