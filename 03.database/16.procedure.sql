/*
PL/SQL
오라클의 	Proedual Language Extension to SQL의 약자
SQL 문장에서 변수정의, 조건처리(if), 반복처리(for,while, loop)등을 지원하며
절차형 언어(Procedural Language)라고 한다.

declare 문을 이용하여 정의하고 선언문은 사용자가 정의한다. PL/SQL문은 블럭구조로
되어 있고 PL/SQL에서 자체 compile엔진을 가지고 있다.

1.PL/SQL의 강점

 block구조로 다수의 sql문을 한번에 오라클 데이터베이스서버로 전송해서 처리하기 때문에
 처리속도가 빠르다.
 PL/SQL의 모든 요소는 하나 또는 두 개이상의 블럭으로 구성하여 모듈화가 가능하다.
 보다 강력한 프로그램을 작성하기 위해 큰 블럭안에 소블럭을 위치 시킬수가 있다.
 variable(변수), constant(상수), cursor(커서), exception(예외처리)등을 정의할 수 있고 sql문장과 produral문장에서 사용할 수 있다.
 변수선언은 테이블의 데이터구조와 컬럼명을 이용하여 동적으로 변수선언할 수가 있다. 
 exception처리를 이용하여 오라클 서버 error처리를 할 수 있다.
 사용자가 에러를 정의 할 수 있고 exception처리를 할 수 있다.
2.PL/SQL의 구조
	1 PL/SQL은 프로그램을 논리적인 블럭으로 나눈 구조화된 언어이다.
	2 선언부(declare, 선택), 실행부(degin...end, 필수), 예외(exception, 선택)로
	구성되어 있다. 특히, 실행부는 반드시 기술을 해야 한다.
	3 문법
	
		declare
				-선택부분
				-변수, 상수, 커서, 사용자예외처리
				
		begin
			-필수부분
			-PL/SQL문장(select, if, for...)
		
		exception
			-선택부분
			-에외처리로직을 기술
		end;
3.PL/SQL의 종류 
	1.anonymous block(익명블록) : 이름이 없는 블럭으로 보통 1회성으로 실행되는 블럭이다.
	2.strored procedure : 매개변수를 전달 받을 수 있고 재사용이 가능하며 보통은 연속실행하거나 
											구현이 복잡한 트랜잭션을 수행하는 PL/SQL블럭으로 "데이터베이스 서버 안에 저장"된다.
											처리 속도가 빠르다. 저장되어 있다는 의미로 stored procedure라고 한다.
	3.function : procedure와 유사하지만 다른 점은 처리결과를 호출한 곳으로 반환해 주는 값이 있다는 것이다.
							 다만 in파라미터만 사용할 수 있고, 반드시 반환될 값의 데이터 타입을 return문 안에 선언해야한다.
							 또한 PL/SQL블럭내에서 return문을 사용하여 반드시 값을 리턴해야 한다.
	4.package  : 패키지는 오라클 데이터베이스 서버에 저장되어 있는 procedure와 function의 집합이다.
							패키자는 선언부와 본문 두 부분으로 나누어 관리한다.
	5.trigger  : insert, delete, update등이 특정 테이블에서 실행될 때 자동으로 수행하도록 정의 한 프로시저
							 이다. 트리거는 테이블과 별도로 database에 저장(객체)된다. 트리거는 table에 대해서만 정의할 수 있다.

							 
4. 생성문법

	create or replace procedure [function]프로시저(펑션)명 is[as]
	begin
	end 
*/
-- procedure /function 생성 및 실행

/*create or replace procedure pro_01 is
begin
	dbms_output.put_line('Hello World');
	end;*/
	
