CREATE TABLE member_ksk (
    member_id number(10) 
        CONSTRAINT mem_mid_pk PRIMARY KEY,
    last_name varchar2(25) 
        CONSTRAINT mem_lname_nn NOT NULL,
    first_name varchar2(25),
    address varchar2(100),
    city varchar2(30),
    phone varchar2(15),
    join_date date DEFAULT sysdate CONSTRAINT mem_date_nn NOT NULL 
);
    
desc member_ksk

CREATE TABLE title_ksk (
    title_id number(10)
        CONSTRAINT ti_tid_pk PRIMARY KEY,
    title varchar2(60)
        CONSTRAINT ti_title_nn NOT NULL,
    description varchar2(400)
        CONSTRAINT ti_desc_nn NOT NULL,
    rating varchar2(4)
        CONSTRAINT ti_rating_ck CHECK(rating in('G','PG','NC17','R','NR')),
    category varchar2(20)
        CONSTRAINT ti_category_ck CHECK(category in('DRAMA','COMEDY','ACTION','CHILD','SCIFI','DOCUMENTARY')),
    release_date date
);
  
desc title_ksk   

CREATE TABLE title_copy_ksk(
    copy_id number(10),
    title_id number(10)
        CONSTRAINT c_tid_fk REFERENCES title_ksk(title_id),
    status varchar2(15)
        CONSTRAINT c_stat_ck CHECK(status in('AVAILABLE','DESTROYED','RENTED','RESERVED')),
    CONSTRAINT c_id_pk PRIMARY KEY(copy_id, title_id)    
);    

desc title_copy_ksk

CREATE TABLE rental_ksk (
    book_date date DEFAULT sysdate,
    member_id number(10) 
        CONSTRAINT rt_mid_fk1 REFERENCES member_ksk(member_id),
    copy_id number(10),
    act_ret_date date,
    exp_ret_date date DEFAULT sysdate+2,
    title_id number(10),
    CONSTRAINT rt_bdate_pk PRIMARY KEY (book_date, member_id, copy_id, title_Id),
    CONSTRAINT rt_fk2 FOREIGN KEY(copy_id,title_id) REFERENCES title_copy_ksk(copy_id, title_id) 
);

desc rental_ksk

CREATE TABLE reservation_ksk(
    res_date date,
    member_id number(10)
        CONSTRAINT rent_mid_fk REFERENCES member_ksk(member_id),
    title_id number(10)
        CONSTRAINT rent_tid_fk REFERENCES title_ksk(title_id),
    CONSTRAINT rent_pk PRIMARY KEY(res_date, member_id, title_id)
);    

desc rental_ksk

alter table title_copy_ksk 
modify status CONSTRAINT c_status_nn not null;

desc dictionary

select *
from dictionary
where table_name='USER_TABLES';

select * from dict
where table_name = 'USER_USERS';

select object_name, object_type, created, status
from user_objects
order by object_type;

desc user_cons_columns

select column_name, constraint_name
from user_cons_columns
where table_name = 'EMPLOYEES';

desc user_tab_columns

select b.column_name, a.constraint_name, a.constraint_type, a.search_condition, a.r_constraint_name
from user_constraints a join user_cons_columns b
on a.constraint_name = b.constraint_name
where lower(a.table_name)=lower('&t_name');

select view_name, text
from user_views;

select sequence_name, min_value, max_value, increment_by, last_number
from user_sequences;

CREATE TABLE book(
    book_id number(10),
    book_name varchar2(100),
    publisher varchar2(50),
    price number(20)
);    

SELECT  employee_id, last_name, salary, department_id
FROM employees
WHERE department_id = 30;

