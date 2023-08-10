/*
테이블 생성하기

1.문법 

 create  table 테이블명(
		컬럼명1 데이터타입(크기) default 기본값
		...
		컬럼명n 데이터타입(크기) default 기본값
		,
		);
		
2.데이터타입
	1)문자형
		char(n) : 고정길이 / 최대 2kb / 기본길이 1byte
		varchar2(n) : 가변길이 / 최대 4byte / 기본길이 1byte
		long : 가변길이 / 최대 2gb / 
	2)숫자형
		number : (p. s) :가변숫자 / p(1~38, 기본값= 38), s(-84)
		float  : (p) : number하위타입 / p(1~128, 기본값=128) / 최대 22byte
	3)날짜형
		date :bc 4712.01.01 ! 9999.12.31까지 년월시분초까지 표현
		timestamp : 년월시분초밀초까지 표현 
	4)lob타입 large object 약자 대용량의 데이터를 저장할 수 있는 데이터타입
					 일반적으로 그래프, 이미지, 동영상, 음악파일등 비저옇ㅇ 데이터를 정할 때 사용된다.
					 문자형 대용량 데이터는 clob or n lob를 사용하고 이미지, 동영상등의 데이터는 blob 또는 bfile 타입을 사용한다
	a. clob : 문자형 대용량 객체, 고정길이와 가변길이 문자형을 지원
	b. blob : 이진형 대용량, 객체, 주로 멀티미디어자료를 저장
	c. bfile : 대용량 이진파일에 대한 파일의 위치와 이름을 저장
*/
/*
테이블 생성하기*/
create table mytable(
 no number(3,1)
 ,name varchar2(10)
 ,hiredate date
);

select * from mytable;


create table 마이테이블(
 번호 number(3,1)
 ,이름 varchar2(10)
 ,입사일 date
);
select * from 마이테이블;

/*
테이블 이름은 반드시 문자로 시작해야한다. 중간에 숫자가 포함되는 것은 가능하다.
특수문자도 가능하지만 단, 테이블 생성시 ""로 감싸야 한다. 하지만 권장하지는 않는다.
테이블 이름이나 컬럼명은 최대 30byte까지 가능(즉, 한글은 문자셋에 따라 utf8이면 10자, euckr이면15자)
동일 사용자안에서(스키마) 테이블명을 중복정의 할 수 없다.
테이블 명이나 컬럼명은 오라클 키워드 사용하지 말것을 권장 하지만 사용은 가능하다. 절대 사용하지말것 
*/

-- 테이블에 자료를 추가하기
--문법
--insert into mytable(컬럼1,...컬럼n) value(값1,....값n)
--제약사항
--컬럼의 갯수와 값의 갯수는 동수이어야 한다. 
--컬럼의 데이터 타입은과 값의 데이터타입은 동일해야 한다.
--단, 형변환(자동형변환)이 가능하다면 사용할 수 있지만 변환이 불가능하다면 에러가 발생
select * from mytable;
insert into mytable(name) values('홍길동'); 
insert into mytable(no, name) values(1, '홍길동');
insert into mytable(no, name) values(2, '홍길순');
insert into mytable(no, name) values(3, '홍길상');
insert into mytable(no, name) values(4, '홍길자');
insert into mytable(no, name) values(5, '홍길성');
insert into mytable(no, name) values(1, '손흥민'); --중복제약사항이 없기 때문에 문법에러는 아니지만 로직에러
insert into mytable(no, name, hiredate) values(6, '김민재', sysdate);
insert into mytable(no, name, hiredate) values(7, 10000, sysdate); -- 자동형변환이 가능하기 때문에 에러는 아님
insert into mytable(no, name, hiredate) values('이강인', 10000, sysdate); -- 자동형변환이 안되서 오류
insert into mytable(no, name, hiredate) values(8, '이강인', '2023.03.27');
insert into mytable(no, name, hiredate) values(9, '소향', '2023.03.27');
insert into mytable(no, name, hiredate) values(1000, '소향', 10); --이것도 에러
insert into mytable(no, name, hiredate) values('2023-03-27', '소향','20230327' ); --이것도도 에러
insert into mytable(no, name, hiredate) values(100, '김민재', sysdate); --value larger than specified precision allowed for this column

select * from mytable;

--테이블복사
--emp테이블을 temptable로 복사
--select 명령으로 복사할 수 있다.
--create table temptable(empno 테이터타입, ename, hiredate....);
select * from emp;

--데이터구조 및 데이터복사할 경우
create table temptable as
select * from emp;

select * from temptable;

--테이블 구조만 복사
-- 테이블이 이미 있는경우 name is already used by an existing object
drop table temptable;
create table temptable as
select * from emp where 1=2;
--테이블 삭제 명령
--drop table 테이블명

-- 테이블 구조 및 특정자료만 복사

drop table temptable;
create table temptable as
select * from emp where deptno = 10;

select * from temptable;

