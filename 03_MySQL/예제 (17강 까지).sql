-- 현재 d005 부서의 매니저 보다 급여를 많이 받는 사원들의 사원번호와 급여액을 가져온다.
select emp_no, salary
from salaries
where to_date='9999-01-01' and salary > (select a.salary
										from salaries a, dept_manager b
										where b.to_date='9999-01-01' and b.dept_no = 'd005' and a.to_date='9999-01-01' and b.emp_no = a.emp_no);

-- 현재 d003 부서에 근무하고 있는 사원들이 현재 받는 급여의 평균보다 더 낮은 급여의 평균을 
-- 받는 부서 번호와 급여 평균을 가져온다. (모든 부서근무와 급여는 현재를 기준으로 한다)
select d.dept_no,avg(s.salary)
from dept_emp d, salaries s
where d.to_date = '9999-01-01' and s.to_date='9999-01-01' and d.emp_no = s.emp_no
group by d.dept_no
having avg(s.salary) < (select avg(s.salary)
						from salaries s,dept_emp d
                        where d.dept_no ='d003' and d.to_date = '9999-01-01' and s.to_date = '9999-01-01' and s.emp_no = d.emp_no);
                        
-- 직함에 Engineer가 들어가는 사원들이 현재 받고 있는 급여의 평균을 가져온다.
select avg(salary)
from salaries
where to_date = '9999-01-01' and emp_no in (select emp_no
											from titles
                                            where title like '%Engineer%' and to_date='9999-01-01');

-- 1960년대에 태어난 사람들이 현재 근무하고 있는 부서의 부서이름과 현재 받고 있는 급여액을 가져온다.
select d.dept_name, s.salary
from departments d, salaries s, dept_emp de
where s.emp_no = de.emp_no and s.to_date = '9999-01-01' and de.to_date = '9999-01-01' and d.dept_no = de.dept_no and de.emp_no in (select emp_no
																																	from employees
																																	where birth_date like '196%');

-- ------------------------
-- Teacher's Version
-- ------------------------

# 로 된 주석은 해당 문제의 작업 과정을 작성한 것입니다.

-- 현재 d005 부서의 매니저 보다 급여를 많이 받는 사원들의 사원번호와 급여액을 가져온다.

# 쿼리문을 작성한다.
# 현재 d005 부서의 매니저의 급여를 모르므로 임의로 정해준다.
select emp_no, salary
from salaries
where to_date = '9999-01-01' and salary > 100000;

# d005 부서의 현재 매니저가 받는 급여액을 가져온다.
# d005 부서의 현재 매니저가 누구인지 모르므로 임의로 정해준다.
select salary
from salaries
where to_date = '9999-01-01' and emp_no = 10001;

# d005 부서의 현재 매니저의 사원번호를 가져온다.
select emp_no
from dept_manager
where to_date = '9999-01-01' and dept_no = 'd005';

# 합친다.
select emp_no, salary
from salaries
where to_date = '9999-01-01' and salary > (select salary
			from salaries
			where to_date = '9999-01-01' and emp_no = (select emp_no
				from dept_manager
				where to_date = '9999-01-01' and dept_no = 'd005'));

-- 현재 d003 부서에 근무하고 있는 사원들이 현재 받는 급여의 평균보다 더 낮은 급여의 평균을
-- 받는 부서 번호와 급여 평균을 가져온다. (모든 부서근무와 급여는 현재를 기준으로 한다)

# 현재 d003 부서에 근무하고 있는 사원들이 현재 받는 급여의 평균보다 더 낮은 급여의 평균을 받는 부서가 
# 어디인지 모르므로 임의의 부서번호를 정해준다.
select a1.dept_no, avg(a2.salary)
from dept_emp a1, salaries a2
where a1.emp_no = a2.emp_no and a1.to_date = '9999-01-01' and a2.to_date = '9999-01-01'
group by a1.dept_no
having a1.dept_no in ('d001', 'd002');

# 현재 d003 부서에 근무하고 있는 사원들이 현재 받는 급여의 평균보다 더 낮은 급여의 평균을 받는 부서의 부서번호를 가져온다.
# d003 부서에 근무하고 있는 사원들이 현재 받는 급여의 평균보다 낮은 급여가 얼마인지 모르므로 임의로 정해준다.
select a1.dept_no
from dept_emp a1, salaries a2
where a1.emp_no = a2.emp_no and a1.to_date = '9999-01-01' and a2.to_date = '9999-01-01'
group by a1.dept_no
having avg(a2.salary) < 5000; 

