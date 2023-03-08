create database library;

use library;

create table  readers 
(
	reader_id varchar(6),
    fname varchar(30),
    mname varchar(30),
    ltname varchar(30),
    city varchar(15),
    mobileno varchar(10),
    occupation varchar(10),
    dob date,
    constraint readers_pk primary key(reader_id)
);

insert into readers values('C00001','Ramesh', 'Chandra', 'Sharma', 'Delhi', '9876876212', 'Service', '1976-11-09');
insert into readers values('C00002','Avish', 'Chandra', 'Sharma', 'Delhi', '9673912341', 'Service', '1946-10-09');
insert into readers values('C00003','Rahul', null,  'Sharma',  'Delhi', '8909768543', 'Student', '1986-09-09');
insert into readers values('C00004','Parul', null, 'Gandhi', 'Delhi', '8192030294', 'Service', '1989-08-09');
insert into readers values('C00005','Naveen', 'Chandra','Aedekar', 'Mumbai', '1234231342', 'Service', '1912-07-09');
insert into readers values('C00006','Amit', 'Kumar' , 'Borker', 'Mumbai', '9812354321', 'Housewife', '1921-06-09');
insert into readers values('C00007','Rajesh', 'Dutta', 'Sharma', 'Mumbai', '9675432543', 'Service', '1976-05-09');
insert into readers values('C00008','Abhishek', null, 'Damle', 'Mumbai', '9698761234', 'Student', '1936-04-09');
insert into readers values('C00009','Shankar', 'Nair', 'Sharma', 'Kolkata', '9456345754', 'Service', '1926-03-09');
insert into readers values('C00010','Abhishek', null, 'Rastogi',  'Chennai', '9887654321', 'Student', '1976-02-09');


select * from readers;

create table Book
(
	bid varchar(6),
    bname varchar(40),
    bdomain varchar(30),
    constraint bood_id_pk primary key(bid)
);

insert into Book values ('B00001','The Cat in the Hat','Story');
insert into Book values ('B00002','Charlie and the chocolate story','Story');
insert into Book values ('B00003','The very hungry caterpillar','Story');

create table active_readers
(
	account_id varchar(6),
    reader_id varchar(6),
    bid varchar(6),
    atype varchar(10),
    astatus varchar(10),
    constraint activereaders_acnumber_pk primary key(account_id),
    constraint account_readerid_fk foreign key(reader_id) references readers(reader_id),
    constraint account_bid_fk foreign key(bid) references book(bid)
);

insert into active_readers values ('A00001','C00001','B00001','Premium','Active');
insert into active_readers values ('A00002','C00002','B00002','Regular','Active');
insert into active_readers values ('A00003','C00003','B00002','Premium','Active');
insert into active_readers values ('A00004','C00002','B00003','Premium','Active');
insert into active_readers values ('A00005','C00005','B00002','Regular','Active');
insert into active_readers values ('A00006','C00007','B00001','Premium','Suspended');
insert into active_readers values ('A00007','C00007','B00001','Premium','Active');
insert into active_readers values ('A00008','C00001','B00003','Regular','Terminated');
insert into active_readers values ('A00009','C00003','B00002','Premium','Terminated');
insert into active_readers values ('A00010','C00004','B00002','Regular','Active');

select * from active_readers;

select * from active_readers where astatus = 'Terminated';

select * from active_readers where astatus = 'Active';

select count(account_id) from active_readers where atype = "Premium";

create table bookissue_details 
(
	issuenumber varchar(6),
    account_id varchar(6),
    bid varchar(20),
    bname varchar(20),
	number_of_book_issued int,
    constraint bookissuedetails_pk primary key (issuenumber)
);

insert into bookissue_details values('I00001', 'A00001', 'B00001', 'The cat in the hat', 2);
insert into bookissue_details values('I00002', 'A00002', 'B00003', 'The cat in the hat', 3);
insert into bookissue_details values('I00003', 'A00005', 'B00002', 'The cat in the hat', 2);

select * from bookissue_details;

