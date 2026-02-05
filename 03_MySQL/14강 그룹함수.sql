-- 그룹 함수
-- https://dev.mysql.com/doc/refman/9.5/en/aggregate-functions.html

-- select 를 통해서 가져온 데이터를 개발자가 정해준 그룹의 기준에 맞게 그룹으로 나눈다음
-- 각 그룹별 통계 값을 구하는 함수
-- 만약 그룹의 기준을 정해주지 않으면 가져온 데이터 전체가 하나의 그룹이 된다.

-- null 값 : 테이블 안에는 비어있는 곳은 존재하지 않는다. 모든 행 모든 컬럼안에는 항상
-- 데이터가 저장되어 있어야 한다. 만약 저장할 값이 아직 없다면 null 값을 저장한다.
-- null 값은 없다 혹은 무한대 등을 의미한다.

-- 그룹함수는 null값을 제외하고 계산을 한다.

-- 사원의 수를 구한다.
-- employees 테이블 안에는 사원 한명의 데이터를 하나의 행으로 구성하여 저장되어 있다.
-- 이에 행의 개수가 사원의 수가 된다. 이처럼 select해서 가져온 결과에 대해
-- 모든 행의 개수를 구하고자 한다면 count 함수 내에 지정하는 컬럼명은 * 을 사용한다.
select count(*)
from employees;

-- 남자 사원의 수를 구한다.
select count(*)
from employees
where gender = 'M';

-- 현재 d005 부서에 근무하고 있는 사원들의 수를 구한다.
select count(*)
from dept_emp
where to_date = '9999-01-01' and dept_no = 'd005';

-- 현재 받고 있는 급여의 총합을 구한다.
select sum(salary)
from salaries
where to_date = '9999-01-01';

-- 현재 받고 있는 급여의 평균을 구한다.
select avg(salary)
from salaries
where to_date = '9999-01-01';

-- 현재 받고 있는 급여의 최대 급여액을 구한다.
select max(salary)
from salaries
where to_date = '9999-01-01';

-- 현재 받고 있는 급여의 최저 급여액을 구한다.
select min(salary)
from salaries
where to_date = '9999-01-01';