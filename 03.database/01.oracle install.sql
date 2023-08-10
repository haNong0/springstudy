/* 오라클 기본 date형식 변경하기*/
-- 1.오라클 환경변수 조회하기
select * from v$NLS_PARAMETERS

-- 2.날짜형식 변경하기
-- alter session[system] set 시스템변수= 변경할 값
select * from hr.employees;

alter session set nls_date_format ='yyyy.mm.dd';  
-- dateformat 변경
alter session set nls_timestamp_format ='yyyy.mm.dd hh:mi:ss';
--  time stamp dateformat 변경

-- 영구적(system 레벨)
alter system set nls_date_format = 'YYYY.MM.DD' scope=spfile; 
alter system set nls_date_format = 'YYYY.MM.DD HH:MI:SS' scope=spfile; 
-- scope
-- 1.both : 바로 적용or 재시작(에러확률높음)
-- 2.spfile: 재시작
-- --3.sql command line에서 system사용자로 변경후 db재시작
select * from hr.employees;