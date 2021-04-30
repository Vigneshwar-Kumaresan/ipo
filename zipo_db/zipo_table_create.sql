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

create table logger (
	dtime datetime,
	cid varchar(255),
    counter int
);


CREATE TABLE bidorder (
	scripid	varchar(255),
	applicationno	varchar(255),
	category	varchar(255),
	applicantname	varchar(255),
	depository	varchar(255),
	dpid	varchar(255),
	clientbenfid	varchar(255),
	chequereceivedflag	varchar(255),
	chequeamount	varchar(255),
	panno	varchar(255),
	bankname	varchar(255),
	location	varchar(255),
	accountnumber_upiid	varchar(255),
	ifsccode	varchar(255),
	referenceno	varchar(255),
	entrydatetime	varchar(255),
	lastmodifieddatetime	varchar(255),
	dpstatus	varchar(255),
	dpremarks	varchar(255),
	sponsorbankpaystatus	varchar(255),
	sponsorbankactiontime	varchar(255),
	sponsorbankamtblocked	varchar(255),
	rejectreason	varchar(255),
	loginid	varchar(255),
	branchcode	varchar(255),
	chequeno	varchar(255),
	subbrokercode	varchar(255),
	errorcode	varchar(255),
	message	varchar(255),
	bids json
);


ALTER TABLE bidorder
ADD orderstatus varchar(255);

ALTER TABLE ipo
ADD descr varchar(255);

ALTER TABLE ipo
ADD rhpdoc varchar(255);
	
ALTER TABLE bidorder
MODIFY COLUMN applicationno varchar(255) unique;

DELETE FROM `movies` WHERE `movie_id` = 18;

CREATE TABLE application (
    app_no int,
    c_code varchar(255)
);

CREATE TABLE order_book (
	scripid                  varchar(255),
	applicationno            varchar(255),
	category                 varchar(255),
	applicantname            varchar(255),
	depository               varchar(255),
	dpid                     varchar(255),
	clientbenfid             varchar(255),
	chequereceivedflag       varchar(255),
	chequeamount             varchar(255),
	panno                    varchar(255),
	bankname                 varchar(255),
	location                 varchar(255),
	accountnumber_upiid      varchar(255),
	ifsccode                 varchar(255),
	referenceno              varchar(255),
	entrydatetime            varchar(255),
	lastmodifieddatetime     varchar(255),
	dpstatus                 varchar(255),
	dpremarks                varchar(255),
	sponsorbankpaystatus     varchar(255),
	sponsorbankactiontime    varchar(255),
	sponsorbankamtblocked    varchar(255),
	rejectreason             varchar(255),
	loginid                  varchar(255),
	branchcode               varchar(255),
	chequeno                 varchar(255),
	subbrokercode            varchar(255),
	errorcode                varchar(255),
	message                  varchar(255),
	bids                     varchar(255)
);