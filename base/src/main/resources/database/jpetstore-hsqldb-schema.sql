create table sequence (
    name varchar(30) not null,
    nextid int not null,
    constraint pk_sequence primary key (name)
);
create table menu(
	id int NOT NULL,
	text varchar(254),
	leaf bit,
	controller varchar(254),
	parent int,
	iconCls varchar(254),
	CONSTRAINT PK_MENU PRIMARY KEY (id)
);