# 현재 d003 부서에 근무하고 있는 사원들이 현재 받고 있는 급여의 평균을 가져온다.
# d003 부서에 현재 근무하고 있는 사원이 누군지 모르므로 임의로 정해준다.
select avg(salary)
from salaries
where to_date = '9999-01-01' and emp_no in (10001, 10002);

# 현재 d003 부서에 근무하고 있는 사원들의 사원번호를 가져온다.
select emp_no
from dept_emp
where dept_no = 'd003' and to_date = '9999-01-01';

# 합친다
select a1.dept_no, avg(a2.salary)
from dept_emp a1, salaries a2
where a1.emp_no = a2.emp_no and a1.to_date = '9999-01-01' and a2.to_date = '9999-01-01'
group by a1.dept_no
having a1.dept_no in (select a1.dept_no
	from dept_emp a1, salaries a2
	where a1.emp_no = a2.emp_no and a1.to_date = '9999-01-01' and a2.to_date = '9999-01-01'
	group by a1.dept_no
	having avg(a2.salary) < (select avg(salary)
			from salaries
			where to_date = '9999-01-01' and emp_no in (select emp_no
					from dept_emp
					where dept_no = 'd003' and to_date = '9999-01-01')));
                    
                    
select a1.dept_no, avg(a2.salary)
from dept_emp a1, salaries a2
where a1.emp_no = a2.emp_no and a1.to_date = '9999-01-01' and a2.to_date = '9999-01-01'
group by a1.dept_no
having avg(a2.salary) < (select avg(salary)
			from salaries
			where to_date = '9999-01-01' and emp_no in (select emp_no
					from dept_emp
					where dept_no = 'd003' and to_date = '9999-01-01'));
                    
-- 직함에 Engineer가 들어가는 사원들이 현재 받고 있는 급여의 평균을 가져온다.

# 직함에 Engineer가 들어가는 사원들이 누구인지 모르기 때문에 임의의 사원번호를 설정해준다.
select avg(salary)
from salaries
where to_date = '9999-01-01' and emp_no in (10001, 10002);

# 현재 직함에 Engineer가 들어가 있는 사원들의 사원 번호
select emp_no
from titles
where to_date = '9999-01-01' and title like '%Engineer%';

# 합친다
select avg(salary)
from salaries
where to_date = '9999-01-01' and emp_no in (select emp_no
		from titles
		where to_date = '9999-01-01' and title like '%Engineer%');

-- 1960년대에 태어난 사람들이 현재 근무하고 있는 부서의 부서이름과 현재 받고 있는 급여액을 가져온다.

# 쿼리문을 작성한다.

# 1960년대에 태어난 사원이 누구인지 알지 못하므로 임의의 사원으로 정한다.
select a1.dept_name, a2.salary
from departments a1, salaries a2, dept_emp a3
where a1.dept_no = a3.dept_no and a2.emp_no = a3.emp_no
      and a3.to_date = '9999-01-01' and a2.to_date = '9999-01-01' and a2.emp_no in (10001, 10002);
      
# 1960년대에 태어난 사원의 사원 번호
select emp_no
from employees
where birth_date between '1960-01-01' and '1969-12-31';

# 합친다
select a1.dept_name, a2.salary
from departments a1, salaries a2, dept_emp a3
where a1.dept_no = a3.dept_no and a2.emp_no = a3.emp_no
      and a3.to_date = '9999-01-01' and a2.to_date = '9999-01-01' 
      and a2.emp_no in (select emp_no
			from employees
			where birth_date between '1960-01-01' and '1969-12-31');

-- ------------------------------------------------------------------------------

-- 사원들의 모든 정보를 가져온다.
select * from employees;

-- 모든 부서의 정보를 가져온다.
select * from dept_emp;

-- 모든 사원들의 사원 번호와 현재 받고 있는 급여액을 가져온다.
select emp_no, salary from salaries where to_date = '9999-01-01';

