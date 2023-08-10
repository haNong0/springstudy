/*
제약 조건
테이블에 정확한 데이터만 입력이 될 수 있도록 사전에 정의(제약)하는 조건을 말한다.
데이터가 추가 될 때 사전에 정의된 제약조건에 맞지 않는 자료는 db엔진에서 자전에 방지할 수 있게한다.

종류
not null 			(nn): null값이 입력되지 못하게 하는 조건
unique        (uk):uk로 설정된 컬럼에는 중복된 값을 허용하지 않는 조건
primary key   (pk): not null+ unique인 컬럼, pk는 테이블당 한 개의 pk만 저으이가능
										pk는 한 개 이상의 컬럼을 묶어서 한개의 pk로 지정할 수 있다.
forign key    (fk): 부모 테이블
check         (ck) : 설정된 값만 입력되게 하는 조건
*/
--테이블 생성시에 지정
--정식문법
create table new_emp_1 (
 no number(4) constraint emp_no_pk primary key
 , name varchar2(20) constraint new_emp_name_nn not null
 , ssn varchar2(13) constraint new_emp_jumin_uk unique
 , loc number(1)    constraint new_emp_loc_ck  not null
 , deptno varchar(6) constraint new_emp_deptno_fk  references dept2(dcode)
);
drop table new_emp_1;
--약식문법
create table new_emp_2 (
 no number(4)  primary key
 , name varchar2(2)  not null
 , ssn varchar2(13)  unique
 , loc number(1)      not null
 , deptno varchar(2)   references dept2(dcode)
);

--테이블에 설정된 제약조건 조회하기
--data distionary : xxx_constraints;
select * from all_constraints;
select * from user_constraints;
select * from all_constraints
	where table_name like'NEW_EMP%';
--실습 데이터 추가하기 (제약조건 테스트)
select * from new_emp_1;

insert into new_emp_1 values(1, '홍길동', '9804144455',1, 1010);
insert into new_emp_1 values(2, '홍길상', '8804144455',1, 1010);
insert into new_emp_1 values(3, '홍길녀', '7804144455',1, 1010);


--에러



--실습2. 제약조건 수정하기
select * from user_constraints where table_name = 'NEW_EMP2';

-- new_emp_2.name에 uk 제약조건을 추가
alter table NEW_EMP_2 add constraint emp_name_uk unique(name);
insert into new_emp_2 values(4, '손흥민', '9804144455',3, 1010);
insert into new_emp_2 values(5, '손승빈', '8804144455',3, 1010);
insert into new_emp_1 values(1, '홍길동', '9804144455',1, 1010);
insert into new_emp_1 values(2, '이강인', '7804144455',null, 1000);

select * from new_emp_2;

--new_emp_2.loc에 nn제약조건을 추가
-- 이미 데이터에 null값이 있을 경우 제약조건추가 불가, 단, null값이 없는 경우에는 제약조건 추가 가능
-- 이미 lock에는 check(loc < 5) 제약조건이 있는 경우 제약조건 추가불가, 따라서 추가가 아니라 수정(modify)으로 해야함
alter table enw_emp_2 add constraint emp_loc_nn not null(loc);
alter table enw_emp_2 modify(loc constraint emp_loc_nn not null);


--실습3. FK 설정하기
drop table c_test_1;
create table c_test_1 (
no number
, name varchar2(10)
, deptno number
);
drop table c_test_2;
create table c_test_2 (
no number
, name varchar2(10)
, deptno number
);
select * from c_test_1;
select * from c_test_2;

--primary key / foreign key
--FK는 참조테이블의 컬럼이 PK or UK인 컬럼만 FK로 정의할 수 있다.
alter table c_test_1 add constraint c_test_1_dept_fk foreign key(deptno) references c_test_2(deptno);

alter table c_test_2 add constraint c2_deptno_uk unique(deptno); -- unique 제약조건 추가
alter table c_test_1 add constraint c_test_1_dept_fk foreign key(deptno) references c_test_2(deptno);

select * from user_constraints
	where table_name like 'C_%';
	
	--FK제약사항 테스트하기
	insert into c_test_1 values(1, '손흥민', 10);
	insert into c_test_2 values(1, '인사부', 10);
	
--부모테이블인 c_test_2에서 10부서인 자료를 삭제할 경우는?
delete from c_test_2 where deptno = 10; --integrity constraint (SCOTT.C_TEST_1_DEPT_FK) violated - child record found

--부모자료를 삭제하려면 자식자료를 삭제한 후에 가능하다.
delete from c_test_1 where deptno = 10;

--FK관계에서 부모테이블 자료를 삭제할 수 있도록 정의하는 옵션
--cascade 옵션
-- 부모와 자식을 동시에 삭제 옵션
-- 부모는 삭제하고 자식에는 FK컬럼을 null로 업데이트 옵션
insert into c_test_1 values(1, '손흥민', 10);
insert into c_test_2 values(1, '인사부', 10);

alter table c_test_1 add constraint c1_deptno_fk foreign key(deptno) references c_test_2(deptno)
on delete cascade;

--부모자료 삭제(자식도 삭제)
delete from c_test_2 where deptno = 10;

--on delete set null : 부모자료 삭제할 경우 자식자료는 null값으로 변경

alter table c_test_2 add constraint c2_deptno_uk unique(deptno);
alter table c_test_1 add constraint c_test_1_dept_fk foreign key(deptno) references c_test_2(deptno);