-- 실행방법
-- exec pro_01 : sql*pluse에서 사용되는 오라클의 명령 즉, 표준명령이 아니다.
 /*create or replace procedure pro_02 is
 v_counter integer; --변수를 선언(변수명과 데이터타입)
 begin
 --실행부
 v_counter := 10; --대입연산자 변수의 초기화
 v_counter := v_counter + 10;
 dbms_output.put_line('Counter =' || v_counter);
 v_counter := v_counter/0;
 exception when others then
 dbms_output.put_line('0으로 나눈 수가 없습니다.');
 
 end;
 
 -- if
create or replace procedure pro_03 is
 isSuccess boolean;
begin
	isSuccess := false; --true false
	if isSuccess 
		then dbms_output.put_line('성공 했습니다.');
		else dbms_output.put_line('실패 했습니다.');
	end if;
end;

--4 for
create or replace procedure pro_04 is
begin
	for i in 1..10 loop
		dbms_output.put_line('i=' ||i);
	end loop;
end;*/

/*
PL/SQL 데이터타입

1.스칼라 : scalar 데이터 타입은 단인 data type과 데이터변수 %type이 있다.
				 
	 일반데이터타입
	 
	 1.선언방법 : 변수명 [constant] 데이터타입 [not null] [:= 상수값 or 표현식]
		예: counter constant integer not null := 10 + 10;
		
	 2.변수명(variable or identifer)의 이름은 SQL명명규칙을 따른다.
	 
	 3.identifer를 상수로 지정하고 싶은 경우에는 constant라는 키워드로 명시적으로 선언하고
		상수는 반드시 초기값을 할당해야 한다.
		
	 4.not null로 정의되어 있다면 초기값을 반드시 지정, 정의되어 있지 않을 경우는 생략할 수 있다.
		초기값은 할당연산자(:=)를 사용하여 지정
		
	 5. 일반적으로 한줄에 한개의 identifer를 정의한다.
	 
	 6. 일반변수의 선언방법
	 
			v_pi constant number(7, 6) := 3.141592;
			v_price constant number(4, 2) := 12.34;
			v_name varchar2(10);
			v_flag boolean not null := true;
2.%type

	1. DB테이블의 컬럼의 데이터타입을 모를 경우에도 사용할 수가 있고 테이블컬럼의 데이터타입이 변경
		 될 경우에도 수정할 필요없이 사용할 수가 있다.
		 
  2. 이미 선언된 다른 변수나 테이블 컬럼을 이용하여 선언(참조)할 수가 있다.
	
	3. DB테이블과 컬럼 그리고 이미 선언한 변수명이 %type앞에 올 수 있다.
	
	4. %type속성을 이용하는 장점은
		 ...table의 column 속성을 정확히 알지 못할 경에도 사용할 수가 있다.
		 ...table의 column 속성이 변경이 되어도 pl/sql을 수정할 필요가 없다.
		 
  5. 선언 방법
		v_empno emp.empno%type;
		
3.%rowtype
	
	하나 이상의 데이터값을 갖는 데이터형으로 배열과 비슷한 역할을 하며 재사용이 가능하다.
	%rowtype 데이터형과 pl/sql 테이블과 레코드는 복합데이터형에 속한다.
	
	1.테이블이나 뷰 내부컬럼의 데이터형, 크기, 속성등을 그대로 사용할 수 있다.
	2.%rowtype앞에는 테이블(뷰)명이 온다.
	3.지정된 테이블의 구조와 동일한 구조를 갖는변수를 선언할 수 있다.
	4.데이터베에스 컬럼들의 갯수나 datatype을 알지 못할 경우에 사용하면 편리하다.
	5.테이블의 컬럼데이터타입이 변경되어도 pl/sql을 변경할 필요가 없다.
	6.선언 방법 
		v_emp_row emp%rowtype;
		 --> v_emp.ename; 
		 
		 
		 table타입
		 
		 pl/sql에서 table타입은 db에서 table과 성격이 다르다. pl/sql에서 table은 1차원 배열이다.
		 table은 크기에 제한이 없으며 row의 수는 데이터가 추가 되면 자동으로 증가된다.
		 binary_integer타입의 인덱스 번호로 순서가 정해 진다. 하나의 테이블에는 한개의 컬럼데이터를 저장할 수  있다.
		 
		 선언방법 : 
			1. 데이터(타입)선언	-	type 테이블타입명 is table of varchar2(20) index by binary_integer;
					-> 사용자가 데이터타입을 새로 만든 것
			2. 변수선언 - v_emp_tab or tab_v_emp  테이블 타입명; --> 사용자가 만든 새로운 데이터타입으로 변수를 선언
			즉, 변수선언의 의미는 테이블타입으로 변수를 선언한다는 의미이다.
			3. %rowtype으로 table타입을 선언

				type 테이블타입명 is table of emp%rowtype index by binary_integer;
				
				v_emp_tab 테이블타입명
					
		 record타입
		 
		 1.record 데이터타입은 여러개의 데이터타입을 갖는 변수들의 집합
		 2.스칼라,테이블 or 레코드타입중 하나 이상의 요소로 구성
		 3.논리적 단위로 컬럼들의 집합을 처리할 수 있도록 한다.
		 4.pl/sql table과는 다르게 개별 필드의 이름을 부여, 선언시에 초기화가 가능하다.
		 5.선언방법 
		 
			type 레코드타입명 is record(
				col1 데이터타입 [not null {:= 값 | 표현식}],
				col(n번째) 데이터타입 [not null {:= 값 | 표현식}]
			)
			
			
		 
		 pl/sql안에서 사용되는 select문법은 일반 sql의 select 문법과는 다르다.
		 
*/

