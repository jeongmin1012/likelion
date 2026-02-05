-- 현재 d001 부서와 d002 부서에 근무하고 있는 사원들의 사원번호, 근무 부서 번호를 가져온다.
select emp_no, dept_no from dept_emp where dept_no in('d001','d002') and to_date = '9999-01-01';

-- 과거에 d003 부서에 근무한 적이 있는 모든 사원들의 사원번호와 근무 종료일을 가져온다(현재는 포함하지 않는다)
select emp_no, to_date from dept_emp where dept_no = 'd003' and to_date<>'9999-01-01';

-- 현재 매니저를 담당하고 있는 사원들의 사원 번호와 근무 부서 번호를 가져온다.
select emp_no, dept_no from dept_manager where to_date = '9999-01-01';

-- d003 부서에서 매니저를 담당적이 있던 모든 사람들의 사원번호와 매니저 종료일을 가져온다(현재는 포함하지 않는다)
select emp_no,from_date from dept_manager where dept_no='d003' and to_date<>'9999-01-01';

-- 1960년대에 태어난 사원들의 사원번호 생년월일을 가져온다.
select emp_no, birth_date from employees where birth_date like '196%';

-- 입사일이 1980년 01월 01일 이후(포함)인 사원들 중에 여자 사원들의 사원번호, 입사일, 성별을 가져온다.
select emp_no, hire_date, gender from employees where hire_date>='1980-01-01' and gender='F';

-- first_name이 Mary인 사원들과 Chirstian 인 사원들의 사원 번호와 last_name을 가져온다.
select emp_no, last_name from employees where first_name in ('Mary','Chirstian');

-- 현재 받고 있는 급여가 100000 이상인 사원들의 사원 번호와 급여액을 가져온다.
select emp_no,salary from salaries where salary >=100000 and to_date = '9999-01-01';

-- 현재 받고 있는 급여가 100000 이하인 사원들의 사원 번호와 급여액을 가져온다.
select emp_no,salary from salaries where salary <=100000 and to_date = '9999-01-01';

-- 현재 받고 있는 급여가 100000 이상 200000 이하인 사원들의 사원 번호와 급여액을 가져온다.
select emp_no,salary from salaries where salary between 100000 and 200000 and to_date = '9999-01-01';

-- 현재 직함이 Staff 이거나 Engineer 이거나 Manager인 사원들의 사원번호와 직함을 가져온다.
select emp_no, title from titles where title in ('Staff','Engineer','Manager')  and to_date = '9999-01-01';

-- 현재 직함에 Senior가 들어가 있는 사원들의 사원번호와 직함을 가져온다.
select emp_no,title from titles where title like '%Senior%' and to_date = '9999-01-01';

-- 현재 직함에 Engineer가 들어가 있는 사원들의 사원번호와 직함을 가져온다.
select emp_no,title from titles where title like '%Engineer%' and to_date = '9999-01-01';