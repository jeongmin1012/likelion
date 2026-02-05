-- 사원들의 모든 정보를 가져온다.
-- 키워드 작성 (select, from) -> 테이블 명 -> 컬럼 목록
select * from employees;

-- 부서 정보를 모두 가져온다.
select * from departments;

-- 부서 관리자 정보를 모두 가져온다.
select * from dept_manager;

-- 사원들의 직함 정보를 모두 가져온다.
select * from titles;

-- 원하는 컬럼 목록을 지정하면 그 컬럼의 데이터만 가져온다.
-- 만약 없는 컬럼명을 지정하면 오류가 발생한다.
-- 데이터를 가져올 때 작성한 컬럼 목록 순서대로 데이터를 가져오며
-- 모든 컬럼을 뜻하는 * 을 주면 테이블을 만들때 지정한 컬럼의 순서대로 데이터를 가져온다.

-- 사원들의 정보 중 사원번호, first_name 을 가져온다.
-- 정리부터 먼저하세요
-- select 사원번호, first_name
-- from
select emp_no, first_name from employees;

-- 사원의 사원번호와 생년월일, 성별을 가져온다.
select emp_no, birth_date, gender from employees;

-- 부서의 부서번호, 부서 이름을 가져온다.
select dept_no, dept_name from departments;

-- 각 사원의 사원번호, 급여액을 가져온다.
select emp_no, salary from salaries;

-- 각 사원의 사원번호, 직함 이름을 가져온다.
select emp_no, title from titles;

