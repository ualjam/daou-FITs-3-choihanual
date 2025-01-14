create table customer_grades (
grade_id varchar2(64) primary key,
grade_name varchar2(64)
);

create table customer_info (
customer_id varchar2(64) primary key,
grade_id varchar2(64),
customer_password varchar2(64),
customer_name varchar2(20),
customer_gender varchar2(4),
customer_email varchar2(40),
customer_phone varchar2(20),
customer_birthdate date,
customer_income long,
customer_risk_tolerance varchar(4),
creation_timestamp timestamp,
update_timestamp timestamp
)

create table account_info (
account_number varchar2(64) primary key,
grade_id varchar2(64),
customer_id varchar2(64),
status varchar2(4),
type varchar2(4),
account_name varchar2(20),
account_password varchar2(64),
open_date varchar2(8),
close_date varchar2(8),
deposit number,
withholding number,
creation_timestamp timestamp,
update_timestamp timestamp
)

create table stock_dividends (
dividend_id varchar2(64) primary key,
stock_id varchar2(64),
account_number varchar2(64),
customer_id varchar2(64)
)

create table securities_orders (
offer_number varchar2(64) primary key,
account_number varchar2(64),
customer_id varchar2(64),
grade_id2 varchar2(64),
offer_date varchar2(8),
product_id varchar2(10),
status varchar2(4),
type varchar2(4),
quantity number,
price number,
traded number,
not_traded number,
creation_timestamp timestamp,
update_timestamp timestamp
)

create table securities_trades (
trade_number varchar2(64) primary key,
trade_date varchar2(8),
buy_order varchar2(64),
sell_order varchar2(64),
quantity number,
price number,
charge decimal(10,2),
creation_timestamp timestamp
)

create table stock_info (
stock_id varchar2(64) primary key,
previous_close number,
open number,
high number,
low number,
volume number,
stock_date date,
dividend number,
dividend_date date
)

