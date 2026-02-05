-- 사원의 번호와 급여를 가져온다. 급여를 기준으로 오름차순 정렬을 한다.
-- order by 컬럼명 asc : 지정한 컬럼에 저장되어 있는 값을 기준으로 행들을 오름차순 정렬 한다.
select emp_no, salary
from salaries
order by salary asc;

-- asc는 생략 가능하다.
-- 정렬의 기준은 asc나 desc를 넣어주는데 생략할 경우 asc가 된다.
select emp_no, salary
from salaries
order by salary desc;

-- 문자열 컬럼도 정렬이 가능하다.
-- 사원의 번호와 first_name을 가져온다. first_name을 기준으로 오름차순 정렬한다.
select emp_no, first_name
from employees
order by first_name asc;

select emp_no, first_name
from employees
order by first_name;

select emp_no, first_name
from employees
order by first_name desc;

-- 날짜 역시 가능하다.
select emp_no, hire_date
from employees
order by hire_date asc;

select emp_no, hire_date
from employees
order by hire_date;

select emp_no, hire_date
from employees
order by hire_date desc;

-- 사원이 근무하고 있는 사원 번호와 부서 번호를 가져온다.
-- 부서 번호를 기준으로 오름 차순 정렬을 하고 사원 번호를 기준으로 내림 차순 정렬을 한다.
-- 정렬의 기준이 다수일 경우 첫 번째 컬럼을 기준으로 정렬을 하고 첫 번째 컬럼의 값이 같은 것 끼리
-- 그룹을 묶은 후 그 안에서 각각 두 번째 기준으로 정렬을 한다..
select emp_no, dept_no
from dept_emp
order by dept_no, emp_no desc;