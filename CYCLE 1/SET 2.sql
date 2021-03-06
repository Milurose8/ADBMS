CREATE TABLE STUDENT
(
sid INT,
sname VARCHAR(25),
dob VARCHAR(12),
physics INT,
chemistry INT,
math INT
);
DESCRIBE STUDENT;
INSERT INTO STUDENT(sid,sname,dob,physics,chemistry,math)
VALUES(1,'RIYA','08-07-1999',80,88,86),
(2,'ROSMIN','08-07-1997',60,75,86),
(3,'RIZWIN','11-07-1994',20,81,20),
(4,'SEBIN','21-11-1999',70,88,86),
(5,'VEENETH','09-08-1999',50,68,76);
SELECT * FROM STUDENT WHERE math>=40 and (physics>=40 or chemistry >=40);
SELECT sname FROM STUDENT WHERE chemistry=(SELECT min(chemistry) FROM STUDENT);
SELECT sname FROM STUDENT WHERE math=(SELECT max(math) FROM STUDENT);
SELECT sid,sname FROM STUDENT WHERE dob=(SELECT max(dob)from STUDENT);
ALTER TABLE STUDENT ADD total int;
ALTER TABLE STUDENT ADD average float(10,3);
DESCRIBE STUDENT;
UPDATE STUDENT SET
total=physics+chemistry+math;
SELECT * FROM  STUDENT;
UPDATE STUDENT SET
average=total/3;
SELECT * FROM STUDENT;
SELECT * FROM STUDENT ORDER BY total DESC;
ALTER TABLE STUDENT RENAME COLUMN average TO avg_mark;
SELECT * FROM STUDENT;
SELECT * FROM STUDENT WHERE avg_mark >(SELECT AVG(avg_mark) FROM STUDENT);
SELECT COUNT(*) FROM STUDENT WHERE AVG_MARK > (SELECT AVG(AVG_MARK) FROM STUDENT);