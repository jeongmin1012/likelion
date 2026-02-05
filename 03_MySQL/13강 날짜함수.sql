-- 날짜를 다루기위한 함수
-- https://dev.mysql.com/doc/refman/9.5/en/date-and-time-functions.html

-- 현재 날짜와 시간
select now(), sysdate(), current_timestamp();

-- 현재 날짜
select curdate(), current_date();

-- 현재 시간
select curtime(), current_time();

-- 날짜 더하기
-- interval 숫자 기준
-- 기준에 맞는 시간값을 더한 결과를 반환한다.
-- YEAR, MONTH, DAY, HOUR, MINUTE, SECOND
select now(), date_add(now(), interval 100 day);

-- 날짜 빼기
select now(), date_sub(now(), interval 100 day);

-- 각 날짜에 해당하는 값들을 추출한다.
-- year : 주어진 날짜에서 년도를 추출한다.
-- month : 주어진 날짜에서 월을 추출한다.
-- monthname : 주어진 날짜에서 월을 문자열 값으로 추출한다.
-- dayname : 주어진 날짜에서 요일을 문자열 값으로 추출한다.
-- dayofweek : 주어진 날짜가 이번주에서 몇번째 날인지 (일요일이 1)
-- weekday : 주어진 날짜가 이번주에서 몇번째 날인지 (월요일이 0)
-- dayofyear : 주어진 날짜가 올해에 몇 번째 날인지
-- week : 주어진 날짜가 올해에 몇 번째 주인지
select year(now()), month(now()), monthname(now()), dayname(now()),
       dayofweek(now()), weekday(now()), dayofyear(now()), week(now());
       
-- 날짜 포멧
select date_format(now(), '%Y년 %m월 %d일 %H시 %i분 %s초 %p');

select date_format(hire_date, '%Y년 %m월 %d일 %H시 %i분 %s초 %p')
from employees;