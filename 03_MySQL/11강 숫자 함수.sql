-- 숫자값이 저장되어 있는 컬럼에 대해 연산을 수행할 수 있는 함수
-- https://dev.mysql.com/doc/refman/9.5/en/mathematical-functions.html

-- 절대값
select abs(100), abs(-100);

-- 소수점 이하 올림
select ceil(10), ceil(10.1), ceil(10.4), ceil(10.5), ceil(10.8);

-- 소수점 이하 버림
select floor(10), floor(10.1), floor(10.4), floor(10.5), floor(10.8);

-- 반올림
select round(10), round(10.1), round(10.4), round(10.5), round(10.8);

-- 반올림은 자리수를 설정할 수 있다.
-- 자리수를 정하지 않으면 소수점 이하 첫 번째 자리가 기준이 된다.
select round(166.555);

-- 자리수를 양수로 지정한다면..
-- 해당 자리에 해당하는 소수점 이하값을 기준으로 반올림한다.
-- 소수점 이하 첫 번째 자리가 0이며 1씩 증가하는 순서 값이다.
select round(166.555, 1);

-- 자리수를 음수로 지정한다.
-- 정수자리를 기준으로 반올림 하게된다.
select round(166.555, -1);

-- 버림
-- truncate 는 두 번째 매개변수에 기준 자리를 넣어 줄 수 있는데
-- 생략이 불가능하다. 0 이면 소수점 이하 첫 번째 자리이고 그 이하는 양수, 그 이전은 음수로 표현한다.
select truncate(166.555, 0), truncate(166.555, 1), truncate(166.555, -1);

-- x의 y승
select pow(10, 2);

-- 나머지 구하기
select mod(10, 3);

-- 최대 숫자
select greatest(10, 4, 20, 1);

-- 최소 숫자
select least(10, 4, 20, 1);

-- 사원들의 사원 번호와 급여를 가져온다.
-- 급여는 10% 인상된 급여를 가져오며 소수점 이하는 올린값, 버린값, 반올림한 값으로 가져온다.
select  emp_no, salary, salary * 1.1, ceil(salary * 1.1), floor(salary * 1.1),
		truncate(salary * 1.1, 0), round(salary * 1.1)
from salaries
where to_date = '9999-01-01';