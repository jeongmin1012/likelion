use employees;

create table emp2
as
select * from employees;
      
-- view
-- view 만들때는 select 서브쿼리를 지정해야 한다.
-- view는 지정한 서브쿼리를 저장해두고 있는 가상의 테이블이다.
-- view를 지정하여 select를 하게 되면 view를 만들때 사용한 서브쿼리를 먼저 수행하고
-- 가져온 결과안에서 다시 select를 하게된다.

create view test_view2
as
select emp_no, first_name
from emp2;
      
-- 테이블을 이용해 select 하는 것과 동일하게 작업한다.
select * from test_view2;
      
-- emp2에 데이터를 저장한다.
insert into emp2 (emp_no, birth_date, first_name, last_name, gender, hire_date)
values (1, now(), '순신', '이', 'M', now());

commit;

select * from test_view2 order by emp_no asc;