select constraint_name, constraint_type, search_condition, r_constraint_name
from user_constraints
where lower(table_name) = lower('&tname');

select column_name, constraint_name
from user_cons_columns
where lower(table_name) = lower('&t_name');

select b.column_name, a.constraint_name, a.constraint_type, a.search_condition, a.r_constraint_name
from user_constraints a join user_cons_columns b
on a.constraint_name = b.constraint_name
where lower(a.table_name)=lower('&t_name');