-- 모든 사원들의 사원 번호와 현재 사용하고 있는 직함 이름을 가져온다.
select emp_no, title from titles where to_date ='9999-01-01';

-- 모든 사원들의 사원 번호와 현재 근무하고 있는 부서의 번호를 가져온다.
select emp_no, dept_no from dept_emp where to_date = '9999-01-01';

-- 남자 사원들의 사원번호, 성별, 생년월일 가져온다.
select emp_no,gender,birth_date from employees where gender = 'M';

-- 여자 사원들의 사원번호, 성별, first_name, last_name을 가져온다.
select emp_no, gender, first_name, last_name from employees where gender = 'F';

-- 사원들의 사원번호, first_name, 현재 근무중인 부서의 번호를 가져온다.
select e.emp_no, e.first_name,d.dept_no from employees e,dept_emp d where e.emp_no = d.emp_no and d.to_date = '9999-01-01';

-- 사원들의 사원번호, 입사일, 현재 받고 있는 급여를 가져온다.
select e.emp_no, e.hire_date,s.salary from employees e, salaries s where e.emp_no = s.emp_no and s.to_date='9999-01-01';

-- 사원들의 사원 번호, 현재 근무중인 부서의 이름을 가져온다.
select d.emp_no,de.dept_name from dept_emp d,departments de where d.dept_no = de.dept_no and d.to_date = '9999-01-01' ;

-- 사원들의 사원 번호, 입사일, 현재 사용중인 직함 이름을 가져온다.
select e.emp_no, e.hire_date, t.title from employees e, titles t where e.emp_no = t.emp_no and t.to_date='9999-01-01';

-- 사원들의 사원번호, 현재 근무 중인 부서 이름, 현재 받고 있는 급여를 가져온다.
-- 단, 현재 받고 있는 급여가 100000 이상인 사원들의 정보만 가져온다.
select d.emp_no, de.dept_name, s.salary from dept_emp d, departments de, salaries s where d.dept_no = de.dept_no and d.emp_no = s.emp_no and s.salary>=100000 and s.to_date='9999-01-01' and d.to_date = '9999-01-01';

-- 사원들의 사원번호, 현재 근무 중인 부서 이름, 현재 받고 있는 급여를 가져온다.
-- 단, 현재 근무하고 있는 부서의 번호가 d003인 사원들의 정보만 가져온다.
select d.emp_no, de.dept_name, s.salary from dept_emp d, departments de, salaries s where d.dept_no = de.dept_no and d.emp_no = s.emp_no and de.dept_no = 'd003' and s.to_date='9999-01-01' and d.to_date = '9999-01-01';


-- 사원들의 사원번호, 현재 근무 중인 부서 이름, 현재 사용중인 직함, 현재 받고 있는 급여를 가져온다.
-- 단, 1990년대에 입사한 사원들의 정보만 가져온다.
select d.emp_no,de.dept_name,t.title,s.salary from dept_emp d,departments de,titles t,salaries s,employees e where d.dept_no =de.dept_no and d.emp_no = s.emp_no and d.emp_no = t.emp_no and d.emp_no  = e.emp_no and s.to_date = '9999-01-01' and d.to_date = '9999-01-01' and t.to_date = '9999-01-01' and e.hire_date like '199%';

-- Finance 부서에 현재 근무하고 있는 사원들의 사원 번호와 근무 시작일을 가져온다.
select emp_no, from_date
from dept_emp
where to_date = '9999-01-01' and dept_no = (select dept_no
											from departments
                                            where dept_name = 'Finance');
      
-- 현재 받고 있는 급여의 평균보다 많이 받는 사원들의 사원번호와 현재 근무 중인 부서 번호를 가져온다.
select d.emp_no, d.dept_no
from dept_emp d, salaries s
where d.to_date ='9999-01-01' and d.emp_no = s.emp_no and s.to_date = '9999-01-01' and s.salary > (select avg(salary) from salaries where to_date = '9999-01-01');

-- 1990년대에 고용된 사원들의 사원번호와 현재 근무 중인 부서 번호를 가져온다.
select emp_no, dept_no
from dept_emp
where emp_no in(select emp_no from employees where hire_date like '199%');

