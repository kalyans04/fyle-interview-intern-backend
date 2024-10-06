-- Write query to find the number of grade A's given by the teacher who has graded the most assignments
with top_teacher as (
    select teacher_id
    from assignments
    where state = 'GRADED'
    group by teacher_id
    order by count(*) desc
    limit 1
),
graded_a as (
    select *
    from assignments
    where grade = 'A' and teacher_id = (select teacher_id from top_teacher)
)
select count(*) as grade_a
from graded_a;

Write query to find the number of grade A's given by the teacher who has graded the most assignments
