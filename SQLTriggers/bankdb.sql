drop database bankdbn;

create database if not exists bankdb;

USE bankdb;

CREATE TABLE branch (
  branch_name varchar(255) PRIMARY KEY,
  branch_city varchar(255),
  assets decimal (12,2)
);

CREATE TABLE customer (
  customer_name varchar(255) PRIMARY KEY,
  customer_street varchar(255),
  customer_city varchar(255)
);

CREATE TABLE account (
  account_number varchar(255) PRIMARY KEY,
  branch_name varchar(255),
  balance decimal (12,2) CHECK(balance >= 0),
  FOREIGN KEY (branch_name) REFERENCES branch (branch_name)
);


CREATE TABLE depositor (
  customer_name varchar(255),
  account_number varchar(255),
  FOREIGN KEY (account_number) REFERENCES account (account_number),
  FOREIGN KEY (customer_name) REFERENCES customer (customer_name),
  PRIMARY KEY (customer_name, account_number)
);


CREATE TABLE loan (
  loan_number varchar(255) PRIMARY KEY,
  branch_name varchar(255),
  amount decimal (12,2) CHECK(amount >= 0),
  FOREIGN KEY (branch_name) REFERENCES branch (branch_name)
);

CREATE TABLE borrower (
  customer_name varchar(255),
  loan_number varchar(255),
  PRIMARY KEY (customer_name, loan_number),
  FOREIGN KEY (customer_name) REFERENCES customer (customer_name),
  FOREIGN KEY (loan_number) REFERENCES loan (loan_number)
);

