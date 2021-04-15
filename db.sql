CREATE DATABASE zipo;
create table ipo_table (
	symbol varchar(255),
	name_ varchar(255),
	isin varchar(255),
	category varchar(255),
	issuetype varchar(255),
	opendatetime datetime,
	closedatetime datetime,
	floorprice varchar(255),
	ceilingprice varchar(255),
	cuttoff varchar(255),
	tickprice varchar(255),
	minbidqty varchar(255),
	maxbidqty varchar(255),
	tradinglot varchar(255),
	minvalue varchar(255),
	maxvalue_ varchar(255),
	discounttype varchar(255),
	discountvalue varchar(255),
	asbanonasba varchar(255),
	tplusmodificationfrom varchar(255),
	tplusmodificationto varchar(255),
	errorcode varchar(255)
);

create table ipo (
	symbol varchar(255),
	name_ varchar(255),
	category varchar(255),
	issuetype varchar(255),
	opendatetime datetime,
	closedatetime datetime,
	floorprice varchar(255),
	ceilingprice varchar(255),
	tradinglot varchar(255),
	asbanonasba varchar(255)
);