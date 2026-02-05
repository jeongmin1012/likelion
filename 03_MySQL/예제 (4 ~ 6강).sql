-- 부서의 모든 정보를 가져온다.
select * from departments;

-- 매니저의 모든 정보를 가져온다.
select * from dept_manager;

-- 사원의 모든 정보를 가져온다.
select * from employees;

-- 사원의 번호와 사원의 급여액을 가져온다.
select emp_no, salary from salaries;

-- 사원 번호와 근무하고 있는 부서 번호를 가져온다.
select emp_no, dept_no from dept_emp;

-- 매니저 사원의 번호와 근무하고 있는 부서 번호를 가져온다.
select emp_no, dept_no from dept_manager;

-- 사원의 번호화 생년월일, 성별, 입사일을 가져온다.
select emp_no,birth_date, gender, hire_date from employees;

-- 사원의 번호와 급여액을 가져온다. 급여액은 2000씩 인상된 금액으로 가져온다.
select salary, salary+2000 from salaries;

-- 사원의 번호와 급여액을 가져온다. 급여액의 3배가 인상된 금액으로 가져온다.
select salary, salary+(salary*3) from salaries;

-- 사원읜 번호와 급여액을 가져온다. 급여액에서 3000씩 인하된 금액을 가져온다.
select salary, salary-3000 from salaries;

-- 사원의 번호와 급여액을 가져온다. 2000 인상된 급여액, 1000 인하된 급여액을 가져온다.
select salary, salary+2000,salary-1000 from salaries;