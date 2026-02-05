-- d001 부서의 매니저 중에 1990년 01월 01일(포함) 이후부터 매니저인 사원의
-- 사원 번호, 부서 번호, 매니저 시작 날짜를 가져온다.

select emp_no, dept_no, from_date
from dept_manager
where dept_no = 'd001' and from_date >= '1990-01-01';

-- d001 부서 또는 d002 부서의 매니저 사원의 사원 번호, 부서 번호를 가져온다.
select emp_no, dept_no
from dept_manager
where dept_no = 'd001' or dept_no = 'd002';

-- d001 부서에 근무하지 않는 사원들의 사원번호와 근무 부서 번호를 가져온다.
select emp_no, dept_no
from dept_emp
where not dept_no = 'd001';

select emp_no, dept_no
from dept_emp
where dept_no <> 'd001';

-- 1990년 01월 01일 이후(포함)에 입사한 남자 사원의 사원 번호, 성별, 입사일을 가져온다.
-- 성별 컬럼이 M 면 남자, F 면 여자에 해당한다.
select emp_no, gender, hire_date from employees where gender='M' and hire_date>='1990-01-01'; 

-- 1990년 01월 01일 이후(포함)부터 60000 이상의 급여를 받은 사원의
-- 사원 번호, 급여, 급여 수령 시작 날짜를 가져온다.
select emp_no, salary, from_date from salaries where from_date >='1990-01-01' and salary>=60000;

-- 직함이 Staff인 사원이거나 Engineer 인 사원의 사원번호, 직함을 가져온다.
select emp_no, title from titles where title='Staff' or title='Engineer';

-- d003 부서의 매니저가 아닌 매니저의 사원번호, 부서 번호를 가져온다.
select emp_no,dept_no from dept_manager where dept_no<>'d003';

-- 현재 d001 부서에 근무하고 있는 사원들의 사원번호, 근무부서 번호를 가져온다.
-- employees 데이터베이스의 모든 테이블들은 to_date가 9999-01-01로 되어 있는 행들이
-- 현재를 의미한다. 
select emp_no, dept_no from dept_emp where dept_no='d001' and to_date='9999-01-01';

-- 현재 급여를 60000 이하(포함)로 받는 사원들의 사원번호와 급여액을 가져온다.
select emp_no,salary from salaries where to_date = '9999-01-01' and salary<=60000;

-- 급여가 60000이상 70000 이하인 사원들의 사원번호, 급여를 가져온다.
select emp_no, salary
from salaries
where salary >= 60000 and salary <= 70000;

-- 특정 컬럼의 값이 0000 이상이고 0000 이하인 조건은 between and로 사용할 수 있다.
select emp_no, salary
from salaries
where salary between 60000 and 70000;

-- d001 부서 또는 d002 부서 또는 d003 부서에 근부하고 있는 사원들의 사원번호, 부서번호를 가져온다.
select emp_no, dept_no
from dept_emp
where dept_no = 'd001' or dept_no = 'd002' or dept_no = 'd003';

-- 특정 컬럼의 값이 이거 이거나 이거 이거나 이거 이거나..하는 조건은 in 으로 바꿔 쓸 수 있다.
select emp_no, dept_no
from dept_emp
where dept_no in ('d001', 'd002', 'd003');

-- 특정 컬럼의 값이 이거 이거나 이거 이거나 이거 이거나..하는 조건은 in 으로 바꿔 쓸 수 있다.
select emp_no, dept_no
from dept_emp
where dept_no in ('d001', 'd002', 'd003');

-- d001 부서와 d002 부서의 사원이 아닌 사원들의 사원번호와 부서 번호를 가져온다.
select emp_no, dept_no
from dept_emp
where dept_no <> 'd001' and dept_no <> 'd002';

select emp_no, dept_no
from dept_emp
where not (dept_no = 'd001' or dept_no = 'd002');

select emp_no, dept_no
from dept_emp
where not dept_no in ('d001', 'd002');

-- 사원들의 사원번호와 급여액을 가져온다. 급여액은 1988년에 받은 급여액이다.
select emp_no, salary
from salaries
where from_date >= '1988-01-01' and from_date <= '1988-12-31';

select emp_no, salary
from salaries
where from_date between '1988-01-01' and '1988-12-31';