/* 
Join문법

1. 오라클 문법
	
	select  t1.ename t2.dname
			from emp t1, dept t2
			where t1.deptno t2.deptno

2. ansi join

	select t1.ename, t2.dname
			from emp t1[inner| outerfull]join dept t2 on t1.deptno = t2.deptno
*/
-- oracle join
select deptno, ename from emp;
select deptno, dname from dept;


-- 테이블 별칭
select e.ename, d.dname , e.deptno
	from emp e, dept d
where e.deptno = d.deptno;

--ansi join
 select ename, dname
	from emp join dept on emp.deptno = dept.deptno;
	
	select ename, dname
	from emp inner join dept on emp.deptno = dept.deptno;
	
	/*
	join 종류
	
	1.equi-join(등가조인), inner join
	2.outer join 
	3.full join 
	*/
	
	--a.equi-join
	-- 실습 student, professor에서 지도교수의 이름과 학생이름을 출력
	--oracle과 ansi join 각각 조회하기
	--학생명과 교수명만 출력해보기
	select * from professor;
	select * from student;
	select * from department;
	
	select pro.name, std.name;
	from professor pro, student std;
	where pro.profno = std.profno;
	
	select professor, student;
	from professor pro inner join student std
		on std.profno = std.profno;

select count(*) from student;

select pro.name 교수명 std.name


--실습2. student, professor, department에서 교수명, 학생명, 학과명을 출력
--표준 문법(where and), ansi(inner 2번) 각각

select s.name, d.name, p.name
from student s, department d, professor p 
 where s.profno=p.profno and p.deptno=d.deptno;
 
 select s.name 학생명, p.name 교수명, d.name 학과명
 from student s inner join professor p on s.profno = p.profno
								inner join 
								

-- outter-join
select count(*) from student;
select count(*) from student where profno is null;

-- 지도교수가 정해져 있지 않은 학생까지도 출력
-- 오라클에서만 사용되는 문법
--지도교수가 할당이 되지 않은 학생
select std.name 학생명, pro.name 교수명
	from student std, professor pro
	where std.profno = pro.profno(+);
-- 학생이 할당되지않은 지도교수까지
	select std.name 학생명, pro.name 교수명
	from student std, professor pro
	where std.profno(+) = pro.profno;
	
	
	--ansi
	select std.name 학생명, pro.name 교수명
	from student std  inner join professor pro
	 on std.profno = pro.profno;
	 
	 select std.name 학생명, pro.name 교수명
		from student std left outer join professor pro on std.profno = pro.profno;
		
--self join
select empno from emp;
select mgr from emp;

select emp.empno , emp.ename --사원
			,mgr.empno, mgr.ename --해당 사원의 매니져
	from emp emp, emp mgr
where emp. mgr = mgr.empno;
 
 -- ex01) student, department에서 학생이름, 학과번호, 1전공학과명출력
select * from student;
select * from department;
select std. name, std. deptno1, dpt.dname
 from student std, department dpt
 where std.deptno1 = dpt.deptno;

-- ex02) emp2, p_grade에서 현재 직급의 사원명, 직급, 현재 년봉, 해당직급의 하한
--       상한금액 출력 (천단위 ,로 구분)  

		select e.name, e.pay, p.s_pay, p.e_pay
					,to_char(e.pay,('999,9999,999'))
					,to_char(p.s_pay,('999,9999,999'))
					,to_char(p.e_pay,('999,9999,999'))
		 from  emp2 e, p_grade p
		 where e.position = p.position;
 
select * from emp2;
select * from p_grade;
    
-- ex03) emp2, p_grade에서 사원명, 나이, 직급, 예상직급(나이로 계산후 해당 나이의
--       직급), 나이는 오늘날자기준 trunc로 소수점이하 절삭 
select
		E.NAME NAME
	, 	TRUNC((SYSDATE - E.BIRTHDAY)/365) + 1  AGE
	, 	E.POSITION CURR_POSITION
	, 	PG.POSITION
FROM EMP2 E, P_GRADE PG
WHERE TRUNC((SYSDATE - E.BIRTHDAY)/365, 0) BETWEEN PG.S_AGE(+) AND PG.E_AGE(+)
ORDER BY AGE;

-- ex04) customer, gift 고객포인트보나 낮은 포인트의 상품중에 Notebook을 선택할
--       수 있는 고객명, 포인트, 상품명을 출력    
select * from  gift;
select * from customer;

select g.gname , c.gname ,c.point 
 from customer c LEFT JOIN  gift  g
ON C.POINT BETWEEN G.G_START AND G.G_END
WHERE G.GNAME = 'Notebook';

	
-- ex05) professor에서 교수번호, 교수명, 입사일, 자신보다 빠른 사람의 인원수
--       단, 입사일이 빠른 사람수를 오름차순으로
select * from PROFESSOR;
select p.profno, p.name, p.hiredate 
from professor p left join professor 
on profno, name, hiredate;

SELECT P.PROFNO, P.NAME, P.HIREDATE, P2.NAME AS "NAME2"
	FROM PROFESSOR p LEFT JOIN PROFESSOR p2 
	ON P.HIREDATE > P2.HIREDATE;


//student professor pfono 
select *
from student s left join;
 
-- ex06) emp에서 사원번호, 사원명, 입사일 자신보다 먼저 입사한 인원수를 출력
--       단, 입사일이 빠른 사람수를 오름차순 정렬
select e1.ename, count(e2.hiredate) "빠른사람",e1.empno, e1.hiredate
-- e1.의 별칭이 되는 컬럼들은 기준이 되는 테이블 e2.는 비교하는 대상의 컬럼 
from emp e1 left join emp e2 on e1.hiredate > e2.hiredate 
-- e1 테이블에 e2테이블을 대입 on= 비교될 조건 e1의 입사날짜가 e2보다 큰걸 비교 모르겠으면 결과보면됨
group by e1.ename, e1.hiredate, e1.empno;
--중복되는 것들을 묶는다. 왜? 많잖아 우리가 봐야할건 사원번호 사원명 입사일을 비교하기때문에 전부 그룹화 해준다.








	