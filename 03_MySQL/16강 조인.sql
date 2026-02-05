-- join : 다수의 테이블에 존재하는 컬럼들을 한번에 가져올 수 있는 방법
-- join을 하게 되면 n : n 관계로 행들이 합쳐져서 생성되기 때문에 올바른 조합의
-- 행만 가져올 수 있도록 조건을 작성해줘야 한다.
-- join에 대한 조건은 on을 사용한다.

-- inner join : join 조건에 만족하는 행들만 남고 만족하지 않는 행들은 제외된다.
select a1.emp_no, a1.dept_no, a2.first_name, a2.gender
from dept_manager a1
inner join employees a2
on a1.emp_no = a2.emp_no;

-- right join : join 조건에 만족하는 행들과 우측의 테이블에는 있지만 좌측에는 없는 행들도 가져온다.
select a1.emp_no, a1.dept_no, a2.first_name, a2.gender
from dept_manager a1
right join employees a2
on a1.emp_no = a2.emp_no;

-- left join : join 조건에 만족하는 행들과 좌측의 테이블에는 있지만 우측에는 없는 행들도 가져온다`
select a2.first_name, a2.gender, a1.emp_no, a1.dept_no
from employees a2
left join dept_manager a1
on a1.emp_no = a2.emp_no;

-- inner join을 가장 많이 사용하기 때문에 문법을 조금 줄인 join을 제공한다.
select a1.emp_no, a1.dept_no, a2.first_name, a2.gender
from dept_manager a1, employees a2
where a1.emp_no = a2.emp_no;


-- 가정을 해보겠습니다.
-- 어떠한 학교가 있습니다. 이 학교의 학생들의 정보를 담아두는 테이블이 있고 시험점수 테이블이 있습니다. 
-- 학생이 전학을 가면 : 학생 정보 테이블에서 삭제, 점수 테이블은 유지
-- 시험을 보지 않으면 : 점수 테이블에 그 학생의 시험 점수가 없음

-- 학생 정보 - left, 시험 점수 - right
-- inner join : 현재 이 학교에 다니는 학생(학생 정보 테이블에 있음) 중에 시험을 본 학생(점수 테이블에 있음)의 정보를 가져온다.
-- left join : 현재 이 학교에 다니는 학생(학생 정보 테이블에 있음) 중에 시험을 본 학생(점수 테이블에 있음)의 정보 뿐만 아니라
--             현재 이 학교에 다니는 학생(학생 정보 테이블에 있음) 중에 시험을 보지 않은 학생(점수 테이블에 없음)의 정보도 
--             가져온다. 이 때, 점수 테이블 쪽은 null 값으로 채워진다.
-- right join : 현재 이 학교에 다니는 학생(학생 정보 테이블에 있음) 중에 시험을 본 학생(점수 테이블에 있음)의 정보 뿐만 아니라
--              시험을 본적이 있지만(점수 테이블에 있음) 전학을 간 학생(학생 정보 테이블에 없음)의 정보도 가져온다.
--              이 때, 학생 정보 테이블 쪽은 null 값으로 채워진다.

-- https://s3.ap-northeast-2.amazonaws.com/opentutorials-user-file/module/98/1861.png

-- 현재 각 사원들의 사원번호, first_name, 근무 부서 번호를 가져온다.
select a.emp_no, a.first_name,b.dept_no from employees a, dept_emp b where a.emp_no = b.emp_no and b.to_date = '9999-01-01';

-- 각 사원들의 사원번호, first_name, 현재 받고 있는 금여액을 가져온다.
select a.emp_no, a.first_name,b.salary from employees a,salaries b where a.emp_no = b.emp_no and b.to_date = '9999-01-01';

-- 각 사원들의 사원번호, first_name, 현재 근무하고 있는 근무 부서 이름을 가져온다.
select a.emp_no,a.first_name,c.dept_name from employees a, dept_emp b, departments c where a.emp_no = b.emp_no and b.dept_no = c.dept_no and b.to_date = '9999-01-01';

-- 현재 매니저인 사원의 사원번호, 근무 부서 번호, first_name을 가져온다.
select a.emp_no, a.dept_no, b.first_name from dept_manager a, employees b where a.to_date = '9999-01-01' and a.emp_no = b.emp_no;

-- 사원번호, 생년월일, 현재 근무하고 있는 부서 번호를 가져온다.
select a.emp_no, a.birth_date, b.dept_no from employees a, dept_emp b where a.emp_no = b.emp_no and b.to_date = '9999-01-01';

-- 각 사원의 사원번호, 현재의 근무 부서 번호, 현재의 매니저 사원 번호를 가져온다.
select a.emp_no, a.dept_no, b.emp_no from dept_emp a,dept_manager b where a.to_date = '9999-01-01' and b.to_date = '9999-01-01' and a.dept_no = b.dept_no ;

-- 현재 급여를 100000 이상 받는 사원들의 사원번호, 현재 근무하는 부서 이름을 가져온다.
select a.emp_no, c.dept_name from salaries a,dept_emp b, departments c where a.emp_no = b.emp_no and b.dept_no = c.dept_no and a.salary >=100000 and a.to_date='9999-01-01' and b.to_date = '9999-01-01';

-- 현재 매니저인 사원의 사원번호, 현재 받는 급여, 현재 근무 부서 이름을 가져온다.
select a.emp_no,b.salary,c.dept_name from dept_manager a, salaries b,departments c where a.emp_no = b.emp_no and a.dept_no = c.dept_no and b.to_date = '9999-01-01' and a.to_date = '9999-01-01';

-- 각 사원들의 이름을 "first_name last_name" 형식으로 가져오고 현재 사용중인 직함 이름도 가져온다.
select concat(a.first_name," ",a.last_name),b.title  from employees a, titles b where a.emp_no = b.emp_no and b.to_date = '9999-01-01';