--일반 sql
--select * from emp;

--pl/sql
--select col1,...coln into var1,...varn
--from emp;

--스칼라데이터타입
--1) 일반 데이터 타입 vs %type

create or replace procedure pro_05 is
v_empno number;  --일반 데이터타입
v_ename emp.ename%type; --참조타입%type
v_sal	emp.sal%type; --참조타입 %type
begin
-- 한 개의 사원정보를 읽어서 출력
select emp.empno, emp.ename, emp.sal
	into v_empno, v_name, v_sal 
	from emp 
	where emp.ename = 'SMITH';
	
	dbms_output.put_line('사원번호 =' || v_empno);
	dbms_output.put_line('사원이름 =' || v_name);
	dbms_output.put_line('사원급여 =' || v_sal);
end;


--rowtype
create or replace procedure pro_06 is
v_emp_row emp%rowtype;
begin
select *
	into v_emp_row
	from emp 
	where emp.empno = 7369;
	dbms_output.put_line('사원번호 =' || v_emp_row.empno);
	dbms_output.put_line('사원이름 =' || v_name_row.ename);
	dbms_output.put_line('사원급여 =' || v_sal_row.sal);
	dbms_output.put_line('커미션 =' || v_sal_row.comm);
	dbms_output.put_line('입사일자 =' || v_sal_row.hiredate);
	dbms_output.put_line('부서번호 =' || v_sal_row.deptno);
end;

select * from emp;

emp.empno
emp.ename

--record type 
-- record : empno, ename, sal, hiredate을 저장할 데이터타입을 선언
--type 레코드명 is recode(col1 데이터타입,...coln 데이터타입);
create or replace procedure pro_07 is
 type emp_rec is record(
 v_empno number,
 v_ename varchar2(30),
 v_sal number,
 v_hiredate date); --1)사용자가 새로운 데이터 타입작성
 
 --2) 변수선언
 v_emp_rec emp_rec;
begin

select empno, ename, sal, hiredate
	into v_emp_rec.v_empno, v_emp_rec.v_ename,v_emp_rec.v_sal, v_emp_rec.v_hiredate
	from emp
	where emp.ename ='KING';
	dbms_output.put_line('사원번호 =' || v_emp_rec.v_empno);
	dbms_output.put_line('사원이름 =' || v_emp_rec.v_ename);
	dbms_output.put_line('사원급여 =' || v_emp_rec.v_sal);
	dbms_output.put_line('입사일자 =' || v_emp_rec.v_hiredate);
	dbms_output.put_line('----------------------------------');
	
	select empno, ename, sal, hiredate
	into v_emp_rec
	from emp
	where emp.ename ='KING';
	
	dbms_output.put_line('사원번호 =' || v_emp_rec.v_empno);
	dbms_output.put_line('사원이름 =' || v_emp_rec.v_ename);
	dbms_output.put_line('사원급여 =' || v_emp_rec.v_sal);
	dbms_output.put_line('입사일자 =' || v_emp_rec.v_hiredate);
