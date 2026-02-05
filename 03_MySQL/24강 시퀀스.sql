-- 시퀀스
-- 데이터를 insert 할 때 컬럼을 생략하면 1부터 1씩 증가되는 값이 저장되도록 할 수 있다.
-- mysql은 auto_increment라는 키워드를 사용한다.
-- mysql은 key 가 설정되어 있는 컬럼만 가능하며 primary key 컬럼에 붙혀줘야 한다.

-- 시퀀스의 사용 목적이 테이블내의 컬럼들 중 primary key로 지정할 컬럼이 없을 경우
-- 사용한다. (null을 허용하지 않고 중복을 허용하지 않는 컬럼)

create database test_db7;

use test_db7;

create table test_table1(
data1 int auto_increment,
data2 int,
constraint pk1 primary key (data1)
);

-- 시퀀스 컬럼을 생략하고 저장한다.
insert into test_table1 (data2) values (100);
insert into test_table1 (data2) values (101);
insert into test_table1 (data2) values (103);

select * from test_table1;