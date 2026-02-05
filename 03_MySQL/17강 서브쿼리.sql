-- 서브 쿼리
-- 쿼리문 안에 들어가는 쿼리문
-- 쿼리문을 작성할 때 쿼리문에 들어가는 값을 구해야 하는 경우 그 값을 구하는 쿼리문을 쿼리문안에 작성하는 개념alter

-- 현재 받는 급여의 평균보다 많이 받는 사원들의 사원번호, 현재 급여액을 가져온다.

-- step1)
-- 조건에 들어가는 현재 받는 급여의 평균보다 많다라는 조건에서 현재 받는 급여액의 평균이 얼마인지 알 수가 없다.
-- 그래서 일단 현재 받는 급여의 평균 금액을 임의의 값으로 정해놓고 쿼리문을 만든다.
select emp_no, salary
from salaries
where to_date = '9999-01-01' and salary > 100000;

-- step2)
-- 현재 받는 급여의 평균 금액을 구하는 쿼리문을 만든다.
select avg(salary)
from salaries
where to_date = '9999-01-01';

-- step3)
-- step1에서 만든 쿼리문에 임의로 지정한 평균 급여액을 step2에서 만든
-- 쿼리문으로 변경해준다.
select emp_no, salary
from salaries
where to_date = '9999-01-01' and salary > (select avg(salary)
											from salaries
											where to_date = '9999-01-01');
                                            
-- 현재 d001 부서에 근무하고 있는 사원들의 사원번호와 first_name 을 가져온다.
select a.emp_no,a.first_name from employees a, dept_emp b where a.emp_no = b.emp_no and b.dept_no = 'd001' and b.to_date = '9999-01-01';

-- 1960년 01월 01일 이후에 태어난 사원들의 사원번호와 현재 근무하고 있는 부서 번호를 가져온다.
select a.emp_no,a.dept_no from dept_emp a,employees b where a.emp_no = b.emp_no and b.birth_date >='1960-01-01' and a.to_date = '9999-01-01';

-- d002 부서에 근무하고 있는 사원들이 받는 급여의 평균보다 더 많이 많는 사원들의 사원번호와 급여액을 가져온다.
select a.emp_no,a.salary
from salaries a, dept_emp b
where a.emp_no = b.emp_no and b.to_date = '9999-01-01' and a.to_date = '9999-01-01' and a.salary>(select avg(a.salary)
																						from salaries a, dept_emp b
																						where b.emp_no = a.emp_no and b.dept_no = 'd002' and b.to_date = '9999-01-01');

-- 직함에 Engineer가 들어가는 사원들의 받는 최저 급여액 보다 더 낮은 급여를 받는 사원들의 사원번호와 급여액을 가져온다.
select emp_no, salary
from salaries
where to_date='9999-01-01' and (select min(b.salary)
		from titles a, salaries b
        where a.title like '%Engineer%' and a.emp_no = b.emp_no and a.to_date='9999-01-01' and b.to_date='9999-01-01')>salary;
        


-- ------------------------
-- Teacher's Version
-- ------------------------

-- 현재 d001 부서에 근무하고 있는 사원들의 사원번호와 first_name 을 가져온다
select emp_no, first_name
from employees
where emp_no in (10001, 10002, 10003);

select emp_no
from dept_emp
where to_date = '9999-01-01' and dept_no = 'd001';

select emp_no, first_name
from employees
where emp_no in (select emp_no
from dept_emp
where to_date = '9999-01-01' and dept_no = 'd001');

select a1.emp_no, a1.first_name
from employees a1, dept_emp a2
where a1.emp_no = a2.emp_no and a2.to_date = '9999-01-01' and a2.dept_no = 'd001';

-- 1960년 01월 01일 이후에 태어난 사원들의 사원번호와 현재 근무하고 있는 부서 번호를 가져온다.
select emp_no, dept_no
from dept_emp
where to_date = '9999-01-01' and emp_no in (10001, 10002, 10003);

select emp_no
from employees
where birth_date >= '1960-01-01';

select emp_no, dept_no
from dept_emp
where to_date = '9999-01-01' and emp_no in (select emp_no
											from employees
											where birth_date >= '1960-01-01');
                                            
-- d002 부서에 현재 근무하고 있는 사원들이 받는 급여의 평균보다 더 많이 많는 사원들의 사원번호와 현재 급여액을 가져온다.
select emp_no, salary
from salaries
where to_date = '9999-01-01' and salary > 100000;

select avg(salary)
from salaries
where to_date = '9999-01-01' and emp_no in (10001, 10002, 10003);

select emp_no
from dept_emp
where dept_no = 'd002' and to_date = '9999-01-01';

select emp_no, salary
from salaries
where to_date = '9999-01-01' and salary > (select avg(salary)
		from salaries
		where to_date = '9999-01-01' 
        and emp_no in (select emp_no
					from dept_emp
					where dept_no = 'd002' and to_date = '9999-01-01'));

-- 직함에 Engineer가 들어가는 사원들의 받는 최저 급여액 보다 더 낮은 급여를 받는 사원들의 사원번호와 급여액을 가져온다.
select emp_no, salary
from salaries
where to_date = '9999-01-01' and salary < 100000;

-- 현재 직함에 Enigneer가 들어가는 사원들이 현재 받는 급여의 최저액보다 더 낮은 급여액을 구하는 쿼리문
-- 현재 직함에 Enigneer가 들어가는 사원들이 누구인지 모르므로 사원번호를 임의로 정해준다.
select min(salary)
from salaries
where to_date = '9999-01-01' and emp_no in (10001, 10002, 10003);

-- 현재 직함에 Enigneer가 들어가는 사원들이 누구인지 모르므로 사원번호를 구한다.
select emp_no
from titles
where to_date = '9999-01-01' and title like '%Engineer%';

-- 이제 합쳐준다.
select emp_no, salary
from salaries
where to_date = '9999-01-01' and salary < (select min(salary)
		from salaries
		where to_date = '9999-01-01' and emp_no in (select emp_no
			from titles
			where to_date = '9999-01-01' and title like '%Engineer%'));