-- 현재 d003 부서에 근무하고 있는 사원들의 현재 급여의 평균액 보다 현재 더 많은 급여를 받는 사원들의
-- 사원 번호와 first_name을 가져온다(가져올 사원 정보는 전체 사원 데이터 중에 조건에 맞는 것을 가져온다)
select e.emp_no, e.first_name, s.salary
from employees e, salaries s
where s.emp_no = e.emp_no and s.to_date = '9999-01-01' and s.salary > (select avg(s.salary)
																		from salaries s, dept_emp d
                                                                        where s.emp_no = d.emp_no and d.dept_no = 'd003' and d.to_date='9999-01-01' and s.to_date='9999-01-01');

-- 사원번호가 110567 인 매니저 사원과 같은 부서에 현재 근무 하고 있는 사원들의 
-- 사원번호, first_name, 근무 부서 이름, 현재 받고 있는 급여액을 가져온다.
select e.emp_no, e.first_name, de.dept_name, s.salary
from employees e, dept_emp d, departments de, salaries s
where e.emp_no = d.emp_no and d.dept_no = de.dept_no and e.emp_no = s.emp_no and d.to_date = '9999-01-01' and s.to_date='9999-01-01' and d.dept_no = (select dept_no
																															from dept_manager
                                                                                                                            where emp_no = 110567 and to_date = '9999-01-01');
-- 현재 사용중인 직함이 Senior Engineer인 사원들의 사원번호, first_name, 근무 부서 이름
-- 현재 받고 있는 급여액을 가져온다.
select e.emp_no, e.first_name, de.dept_name, s.salary
from employees e,dept_emp d, departments de,salaries s
where e.emp_no = d.emp_no and d.dept_no = de.dept_no and e.emp_no = s.emp_no  and s.to_date = '9999-01-01' and e.emp_no in(select emp_no
																															from titles
																															where title = 'Senior Engineer' and to_date = '9999-01-01');
																						

-- 사원들의 모든 정보를 가져온다.
select * from employees;

-- 모든 부서의 정보를 가져온다.
select * from dept_emp;

-- 모든 사원들의 사원 번호와 현재 받고 있는 급여액을 가져온다.
select emp_no, salary from salaries where to_date = '9999-01-01';

-- 모든 사원들의 사원 번호와 현재 사용하고 있는 직함 이름을 가져온다.
select emp_no, title from titles where to_date ='9999-01-01';

-- 모든 사원들의 사원 번호와 현재 근무하고 있는 부서의 번호를 가져온다.
select emp_no, dept_no from dept_emp where to_date = '9999-01-01';

-- 남자 사원들의 사원번호, 성별, 생년월일 가져온다.
select emp_no,gender,birth_date from employees where gender = 'M';

-- 여자 사원들의 사원번호, 성별, first_name, last_name을 가져온다.
select emp_no, gender, first_name, last_name from employees where gender = 'F';

-- 사원들의 사원번호, first_name, 현재 근무중인 부서의 번호를 가져온다.
select e.emp_no, e.first_name,d.dept_no from employees e,dept_emp d where e.emp_no = d.emp_no and d.to_date = '9999-01-01';

-- 사원들의 사원번호, 입사일, 현재 받고 있는 급여를 가져온다.
select e.emp_no, e.hire_date,s.salary from employees e, salaries s where e.emp_no = s.emp_no and s.to_date='9999-01-01';

-- 사원들의 사원 번호, 현재 근무중인 부서의 이름을 가져온다.
select d.emp_no,de.dept_name from dept_emp d,departments de where d.dept_no = de.dept_no and d.to_date = '9999-01-01' ;

-- 사원들의 사원 번호, 입사일, 현재 사용중인 직함 이름을 가져온다.
select e.emp_no, e.hire_date, t.title from employees e, titles t where e.emp_no = t.emp_no and to_date='9999-01-01';

-- 사원들의 사원번호, 현재 근무 중인 부서 이름, 현재 받고 있는 급여를 가져온다.
-- 단, 현재 받고 있는 급여가 100000 이상인 사원들의 정보만 가져온다.
select d.emp_no, de.dept_name, s.salary from dept_emp d, departments de, salaries s where d.dept_no = de.dept_no and d.emp_no = s.emp_no and s.salary>=100000 and s.to_date='9999-01-01' and d.to_date = '9999-01-01';

