create database university;

use university;

create table classroom
    (building varchar(15),
    room_number varchar(7),
    capacity numeric(4,0),
    primary key (building, room_number)
    );
    
create table department
	(dept_name	varchar(20),
     building varchar(15),
     budgest numeric(12, 2) check (budget > 0),
     primary key (dept_name)
     );