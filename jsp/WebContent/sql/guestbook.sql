create table guestbook(
guest_no int primary key
,guest_name varchar(20) not null
,guest_title varchar(50) not null
,guest_cont varchar(4000) not null
,guest_pwd varchar(15) not null
,guest_hit int default 0
,guest_regdate date
);

create sequence guest_no_seq increment by 1 start with 1 nocache;

select * from guestbook order by guest_no desc;