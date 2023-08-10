/* dml
	insert : 테이블에 데이터 추가
	update : 테이블에 데이터 수정
	delete : 테이블에 데이터를 삭제
	merge   : 2개이상의 테이블을 한개의 테이블로 병합
DQL : select
*/

/*
테이블에 새로운 행(row, record)를 추가할 때 사용하는 명령
테이블에 새로운 데이터를 입력(추가)하기 위한 데이터조작어
문법

	insert into 테이블명 (컬럼1...컬럼n) values(값1...값n);
	insert into xpdlqmfaud values(값1..값n);
	서브쿼리를 이용해서 기존 테이블에 데이터를 추가하는 방법
	....insert into 테이블명 select 컬럼1...컬럼n 테이블명 where...
	...동일 갯수, 동일 순서, 동일데이터타입일 경우에 사용가능
	insert all
				when 조건 then into
				when 조건 then into
	insert all
				into 테이블명 values()
				into 테이블명 values()
				
	레코드 추가
	실습1. dept2에 부서번호 9000, 부서명= 테스트부서_1, 상위부서=1006, 지역=기타지역
	실습2. dept2에 부서번호 9002, 부서명= 테스트부서_2, 상위부서=1006, 지역=기타지역
*/
select * from dept2;
insert into dept2 values(dcode = 9000, dname= '테스트부서_1', pdept= 1006, area= '기타지역');
insert into dept2 values(dcode = 9000, dname= '테스트부서_2', pdept= 1006, area= '기타지역'); --오류
insert into dept2(dcode, dname, pdept, area) values(9000, '테스트부터1', 1006, '기타지역');

--실습2. professor에 교수번호= 5001 , 교수명 = 홍길동,  id=hong postion = 정교수 급여= 510 입사일= 오늘
 select * from professor; 
insert into professor(profno, name, id, position, pay, hiredate) values(5001, 홍길동, hong, 정교수, 510, sysdate);

--실습3.
--professor의 구조만 복사해서 professor4
--profno profno>4000 보다 큰교수만 professor4에 추가
create table professor4 as
select * from professor where 1=2;

insert into professor4;
select * from profesoor4 select * from professor where profno > 4000;



--실습4.
--professor을 기준으로 prof_3과 prof_4테이블을 생성
--각각 profno, name varchar2(25), number 의 2개의 컬럼만 존재하는 테이블 생성
-- prof-3에는 1000~1999번까지의 교수만
-- prof-4에는 2000~2999번까지의 교수만 복사
create table prof_3(profno number, name varchar2(25));
create table prof_4 as select * from prof_3 where 1=2;

insert into prof_3 select profno, name from professor where profno between 1000 and 1999;
insert into prof_4 select profno, name from professor where profno between 2000 and 2999;


--insert all(1)
drop table prof_3;
drop table prof_4;

create table prof_3(profno number, name varchar2(25));
create table prof_4 as select * from prof_3 where 1=2;

insert all
				when profno between 1000 and 1999 then into prof_3 values(profno, name);
				when profno between 2000 and 2999 then into prof_4 values(profno, name);
--insert all(2)
--동일 자료를 각각 다른 테이블에 추가하는 방법
drop table prof_3;
drop table prof_4;

create table prof_3(profno number, name varchar2(25));
create table prof_4 as select * from prof_3 where 1=2;


insert all
				into prof_3 values(profno, name)
				into prof_4  values(profno, name)
				select profno, name from professor
				where profno between 3000 and 3999;


	