/* 테이블 수정하기 -컬럼

컬럼 추가하기 : alter table 테이블명 add(추가 컬럼명 데이터타입)
컬럼명 변경하기 : alter table 테이블명 rename column 변경전 이름 to 변경후이름
데이터 타입 변경 : alter table 테이블명 modify(변경할컬럼 변경할 데이터타입)
컬럼삭제하기 : alter table 테이블명 drop column 삭제할 컬럼명
*/

--실습. dept2테이블을 dept6로 복사
create table dept6 as
select * from dept2;

select* from dept6;

--컬럼추가 : dept6 location varchar2(10)
alter table dept6 add(location varchar2(10));
select * from dept6;

--컬럼명변경하기 : location -> loc변경
alter table dept6 rename column location to loc;
select * from dept6;

--데이터 타입 변경: dname -> number, loc -> number 타입
--데이터타입을 변경할 경우 기존에 데이터에 따라 변경가능한 타입이라면 변경 할 수 있지만
--변환불가능한 데이터가 있을 경우에는 에러 발생
alter table dept6 modify(dname number); --column to be modified must be empty to change datatype
alter table dept6 modify(loc number); -- 값이 하나도 없기 때문에 변경가능

--오라클테이블 정보보기
select * from all_tab_columns
 where table_name = 'emp';  --내용이 보이지않아요
 
--컬럼추가시에 기본값 설정하기
create table dept7 as select * from dept2;


alter table dept7 add(location varchar2(10) default '서울');
alter table dept7 add(xxx varchar2(10) default '서울');
alter table dept7 add(create_date date default sysdate);
select * from dept7;

--컬럼의 크기 변경
-- location 10자리를 1자리로 변경
select * from all_tab_columns where table_name = 'DEPT7';
alter table DEPT7 modify(location varchar2(1)); --에러
alter table DEPT7 modify(location varchar2(7));

--컬럼삭제하기
alter table dept7 drop column xxx;

--테이블 수정하기 - 테이블
--테이블이름 변경 : alter table 변경전 rename to 변경후
--테이블삭제(자료만) : truncate table 테이블명
--테이블삭제(완전삭제) : drop table 테이블명

-- 테이블명 변경하기
alter table dept7 rename to dept777;

--truncate
truncate table dept777;

--완전삭제
drop table dept777;

/*읽기 전용 테이블 생성하기*/
--alter table 테이블명 read only
create table tbl_read_only(
no number
,name varchar2(20)
);
insert into tbl_read_only values(1, '손흥민');
select * from tbl_read_only;

--읽기전용테이블로 변경하기
insert into tbl_read_only values(2, '김민재'); 

--읽기전용을 읽기/쓰기로 변경
alter table tbl_read_only read write;
insert into tbl_read_only values(2, '김민재');


/*
Data Dictionary

오라클 데이터베이스의 메모리 구조와 테이블에 대한 구조 정보를 가지고 있다.
각, 객체(테이블, view, index...)등이 사용하고 있는 공간정보, 제약조건, 사용자정보 및 권한
프로파일, Role, 감사(Audit)등의 정보를 제공한다.

데이터 딕셔너리
	
	데이터베이스자원들을 효율적으로 관리하기 위해서 다양한 정보를 저장하고 있는 시스템이다.
	사용자가 테이블을 생성하거나 변경하는 등의 작업을 할 때 데이터베이스 서버(엔진)에 의해
	자동으로 갱신되는 테이블이다.
	
	사용자가 데이터딕셔너리의 내용을 수정하거나 삭제할 수 없다.
	
	사용자가 데이터 딕셔너리를 조회할 경우에 시스템이 직접 관리하는 테이블은 암호가 되어
	있기 때문에 내용을 볼 수가 없다.
	
데이터 딕셔너리 뷰 : 오라클은 데이터딕셔너리의 내용을 사용자가 이해할 수 있는 내용으로 변환
								하여 제공한다.
								
	user_xxx
	
		자신의 계정이 소유한 객체에 대한 정보를 조회할 수 있다.
		user라는 접두어가 붙은 데이터딕셔너리 중에서 자신이 생성한 테이블, 인덱스, 뷰등과 같은 
		자신이 소유한 객체의 정보를 저장하는 user_tables가 있다.
		--> select * from user_tables;
	all_xxx
	
		자신계정소유와 권한을 부여 받은 객체등에 대한 정보를 조회할 수 있다.
		타 계정의 객체는 원칙적으로 접근이 불가능하지만 그 객체의 소유자가 접근할 수 있도록
		권한을 부여한 경우에는 타 계정의 객체에도 접근할 수가 있다.
		
		--> select * from all_tables;
		--> select * from all_tables where owner = 'SCOTT';
	dba_xxx
	
		데이터베이스관리자만 접근이 가능한 객체들의 정보를 조회할 수 있다.
		dba딕셔너리는 dba권한을 가진 사용자는 모두 접근이 가능하다. 즉, db에 있는 모든 객체들에
		대한 정보를 조회할 수 있다.
		따라서, dba권한을 가진 sys, system계정으로 접속하면 dba_xxx등의 내용을 조회할 수가 있다.
*/

