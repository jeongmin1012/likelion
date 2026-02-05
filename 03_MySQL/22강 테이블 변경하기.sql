
create database test_db3;

use test_db3;

create table test_table1(
data1 int,
data2 varchar(100),
data3 float
);

desc test_table1;

-- 테이블 이름 변경
show tables;

rename table test_table1 to test_table2;
show tables;

-- 컬럼 수정
-- 컬럼의 이름을 변경하는 것은 따로 있다
-- 컬럼의 타입을 변경하는 목적으로 사용한다. (주의!! 데이터 유실이 발생할 수 있다)
desc test_table2;
alter table test_table2 modify data2 varchar(500);
desc test_table2;

-- 컬럼 이름 수정
-- 데이터 타입도 적어워야 한다.. (주의!! 타입등을 변경하면 데이터 유실이 발생할 수 있다)
desc test_table2;
alter table test_table2 change data1 data10 int;
desc test_table2;

-- 컬럼 추가
-- 주의 : null값이 모두 채워진 형태로 추가된다.
desc test_table2;
alter table test_table2 add data4 int;
desc test_table2;

-- 컬럼 삭제
-- 주의 : 컬럼내에 있던 모든 데이터도 삭제된다.
desc test_table2;
alter table test_table2 drop data4;
desc test_table2;

-- 테이블 삭제
-- 테이블 삭제시 물리적인 저장장치에서 삭제 되지 않는다.
-- 이는 실수로 테이블을 제거하는 것을 예방하기 위함이다.
-- system 계정으로 접속하면 복구가 가능하다.
-- 테이블을 삭제하게 되면 실제로는 테이블의 이름을 DBMS가 임의로 변경하고
-- 현재 계정에서 이 테이블에 접근할 수 있는 권한을 박탈시킨다.
-- system 계정을 통해 영구 삭제가 가능하다.
show tables;
drop table test_table2;
show tables;

-- 데이터 베이스 삭제
-- 데이터 베이스 삭제시 즉시 물리적인 저장장소에서 삭제된다. 
-- 데이터 베이스 제품군에 버전에 따라 다를 수 있다.
show databases;
drop database test_db3;
show databases;