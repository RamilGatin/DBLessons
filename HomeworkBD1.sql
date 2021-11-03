--task 1

select   e1.name,
    e1.salary as employee_salary,
    e2.salary as chief_salary,
    d.name
from employee as e1
left join employee as e2 on e1.chief_id = e2.id
join department d on d.id = e1.department_id
where e1.salary > e2.salary
limit 10;


--task 2

select a.*
from   employee a
where  a.salary =
       (
    select max(salary)
    from employee b
    where  b.department_id = a.department_id
    limit 10
           );

--task 3
select * from department d
where (select count(e1) from employee e1 where e1.department_id = d.id ) <= 3;

--task 4

select e1.*
from   employee e1
left join employee e2
on (e2.id = e1.chief_id and e2.department_id = e1.department_id)
where e2.id is null
limit 10;

--task 5

with id_sum as (select e.department_id, sum(salary) as salary
from employee e
group by department_id)
select distinct i1.department_id from id_sum i1
join id_sum i on i1.salary =(select max(salary) from id_sum);
