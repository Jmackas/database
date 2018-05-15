CREATE TABLE B_Member (
Member_ID		NUMBER(8) NOT NULL,
First_Name		VARCHAR2(25) NOT NULL,
Last_Name		VARCHAR2(25) NOT NULL,
DOB			DATE NOT NULL,
Gender			CHAR() NOT NULL,
Address			VARCHAR2(25) NOT NULL,
Mobile			VARCHAR2(25) NOT NULL,
Home_Phone		VARCHAR2(25), 
Email			VARCHAR2(50) NOT NULL,
Health_Condition	VARCHAR2(80) NOT NULL,
Emergency_Name		VARCHAR2(25) NOT NULL,
Emergency_Mobile	VARCHAR2(15) NOT NULL,
Emergency_Relationship	VARCHAR2(15) NOT NULL,
Attendance_Status	BOOLEAN(),
Participation_Status	CHAR(),

	CONSTRAINT PK_B_Member PRIMARY KEY (Member_ID)
);

/* to create the required database for testing differnt types of joins */
CREATE TABLE PRODUCT_Outerjoin (
PROD_CODE varchar2(20),
PROD_DESCRIPTION varchar2(60),
PROD_PRICE float(8),
PROD_QOH integer,
VEND_NUM integer
);
INSERT INTO B_Member VALUES('COCBLPAR6','6 ft. parallel cable, shielded metal case','14.34','63','5');
INSERT INTO B_Member VALUES('DRSUCR44MX','Removable cartridge, 44MB, Maxell','45.95','23','3');
INSERT INTO B_Member VALUES('DRSUCR88MX','Removable cartridge, 88MB, Maxell','52.99','41','');

INSERT INTO PRODUCT_Outerjoin VALUES('DRSUDI12-3M','3.5" HD/DS Diskettes, 1.44 MB formatted, IBM, 12/box, 3M','5.99','95','5');
INSERT INTO PRODUCT_Outerjoin VALUES('DRSUDI50-3M','3.5" HD/DS Diskettes, 1.44 MB formatted, IBM, 50/box, 3M','16.43','108','2');
INSERT INTO PRODUCT_Outerjoin VALUES('DRSUTC3490E','Tape cartridge, 1,100ft, 36-track, AS400-3480-3490E','21.75','22','2');
INSERT INTO PRODUCT_Outerjoin VALUES('PRCTCANBC02','Canon color cartridge, BJ-100, 2200, 210, 230','36.57','102','9');
INSERT INTO PRODUCT_Outerjoin VALUES('PRCTHPDJ56','HP DeskJet Plus, 500C, 550C, 600','26.95','89','3');
INSERT INTO PRODUCT_Outerjoin VALUES('PRCTLEX4072','IBM (Lexmark) 4072 ExecJet cartridge','22.95','127','5');

/* -- */

CREATE TABLE B_Membership (
Membership_ID 				NUMBER(8) NOT NULL,
Voting_Rights				BOOLEAN NOT NULL,
Start_Date				DATE NOT NULL,
Membership_Class			VARCHAR2() NOT NULL
Exercise_Location			VARCHAR2(),
Nominee					VARCHAR2(),
Approved_by				VARCHAR2() NOT NULL,
Family_Acknowledgement_Status		VARCHAR2() NOT NULL,
Family_Acknowledgement_Name		VARCHAR2() NOT NULL,
Family_Acknowledgement_Signature_Status	VARCHAR2() NOT NULL,
Family_Acknowledgement_Date		DATE NOT NULL,
Family_Acknowledgement_Relationship	VARCHAR2() NOT NULL,

	CONSTRAINT PK_B_Membership PRIMARY KEY (Membership_ID)
);

CREATE TABLE B_Course (
Course_ID		NUMBER(,) NOT NULL,
Exercise_Type		VARCHAR2(),
Exercise_Location	VARCHAR2(),

	CONSTRAINT PK_B_Course PRIMARY KEY (Course_ID)
);

CREATE TABLE B_Event (
Event_ID			NUMBER(,) NOT NULL,
Event_Name			VARCHAR2(),
Event_Date			DATE,
Event_Time			TIME,
Event_Photo_Drive_Location	VARCHAR2(),

	CONSTRAINT PK_B_Event PRIMARY KEY (Event_ID)
);

CREATE TABLE B_Committee_Member_Type (
Committee_Member_Type_ID	NUMBER(,) NOT NULL,
Association_Committee_Position	VARCHAR2(),

	CONSTRAINT PK_B_Committee_Member_Type PRIMARY KEY (Committee_Member_Type_ID)
);

