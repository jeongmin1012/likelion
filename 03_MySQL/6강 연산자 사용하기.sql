-- 컬럼과의 연산을 수행하면 해당 컬럼에 있는 각각의 데이터에 대해 각각 연산한 결과를 가져온다.

-- 모든 사원들의 급여를 1000씩 인상한다.
select salary, salary + 1000
from salaries;

-- 모든 사원들의 급여를 1000씩 인하한다.
select salary, salary-1000 from salaries;

-- 각 사원들의 급여를 10% 인상한 급여액을 가져온다. (1.1을 곱해주세요)
select salary, salary*1.1 from salaries;

-- 각 사원들의 직함을 중복되지 않게 가져온다.
select distinct title
from titles;

