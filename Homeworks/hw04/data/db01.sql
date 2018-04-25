

/*---------------------------------------
1. Simple SELECTS (on the parents table)
----------------------------------------*/

CREATE TABLE parents (
     parent VARCHAR(20),
     child VARCHAR(20));
INSERT INTO parents (parent, child)
VALUES ("abraham", "barack") 		UNION
VALUES ("abraham", "clinton")		UNION
VALUES ("delano", "herbert")		UNION
VALUES  ("fillmore",   "abraham")   UNION
VALUES ("fillmore",   "delano")		UNION
VALUES ("fillmore",   "grover")		UNION
VALUES ("eisenhower", "fillmore");
/*
--Q1
SELECT * FROM  parents;

--Q2
SELECT child, parent FROM parents
WHERE parent="abraham";

--Q3
SELECT child FROM parents
WHERE child LIKE '%e%';

--Q4
SELECT DISTINCT parent FROM parents
ORDER BY parent DESC;

--Q5
SELECT a.child, b.child 
    FROM parents a, parents b
    WHERE a.parent = b.parent 
    AND a.child < b.child;

*/
/*---------------------------------------
2. JOINS
---------------------------------------*/

CREATE TABLE dogs AS
	SELECT "abraham" AS name, "long" AS fur UNION
	SELECT "barack", "short"      			UNION
	SELECT "clinton", "long"        		UNION
	SELECT "delano", "long"        			UNION
	SELECT "eisenhower", "short"       		UNION
	SELECT "fillmore", "curly"       		UNION
	SELECT "grover", "short"       			UNION
	SELECT "herbert", "curly";
 /*
 --Q1
SELECT COUNT(*)
FROM dogs
WHERE fur="curly";

--Q2
SELECT parents.parent as parent
FROM parents JOIN dogs
ON child = name
WHERE dogs.fur='curly';


--Q3
SELECT a.parent, b.child
    FROM 
    	(SELECT parents.parent, dogs.fur
    	FROM parents LEFT JOIN dogs
    	ON parents.parent = dogs.name) as a, 
    	(SELECT parents.child, parents.parent, dogs.fur
		FROM parents JOIN dogs
		ON parents.child = dogs.name) as b
	WHERE a.parent = b.parent
	AND a.fur = b.fur
	GROUP BY a.parent;
*/

/*----------------------------------------------------
3. Aggregate functions, numerical logic and grouping
-----------------------------------------------------*/

CREATE TABLE animals AS
    SELECT "dog" AS kind, 4 AS legs, 20 AS weight 	UNION
    SELECT "cat" , 4 , 10 						  	UNION
    SELECT "ferret" , 4 , 10 						UNION
    SELECT "parrot" , 2 , 6							UNION
    SELECT "penguin" , 2 , 10 						UNION
    SELECT "t-rex" , 2 , 12000;
/*
--Q1
SELECT kind, MIN(weight) FROM animals;

--Q2
SELECT AVG(legs), AVG(weight) from animals;

--Q3
SELECT kind FROM animals
WHERE legs > 2
AND weight < 20;

--Q4
SELECT AVG(weight) FROM animals
GROUP BY legs;
*/



