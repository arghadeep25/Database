					 ---######### GEO DATABASE #########---
					 ---######### HOMEWORK 6 #########---
					  ---##### ARGHADEEP MAZUMDER #####---
						---##### 378554 #####---

/*H6.1*/

SELECT STATE, ST_Area(geom) FROM STATES;

/*H6.2*/

SELECT SUM(ST_Area(geom)) FROM STATES;

/*H6.3*/

SELECT SUM(ST_Length(geom)) FROM HIGHWAY;