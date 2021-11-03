INSERT INTO "employee"(department_id, chief_id, name,phone_number, salary)
select
(random()*9 + 1),
(random()*((select max(id) from employee) - 1) + 1),
(array['Ramil', 'Marat', 'Ruslan', 'Arthur', 'Amir', 'Jonny','Kamilla'
])[ceil(random()*7)],
89012345678,
(random()*100) from generate_series(1,10);
