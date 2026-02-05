-- 트랜젝션
-- 물리적인 디스크에 반영하기 전까지의 작업단위를 의미한다.
-- 데이터베이스에 접속하거나 트랜젝션을 종료시키면 새로운 트랜젝션이 발생한다.
-- 트랜젝션을 종료시키는 명령어를 사용하면(명령어 뜻은 허용한다, 반영한다를 뜻하는 commit)
-- 트랜젝션내의 모든 작업들을 물리적인 저장소에 반영을하고 트랜젝션을 종료한다.
-- commit된 트랜젝션을 되돌 수 없다.

-- use employees;

-- create table emp100
-- as 
-- select * from employees;
-- ------------------------------
-- drop database test_db3;

-- create database test_db3;

-- use test_db3;

-- create table test_table1(
-- data1 int,
-- data2 int
-- );

-- desc test_table1;

-- insert into test_table1 (data1, data2) values (100, 200);
-- insert into test_table1 (data1, data2) values (101, 201);

-- select * from test_table1;

-- 워크벤치는 auto commit 이 기본적으로 활성화 되어 있다.
-- 이에 insert, update, delete를 하면 commit 이 자동으로 수행되어 매번 물리적인 디스크에 반영된다.
-- 트랜젝션 테스트를 위해서는 auto commit을 비활성화 해야 한다.
-- 설정 메뉴 > SQL Editor > SQL Execution > "New connections use auto commit mode"를 
-- 비활성화하고 워크벤치를 종료하고 다시 실행해준다.

-- 테스트용 데이터베이스와 테이블 생성한다.
create database test_db5;

use test_db5;

create table test_table1(
data1 int,
data2 int
);

-- 데이터를 추가, 수정, 삭제 등의 작업을 한다.
insert into test_table1 (data1, data2) values (100, 200);
insert into test_table1 (data1, data2) values (101, 201);
select * from test_table1;

update test_table1 set data2 = 2000 where data1 = 100;
select * from test_table1;

delete from test_table1 where data1 = 100;
select * from test_table1;

-- 트랜젝션을 취소한다.
-- 지금까지 했던 메모리상에서의 작업이 모두 소멸된다.
rollback;

select * from test_table1;

-- 데이터를 추가, 수정, 삭제 등의 작업을 한다.
insert into test_table1 (data1, data2) values (100, 200);
insert into test_table1 (data1, data2) values (101, 201);
select * from test_table1;

update test_table1 set data2 = 2000 where data1 = 100;
select * from test_table1;

delete from test_table1 where data1 = 100;
select * from test_table1;

-- 현재의 트랜젝션을 종료한다. 이 때, 물리적인 디스크에 반영한다.
commit;
select * from test_table1;
-- rollback을 해본다.
rollback;
select * from test_table1;

-- savepoint : rollback 지점을 설정할 수 있다
delete from test_table1;

select * from test_table1;
commit;

-- 데이터를 추가, 수정, 삭제 등의 작업을 한다.
insert into test_table1 (data1, data2) values (100, 200);
insert into test_table1 (data1, data2) values (101, 201);
select * from test_table1;

savepoint a1;

update test_table1 set data2 = 2000 where data1 = 100;
select * from test_table1;

delete from test_table1 where data1 = 100;
select * from test_table1;

-- savepoint 위치를 지정하여 rollback
rollback to a1;

select * from test_table1;

-- truncate 테이블명 : 테이블 내의 모든 데이터를 삭제한다. 트랜젝션과 관련없이 물리적인
-- 디스크에 데이터를 삭제한다.
-- rollback이 불가능하다.

commit;

select * from test_table1;

delete from test_table1;
select * from test_table1;

rollback;
select * from test_table1;

truncate test_table1;
select * from test_table1;

rollback;
select * from test_table1;