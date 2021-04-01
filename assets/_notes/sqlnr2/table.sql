DROP TABLE IF EXISTS DEPT ;
DROP TABLE IF EXISTS EMP ;
DROP TABLE IF EXISTS SALGRADE;


CREATE TABLE DEPT
(
  DEPTNO  NUMBER(2)                                 NULL,
  DNAME   VARCHAR2(14)                              NULL,
  LOC     VARCHAR2(13)                              NULL
);

ALTER TABLE DEPT ADD (
  CONSTRAINT PK_DEPT
 PRIMARY KEY
 (DEPTNO));

CREATE TABLE EMP
(
  EMPNO     NUMBER(4)                               NULL,
  ENAME     VARCHAR2(10)                            NULL,
  JOB       VARCHAR2(9)                             NULL,
  MGR       NUMBER(4)                               NULL,
  HIREDATE  DATE                                    NULL,
  SAL       NUMBER(7,2)                             NULL,
  COMM      NUMBER(7,2)                             NULL,
  DEPTNO    NUMBER(2)                               NULL
);




ALTER TABLE EMP ADD (
  CONSTRAINT PK_EMP
 PRIMARY KEY
 (EMPNO));

ALTER TABLE EMP ADD (
  CONSTRAINT FK_DEPTNO 
 FOREIGN KEY (DEPTNO) 
 REFERENCES DEPT (DEPTNO));
 
CREATE TABLE BONUS
(
  ENAME  VARCHAR2(10)                               NULL,
  JOB    VARCHAR2(9)                                NULL,
  SAL    NUMBER                                     NULL,
  PRIME  NUMBER                                     NULL
);

CREATE TABLE SALGRADE
(
  GRADE  NUMBER                                     NULL,
  LOSAL  NUMBER                                     NULL,
  HISAL  NUMBER                                     NULL
);

Insert into DEPT
   (DEPTNO, DNAME, LOC)
 Values
   (10, 'ACCOUNTING', 'NEW YORK');
Insert into DEPT
   (DEPTNO, DNAME, LOC)
 Values
   (20, 'RESEARCH', 'DALLAS');
Insert into DEPT
   (DEPTNO, DNAME, LOC)
 Values
   (30, 'SALES', 'CHICAGO');
Insert into DEPT
   (DEPTNO, DNAME, LOC)
 Values
   (40, 'OPERATIONS', 'BOSTON');
COMMIT;

Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
 Values
   (7369, 'SMITH', 'CLERK', 7902, 
    TO_DATE('12/17/1980 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 800, NULL, 20);
Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
 Values
   (7499, 'ALLEN', 'SALESMAN', 7698, 
    TO_DATE('02/20/1981 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 1600, 300, 30);
Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
 Values
   (7521, 'WARD', 'SALESMAN', 7698, 
    TO_DATE('02/22/1981 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 1250, 500, 30);
Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
 Values
   (7566, 'JONES', 'MANAGER', 7839, 
    TO_DATE('04/02/1981 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 2975, NULL, 20);
Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
 Values
   (7654, 'MARTIN', 'SALESMAN', 7698, 
    TO_DATE('09/28/1981 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 1250, 1400, 30);
Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
 Values
   (7698, 'BLAKE', 'MANAGER', 7839, 
    TO_DATE('05/01/1981 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 2850, NULL, 30);
Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
 Values
   (7782, 'CLARK', 'MANAGER', 7839, 
    TO_DATE('06/09/1981 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 2450, NULL, 10);
Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
 Values
   (7788, 'SCOTT', 'ANALYST', 7566, 
    TO_DATE('04/19/1987 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 3000, NULL, 20);
Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
 Values
   (7839, 'KING', 'PRESIDENT', NULL, 
    TO_DATE('11/17/1981 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 5000, NULL, 10);
Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
 Values
   (7844, 'TURNER', 'SALESMAN', 7698, 
    TO_DATE('09/08/1981 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 1500, 0, 30);
Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
 Values
   (7876, 'ADAMS', 'CLERK', 7788, 
    TO_DATE('05/23/1987 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 1100, NULL, 20);
Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
 Values
   (7900, 'JAMES', 'CLERK', 7698, 
    TO_DATE('12/03/1981 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 950, NULL, 30);
Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
 Values
   (7902, 'FORD', 'ANALYST', 7566, 
    TO_DATE('12/03/1981 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 3000, NULL, 20);
Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
 Values
   (7934, 'MILLER', 'CLERK', 7782, 
    TO_DATE('01/23/1982 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 1300, NULL, 10);
COMMIT;

Insert into SALGRADE
   (GRADE, LOSAL, HISAL)
 Values
   (1, 700, 1200);
Insert into SALGRADE
   (GRADE, LOSAL, HISAL)
 Values
   (2, 1201, 1400);
Insert into SALGRADE
   (GRADE, LOSAL, HISAL)
 Values
   (3, 1401, 2000);
Insert into SALGRADE
   (GRADE, LOSAL, HISAL)
 Values
   (4, 2001, 3000);
Insert into SALGRADE
   (GRADE, LOSAL, HISAL)
 Values
   (5, 3001, 9999);

COMMIT;