-- 사원들의 사원번호, 현재 근무 중인 부서 이름, 현재 받고 있는 급여를 가져온다.
-- 단, 현재 근무하고 있는 부서의 번호가 d003인 사원들의 정보만 가져온다.
select d.emp_no, de.dept_name, s.salary from dept_emp d, departments de, salaries s where d.dept_no = de.dept_no and d.emp_no = s.emp_no and de.dept_no = 'd003' and s.to_date='9999-01-01' and d.to_date = '9999-01-01';


-- 사원들의 사원번호, 현재 근무 중인 부서 이름, 현재 사용중인 직함, 현재 받고 있는 급여를 가져온다.
-- 단, 1990년대에 입사한 사원들의 정보만 가져온다.
select d.emp_no,de.dept_name,t.title,s.salary from dept_emp d,departments de,titles t,salaries s,employees e where d.dept_no =de.dept_no and d.emp_no = s.emp_no and d.emp_no = t.emp_no and d.emp_no  = e.emp_no and s.to_date = '9999-01-01' and d.to_date = '9999-01-01' and t.to_date = '9999-01-01' and e.hire_date like '199%';

-- Finance 부서에 현재 근무하고 있는 사원들의 사원 번호와 근무 시작일을 가져온다.
select emp_no, from_date
from dept_emp
where to_date = '9999-01-01' and dept_no = (select dept_no
											from departments
                                            where dept_name like 'Finance');
      
-- 현재 받고 있는 급여의 평균보다 많이 받는 사원들의 사원번호와 현재 근무 중인 부서 번호를 가져온다.
select d.emp_no, d.dept_no
from dept_emp d, salaries s
where d.to_date ='9999-01-01' and d.emp_no = s.emp_no and s.to_date = '9999-01-01' and s.salary > (select avg(salary) from salaries where to_date = '9999-01-01');

-- 1990년대에 고용된 사원들의 사원번호와 현재 근무 중인 부서 번호를 가져온다.
select emp_no, dept_no
from dept_emp
where emp_no in(select emp_no from employees where hire_date like '199%');

-- 현재 d003 부서에 근무하고 있는 사원들의 현재 급여의 평균액 보다 현재 더 많은 급여를 받는 사원들의
-- 사원 번호와 first_name을 가져온다(가져올 사원 정보는 전체 사원 데이터 중에 조건에 맞는 것을 가져온다)
select e.emp_no, e.first_name, s.salary
from employees e, salaries s
where s.emp_no = e.emp_no and s.to_date = '9999-01-01' and s.salary > (select avg(s.salary)
																		from salaries s, dept_emp d
                                                                        where s.emp_no = d.emp_no and d.dept_no = 'd003' and d.to_date='9999-01-01' and s.to_date='9999-01-01');

-- 사원번호가 110567 인 매니저 사원과 같은 부서에 현재 근무 하고 있는 사원들의 
-- 사원번호, first_name, 근무 부서 이름, 현재 받고 있는 급여액을 가져온다.
select e.emp_no, e.first_name, de.dept_name, s.salary
from employees e, dept_emp d, departments de, salaries s
where e.emp_no = d.emp_no and d.dept_no = de.dept_no and e.emp_no = s.emp_no and d.to_date = '9999-01-01' and s.to_date='9999-01-01' and d.dept_no = (select dept_no
																															from dept_manager
                                                                                                                            where emp_no = '110567' and to_date = '9999-01-01');
-- 현재 사용중인 직함이 Senior Engineer인 사원들의 사원번호, first_name, 근무 부서 이름
-- 현재 받고 있는 급여액을 가져온다.
select e.emp_no, e.first_name, de.dept_name, s.salary
from employees e,dept_emp d, departments de,salaries s
where e.emp_no = d.emp_no and d.dept_no = de.dept_no and e.emp_no = s.emp_no  and s.to_date = '9999-01-01' and e.emp_no in(select emp_no
																															from titles
																															where title = 'Senior Engineer' and to_date = '9999-01-01');

-- ------------------------
-- Teacher's Version
-- ------------------------


-- 사원들의 모든 정보를 가져온다.
select *
from employees;

-- 모든 부서의 정보를 가져온다.
select *
from departments;

