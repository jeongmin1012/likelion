-- 제약조건
-- 테이블을 만들때 각 컬럼에 설정하는 것.
-- 컬럼에 저장될 데이터에 대한 제한을 걸어 데이터의 무결성을 보장하기 위한 장치

create database test_db6;

use test_db6;

-- 제약조건
-- 테이블을 만들때 각 컬럼에 설정하는 것.
-- 컬럼에 저장될 데이터에 대한 제한을 걸어 데이터의 무결성을 보장하기 위한 장치

-- not null
-- 컬럼에 null 값이 저장되지 않도록 하는 제약조건
-- not null이 설정되어 있는 컬럼에는 저장될 값을 개발자가 반드시 지정해줘야 한다.

create table test_table1(
data1 int,
data2 int not null
);

desc test_table1;

-- 모든 컬럼에 저장할 값을 지정해준다.
insert into test_table1 (data1, data2) values (100, 200);
select * from test_table1;

-- not null이 없는 (즉, null을 허용하는) 컬럼을 생략한다
insert into test_table1(data2) values (201);
select * from test_table1;

-- not null이 있는 (즉, null을 허용하지 않는) 컬럼을 생략한다.
insert into test_table1(data1) values (102);
select * from test_table1;

-- not null이 있는 컬럼에 null 값을 직접 지정한다.
insert into test_table1(data1, data2) values (103, null);
select * from test_table1;

-- 기본값
-- 지정된 컬럼에 null 값이 저장되려고 할 때 대신 넣어주는 값
-- 사실 default는 null과 관계가 없다. 해당 컬럼이 null을 허용하든 허용하지 않든
-- 컬럼을 생략하고 insert할 때 null 대신 들어갈 값을 지정하는 것이다.
create table test_table2(
data1 int,
data2 int default 0,
data3 int not null default 0
);

-- 모든 컬럼에 값을 지정한다.
insert into test_table2 (data1, data2, data3) values (100, 200, 300);
select * from test_table2;

-- null을 허용하는 컬럼을 생략한다.
insert into test_table2 (data1, data3) values (101, 301);
select * from test_table2;

-- null을 허용하는 컬럼에 null을 지정한다.
insert into test_table2 (data1, data2, data3) values (102, null, 302);
select * from test_table2;

-- null을 허용하지 않는 컬럼을 생략한다.
insert into test_table2 (data1, data2) values (103, 203);
select * from test_table2;

-- null을 허용하지 않는 컬럼에 null을 지정한다.
insert into test_table2 (data1, data2, data3) values (104, 204, null);
select * from test_table2;

-- -------------------------------------------------------------------------
-- primary key
-- 설정된 컬럼은 중복된 값을 저장할 수 없고 null을 허용하지 않는다.
-- indexing이 자동으로 설정되어 내용에 의한 검색을 수행할 때 다른 컬럼에 비해서 빨라진다.
-- 다른 테이블 혹은 같은 테이블의 컬럼들이 참조할 수 있다.
-- safe update 모드가 활성되어 있을 경우 update, delete의 조건절에는 primary key 컬럼을 사용한 조건만 작성할 수 있다.
-- 기타 등등

-- constraint 제약조건이름 primary key(컬럼이름)
create table test_table3(
data1 int,
data2 int,
constraint pk1 primary key(data1)
);

-- 모든 컬럼에 데이터를 저장한다.
insert into test_table3 (data1, data2)
values (100, 200);
select * from test_table3;

-- pk 컬럼에 중복된 데이터를 저장한다.
insert into test_table3 (data1, data2)
values (100, 201);

-- pk 컬럼을 생략한다.
insert into test_table3 (data2)
values (202);

-- null을 지정한다.
insert into test_table3 (data1, data2)
values (null, 203);

-- --------------------------------------------------
-- foregin key
-- 반드시 참조는 컬럼을 지정해야 한다.
-- 참조하기 위해 지정한 컬럼안에 저장되어 있는 데이터만 저장할 수 있다.
-- null을 허용하며 중복을 허용한다.
-- primary key 컬럼을 참조하며 DBMS 종류에 따라서는 pk 컬럼이 아니어도 참조가 가능하다.

-- constraint 제약조건이름 foreign key(컬럼명) references 테이블명(참조할컬럼명)
create table test_table4(
data100 int,
constraint fk1 foreign key(data100) references test_table3(data1)
);

-- 참조하고 있는 컬럼에 저장되어 있는 값을 저장한다.
insert into test_table4(data100) values (100);
insert into test_table4(data100) values (100);
select * from test_table4;

-- 참조하고 있는 컬럼에 저장되어 있지 않는 값을 저장한다.
insert into test_table4 (data100) values (200);

-- -----------------------------------------------------------
-- unique
-- 중복된 데이터를 허용하지 않는다.
-- null을 허용한다.
-- pk 컬럼과 성격이 다르다.

-- constraint 제약조건이름 unique(컬럼명)
create table test_table5(
data1 int,
constraint uq1 unique(data1)
);

insert into test_table5 (data1) values (100);
select * from test_table5;

-- 중복된 값 저장
insert into test_table5 (data1) values (100);

-- null 값은 중복해서 저장할 수 있다.
insert into test_table5 (data1) values (null);
insert into test_table5 (data1) values (null);
select * from test_table5;

-- ---------------------------------------------------------------
-- check 
-- 컬럼에 저장되는 값에 대한 조건을 설정한다.
-- constraint 제약조건이름 check (조건)
-- 조건은 sql 문에서 봤던 where 조건에 들어가는 식들(<, >, in , between and 등등)
create table test_table6(
data1 int,
data2 int,
data3 int,
-- data1에는 10, 20, 30 중에 하나만 담을 수 있다
constraint chk1 check (data1 in (10, 20, 30)),
-- data2에는 10보다 큰 값만 담을 수 있다.
constraint chk2 check (data2 > 10),
-- data에는 100 이상 200 이하의 값만 담을 수 있다.
constraint chk3 check (data3 between 100 and 200)
);

-- 모든 조건에 만족하는 값들
insert into test_table6 (data1, data2, data3) values (20, 50, 150);
select * from test_table6;

-- chk1 위배
insert into test_table6 (data1, data2, data3) values (50, 50, 150);

-- chk2 위배
insert into test_table6 (data1, data2, data3) values (20, 5, 150);

-- chk3 위배
insert into test_table6 (data1, data2, data3) values (20, 50, 250);