end;

--table type 타입(한건, 한개의 컬럼을 정의)
--1차원배열과 유사
-- type 테이블타입명 is table of 테이블한개의 컬럼 index by binary_integer;
create or replace procedure pro_08 is
--1st step : table타입 작성
type tbl_emp_name is table of hr.employees.first_name%type index by binary_integer;
--2st step : 변수 선언 
v_name tbl_emp_name;
v_name_1 varchar2(20);
begin
 select first_name
	into v_name_1
	from hr.employees
	where employee_id = 100;
	
	dbms_output.put_line('입사일자 =' || v_name_1);
	dbms_output.put_line('-------------------------------');
	
	v_name(0) := v_name_1;
	v_name(1) := '홍길동';
	v_name(2) := '손흥민';
	
	dbms_output.put_line('입사일자 =' || v_name(0));
	dbms_output.put_line('입사일자 =' || v_name(1));
	dbms_output.put_line('입사일자 =' || v_name(2));
	
	
end;

--table type 타입(여러건, 한개의 컬럼을 정의)
create or replace procedure pro_09 is
--1st step : table타입 작성
type e_table_type is table of hr.employees.first_name%type index by binary_integer;
--2st step : 변수 선언 
v_tab_type  e_table_type;
idx 	      	binary_integer := 0;
begin


for name in (select first_name || '.'|| last_name as empname from hr.employees order by first_name) loop
idx := idx + 1;
v_tab_type(idx) := name.empname; -- name %rowtype으로 처리
end loop;

for i in 1..idx loop
dbms_output.put_line('사원이름 =' || v_tab_type(i));
	end loop;
end;

--table type 타입(여러건, 여러개의 컬럼을 정의)
--emp테이블에서 사원명과 직급을 출력
create or replace procedure pro_10 is
type tab_name_type is table of emp.ename%type index by binary_integer;
type  tab_job_type is table of emp.job%type index by binary_integer;

v_name_table 	tab_name_type;
v_job_table  	tab_job_type;

idx    binary_integer = 0;

begin
for name_job in(select ename, job from emp order by ename) loop
idx := idx + 1;
v_name_table(idx) := name_job.ename;
v_job_table(idx) := name_job.job;
end loop;

dbms_output.put_line('----------------------------');
dbms_output.put_line('사원이름'|| chr(9) ||'직급'); --chr(9)
dbms_output.put_line('----------------------------');

for i in 1..idx loop
	dbms_output.put_line(v_name_table(i) || chr(9) ||v_job_table(i));
	end loop;
	
	exception when others then 
		dbms_output.put_line('에러가 발생했습니다!!');
end;

--실습 hr.employees 와 hr.departments 읽어서
--사원이름 (first_name, last_name)와 부서명을 출력
--사원이름 chr(9)
create or replace procedure pro_11 is
type tab_name_type is table of  hr.emp.ename%type index by binary_integer;
type tab_dname_type is table of  hr.dpt.dname%type index by binary_integer;

v_name_table 	table_name_type
v_dname_table table_dname_type



--table 타입을 %rowtype을 선언
--emp테이블에서 사원명과 직급을 출력
create or replace procedure pro_12 is

	type  t_dept is table of  dept%rowtype index by binary_integer;
	v_dept t_dept;
	idx    binary_integer := 0;
begin

	for dept_list in (select * from dept order by dname) loop
		idx := idx + 1;
	--	v_dept(idx) := dept_list.deptno;
	--	v_dept(idx).dname := dept_list.dname;
	--	v_dept(idx).loc := dept_list.loc;
		v_dept(idx) := dept_list;
	end loop;
		
	for i in 1..idx loop
		dbms_output.put_line('부서번호 ='||v_dept(i).deptno ||chr(9)||
													,'부서이름='|| v_dept(i).dname ||chr(9)||
													,'부서위치='|| v_dept(i).loc);
	end loop;