-- 모든 사원들의 사원 번호와 현재 받고 있는 급여액을 가져온다.
select emp_no, salary
from salaries
where to_date = '9999-01-01';

-- 모든 사원들의 사원 번호와 현재 사용하고 있는 직함 이름을 가져온다.
select emp_no, title
from titles
where to_date = '9999-01-01';

-- 모든 사원들의 사원 번호와 현재 근무하고 있는 부서의 번호를 가져온다.
select emp_no, dept_no
from dept_emp
where to_date = '9999-01-01';

-- 남자 사원들의 사원번호, 성별, 생년월일 가져온다.
select emp_no, gender, birth_date
from employees
where gender = 'M';

-- 여자 사원들의 사원번호, 성별, first_name, last_name을 가져온다.
select emp_no, gender, first_name, last_name
from employees
where gender = 'F';

-- --------------------------------------------------------------------------

-- 사원들의 사원번호, first_name, 현재 근무중인 부서의 번호를 가져온다.
select a1.emp_no, a1.first_name, a2.dept_no
from employees a1, dept_emp a2
where a1.emp_no = a2.emp_no and a2.to_date = '9999-01-01';

-- 사원들의 사원번호, 입사일, 현재 받고 있는 급여를 가져온다
select a1.emp_no, a1.hire_date, a2.salary
from employees a1, salaries a2
where a1.emp_no = a2.emp_no and a2.to_date = '9999-01-01';

-- 사원들의 사원 번호, 현재 근무중인 부서의 이름을 가져온다.
select a1.emp_no, a2.dept_name
from dept_emp a1, departments a2
where a1.dept_no = a2.dept_no and a1.to_date = '9999-01-01';

-- 사원들의 사원 번호, 입사일, 현재 사용중인 직함 이름을 가져온다.
select a1.emp_no, a1.hire_date, a2.title
from employees a1, titles a2
where a1.emp_no = a2.emp_no and to_date = '9999-01-01';

-- 사원들의 사원번호, 현재 근무 중인 부서 이름, 현재 받고 있는 급여를 가져온다.
-- 단, 현재 받고 있는 급여가 100000 이상인 사원들의 정보만 가져온다.
select a3.emp_no, a1.dept_name, a2.salary
from departments a1, salaries a2, dept_emp a3
where a3.dept_no = a1.dept_no and a3.emp_no = a2.emp_no 
      and a3.to_date = '9999-01-01' and a2.to_date = '9999-01-01' 
      and a2.salary >= 100000;

-- 사원들의 사원번호, 현재 근무 중인 부서 이름, 현재 받고 있는 급여를 가져온다.
-- 단, 현재 근무하고 있는 부서의 번호가 d003인 사원들의 정보만 가져온다.
select a1.emp_no, a2.dept_name, a3.salary
from dept_emp a1, departments a2, salaries a3
where a1.dept_no = a2.dept_no and a1.emp_no = a3.emp_no
      and a1.to_date = '9999-01-01' and a3.to_date = '9999-01-01' 
      and a1.dept_no = 'd003';

-- 사원들의 사원번호, 현재 근무 중인 부서 이름, 현재 사용중인 직함, 현재 받고 있는 급여를 가져온다.
-- 단, 1990년대에 입사한 사원들의 정보만 가져온다.
select a1.emp_no, a2.dept_name, a4.title, a3.salary
from dept_emp a1, departments a2, salaries a3, titles a4
where a1.dept_no = a2.dept_no and a1.emp_no = a3.emp_no and a1.emp_no = a4.emp_no
      and a3.emp_no = a4.emp_no and a1.to_date = '9999-01-01'
      and a4.to_date = '9999-01-01' and a3.to_date = '9999-01-01'
      and a3.emp_no in (10001, 10002);
      
select emp_no
from employees
where hire_date between '1990-01-01' and '1999-12-31';

select a1.emp_no, a2.dept_name, a4.title, a3.salary
from dept_emp a1, departments a2, salaries a3, titles a4
where a1.dept_no = a2.dept_no and a1.emp_no = a3.emp_no and a1.emp_no = a4.emp_no
      and a3.emp_no = a4.emp_no and a1.to_date = '9999-01-01'
      and a4.to_date = '9999-01-01' and a3.to_date = '9999-01-01'
      and a3.emp_no in (select emp_no
			from employees
			where hire_date between '1990-01-01' and '1999-12-31');
            
