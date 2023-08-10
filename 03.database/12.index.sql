/*
 인덱스란?
 
 인덱스는 특정 데이터가 HDD의 어느 위치(메모리)에 저장되어 잇는지에 대한 정보를 가진 주소와 같은 개념이다.
 인덱스는 데이터와 위치주소(ROWID)정보를 key와 value의 형태의 한상으로 저장되어 관리된다.
 인덱스의 가장 큰 목적은 데이터를보다 빠르게 검색 or 조회할 수 있게 하기 위함이다.
 
 rowid구조
 
 rowid는 데이터의 위치정보 즉, HDD에 저장되어 잇는 메모리주소로서 오라클에서는 총 18Bytes길이의 정보이다.
 rowid는 예를 들어 AAAW5JAAAAFbAAA의 형태이다.
 1.데이터오브젝트번호(6): AAAWSj
 2.파일번호 (3):AAE
 3.block번호(6):AAAAFb
 4.row번호 (3):AAA
 
 index를 사용하는 이유
 
 1.데이터를 보다 신속하게 검색할 수 있게 하도록 사용(검색속도를 향상)
 2.보통 index테이블의 특정 컬럼에 한 개 이상을 주게 되면 index table이 별도로 생성된다.
	이 인덱스테이블에는 인덱스 컬럼의 row값과 rowid가 저장되고 row값은 정렬된 b-tree구조로
	저장시켜서 검색시에 보다 빠르게 데이터를 검색할 수 있게 한다.
	
	하지만, update, delete, insert시에 속도가 느려지는 단점이 있다.
	
 3.index를 필요한 이유
	
	1.데이터가 대용량일 때
	2.where 조건절에 자주 사용되는 컬럼일 경우
	3.조회결과 전체 데이터베이스의 3~5%미만일 경우 인덱스 검색이 효율적으로
		보다 적은 비용으로 빠르게 검색할 수 있다.
		

4.index가 필요하지 않은 경우

	1.데이터가 적을 경우(수천건 미만)에는 인덱스를 설정하지 않는 것이 오히려 성능에 좋다.
	2.검색보다 update, delete, insert가 빈번하게 일어나는 테이블에는 인덱스가 없는 게 오히려 좋을 수가 있다.
	3.조회결과 전체 행의 15%이상인 경우에는 사용하지 않는 것이 좋다.
	
5.index가 자동생성되는 경우
	
	인덱스가 자동생성되는 경우는 테이블정의시에 pk.uk의 제약조건으로 정의할 때 자동으로 생성된다.
	
6.문법

	1.생성방법: create [unique] index 인덱스명 on 테이블명(컬럼1,...컬럼n)
	2.삭제방법: drop index 인덱스명
			--> index는 테이블에 종속되어 있기 때문에 테이블이 삭제가 될 때 자동으로 삭제가 된다.


*/
select rowid, ename from emp;

--rowid 오라클 DB에서만 사용하는 개념으로 rowid를 검색할 수 있다.
--만약, rowid를 지원하지 않는 프로그램에서는 rowidtochar(rowid)함수를 이용해서 조회할 수 있다.
select rowid, ename from emp;
select rowidtochar(rowid), ename from emp;
select length(rowid) from emp;

select length(rowid) --7521데이터가 저장되어 있는 HDD의 메모리 주소
			, rowid
			,ename
			,empno
	from emp
	where empno=7521
	union all
	select length(rowid) 
			,rowid
			,ename
			,empno
	from emp
	where ename= 'WARD';
	
-- index 조회 ; data dictionary
select * from all_indexes; 
select * from user_indexes; 
select * from user_indexes where table_name = 'DEPT2';
select * from user_ind_columns where table_name = 'DEPT2';
select * from user_ind_columns where table_name = 'EMP';

-- index 생성(1) - unique index
create unique index idx_dept2_dname on dept2(dname);

-- index 생성(2) -  non unique index
select * from dept2;
create  index idx_dept2_area on dept2(area); 

--index 생성(3) - 결합인덱스
select ename, sal, job from emp where ename = 'SMITH' and job = 'CLERK';
select ename, sal, job from emp where job = 'CLERK' and ename = 'SMITH';
select count(*) from emp where ename = 'SMITH'
select count(*) from emp where job = 'CLERK';
select * from user_indexes



create index idx_emp_ename_job on emp(ename, job);
select * from user_indexes where table_name = 'EMP';
select * from user_ind_columns where table_name = 'EMP';


--index rebuilding하기
--index 생성
drop table idx;
create table idx_test(no number);
select * from idx_test;

--pl/sql
begin
for i in 1..100000 loop
	insert into idx_test values(i);
	end loop;
	commit;
end;

select count(*) from idx_test;

--인덱스 없이 조회하기
select * from idx_test order by no;
select * from idx_test where no = 9000;
--인덱스 생성후 조회하기
create unique index idx_test_no on idx_test(no);

select * from idx_test order by no;
select * from idx_test where 