CREATE TABLE B_Membersip_Fee (
Membership_Fee_ID		NUMBER(,) NOT NULL,
Membership_ID			NUMBER(,) NOT NULL,
Fee_Schedule			VARCHAR2() NOT NULL,
Fee_Type			VARCAHR2() NOT NULL,
Membership_Duration		NUMBER(,),
Couple_Discount_Status		BOOLEAN,
Partner_ID			NUMBER(,),
Fee_Year			NUMBER(,),
Amount				NUMBER(,),

	CONSTRAINT PK_Membership_Fee PRIMARY KEY (Membership_Fee_ID)
	CONSTRAINT FK_Membership FOREIGN KEY (Membership_ID) REFERENCES Membership
);

CREATE TABLE B_Membership_History (
Membership_History_ID		NUMBER(,) NOT NULL,
Member_ID			NUMBER(,) NOT NULL,
Membership_ID			NUMBER(,) NOT NULL,
Start_Date			DATE NOT NULL,
End_Date			DATE,

	CONSTRAINT PK_Membership_History PRIMARY KEY (Membership_History_ID)
	CONSTRAINT FK_Member FOREIGN KEY (Member_ID) REFERENCES Member
	CONSTRAINT FK_Membership FOREIGN KEY (Membership_ID) REFERENCES Membership
);

CREATE TABLE B_Events_Attendance (
Events_Attendance_ID		NUMBER(,) NOT NULL,
Member_ID			NUMBER(,),
Event_ID			NUMBER(,) NOT NULL,
Attendance_Status		BOOLEAN,

	CONSTRAINT PK_Events_Attendance PRIMARY KEY (Events_Attendance_ID)
	CONSTRAINT FK_Member FOREIGN KEY (Member_ID) REFERENCES Member
	CONSTRAINT FK_Event FOREIGN KEY (Event_ID) REFERENCES Event
);

CREATE TABLE B_Course_Attendance (
Course_Attendance_ID		NUMBER(,) NOT NULL,
Member_ID			NUMBER(,) NOT NULL,
Course_ID			NUMBER(,),
Attendance_Date_Time		DATE NOT NULL,
Bar_Code			NUMBER(,) NOT NULL,

	CONSTRAINT PK_Course_Attendance PRIMARY KEY (Course_Attendance_ID)
	CONSTRAINT FK_Member FOREIGN KEY (Member_ID) REFERENCES Member
	CONSTRAINT FK_Course FOREIGN KEY (Course_ID) REFERENCES Course
);

CREATE TABLE B_Committee_Member_History (
Committee_Member_History_ID	NUMBER(,) NOT NULL,
Member_ID			NUMBER(,),
Committee_Member_Type_ID	NUMBER(,),
Start_Date			DATE NOT NULL,
End_Date			DATE,

	CONSTRAINT PK_Committee_Member_History PRIMARY KEY (Committe_Member_History_ID)
	CONSTRAINT FK_Member FOREIGN KEY (Member_ID) REFERENCES Member
	CONSTRAINT FK_Committee_Member_Type FOREIGN KEY (Committee_Member_Type_ID) REFERENCES Committee Member Type
);

CREATE TABLE B_Event_Organiser_History (
Event_Organiser_ID		NUMBER(,) NOT NULL,
Member_ID			NUMBER(,),
Event_ID			NUMBER(,),
Note				VARCHAR2(),

	CONSTRAINT PK_Event_Organiser_History PRIMARY KEY (Event_Organiser_ID)
	CONSTRAINT FK_Member FOREIGN KEY (Member_ID) REFERENCES Member
	CONSTRAINT FK_Event FOREIGN KEY (Event_ID) REFERENCES Event
);

CREATE TABLE B_Training_Assignment (
Training_Assignment_ID		NUMBER(,) NOT NULL,
Trainer_ID			NUMBER(,) NOT NULL,
Course_ID			NUMBER(,) NOT NULL,
Start_Date			DATE NOT NULL,
End_Date			DATE,

	CONSTRAINT PK_Training_Assignment PRIMARY KEY (Training_Assignment_ID)
	CONSTRAINT FK_Trainer FOREIGN KEY (Trainer_ID) REFERENCES Trainer
	CONSTRAINT FK_Course FOREIGN KEY (Course_ID) REFERENCES Course
);

CREATE TABLE B_Payment (
Payment_ID			NUMBER(,) NOT NULL,
Membership_Fee_ID		NUMBER(,),
Course_Attendance_ID		NUMBER(,),
Payment_Method			VARCHAR2(),
Paid_By				DATE,
Payment_Date			DATE,
Payment_Terms			VARCHAR2(),
Payment_Status			BOOLEAN(),
Account_Status			BOOLEAN(),
Amount				NUMBER(,),

	CONSTRAINT PK_Payment PRIMARY KEY (Payment_ID)
	CONSTRAINT FK_Membership_Fee FOREIGN KEY (Membership_Fee_ID) REFERENCES Membership Fee
	CONSTRAINT FK_Course_Attendance FOREIGN KEY (Course_Attendance_ID) REFERENCES Course Attendance
);

