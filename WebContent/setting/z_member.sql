create table z_member (
	id varchar(20)  null,
	email varchar(20) not null,
	password varchar(20) null,
	type varchar(10) null,
	primary key(email)
) engine=innodb default charset=euckr;

select * from z_member;
drop table z_member;
insert into z_member(id, email, password, type) values("김진석", "seok7777@naver.com", "qwe", "3");

create table z_product (
	no int(5) not null auto_increment,
	name varchar(20) not null,
	price varchar(10) null,
	detail text null,
	date varchar(20) null,
	stock varchar(10) null,
	image varchar(20) null,
	primary key (no)
)engine=innodb default charset=euckr;

select * from z_product;
drop table z_product;