select a1.emp_no, a2.dept_name, a4.title, a3.salary
from dept_emp a1, departments a2, salaries a3, titles a4, employees a5
where a1.dept_no = a2.dept_no and a1.emp_no = a3.emp_no and a1.emp_no = a4.emp_no
      and a1.emp_no = a5.emp_no
      and a3.emp_no = a4.emp_no and a1.to_date = '9999-01-01'
      and a4.to_date = '9999-01-01' and a3.to_date = '9999-01-01'
      and a5.hire_date between '1990-01-01' and '1999-12-31';

-- Finance 부서에 현재 근무하고 있는 사원들의 사원 번호와 근무 시작일을 가져온다.

# Finance 부서의 부서 번호를 모르기 때문에 임의이 부서 번호를 사용한다.
select emp_no, from_date
from dept_emp
where to_date = '9999-01-01' and dept_no = 'd001';

# Finance 부서의 번호를 가져온다.
select dept_no
from departments
where dept_name = 'Finance';

# 합친다
select emp_no, from_date
from dept_emp
where to_date = '9999-01-01' and dept_no = (select dept_no
											from departments
											where dept_name = 'Finance');
                                            
# join
select a1.emp_no, a1.from_date
from dept_emp a1, departments a2
where a1.dept_no = a2.dept_no and a1.to_date = '9999-01-01'
      and a2.dept_name = 'Finance';
      
-- 현재 받고 있는 급여의 평균보다 많이 받는 사원들의 사원번호와 현재 근무 중인 부서 번호를 가져온다.

# 현재 받고 있는 급여의 평균보다 급여를 많이 받는 사원이 누구인 알 수 없기 때문에
# 임의의 사원 번호를 지정한다.
select emp_no, dept_no
from dept_emp
where to_date = '9999-01-01' and emp_no in (10001, 10002);

# 현재 받고 있는 급여의 평균보다 급여를 많이 받는 사원의 사원 번호를 가져온다.
# 현재 받고 있는 급여의 평균을 알지 못하므로 임의의 지정한다.
select emp_no
from salaries
where to_date = '9999-01-01' and salary > 100000;

# 현재 받고 있는 급여의 평균을 가져온다.
select avg(salary)
from salaries
where to_date = '9999-01-01';

# 합친다.
select emp_no, dept_no
from dept_emp
where to_date = '9999-01-01' and emp_no in (select emp_no
		from salaries
		where to_date = '9999-01-01' and salary > (select avg(salary)
			from salaries
			where to_date = '9999-01-01'));


-- 1990년대에 고용된 사원들의 사원번호와 현재 근무 중인 부서 번호를 가져온다.

# 1990년대에 고용된 사원이 누구인지 알 수 없으므로 임의로 지정한다.
select emp_no, dept_no
from dept_emp
where to_date = '9999-01-01' and emp_no in (10001, 10002);

# 1990년대에 고용된 사원의 사원 번호를 가져온다.
select emp_no
from employees
where hire_date between '1990-01-01' and '1999-12-31';

# 합친다.
select emp_no, dept_no
from dept_emp
where to_date = '9999-01-01' and emp_no in (select emp_no
		from employees
		where hire_date between '1990-01-01' and '1999-12-31');

-- 현재 d003 부서에 근무하고 있는 사원들의 현재 급여의 평균액 보다 현재 더 많은 급여를 받는 사원들의
-- 사원 번호와 first_name을 가져온다(가져올 사원 정보는 전체 사원 데이터 중에 조건에 맞는 것을 가져온다)

# 현재 d003 부서에 근무하고 있는 사원들의 현재 급여의 평균액 보다 현재 더 많은 급여를 받는 사원이 누구인지
# 알 수 없기 때문에 임의의 사원을 지정한다.
select emp_no, first_name
from employees
where emp_no in (10001, 10002);

# 현재 d003 부서에 근무하고 있는 사원들의 현재 급여의 평균액 보다 현재 더 많은 급여를 받는 사원의 사원번호
# 현재 d003 부서에 근무하고 있는 사원들의 현재 급여의 평균액을 알 수 없기 때문에 임의의 급여액을 지정한다.
select emp_no
from salaries
where to_date = '9999-01-01' and salary > 100000;

