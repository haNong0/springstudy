/*
function

funtion

	보통의 경우 갑을 계산하고 그 결과를 반환하기 위해서 function을 사용한다.
	대부분 procedure과 유사하지만
	
	1) in 파라미터만 사용할 수 있다.
	2)반드시 반환될 값의 데이터 타입을 return문안에 선언해야 한다. (프로시저와 차이점)
	
문법

	1)pl/sql 블럭안에는 적어도 한개의 return이 있어야 한다.
	2)선언방법
	
	create or replace function 함수이름(argl in 데이터타입,...)
	return 데이터타입 is[as]
		변수선언...
		[pragma autonomous_transaction]
	begin
	end 펑션이름;

주의사항

	오라클 함수 즉, function에서는 기본적으로 DML(insert, update, delete) 문을 사용할 수 없다.
	만약에 사용하고자 할 경우 begin 바로 위에 pragma autonomous_transaction을 선언하면 사용 할 수 있다.
	
	procedure vs function
	
	PROCEDURE							function
	------------------		------------------------
	서버에서 실행(속도가 빠름)		클라이언트에서 실행
	return값이 없어도 상관없음		return값 필수 하나만 가능
	(in, out)처리						in만 있음
	select 절에는 사용불가			select에서 사용가능
	--> call, execute     --> select 펑션() from  dual;
*/

--실습1. 사원번호를 입력받아서 급여를 10% 인상하는 함수 작성
CREATE OR REPLACE FUNCTION fn_01(p_empno in number) return number is
v_sal number;
pragma autonomous_transaction;
begin
update emp
	set sal = sal * 1.1
	where empno = p_empno;
	
	commit;
	
		select sal
		into v_sal
		from emp
		where empno = p_empno;
		
		return v_sal;

end fn_01;


--call fn_01(7369);, procedure는 call로 호출이 가능하지만 function은 할 수 없다.

select * from emp;--968
select sum(sal) from emp;
select fn_01(7369) from dual;

--실습2. 부피를 계산하는 함수 fn_02
-- 부피 =길이 * 넓이  * 높이 return이 부피
CREATE OR REPLACE FUNCTION fn_02(p_long in number, p_big in number, p_height in number) return number is
p_vr  number;
begin 
	p_vr := p_long * p_big * p_height;
	
	return p_vr;
	
	
end fn_02;
-- sql * plus : execute fn_02(10, 10, 10) from dual;

SELECT fn_02(10, 10, 10) from dual;



--실습3. 현재일을 입력받아서 해당월의 마지막일자를 구하는 함수
CREATE OR REPLACE FUNCTION fn_03(v_date in date) return date is
v_lastday date;
begin
 v_lastday :=select to_char(LAST_DAY(v_date),'yyyy-mm-dd') as 이번달마지막일 from dual;
 -- 강사님 
 -- add_months(p_date, 1)- to char(p_date, 'DD');
 
 return v_lastday;
 
end;


--실습4. '홍길동'문자열을 전달받아서 '길동'만 리턴하는 함수04
CREATE OR REPLACE FUNCTION fn_04(v_vname in varchar2) return varchar2 is
v_result varchar2(20);

begin
v_result := substr(v_vname,2);

return v_result;
end fn_04;

select fn04('홍길동') from dual;
select emanme. fn_04(ename) from emp;

--실습 fn_05 현재일 입력받아서 '2023년 04월 03일'의 형태로 리턴
create or replace function fn_05(v_day in date) return varchar2 is
v_result varchar2(20);

begin
v_result := to_char(v_day, 'yyyy"년" mm "월" dd"일"');

return v_result;
end fn_05;

select fn_05(sysdate) from dual;
select name, fn_05(hiredate) from professor;

--실습05 주민번호(ssn)를 입력받아서 남자 ㅐㄱ 여자를 구분하는 리턴함수 작성 
create or replace function fn_06(v_ssn varchar2) return varchar2 is
v_result varchar2(40);
begin

	  if substr(v_ssn,7,1) ='1' or substr(v_ssn,7,1 )= '3' then 
		select '남' into v_result from dual;
	else 
		select '여' into v_result from dual;
		end if;
		--강사님
		/*
		v_result in substr(v_ssn,7,1);
		if v_result('1','3')
		then v_result := '남자';
		else v_result := '여자';
		end if;
		*/
		return v_result;
	
end;

select fn_06(980427211111) from dual;

select name, fn_06(jumin), fn_05(birthday) from student;


--실습 professor에서 hiredate를 현재일 기준으로 근속년월을 계산 함수 
-- 근속년 floor(months_between()) 사용, 근속월 ceil(months_between()) -> 12년 5개월  
select * from professor;
select * from emp;
 
create or replace function fn_07(stal in date) return varchar2 is  --date? varchar2?
v_result varchar2(20);
begin
	v_result := floor(months_between(sysdate, stal)/12)|| '년'||	
							ceil (mod(months_between(sysdate, stal),12)) || '개월';
							return v_result;
				end fn_07;
/*select sysdate,
					,months_between(sysdate, stal)/12
					,floor(months_between(sysdate, stal)/12)
					,ceil (mod(months_between(sysdate, stal),12)) from 
					,mod(3, 2)
					from dual;
	return v_result;*/

