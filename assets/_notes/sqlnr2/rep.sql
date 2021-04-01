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