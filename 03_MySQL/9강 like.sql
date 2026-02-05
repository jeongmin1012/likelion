-- first_name이 Tommaso 인 사원의 사원번호, first_name을 가져온다.
select emp_no, first_name
from employees
where first_name = 'Tommaso';

-- 이름의 첫 글자가 A로 시작하는 사원의 사원번호, 이름을 가져온다.
select emp_no, first_name
from employees
where first_name like 'A%';

-- first_name의 마지막 글자가 s로 끝나는 사원의 사원번호와 이름을 가져온다.
select emp_no, first_name from employees where first_name like '%s';

-- 이름의 두 번째 글자가 i 인 사원의 사원번호, 이름을 가져온다.
select emp_no, first_name from employees where first_name like '_i%';

-- 이름이 5글자인 사원들의 사원번호, 이름을 가져온다.
select emp_no, first_name from employees where first_name like '_____';

-- 직함이 Senior 등급인 모든 사원들의 사원 번호와 직함을 가져온다.
select emp_no,title from titles where title like 'Senior%';

-- Engineer 계열의 직함을 가진 모든 사원들의 사원 번호와 직함을 가져온다.
select emp_no,title from titles where title like '%Engineer';