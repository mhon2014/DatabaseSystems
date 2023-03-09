drop database if exists airways;

create database if not exists airways;

use airways;

create table person(
    name varchar(255) primary key,
    address varchar(255),
    phone varchar(255)
);

create table plane(
    maker varchar(255),
    model_no varchar(255) primary key
    
);

create table aircraft(
    serial_no integer,
    model_no varchar(255),
    foreign key (model_no) references plane (model_no),
    primary key (serial_no, model_no)
);

create table flight(
    flight_no varchar(255) primary key,
    origin varchar(255),
    destination varchar(255),
    departure_time time,
    arrival_time time,
    status varchar(255)
);

create table departure(
    departure_date varchar(255),
    flight_no varchar(255),
    foreign key (flight_no) references flight (flight_no),
    constraint departure_key unique (departure_date,flight_no)
);

create table employee(
    name varchar(255),
    salary decimal(10,2),
    employee_no integer primary key,
    foreign key(name) references person (name)
);
    
create table passenger(
    name varchar(255),
    departure_date varchar(255),
    flight_no varchar(255),
    ticket_number varchar(255),
    foreign key (name) references person (name),
    foreign key (departure_date) references departure (departure_date) on update set null,
    foreign key (flight_no) references flight (flight_no),
    primary key (ticket_number)
);
    
create table pilot(
    employee_no integer,
    hours decimal(10,2),
    foreign key (employee_no) references employee (employee_no),
    primary key (employee_no)
);

create table can_fly(
    employee_no integer,
    model_no varchar(255),
    foreign key (employee_no) references pilot (employee_no),
    foreign key (model_no) references plane (model_no),
    primary key (employee_no, model_no)
);

create table assigned(
    employee_no integer,
    departure_date varchar(255),
    flight_no varchar(255),
    foreign key (employee_no) references employee (employee_no),
    foreign key (departure_date) references departure (departure_date) on update set null, 
    foreign key (flight_no) references flight (flight_no),
    constraint assigned_key unique (employee_no, departure_date, flight_no)
);