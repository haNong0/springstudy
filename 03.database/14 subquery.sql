 /*
 sub query
		main query와 반대되는 개념으로 이름을 부여한 것
		메인쿼리를 구성하는 소단위 쿼리(종속쿼리)
		subquery안에는 select, insert, delete, update 모두 사용이 가능하다.
		 sub query의 결과값을 메아ㅣㄴ쿼리가 사용하는 중간값으로 사용할 수 있다.
		 sub query 자체는 일반 쿼리와 다를 바가 없다.
		 
		 서브쿼리 종류
		 
		 연관성에 따른 분류
			연관성이 있는 쿼리
			연관성이 없는 쿼리
			
		위치에 따른 분류
			inline view : select절이나 from절안에 위치하는 쿼리
			중첩쿼리			: where절에 위치한 쿼리
			
			
		제약사항
		
		where절에 연산자 오른쪽에 위치해야 하며 반드시 소괄호()로 묶어야 한다.
		특수한 경우를 제외하고는 sub query절에는 order by를 사용할 수 없다.
		비교연산자에 따라서 단일행 sub query(<,>,=..)또는 다중행 sub query(in, exists..)를 사용할 수 있다.
 */
 -- 다른 사용자의 객체(table, view,...)에 접근권한 부여하기
 --현재 scott은 hr의 테이블에 접근할 수 있는 권한이 없다.
 select * from hr.employees; --table or view does not exist
 select * from hr.departments;
 select * from hr.countries; -- 권한이 없기 때문
 
 
 --hr사용자가 scott에게 employees, departments에 조회권한 부여하기
 -- sysdba권한 or 소유자(hr)가 다른 사용자(scott)에게 권한을 부여할 수 있다.
 --hr에서 scott에 권한을 부여
 --사용자를 hr로 변경후에 작업 할 것 
 --문법: grant 부여할 명령 on 접근허용할 객체 to 권한부여하는사용자
-- 			revoke 헤제할 명령 on 헤체할 객체 from 권한헤제하는사용자
 grant select on employees to scott;
 
 grant select on departments to scott;
 
 -- 권한헤제
 revoke select on employees from scott;
 revoke select on departments from scott;
 
 --scott에 select 권한을 받은 테이블 조회하기
 --다른 사용자(스키마)의 객체에 접근하려면 "스키마.객체이름" 형식으로 접근해야한다.
 
 
 /*
 단일행 sub query
 --실습 샤론스톤과 동일한 직급(instructor)인 교수들을 조회하기
 */
 select * from professor;
 select position from scott.professor where position = 'instructor';
 select position from scott.professor where name='Sharon Stone';
 
 select *
	from scott.professor
	where position =(select position
										from scott.professor
										);
										
	--실습 hr에서 employees,departments를 join해서
	-- 사원이름(first_name + last_name), 부서id, 부서명(inline view)를 조회하기
	
	select * from employees;
	select * from departments;
	
	/*select em. first_name
				, em.last_name 
				, em.job_id
				, de.department_name
		from employees em, departments de */
	
	select first_name || '.'|| last_name 사원명
				,department_id   						   부서명
				,(select department_name from hr.departments where emp.deartment_id = dpt. department_id) 부서이름
		from hr.employees
				,hr.departments;
				
				
-- 실습 hr계정 사원테이블에서 평균급(전체사원)보다 작은 사원만 출력
-- 단일행 단일컬럼
select round(avg(salary), 0) from 

select first_name || '.'|| last_name 사원명
			, salary
	from hr.employees emp
	where salary < (select round(avg(salary),0) from hr.employees);


/*
다중행, 다중열 sub query*/
-- 다중행, 단일행
--hr의 locations, jobs에 테이블에 접근할 수 있도록 권한을 부여
grant select on hr.locations to scott;
grant select on hr.jobs to scott;
grant select on hr.employees to scott;

select * from hr.locations;
select * from hr.jobs;

--실습 부서의 state_province가 null인 부서를 조회
-- locations에서 state_province가 null인 자료 (다중행, 단일컬럼)
--departments를 조인해서 부서번호 부서명출력
select * from hr.locations_id where state_province is null;
select * from hr.departments dpts;

select dpt.departments_id
			,dpt.department_name
		from hr.departments dpt
	where dpt.location_id in(select location_id 
													 from hr.locations
													 where state_province is null);
													 