select * from user_tables;
select * from all_tables;
select * from dba_tables; --권한이 없어서 못봄 

select * from all_tables where owner = 'SCOTT';
select * from DIRECTORY;




/*
update

테이블에 있는 데이터를 수정하기 위해서 사용되는 명령
기존의 행or 열을 수정하기 위해서 사용
주의할 점 where 조건절에 특저으이 조건을 정의하지 않을 경우 전체 데이터가 수정이 된다.

update 테이블명
 set 컬럼 = 값
 where 조건절
*/

create table emp999 as select * from emp;
select * from emp999;

--update주의할 점
update emp999
	set ename= '스미스';
	
--전체 사원의 부서번호를 10, 급여를 0으로 수정하기
update emp999
	set deptno = 10,
		sal = 0;
		
select * from emp999;

--실습 전체 사원의 급여를 10%인상하기
select sal * 1.1 "인상급여" from emp999;
update emp999
	set sal = sal*1.1;
	
-- 모든 사원의 입사일 현재일로 수정하기(sysdate)
update emp999
	set hiredate = sysdate;

--실습 professor에서 직급이 assistant professor인 사림의 보너스를 200으로 인상하기
create table professor1 as select * from professor;
select * from professor1;

update professor1
	set bonus = 200
	where position = 'assistant professor';

--실습 professor에서 sharon stoen과 직급이 동일한 교수들의 급여를 15%인상하기 where position = (select from professor where name 셔론스톤의 position)
	select * from professor1;
	update professor1
		set pay = pay * 1.15 
		 where position = (select position from professor1 where name = 'Sharon Stone');
		 
	/*
	delete 
	테이블에서 특정 조건의 자료를 삭제
	행단위로 삭제(열만 삭제 할 수 없다)
	문법 
	
	delete from 테이블명
		where 조건절
	*/
	
	select * from PROFESSOR1;
	delete from PROFESSOR1;
	
create table professor2 as select * from professor;
select * from professor2;

select * from dept2;

--실습 부서코드가 9000인 자료를 삭제
--부서코드가 9000이상인 자료를 삭제

delete from dept2
		where dcode = 9000;
		
delete from dept2
 where decode >= 9000;
 
 /*
 merge
 여러개의 테이블을 한 개의 테이블로 병합 하는 명령
 문법
 
 merge into 병합할 테이블명
		using 테이블1 on 병합할 조건 when matched then update set 업데이트할 명령
			delete where 조건절 when not matched then insert into values(...)
 */
 
 create table charge_01 (
	u_date varchar2(6)
	, cust_no number
	, u_time number
	);
	create table charge_02 (
	u_date varchar2(6)
	, cust_no number
	, u_time number
	);
	create table charge_03 (
	u_date varchar2(6)
	, cust_no number
	, u_time number
	);
	
	insert into charge_01 values('141001', 1000, 2, 1000);
	insert into charge_01 values('141001', 1001, 2, 1000);
	insert into charge_01 values('141001', 1002, 2, 1000);
	
	insert into charge_02 values('141002', 1000, 3, 1500);
	insert into charge_02 values('141002', 1001, 4, 2000);
	insert into charge_02 values('141002', 1003, 1, 500);
	
	select * from charge_01
	union all
	select * from charge_02;
	
	select * from charge_03;
	
	--charge_01 ~ charge_03 
	merge into charge_03 tot
			using charge_01 c01 on (tot.u_date = c.01.u.date)
			when matched then update set tot.cust_no = c01.cust_no
			when not matched then insert values(c01.u_date, c01.cust_no, c01_u_time, c01.charge);
			
-- charge02 + charge_03
merge into charge_03 tot
			using charge_02 c01 on (tot.u_date = c.02.u_date)
			when not matched then insert values(c02.u_date, c02.cust_no, c02_u_time, c02.charge);
			
-- transaction
-- 실무에서는 간단한 sql작업을 하는 것이 아니라 대부분이 여러가지 작업을 동시체 처리하게 되는데
--처리 도중에 에러가 발생될 경우 이전 실행 작업을 취소해야 할 필요가 있게된다.'
-- 에러가 없을 경우애는 최종적으로 작업을 확정하게 되는데 이런 작업을 취소 또는 확정하게 하는 명령이
--rollback, commit이다

--rollback : 확정되지 않은 이전 작업을 취소하는 명령
--commit : 작업을 최종적으로 확정하는 명령

--실습카톡

--1번

select * from dept2;
insert into  dept2(dcode, dname, pdept,area)
		values(9010, 'temp_10', 1006, 'temp area');
		
--2번
insert into dept2(dcode, dname, pdept)
			values(9020, 'temp_20', 1006);
			
--3번


--4번
select * from professor;
update professor
 set bonus = 100
  where name = 'Sharon Stone';
