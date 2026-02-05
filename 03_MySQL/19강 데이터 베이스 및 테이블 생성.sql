-- 데이터 베이스를 생성한다.
-- 현재의 mysql 버전에서는 기본 인코딩셋이 utf8 이므로
-- 한글이 깨지지 않는다.
create database test_db;

-- 만약 과거의 버전 (예 : 5.X 버전)을 사용한다면 인코딩셋을 반드시 지정해줘야 한다.
-- create database test_db
-- character set = 'utf8'
-- collate = 'utf8_general_ci';

-- 데이터 베이스 선택
-- 좌측의 schemas에서 데이터 베이스를 더블클릭한다(워크벤치에서만 가능하다)
use test_db;

-- 테이블 생성하기
-- 자료형 : https://dev.mysql.com/doc/refman/9.5/en/data-types.html
create table test_table1(
data1 int,
data2 varchar(100),
date3 float
);

-- 테이블 정보 확인
desc test_table1;

-- 서브쿼리를 활용한 테이블 생성 실습을 위해 employees 데이터 베이스를 사용한다.
use employees;

-- 사원들의 사원번호, first_name, 현재 근무하고 있는 부서 이름, 현재 받고 있는 급여 정보를
-- 가지고 있는 테이블 emp_dept_salary를 만든다.

create table emp_dept_salary
as
select a1.emp_no, a1.first_name, a3.dept_name, a4.salary
from employees a1, dept_emp a2, departments a3, salaries a4
where a1.emp_no = a2.emp_no and a2.dept_no = a3.dept_no and a1.emp_no = a4.emp_no
      and a2.to_date = '9999-01-01' and a4.to_date = '9999-01-01';

select * from emp_dept_salary;

-- 테이블의 구조만 복사해서 새로운 테이블을 만들고 싶을때도 사용한다.
-- 서브쿼리에 모든 행에대해 거짓이 되는 조건을 달아주면
-- 행은 하나도 가져오지 못하지만 검색 결과를 전달해주기 때문에 컬럼 구조는 가져올 수 있다.
-- 이를 이용해 데이터 없이 구조만 복제하는 테이블을 만들 수 있다.
create table employees2
as
select * from employees where 1=0;

select * from employees2;