exception when others then 
		dbms_output.put_line('에러가 발생했습니다!!');
end;

/*
제어문(if, case)

1.단순 if : if ~ end if;
2.if ~then ~ else ~ end if;
3.if ~ elseif ~ elseif~ end if;
4.case
*/

--단순if 
--hr.employees에서 10=총무부,...40=인사부
create or replace procedure pro_13 is
	v_emp_id		hr.employees.employee_id%type;
	v_name			hr.employees.first_name%type;
	v_dept_id		hr.employees.department_id%type;
	v_dname			varchar2(20);
begin

	select employee_id, first_name||'.'||last_name, department_id
		into v_emp_id, v_name, v_dept_id
		from hr.employees
		where employee_id = 203;
		
		if(v_dept_id = 10) then
			v_dname :='총무부';
			end if;
			
			if(v_dept_id = 20) then
			v_dname :='마케팅';
			end if;
			
			if(v_dept_id = 30) then
			v_dname :='구매부';
			end if;
			
			if(v_dept_id = 40) then
			v_dname :='인사부';
			end if;
			
			dbms_output.put_line(v_name||'의 부서는'||v_dname||'입니다.');
exception when others then 
		dbms_output.put_line('에러가 발생했습니다!!');
end;


--if~ then ~ else ~ end if
-- hr.employees에서 commission이 있으면 보너스를 지급, 없으면 지급하지않음
create or replace procedure pro_14 is
v_emp_id 	hr.employees.employee_id%type;
v_name		hr.employees.first_id%type;
v_sal			hr.employees.salary_id%type;
v_comm		hr.employees.commission_pct%type;
c_bonus		number;
begin

	select employee_id
	, first_name||'.'||last_name
	, nvl(commission_pct,0)
	, salary* nvl(commission_pct, 0)
		into v_emp_id, v_name, v_dept_id
		from hr.employees
		where employee_id = 145;

if(v_comm > 0)
then dbms_output.put_line(v_name||'사원의 보너스는' ||v_bonus||'입니다!');
else dbms_output.put_line(v_name||'사원의 보너스는 없습니다.' );
end if

exception when others then 
		dbms_output.put_line('에러가 발생했습니다!!');
end;


--if ~else if ~ elseif ~ end if
-- hr.employees에서 10=총무부,...40=인사부
create or replace procedure pro_15 is
v_emp_id		hr.employees.employee_id%type;
	v_name			hr.employees.first_name%type;
	v_dept_id		hr.employees.department_id%type;
	v_dname			varchar2(20);
begin
	select employee_id, first_name||'.'||last_name, department_id
		into v_emp_id, v_name, v_dept_id
		from hr.employees
		where employee_id = 203;
if
(v_dept_id = 10) then
			v_dname :='총무부';

elsif
(v_dept_id = 20) then
			v_dname :='마케팅';

elsif
(v_dept_id = 30) then
			v_dname :='구매부';

elsif
(v_dept_id = 40) then
			v_dname :='인사부';
end if;
exception when others then 
		dbms_output.put_line('에러가 발생했습니다!!');
end;


-- case 문
create or replace procedure pro_15 is
	v_emp_id		hr.employees.employee_id%type;
	v_name			hr.employees.first_name%type;
	v_dept_id		hr.employees.department_id%type;
	v_dname			varchar2(20);
begin
		select employee_id, first_name||'.'||last_name, department_id
		into v_emp_id, v_name, v_dept_id
		from hr.employees
		where employee_id = 203;
		
		case v_dept_id
			when 10 then '총무부'
			when 20 then '마케팅'
			when 30 then '구매부'
			when 40 then '인사부'
					
end;





