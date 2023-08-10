/*
view란 

view란 하나의 가상의 테이블이다.
view에는 실제 데이터가 존재하지 않고 view를 통해서 데이터만 조회할 수 있다.
view는 복잡한 query를 통해 조회할 수 있는 결과를 사전에 정의한 view를 통해
간단히 조회할 수 있다.
한개의 view로 여러 개의 table데이터를 검색할 수 있게 한다.
특정 기준에 따라 사용자별로 다른 조회 결과를 얻을 수 있게 한다.

제한 조건

테이블에 not null로 만든 컬럼들이 view에 포함되어야 한다.
view를 통해서도 데이터를 insert할 수 있다. 단, rowid, rownum, nextval, cuval등과
같은 가상의 컬럼에 대해 참조하고 있을 경우에 가능하다.
with read only옵션으로 설정된 view는 어떠한 데이터를 갱신할 수 없다.
with check option을 설정한 view는 view조건에 대항되는 데이터맘 삽입, 삭제, 수정 할 수 있다.

문법

create [or replace] [force|no force]view 뷰이름 as
sub query ....
with read only
with check option

or replace : 동일 이름의 view가 존재할 경우 삭제후 다시 생성(대체)
force|no force : 테이블의 존재유무와 상관없이 view를 생성할지 여부
with read only : 조회만 가능한 view
with check option : 주어진 check옵션 즉, 제약조건에 맞는 데이터만 입력하거나 수정가능


view 조회방법

테이블과 동일한 문법으로 사용

select * form 뷰이름

view를 생성 할 수 있는 권한 부여하기

사용자권한조회 : select * from user_role_privs;
권한 부여방법 : sysdba에 권한으로 부여 가능
grant create view to scott(사용자명 or )

*/



select * from emp;

create or replace view v_emp as
select ename, job, deptno from emp;

-- create view 권한 부여하기 
--grant connect, resource to scott;
grant create view to scott;

-- 권한 조회하기
select * from user_role_privs;

--  단순 view 생성하기

create or replace view v_emp as
select ename, job, deptno from emp;

select * from v_emp;

-- 사용자 view목록 조회하기
select * from user_views;

select * from emp;
select * from dept;

--복합뷰
create or replace view v_emp_dname as
select emp.ename, dpt.dname, emp.deptno
from  emp emp,  dept dpt 
where emp.deptno = dpt.deptno;

--실습 급여정보(sal, comm)가 포함된 view
--예) 급여조회권한이 있는 담당자만 사용할 수 있는 view

create or replace view v_emp_sal as
select empno "사원번호"
			,ename "사원이름"
			,job   "직급"
			,sal 	 "급여"
			,nvl(comm,0)  커미션
		from emp;
		
select * from v_emp_sal;
select * from v_emp_sal where job = 'CLERK'; 
select * from v_emp_sal where "직급" = 'CLERK';
select * from v_emp_sal where  "사원이름" = 'SMITH';

select *
	from (select * empno 사원번호
			,ename 사원이름
			,job   직급
			,sal 	 급여
			,nvl(comm,0)  커미션
		from emp)
where job = 'CLERK';

--table과 view의 join?
select emp.deptno, v_emp.*
	from emp emp, emp_v_emp_sal v_emp
where emp.empno = v_emp.사원번호;

select * from v test;

--실습 emp에서 부서번호 dept에서 dname , v_emp_sal와 join
--사원번호, 사원이름, 부서명 , 직급 ,급여
select * from V_EMP_SAL;
select * from emp; --deptno
select * from dept;--deptno

select emp.deptno, dpt.dname, sal.*
	from emp emp, dept dpt, v_emp_sal sal
	where emp.deptno = dpt.deptno and emp.empno = sal. "사원번호";
	
	create or replace view v_test2 as;
	
-- inline view
--제약사항: 하나의 컬럼만 정의가능
select emp.ename
			,dpt. dname
		from emp emp
		  ,dept dpt
where demp.deptno = dpt.deptno;

select emp.ename
			,(select deptno, dname from dept dpt where emp.deptno = dpt.deptno)
		from emp emp; --에러 too many value
	
	select emp.ename
			,(select dname from dept dpt where emp.deptno = dpt.deptno) "부서번호"
		from emp emp; 
		
	select emp.ename
				, dpt.dname 부서번호
			from emp emp
				,(select deptno, dname from dept dpt) dpt
			where emp.deptno = dpt.deptno;
			
--view 삭제
drop view v_test2;
select * from user_views;

--emp와 dept를 조회 : 부서번호와 부서별최대급여 및 부서명을 조회
--1) view를 생성
--2) in line view로 작성
-- deptno, dname, max_sal :
--view 이름 v_max_sal_01

select * from emp;
select * from dept;
--방식2
create or replace view v_max_sal_01 as
 select dpt.dname "부서명"
			, dpt.deptno "부서번호"
			, max(sal)  "부서별 최대급여"
  from emp emp, dept dpt
		where emp.deptno = dpt.deptno
		group by emp.deptno, dpt.dname
		order by emp.deptno;
		
drop view v_max_sal_01;
--방식 1
create or replace view v_max_sal_01 as
select deptno
		, max(sal) 최대급여
	from emp
	group by deptno
	order by deptno;
	
--방식3 inline view에 group by사용
 create or replace view v_max_sal_01 as
 select dpt.deptno
			, dpt.dname
			, sal.max_sal
		from dept dpt
				,(select deptno,sum(sal) as max_sal from emp group by deptno) sal
		where dpt.deptno = sal.deptno;
--방식4	in line view
select dpt.deptno
			, dpt.dname
			,nvl((select max(sal) from emp emp where dpt.deptno = emp.deptno group by deptno),0) 부서별 최대급여
	from dept dpt;		