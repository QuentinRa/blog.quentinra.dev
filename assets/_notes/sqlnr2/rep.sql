SELECT count(*) from emp
                         JOIN dept d on emp.DEPTNO = d.DEPTNO
GROUP BY d.DEPTNO
ORDER BY d.DEPTNO
LIMIT 0,1;

SELECT d.DEPTNO, MIN(SAL) from emp JOIN dept d on emp.DEPTNO = d.DEPTNO
GROUP BY d.DEPTNO;

SELECT d.DEPTNO from emp JOIN dept d on emp.DEPTNO = d.DEPTNO
GROUP BY d.DEPTNO
ORDER BY count(*)
LIMIT 0,1;

-- vérification
SELECT d.DEPTNO, count(*) from emp JOIN dept d on emp.DEPTNO = d.DEPTNO
GROUP BY d.DEPTNO
ORDER BY count(*);

SELECT CONCAT(emp.ENAME, ' gagne ', emp.SAL, ' euros par mois, mais souhaite '
           , emp.SAL * 3, 'euros.') as 'Salaire souhaité'
FROM emp;

SELECT (emp.ENAME || ' gagne ' || emp.SAL || ' euros par mois, mais souhaite '
    || emp.SAL * 3 || 'euros.') as 'Salaire souhaité'
FROM emp;

SELECT ENAME, HIREDATE, DAYNAME(HIREDATE) as "jour" FROM emp
ORDER BY 3 DESC;

SELECT ENAME as "Employé",
       (SELECT ENAME from emp WHERE EMPNO=e.MGR)
             as "Chef"
FROM emp e;

SELECT JOB, DEPTNO, sum(DEPTNO='10' SAL), avg(ALL SAL) FROM emp
GROUP BY JOB, DEPTNO
ORDER BY JOB, DEPTNO;

SELECT DECODE_ORACLE(
               DEPTNO, 10, 'DEP10', 20, 'DEP20', 30, 'DEP30'
           ) as "DEP" FROM emp;

SELECT deptno AS 'Département'
FROM DEPT d
WHERE NOT EXISTS ( SELECT NULL FROM EMP where DEPTNO=d.DEPTNO) ;