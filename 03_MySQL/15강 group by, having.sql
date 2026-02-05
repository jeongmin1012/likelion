-- 사원의 수를 가져온다.
-- 그룹 함수를 사용할 때 그룹의 기준을 정해주지 않으면
-- select 를 통해 가져온 모든 행을 하나의 그룹으로 묶은 다음
-- 그룹함수 계산을 한다.
select count(*)
from employees;

-- 현재 각 부서에 근무하고 있는 사원들의 수를 구한다.
select dept_no, count(*)
from dept_emp
where to_date = '9999-01-01'
group by dept_no;

-- 각 부서별 과거의 매너저의 수를 구한다.
select dept_no, count(*)
from dept_manager
where to_date <> '9999-01-01'
group by dept_no;

-- having
-- group by를 통해 묶어진 그룹 중에서 사용할 그룹을 선택하는 조건

-- 현재 만명 이상이 사용하고 있는 직함의 이름과 직함별 사원의 수를 가지고 온다.
select title, count(*)
from titles
where to_date = '9999-01-01'
group by title
having count(*) >= 10000;

-- 현재 5만명이상 근무하고 있는 부서의 부서 번호와 부서 소속 사원의 수를 가져온다.
select dept_no, count(*)
from dept_emp
where to_date = '9999-01-01'
group by dept_no
having count(*) >= 50000;

-- 현재 50000만명 이상이 사용하고 있는 직함명과 사원의 수를 가져온다.
select title, count(*) from titles where to_date='9999-01-01' group by title having count(*)>=50000;

-- 같은 first_name이 200명 미만인 사람들의 first_name과 사원의 수를 가져온다.
select first_name,count(*) from employees group by first_name having count(*)<200;


-- ------------------------------------
-- Teacher's Version
-- ------------------------------------

-- 현재 50000만명 이상이 사용하고 있는 직함명과 사원의 수를 가져온다.
select title, count(*)
from titles
where to_date = '9999-01-01'
group by title
having count(*) >= 50000;

-- 같은 first_name이 200명 미만인 사람들의 first_name과 사원의 수를 가져온다.
select first_name, count(*)
from employees
group by first_name
having count(*) < 200;