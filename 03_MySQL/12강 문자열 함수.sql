-- 문자열 함수 : 컬럼에 저장되어 있는 문자열 값들을 통해 작업을 할 수 있는 함수들
-- https://dev.mysql.com/doc/refman/9.5/en/string-functions.html

-- 문자열을 합친다.
select concat('aaa', 'bbb', 'ccc');

select concat(first_name, ' ', last_name)
from employees;

-- 삽입
-- (원본 문자열, 삽입될 위치(1부터 시작), 제거될 글자수, 삽입할 문자열)
select insert('aaaaa', 2, 2, 'bbb');
select insert('aaaaa', 2, 0, 'bbb');

select first_name, insert(first_name, 2, 3, 'im')
from employees;

-- 변경
-- 지정된 문자열에 있는 이 문자열을 요 문자열로 바꿀거야
select replace('aabbccbbdd', 'bb', 'ff');

-- 사원 번호와 직함을 가져온다.
-- Engineer를 기술자로 바꿔서 가져온다.
select emp_no, title, replace(title, 'Engineer', '기술자')
from titles;

-- Engineer는 기술자로, Staff 는 스탭으로, Manager 는 매니저로 변경해서 가져온다.
select emp_no, replace(replace(replace(title, 'Engineer', '기술자'), 'Staff', '스탭'), 'Manager', '매니저')
from titles;

-- 위치 찾기
-- 찾으면 1부터 시작하는 순서값을 가져오고 없으면 0을 가져온다.
select instr('abcdefg', 'cde'), instr('abcdefg', 'zzz');

select title, instr(title, 'Senior')
from titles;

-- 좌측으로 부터 지정한 수 만큼 문자열을 가져온다.
select left('abcdefg', 3);

-- 우측으로 부터 지정한 수 만큼 문자열을 가져온다.
select right('abcdefg', 3);

-- 지정된 위치로 부터 지정된 수 만큼 글자를 가져온다.
select mid('abcdefg', 3, 2);

select substring('abcdefg', 3, 2);

-- 공백제거
-- ltrim : 좌측 공백 제거
-- rtrim : 우측 공백 제거
-- trim : 좌우측 공백 제거
select concat('[',       '    abcd     ',  ']'),
       concat('[', ltrim('    abcd     '), ']'),
       concat('[', rtrim('    abcd     '), ']'),
       concat('[',  trim('    abcd     '), ']');

-- 대문자 -> 소문자, 소문자 -> 대문자
select lcase('ABcdEF'), lower('ABcdEF'), ucase('ABcdEF'), upper('ABcdEF');

-- 첫 글자만 대문자로...
-- 원래 initcap는 함수가 있었는데 없습니다.ㅠㅠㅠㅠㅠ
select concat(upper(substring('aBCDEF', 1, 1)), lower(substring('aBCDEF', 2)));

select first_name, lcase(first_name), lower(first_name), ucase(first_name), upper(first_name)
from employees;

-- 문자열을 뒤집는다.
select reverse('abcdef');

-- 사원들의 사원번호와 이름을 가져온다.
-- 다음 양식으로 가져온다.
-- 0000번 사원의 이름은 0000 0000 입니다
select concat(emp_no, '번 사원의 이름은 ', first_name, ' ', last_name, '입니다')
from employees;