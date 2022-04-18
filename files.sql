select * from BATCH4BTR_login;
select * from BATCH4BTR_empDetails;
select * from BATCH4BTR_request;
select * from BATCH4BTR_history;

drop table BATCH4BTR_login;
drop table BATCH4BTR_empDetails;
drop table BATCH4BTR_history;
drop table BATCH4BTR_request;

drop sequence loginIdSeq;
drop sequence empDSeq;
drop sequence reqIdSeq;
drop sequence hisIdSeq;


CREATE SEQUENCE loginIdSeq START WITH 9;
CREATE TABLE BATCH4BTR_login(
    empId number(5) DEFAULT loginIdSeq.nextval NOT NULL PRIMARY KEY,
    ename varchar2(25) NOT NULL,
    email varchar2(25) NOT NULL,
    pass varchar2(20) NOT NULL,
    postDetailsId number(1) default 0 NOT NULL
    );
    
insert into BATCH4BTR_login values(1, 'Ayan Khan', 'ayan@gmail.com', 'ayan123', 1);
insert into BATCH4BTR_login values(2, 'Megha Shah', 'megha@gmail.com', 'megha123', 2);
insert into BATCH4BTR_login values(3, 'Neha Moon', 'neha@gmail.com', 'neha123', 3);
insert into BATCH4BTR_login values(4, 'Aniket Mishra', 'aniket@gmail.com', 'aniket123', 0);
insert into BATCH4BTR_login values(5, 'Yogita Kshirsagar', 'yogita@gmail.com', 'yogita123', 0);
insert into BATCH4BTR_login values(6, 'Bhupendra Singh', 'bhupen@gmail.com', 'abhupen123', 0);


CREATE SEQUENCE empDSeq START WITH 103;

    CREATE TABLE BATCH4BTR_empDetails(
    empdDetId Number (5) DEFAULT empIdsSeq.nextval NOT NULL PRIMARY KEY,
    nationality varchar2(20) NOT NULL,
    nationId number(4) NOT NULL,
    joinDate varchar2(20) NOT NULL,
    dob varchar2(20) NOT NULL,
    passport number (4) NOT NULL,
    gender varchar(6) not null,
    dept varchar(6) not null,
    empId Number (5) NOT NULL,
    FOREIGN KEY (empId) REFERENCES BATCH4BTR_login(empId)
    );
    
insert into BATCH4BTR_empDetails values(101, 'Indian', 444, to_date('20-6-2021','dd-mm-yyyy'), to_date('28-9-2001','dd-mm-yyyy'), 1111, 'male' , 'A.D.', 4);
insert into BATCH4BTR_empDetails values(102, 'American', 555, to_date('16-6-2021','dd-mm-yyyy'), to_date('08-8-2000','dd-mm-yyyy'), 2222, 'female', 'H.C.M.', 5);

CREATE SEQUENCE reqIdSeq START WITH 1013;
CREATE TABLE BATCH4BTR_request (
    reqId number(5) DEFAULT reqIdSeq.nextval NOT NULL PRIMARY KEY,
    depart varchar2(20) NOT NULL ,
    destination varchar2(20) NOT NULL,
    travelDate varchar2(20) NOT NULL,
    accom varchar2(10),
    advnc varchar2(10),
    amt number(10) DEFAULT '0',
    status varchar2(10) DEFAULT 'Pending' not null,
    empId number(5),
    FOREIGN KEY (empId) REFERENCES BATCH4BTR_login(empId));
    
    insert into BATCH4BTR_request values(1011, 'India', 'London', to_date('20-1-2022','dd-mm-yyyy'), 'yes', 'yes', 5000, 'pending', 1);
    insert into BATCH4BTR_request values(1012, 'India', 'Japan', to_date('20-9-2021','dd-mm-yyyy'), 'yes', 'no', 0, 'approved', 2);
    
CREATE  SEQUENCE  hisIdSeq START WITH 5001;

CREATE TABLE BATCH4BTR_history (
    hisId number(5) DEFAULT hisIdSeq.nextval NOT NULL PRIMARY KEY,
    depart varchar2(25) NOT NULL,
    destination varchar2(25) NOT NULL,
    travelDate DATE NOT NULL,
    status varchar2(10) NOT NULL,
    reqId number(5),
    FOREIGN KEY (reqId) REFERENCES BATCH4BTR_request(reqId)
    );

insert into BATCH4BTR_history values(5001, 'India', 'London', to_date('20-1-2022','dd-mm-yyyy'), 'pending', 1011);


select  r.reqId, e.ename, r.depart, r.destination, r.travelDate, e.empId from BATCH4BTR_login e  join BATCH4BTR_request r on e.empId = r.empid;

select r.reqId, e.ename, r.depart, r.destination, r.travelDate, e.empId 
from BATCH4BTR_login e  join BATCH4BTR_request r on e.empId = r.empid
;

select  be.*, br.*, bed.*  from BATCH4BTR_login  be full outer join  BATCH4BTR_request br on be.empId = br.empId
full outer join BATCH4BTR_empDetails bed on  be.empId = bed.empId 
;

CREATE OR REPLACE PROCEDURE get_next_approver (
    requestid IN NUMBER
) IS

    current_apr_level NUMBER := 0;
    next_apr_level    NUMBER := 0;
    next_apr_id       NUMBER := 0;
    next_apr_person   VARCHAR2(25) := NULL;
BEGIN
    SELECT
        pending_with
    INTO current_apr_level
    FROM
        BATCH4BTR_request
    WHERE
        reqid = requestid;

    IF current_apr_level IS NOT NULL THEN
        next_apr_level := current_apr_level + 1;
    END IF;
    IF next_apr_level != 0 THEN
        SELECT
            ename,
            empid
        INTO
            next_apr_id,
            next_apr_person
        FROM
            BATCH4BTR_login
        WHERE
            postDetailsId = next_apr_level;
    END IF;
    IF next_apr_person IS NOT NULL THEN
        UPDATE BATCH4BTR_request
        SET
            pending_with = next_apr_level;
     INSERT INTO BATCH4BTR_history_tbl (
            reqID,
            from_level,
            to_level
        ) VALUES (
            requestid,
            current_apr_level,
            next_apr_level
        );
    ELSE
        UPDATE BATCH4BTR_request
        SET
            status = 'Completed';
    END IF;
END;




CREATE TABLE BATCH4BTR_history_tbl (
    hid         NUMBER(4),
    from_level  VARCHAR2(25),
    to_level    VARCHAR2(25),
    action_date DATE DEFAULT SYSDATE,
    PRIMARY KEY ( "HID" ),
    REQID Number (5) CONSTRAINT FK_BATCH4BTR_HISTORY_TBL_REQID REFERENCES BATCH4BTR_request
);



 

CREATE SEQUENCE "BATCH4BTR_HISTORY_SEQ" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1;

 


 
















