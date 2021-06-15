CREATE TABLE  SAILORS
(
SID INT,
SNAME VARCHAR(10),
RATING INT,
AGE INT
);
INSERT INTO SAILORS VALUES
(22,'DUSTIN',7,45),(29,'BRUTAS',1,33),(31,'LUBBER',8,55),
(32,'ANDY',8,25),(58,'RUSTY',10,35),(64,'HORATIO',7,35),
(71,'ZORBA',10,16),(74,'HORATIO',9,35),(85,'ART',3,26),
(95,'BOB',3,64);
DESCRIBE SAILORS;
SELECT *FROM SAILORS;
CREATE TABLE BOAT
(
BID INT,
BNAME VARCHAR(10),
COLOR VARCHAR(8)
);
INSERT INTO BOAT VALUES  (101,'INTERLAKE','BLUE'),
(102,'INTERLAKE','RED'),(103,'CLIPPER','GREEN'),(104,'MARINE','RED');
DESCRIBE BOAT;
SELECT *FROM BOAT;
CREATE TABLE RESERVES (
SID INT,
BID INT,
DAY date
);
INSERT INTO RESERVES VALUES(22,101,"1998-10-10"),(22,102,"1998-10-10"),(22,103,"1998-08-10"),(22,104,"1998-07-10"),
(31,102,"1998-10-11"),(31,103,"1998-06-11"),(31,104,"1998-12-11"),(64,101,"1998-05-09"),(64,102,"1998-08-09"),(74,103,"1998-08-09");
DESCRIBE  RESERVES ;
SELECT *FROM  RESERVES ;
SELECT SNAME,AGE FROM SAILORS;
 SELECT *  FROM SAILORS,
   RESERVES
  WHERE sailors.sid = reserves.sid
 AND bid  = 101;
 SELECT sname FROM SAILORS WHERE rating > 7;
 SELECT sname FROM SAILORS,
 RESERVES,
 BOAT
 WHERE boat.bid = 103
 AND boat.bid   = reserves.bid
 AND sailors.sid = reserves.sid
SELECT DISTINCT sname FROM SAILORS,
RESERVES,
BOAT
WHERE color     = 'Red'
AND boat.bid   = reserves.bid
AND sailors.sid = reserves.sid;
SELECT DISTINCT sname FROM SAILORS,
      RESERVES,
      BOAT
    WHERE ( color   = 'Red'
    OR color        = 'Green')
    AND boat.bid   = reserves.bid
    AND sailors.sid = reserves.sid;
   SELECT DISTINCT color FROM SAILORS,
      RESERVES,
      BOAT
    WHERE sname     = 'Lubber'
    AND boat.bid   = reserves.bid
    AND sailors.sid = reserves.sid;
     SELECT DISTINCT sname FROM SAILORS,
      RESERVES,
      BOAT
    WHERE color     = 'Red'
    AND boat.bid   = reserves.bid
    AND sailors.sid = reserves.sid
    INTERSECT
    SELECT DISTINCT sname FROM SAILORS,
     RESERVES,
     BOAT
   WHERE color     = 'Green'
   AND boat.bid   = reserves.bid
   AND sailors.sid = reserves.sid;
   SELECT DISTINCT sname
    FROM SAILORS,
      RESERVES
    WHERE reserves.sid = sailors.sid;
SELECT sname,
reserves.sid
FROM RESERVES,
SAILORS
WHERE sailors.sid = reserves.sid
GROUP BY DAY,
reserves.sid,
sname
HAVING COUNT(DAY)>1 ;
 SELECT sname,
age
FROM SAILORS
WHERE age =
(SELECT MIN(age) FROM sailors) ;
SELECT sname
FROM SAILORS
WHERE rating >
(SELECT MAX(rating) FROM SAILORS WHERE sname = 'Horatio');
 SELECT sname,sid FROM(SELECT sname,reserves.sid,COUNT(bid) AS id
      FROM RESERVES,
        SAILORS
      WHERE reserves.sid = sailors.sid
     GROUP BY reserves.SID,
       sname
     ) a
    WHERE id =( SELECT COUNT(bid) FROM BOAT);
    SELECT COUNT(c.sname)
   FROM (SELECT DISTINCT sname FROM Sailors) c;
COUNT(C.SNAME)
SELECT AVG(age) FROM SAILORS;
AVG(AGE)
 SELECT rating,AVG(age) FROM SAILORS GROUP BY 
    rating;
    
SELECT a.rating,
b.mean
FROM
(SELECT COUNT(sname) AS num,
rating
FROM SAILORS
GROUP BY rating
HAVING COUNT(sname)>1
) a, 
(SELECT rating,AVG(age) AS mean FROM SAILORS GROUP BY rating ) b
WHERE a.rating = b.rating;