-- 급여가 가장 많은 사원의 이름, 직급을 출력
-- first name last_name, job_ title;
select * from hr.jobs;
select * from hr.employees;

select first_name || '.'|| last_name 사원명
			, emp.salary 급여
			, job. job_title
			from hr.employees emp
					,hr.jobs job
			where emp.salary =(select max (salary) from hr.employees)
			and emp.job_id = job.job_id;
			

--급여가 평균급여보다 많은 사원
--미국내에서 근무하는 사원들에 대한 평균 급여
-- 사원명 급여 직급
select * from hr.employees;
select * from hr.departments dpt;
select * from hr.locations loc;

select emp.first_name || '.'|| last_name 사원명
			,emp.salary 급여
			,job.job_title 직급
		from hr.jobs job , hr.employees emp
		where emp.job_id = job.job_id
		and (select round(avg(emp.salary))
		from hr.employees emp
				,hr.location loc
				,hr.departments dpt 
	where loc.country_id = 'US'
				and emp.location_id = loc.location_id 
				and dpt.department_id = emp.department_id);
				
drop table month_salary;
create table month_salary(
	magam_date		  date not null /*마감일*/
	, department_id number   /*부서번호*/
	, emp_count		  number   /* 사원수*/
	, total_salary  number   /*급여 총액*/
	, average_salary number  /*급여 평균*/
);

select * from month_salary;
select * from emp;
select count(*), round(avg(sal)) , sum(sal)
		from emp
		group by deptno;
-- 부서별 총사원수, 급여총액, 급여평균을 업데이트 하기
-- 2step으로 처리
-- 현재일기준으로 insert(부서별)를 하고, 마감일, 부서번호, 0 , 0, 0
-- 초기화후에 update(사원수, 급여총액, 급여 평균)

insert into month_salary select last_day(sysdate), emp.department_id, 0, 0, 0 from hr.employees emp group by department_id; 


select emp.department_id, count(*), sum(emp.salary),sum(salary) , round(avg(emp.salary)) from hr.employees emp group by department_id;

--update month_ salary set dpartment_id  = (select count(deptno) from emp where deptno = 10 group by deptno);
 
update month_salary 
	set = (select count(*), sum(emp.salary)
							 , sum(salary) 
							 , round(avg(emp.salary)) 
	from hr.employees emp 
	where emp.department_id;
	
	update month_salary sal
		set emp_count 
							= (select count(*) from hr.employees emp where emp.department_id = sal.department_id ), total salary
-- 1step으로 처리
-- 현재일기준으로 insert(부서별)를 하고, 마감일, 부서번호, 0 , 0, 0
-- 초기화후에 update(사원수, 급여총액, 급여 평균)

delete from month_salary 
update month_salary sal
	set(emp_count, total_ salary, average_salary)
		= (select count(*)
						, sum (emp.salary)
						, round(avg(emp.salary))
						from hr. employees emp
					where emp.department_id = sal. department_id);
					
/*
다중행, 다중열 관련 연산자

비교 연산자 : in between exists
>any : 결과중에서 최소값을 반환
<any : 결과중에서 최대값을 반환
>all : 결과중에서 최대값을 반환
<all : 결과중에서 최소값을 반환
*/

--실습 미국내에 있는 부서 조회
--a. 비교연산자 
 select dpt.department_name
		from hr.departments dpt
				, hr.locations loc
		where  loc. country_id = 'US'
		and dpt.location_ id = loc. location_id;
--in 연산자
select  dpt.department_name
	from hr.departments dpt
	where dpt.location_id in (select location_id from hr.locations loc where loc.country_id = 'US');
--any, all 연산자
--salary가 30번 부서의 최소급여보다 많은 사원을 조회
select min(salary) from hr.employees where department_id = 30;

-- 비교연산자
select first_name || '.'|| last_name 사원명
			, emp.salary 급여
			from hr.employees emp
		where emp. salary > (select min(salary) from hr.employees where department_id = 30);

-- > any, < all
select first_name || '.'|| last_name 사원명
			, emp.salary 급여
			from hr.employees emp
		where emp. salary >any (select salary from hr.employees where department_id = 30);
		
select first_name || '.'|| last_name 사원명
			, emp.salary 급여
			from hr.employees emp
		where emp. salary >all (select salary from hr.employees where department_id = 30);
 