# 현재 d003 부서에 근무하고 있는 사원들의 현재 급여의 평균액을 가져온다;
# 현재 d003 부서에 근무하고 있는 사원들이 누군지 알 수 없으므로 임의의 사원을 지정한다.
select avg(salary)
from salaries
where emp_no in (10001, 10002);

# 현재 d003 부서에 근무하고 있는 사원들의 사원 번호
select emp_no
from dept_emp
where to_date = '9999-01-01' and dept_no = 'd003';

# 합친다
select emp_no, first_name
from employees
where emp_no in (select emp_no
		from salaries
		where to_date = '9999-01-01' and salary > (select avg(salary)
			from salaries
			where emp_no in (select emp_no
				from dept_emp
				where to_date = '9999-01-01' and dept_no = 'd003')));
 
-- 사원번호가 110567 인 매니저 사원과 같은 부서에 현재 근무 하고 있는 사원들의 
-- 사원번호, first_name, 근무 부서 이름, 현재 받고 있는 급여액을 가져온다.

# 사원번호가 110567인 매니저 사원이 어느 부서에 근무하고 있는지 알 수 없으므로 임의로 정해준다.
select a1.emp_no, a1.first_name, a3.dept_name, a4.salary
from employees a1, dept_emp a2, departments a3, salaries a4
where a1.emp_no = a2.emp_no and a2.dept_no = a3.dept_no and a1.emp_no = a4.emp_no
      and a2.to_date = '9999-01-01' and a4.to_date = '9999-01-01' 
      and a2.dept_no = 'd001';
      
# 사원번호가 110567인 매니저 사원이 근무하고 있는 부서의 번호
select dept_no
from dept_manager
where to_date = '9999-01-01' and emp_no = 110567;

# 합친다
select a1.emp_no, a1.first_name, a3.dept_name, a4.salary
from employees a1, dept_emp a2, departments a3, salaries a4
where a1.emp_no = a2.emp_no and a2.dept_no = a3.dept_no and a1.emp_no = a4.emp_no
      and a2.to_date = '9999-01-01' and a4.to_date = '9999-01-01' 
      and a2.dept_no = (select dept_no
			from dept_manager
			where to_date = '9999-01-01' and emp_no = 110567);


-- 현재 사용중인 직함이 Senior Engineer인 사원들의 사원번호, first_name, 근무 부서 이름
-- 현재 받고 있는 급여액을 가져온다.

# 직함이 Senior Engineer 인 사원을 알 수 없으므로 임의의 사원으로 설정한다.
select a1.emp_no, a1.first_name, a3.dept_name, a4.salary
from employees a1, dept_emp a2, departments a3, salaries a4
where a1.emp_no = a2.emp_no and a2.dept_no = a3.dept_no and a1.emp_no = a4.emp_no
      and a2.to_date = '9999-01-01' and a4.to_date = '9999-01-01' 
      and a1.emp_no in (10001, 10002);
      
# 직함이 Senior Engineer 인 사원의 사원 번호를 가져온다.
select emp_no
from titles
where to_date = '9999-01-01' and title = 'Senior Engineer';

# 합친다.
select a1.emp_no, a1.first_name, a3.dept_name, a4.salary
from employees a1, dept_emp a2, departments a3, salaries a4
where a1.emp_no = a2.emp_no and a2.dept_no = a3.dept_no and a1.emp_no = a4.emp_no
      and a2.to_date = '9999-01-01' and a4.to_date = '9999-01-01' 
      and a1.emp_no in (select emp_no
			from titles
			where to_date = '9999-01-01' and title = 'Senior Engineer');
            
# join
select a1.emp_no, a1.first_name, a3.dept_name, a4.salary
from employees a1, dept_emp a2, departments a3, salaries a4, titles a5
where a1.emp_no = a2.emp_no and a2.dept_no = a3.dept_no and a1.emp_no = a4.emp_no
      and a1.emp_no = a5.emp_no
      and a2.to_date = '9999-01-01' and a4.to_date = '9999-01-01' 
      and a5.to_date = '9999-01-01' and a5.title = 'Senior Engineer';
