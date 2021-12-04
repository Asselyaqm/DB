-- Task 1
-- Create a function that:


-- a. Increments given values by 1 and returns it.
create or replace function increment(num integer)
    returns integer as
$$
begin
    return num + 1;
end;
$$ language plpgsql;

select increment(5) as new_number;

-- b. Returns sum of 2 numbers.
create or replace function sum_of(st int, nd int)
returns integer as
$$
begin
    return st + nd;
end;
$$ language plpgsql;

select sum_of(5, 3) as sum_of_numbers;

-- c. Returns true or false if numbers are divisible by 2.
create or replace function is_even(x int)
returns boolean as
$$
begin
  end;
$$ language plpgsql;
select is_even(4) as is_even;

-- d. Checks some password for validity. ???
create or replace function validation(x varchar)
    returns boolean as
$$
begin
    if x.length > 8 then
        return true;
    else
        return false;
    end if;
end;
$$ language plpgsql;

-- e. Returns two outputs, but has one input.
create or replace function pair_output(x int, out y int, out z int)
as
$$
begin
    y = x;
    z = x+1;
end;
$$ language plpgsql;

select pair_output(4);

-- Task 2
/*  Create a trigger that: */

-- a. Return timestamp of the occurred action within the database.

-- b. Computes the age of a person when persons’ date of birth is inserted.

-- c. Adds 12% tax on the price of the inserted item.

-- d. Prevents deletion of any row from only one table.

-- e. Launches functions 1.d and 1.e.


-- Task 3
/* What is the difference between procedure and function? */

/*
    A function deals with as an expression. Function is used to calculate something from a given input.
Hence it got its name from Mathematics. The function can be called by a procedure.
In sql, inside the function we can not use the DML(Data manipulation language)
commands such as Insert, Delete, Update. Functions can be called through sql queries.
Each time functions are compiled when they are called. 	The return statement of a function
returns the control and function’s result value to the calling program. Function doesn't support try-catch blocks.
Function can be operated in the SELECT statement. Function does not support explicit transaction handles.
    Whereas a procedure does not deal with as an expression. While procedure is the set of commands,
which are executed in a order. But a procedure can not be called by a function. Here, in sql,
inside the procedure we can use DML commands. However, the procedure can’t be called through a sql query.
Whereas, procedures are compiled only once and can be called again and again as needed without being compiled each time.
While the return statement of the procedure returns control to the calling program, it can not return the result value.
While it supports try-catch blocks. While it can’t be operated in the SELECT statement.
While procedure supports explicit transaction handles.
*/


-- Task 4

drop table employee;

create table employee
(
    id              int,
    name            varchar(20) not null,
    date_of_birth   date,
    age             int check ( age >= 18 and age <= 63 ),
    salary          int,
    work_experience int check ( work_experience <= 60 ),
    discount        int check ( discount >= 0 ),
    primary key (id)
);

insert into employee
values (1, 'Adam', '1996-12-31', 25, 3000, 5, 5);
insert into employee
values (2, 'Adil', '1990-05-12', 31, 2000, 4, 5);
insert into employee
values (3, 'Mura', '1995-04-03', 26, 1500, 3, 2);
insert into employee
values (4, 'Tima', '2002-12-31', 19, 900, 1, 0);
insert into employee
values (5, 'Dima', '1998-06-29', 23, 1200, 2, 0);

select *
from employee;

/*
a) Increases salary by 10% for every 2 years of work experience and provides
10% discount and after 5 years adds 1% to the discount.
*/

create or replace procedure inc_salary_discount()
    language plpgsql
as
$$
begin
    update employee
    set salary   = salary + salary * (work_experience / 2) * 0.1,
        discount = 10
    where work_experience >= 2;

    update employee
    set discount = discount + 1
    where work_experience >= 5;
end;
$$;

begin;
call inc_salary_discount();
select * from employee;
rollback;
select * from employee;

/*
b) After reaching 40 years, increase salary by 15%. If work experience is more
than 8 years, increase salary for 15% of the already increased value for work experience
and provide a constant 20% discount.
*/

create or replace procedure after_40()
    language plpgsql
as
$$
begin
    update employee
    set salary = salary + employee.salary * 0.15
    where age >= 40;

    update employee
    set salary   = salary + employee.salary * 0.15,
        discount = 20
    where work_experience >= 8;
end;
$$;

insert into employee
values (6, 'Sam', '1982-06-29', 39, 4000, 10, 10);

select *
from employee;

begin;
call after_40();
select * from employee;
commit;

-- Task 5
create table members
(
    memid int,
    surname varchar(200) not null,
    firstname varchar(200) not null,
    address varchar(300),
    zipcode int,
    telephone varchar(20),
    recommendedby integer,
    joindate timestamp,
    primary key (memid)
);

create table booking
(
    facid int,
    memid int,
    starttime timestamp,
    slots int,
    primary key (facid, memid)
);

create table facilities
(
    facid int,
    name varchar(100) not null,
    membercost numeric,
    guestcost numeric,
    initialoutlay numeric,
    monthlymaintenance numeric,
    primary key (facid)
);

with recursive recommenders(recommender, member) as (
	select recommendedby, memid
		from members
	union all
	select mems.recommendedby, recs.member
		from recommenders recs
		inner join members mems
			on mems.memid = recs.recommender
)

select recs.member member, recs.recommender, mems.firstname, mems.surname
	from recommenders recs
	inner join members mems
		on recs.recommender = mems.memid
	where recs.member = 22 or recs.member = 12
order by recs.member asc, recs.recommender desc