select emp_no from titles where title = 'Senior Staff' order by emp_no;
select emp_no from titles where title = 'Staff' order by emp_no;

-- 합집합
-- 합집한 두 select 문의 결과를 하나의 결과로 합쳐준다.
-- select한 결과의 컬럼 구성이 동일해야 한다.

-- union은 중복된 데이터는 한 번만 가져온다.
select emp_no from titles where title = 'Senior Staff'
union
select emp_no from titles where title = 'Staff'
order by emp_no;

-- union all 은 중복된 데이터는 중복된 만큼 가져온다.
select emp_no from titles where title = 'Senior Staff'
union all
select emp_no from titles where title = 'Staff'
order by emp_no;

-- 교집합
-- 교집합은 inner join을 사용한다.
select a1.emp_no
from titles a1, titles a2
where a1.emp_no = a2.emp_no and a1.title = 'Senior Staff' and a2.title = 'Staff';

-- 차집합
-- 차집한 서브 쿼리를 활용한다.
select emp_no
from titles
where title = 'Staff' and
      emp_no not in (select emp_no from titles where title = 'Senior Staff');
