-- 현재 d001 부서에 근무하고 있는 사원들의 수를 가져온다.
select count(*) from dept_emp where dept_no ='d001' and to_date = '9999-01-01';

-- first_name이 Georgi인 사원들의 수를 구한다.
select count(*) from employees where first_name = 'Georgi';

-- 1990년대에 고용된 여자 사원들의 수를 구한다.
select count(*) from employees where gender = 'F' and hire_date like '199%';

-- 1960년대에 태어난 남자 사원들의 수를 구한다.
select count(*) from employees where birth_date like '196%';

-- 현재 100000 이상의 급여를 받는 사원들의 급여 평균을 구한다.
select avg(salary) from salaries where salary >= 100000 and to_date = '9999-01-01';

-- 현재 100000 미만의 급여를 받는 사람들의 급여 총합을 구한다.
select sum(salary) from salaries where salary < 100000 and to_date = '9999-01-01' ;

-- 현재 받고 있는 급여의 최고액과 최저액을 가져온다.
select max(salary),min(salary) from salaries where to_date = '9999-01-01';

-- ------------------------------------
-- Teacher's Version
-- ------------------------------------

-- 현재 d001 부서에 근무하고 있는 사원들의 수를 가져온다.
select count(*)
from dept_emp
where to_date = '9999-01-01' and dept_no = 'd001';

-- first_name이 Georgi인 사원들의 수를 구한다.
select count(*)
from employees
where first_name = 'Georgi';

-- 1990년대에 고용된 여자 사원들의 수를 구한다.
select count(*)
from employees
where (hire_date between '1990-01-01' and '1999-12-31') and gender = 'F';

-- 1960년대에 태어난 남자 사원들의 수를 구한다.
select count(*)
from employees
where (birth_date between '1960-01-01' and '1960-12-31') and gender = 'M';

-- 현재 100000 이상의 급여를 받는 사원들의 급여 평균을 구한다.
select avg(salary)
from salaries
where to_date = '9999-01-01' and salary >= 100000;

-- 현재 100000 미만의 급여를 받는 사람들의 급여 총합을 구한다.
select sum(salary)
from salaries
where to_date = '9999-01-01' and salary < 100000;

-- 현재 받고 있는 급여의 최고액과 최저액을 가져온다.
select max(salary), min(salary)
from salaries
where to_date = '9999-01-01';


