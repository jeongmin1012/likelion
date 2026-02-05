-- 데이터 베이스 생성
-- 복습때는 데이터 베이스는 좌측의 schemas의 데이터베이스 목록에서 
-- 삭제하고자 하는 데이터 베이스에서 우클릭하고 drop schema를 선택해서 데이터베이스를 삭제해주세요
-- 데이터 베이스를 삭제하는 명령어는 뒤에서 살펴보겠습니다
create database test_db2;

-- 데이터 베이스를 선택한다.
use test_db2;

-- 테이블을 만들어준다.
create table test_table1(
data1 int,
data2 varchar(100),
data3 float
);

desc test_table1;

-- 행을 추가한다.
-- insert into 테이블명 (컬럼 목록) values (데이터 목록)
insert into test_table1	(data1, data2, data3)
values (100, '문자열1', 11.11);

select * from test_table1;

-- 컬럼 목록은 순서가 정해져 있지 않는다.
-- 단 저장될 값들은 컬럼 순서에 1:1 매칭되서 저장되기 때문에
-- 컬럼의 순서에 맞게 값의 목록도 작성해줘야 한다.
insert into test_table1 (data3, data2, data1)
values (22.22, '문자열2', 200);

select * from test_table1;

-- 만약 모든 컬럼에 저장될 값을 지정할 경우에는 컬럼 목록을 생략할 수 있다.
-- 이 때, 값의 순서는 테이블을 만들때 설정한 컬럼의 순서(desc 테이블명 했을 때 나오는 순서)
-- 맞춰서 지정해야 한다.
insert into test_table1 
values (300, '문자열3', 33.33);

select * from test_table1;

-- 아래의 3개의 쿼리문은 오류가 날 수도 있다.
-- 저장하는 값보다 컬럼의 수가 부족할 경우...
insert into test_table1 (data1, data2)
values (400, '문자열4', 44.44);

-- 컬럼의 수 보다 저장하는 값의 수가 부족할 경우
insert into test_table1 (data1, data2, data3)
values (400, '문자열4');

-- 컬럼의 타입과 다른 타입의 값을 넣을 경우
insert into test_table1 (data1, data2, data3)
values ('문자열100', '문자열200', '문자열300');

-- 만약 문자열이지만 컬럼의 타입과 동일 형태의 글자로 구성된 문자열을 지정한다면
-- 값의 타입을 변환해서 저장해준다.
insert into test_table1 (data1, data2, data3)
values ('500', '문자열5', '11.11');

select * from test_table1;

-- 만약 테이블에 있는 컬럼들 중 일부를 빼고 저장한다면...
-- 목록에 없는 컬럼에는 null 값이 저장된다.
insert into test_table1 (data1, data2)
values (600, '문자열6');

select * from test_table1;

-- 수정
-- update 테이블 명 
-- set 컬럼명=값, 컬럼명=값, 컬럼명=값
-- where 조건절

-- where 조건절은 생략이 가능하다... 하!!!지!!!!만!!!!!!!!
-- 조건절은 무조건 따라 다닌다고 생각해주세요!!!!!!!!!!

-- 워크벤치로 작업 할 때는 update하고 delete를 사용할 경우
-- 반드시 primary key 가 설정되어 있는 조건절이 들어가 있어야 한다 (safe update mode)
-- 만약 이를 해제하고 테스트하고 싶다면.....(주의!!! 개발용 데이터 베이스를 사용할 때만 해제해주세요)
-- 설정 메뉴 > SQL Editor 클릭 > 하단에 있는 "Safe Updates"를 체크 해제한다. > 워크 벤치를 종료하고 다시 실행해준다.
update test_table1
set data2 = '새로운 문자열1', data3 = 99.00
where data1 = 100;

select * from test_table1;

-- 삭제
-- delete 테이블 명 where 조건절
delete from test_table1
where data1 = 100;

select * from test_table1;

-- 서브쿼리 활용
use employees;

create table employees3
as
select * from employees;

-- d005 부서에 근무하고 있는 모든 사원들의 정보를 삭제한다.
select emp_no
from dept_emp
where dept_no = 'd005';

-- 이를 조건절의 서브쿼리로 사용한다.
delete from employees3
where emp_no in (select emp_no
					from dept_emp
					where dept_no = 'd005' and
                    to_date = '9999-01-01');
                    
select * from employees3;