/*
반복문(loop, for, while)
loop 	
end loop



for loop
end loop

while 조건 loop
end loop
*/
create or replace procedure pro_17 is
	cnt number := 0;

begin

loop
	cnt := cnt + 1;
	dbms_output.put_line('현재번호는=' || cnt);
	exit when cnt >= 10;
	end loop;
	
	exception 
	
	end pro_17;
	
	
	--while 반복문	
	create or replace procedure pro_18 is
	cnt number := 0;

begin

while cnt < 10 loop
	cnt := cnt + 1;
	dbms_output.put_line('현재번호는=' || cnt);
	end loop;
	
	exception when others then 
		dbms_output.put_line('에러가 발생했습니다!!');
end;

--함수나 프로시저를 호출 일반적인 명령
call pro_17();

--for
--for 카운트 in[reverse] start..end loop
--end loop;
--for 객체리스트 in (select~~) loop
--end loop
create or replace procedure pro_19 is
cnt number := 0;
begin
	for cnt in 1..19 loop
		dbms_output.put_line('현재비밀번호는 =' );
exception when others then 
		dbms_output.put_line('에러가 발생했습니다!!');
end;

/* in 매개변수가 있는 procedure
create or replace procedure 프로시저명(arg1 in 데이터 타입,...argn in 데이터타입)is
begin 
end;

*/
-- 사원번호와 급여인상율(10%)을 전달 받아서 해당 사원의 급여를 인상하는 procdure
create or replace procedure update_sal_emp(p_empno in number p_percent in number)is
v_bef_sal number;
v_aft_sal number;
v_ename 	emp.ename%type;
begin
dbms_output.put_line('사원번호='||p_empno);
dbms_output.put_line('인상율='|| p_percent);

select 
	into v_bef_sal
	from emp
	where empno = p_empno;
	
	dbms_output.put_line('인상 전 급여='|| v_bef_sal);
	
	update emp
	set sal = sal + (sal * p_percent / 100)
	where empno = p_empno;
	
	select 
	into v_aft_sal
	from emp
	where empno = p_empno;
	
	dbms_output.put_line('인상 후 급여='|| v_aft_sal);
	
	select sal, ename
	into v_aft_sal, v_name
	from emp
	where  empno = p_empno;
	dbms_output.put_line('----------------------------------------------------')
	dbms_output.put_line(v_ename || '('||p_empno||'사원의 인상전 급여=' v_bef_sal||
		',인상후 급여'|| v_aft_sal);

end update_sal_emp;

call update_sal_emp(7359, 10);


--실습 emp에서 10번 부서의 사원 급여를 15%인상후 급여를 출력
-- 프로시저명 : pro_sal_raise
--for문, type is table of
-- '사원번호 chr(9)', '사원이름 동일 인상 후 급여' 

select * from emp;

 
create or replace procedure  pro_sal_raise(p_deptno in number, p_percent) is

type t_emp is table of emp%rowtype index by binary_integer;
v_emp t_emp;
i  		binary_integer := 0;
begin
dbms_output.put_line('부서번호는='|| p_deptno);
dbms_output.put_line('인상률='|| p_percent);
update emp 
set sal = sal + (sal * p_percent/100)
where deptno = p_deptno;

 
commit;

for emp_list  in (select * from emp where deptno = p_deptno)  loop
v_emp(i) := emp_list;
v_emp(i).empno := emp_list.empno;
v_emp(i).ename := emp_list.ename;
v_emp(i).sal := emp_list.sal;
end loop;
		dbms_output.put_line('--------------------------');
		dbms_output.put_line('사원번호'|| chr(9)||'사원이름'||chr(9)||'인상 후 급여');
		dbms_output.put_line('-------------------------');
		
	for i in 1..i loop
			dbms_output.put_line(v_emp(j).empno||chr(9)||v_emp(j).ename||);
		
		
end pro_sal_raise;

--data dictionary
-- 소유객체 등록
select * from user_objects;
select distinct object_type from user_objects;
select * from user_objects where object_type = 'procedure' order by object_name;

