DROP TABLE International;
DROP TABLE Tracking;
DROP TABLE Vehicle_Warehouse;
DROP TABLE Transaction;
DROP TABLE PackageDelivery;
DROP TABLE Package;
DROP TABLE Service;
DROP TABLE Customer;


CREATE TABLE Customer(
	CustomerID varchar(20),
	Name varchar(30) NOT NULL,
	Country varchar(30),
	State varchar(30),
	City varchar(30),
	HouseNo varchar(30),
	Street varchar(30),
	Email varchar(30),
	Phone varchar(10),
	PRIMARY KEY(CustomerID));

CREATE TABLE DeliveryCompany(
	CompanyID varchar(20),
	Name varchar(30) NOT NULL,
	Country varchar(30),
	State varchar(30),
	City varchar(30),
	PRIMARY KEY(CompanyID));

CREATE TABLE Service(
	ServiceID varchar(15),
	ServiceType varchar(20),
	PackageType varchar(20) NOT NULL,
	Weight int,
	Amount int,
	Speed varchar(20),
	PRIMARY KEY(ServiceID));

CREATE TABLE Package(
	PkgID varchar(15),
	IsFragile varchar(3),
	Description varchar(30),
	Weight int,
	HazardousCategory varchar(20),
	PRIMARY KEY(PkgID));

CREATE TABLE PackageDelivery(
	CustomerID varchar(20),
	PkgID varchar(20),
	ReceiverName varchar(20),
	Email varchar(30),
	Phone varchar(10),
	Country varchar(30),
	State varchar(30),
	City varchar(30),
	Zipcode varchar(30),
	Street varchar(30),
	DateOfRequest timestamp,
	PRIMARY KEY(PkgID),
	FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
	CONSTRAINT FK_PkgDel FOREIGN KEY(PkgID) REFERENCES Package(PkgID));

CREATE TABLE Transaction(
	PkgID varchar(15),
	CustomerID varchar(15),
	ServiceID varchar(20),
	Time timestamp,
	Amount int,
	PaymentType varchar(20),
	Account varchar(20),
	FOREIGN KEY(PkgID) REFERENCES Package(PkgID),
	CONSTRAINT FK_Transaction1 FOREIGN KEY(CustomerID) REFERENCES Customer(CustomerID),
	CONSTRAINT FK_Transaction2 FOREIGN KEY(ServiceID) REFERENCES Service(ServiceID));

CREATE TABLE Vehicle_Warehouse(
	RegistrationNo varchar(15),
	Type varchar(30) NOT NULL,
	PRIMARY KEY(RegistrationNo));

CREATE TABLE Tracking(
	PkgID varchar(15),
	RegistrationNo varchar(15),
	CurrentCity varchar(50),
	CurrentTime timestamp,
	DeliveryTime timestamp,
	Status varchar(20),
	PRIMARY KEY(PkgID,CurrentTime),
	CONSTRAINT FK_Tracking1 FOREIGN KEY(PkgID) REFERENCES Package(PkgID),
	CONSTRAINT FK_Tracking2 FOREIGN KEY(RegistrationNo) REFERENCES Vehicle_Warehouse(RegistrationNo));

CREATE TABLE International(
	PkgID varchar(15),
	Value int,
	Contents varchar(30),
	PRIMARY KEY(PkgID),
	CONSTRAINT FK_International FOREIGN KEY(PkgID) REFERENCES Package(PkgID));

CREATE TABLE Declaration (
    DeclarationID varchar(20),
    PkgID varchar(15),
    Title varchar(10),
    Description varchar(100),
    PRIMARY KEY(DeclarationID),
    FOREIGN KEY (PkgID) REFERENCES International(PkgID)
);

--Inserting data
insert into DeliveryCompany (CompanyID, Name, Country, State, City) values ('23456789','MUCHACHA','USA','13','LA');


insert into Package (PkgID, IsFragile, Description, Weight,HazardousCategory) values ('74976', 'YES', 'HGVUFYV', '754','NORMAL');
insert into Package (PkgID, IsFragile, Description, Weight,HazardousCategory) values ('94646', 'YES', 'PFCJSG', '234','NORMAL');
insert into Package (PkgID, IsFragile, Description, Weight,HazardousCategory) values ('73426', 'YES', 'NJDSHU', '4','DANGEROUS');
insert into Package (PkgID, IsFragile, Description, Weight,HazardousCategory) values ('12846', 'YES', 'HWWFVV', '54','DANGEROUS');
insert into Package (PkgID, IsFragile, Description, Weight,HazardousCategory) values ('87563', 'YES', 'KVJMFH', '7','NORMAL');
insert into Package (PkgID, IsFragile, Description, Weight,HazardousCategory) values ('23658', 'NO', 'KIYA', '84','DANGEROUS');
insert into Package (PkgID, IsFragile, Description, Weight,HazardousCategory) values ('19374', 'NO', 'ALOHA', '84','NORMAL');
insert into Package (PkgID, IsFragile, Description, Weight,HazardousCategory) values ('94734', 'YES', 'MWAH', '24','DANGEROUS');
insert into Package (PkgID, IsFragile, Description, Weight,HazardousCategory) values ('19273', 'YES', 'KRUHBZ', '10','NORMAL');
insert into Package (PkgID, IsFragile, Description, Weight,HazardousCategory) values ('33456', 'YES', 'BTUH', '100','NORMAL');
insert into Package (PkgID, IsFragile, Description, Weight,HazardousCategory) values ('76766', 'NO', 'BBBYV', '50','NORMAL');
insert into Package (PkgID, IsFragile, Description, Weight,HazardousCategory) values ('98466', 'YES', 'LSJFUHV', '20','DANGEROUS');
insert into Package (PkgID, IsFragile, Description, Weight,HazardousCategory) values ('99976', 'NO', 'HGVKSJUHV','20','NORMAL');
insert into Package (PkgID, IsFragile, Description, Weight,HazardousCategory) values ('78877', 'NO', 'HGSFSWVV', '2000','DANGEROUS');
insert into Package (PkgID, IsFragile, Description, Weight,HazardousCategory) values ('55443', 'NO', 'HWWEREV', '1000','NORMAL');
insert into Package (PkgID, IsFragile, Description, Weight,HazardousCategory) values ('99999', 'YES', 'WEIRD', '19','DANGEROUS');
insert into Package (PkgID, IsFragile, Description, Weight,HazardousCategory) values ('66666', 'NO', 'AUTYR', '16','DANGEROUS');
insert into Package (PkgID, IsFragile, Description, Weight,HazardousCategory) values ('11111', 'NO', 'LETO', '13','NORMAL');
insert into Package (PkgID, IsFragile, Description, Weight,HazardousCategory) values ('22222', 'YES', 'ZIHGA', '12','DANGEROUS');
insert into Package (PkgID, IsFragile, Description, Weight,HazardousCategory) values ('33333', 'YES', 'IQUOU', '11','NORMAL');

insert into Customer (CustomerID, Name,Country, State,City,HouseNo,Street,Email,Phone) values ('0001', 'Adam', 'KZ', '12','ALMATY','14','Adjaian','aidhhau@mail','848');
insert into Customer (CustomerID, Name,Country, State,City,HouseNo,Street,Email,Phone) values ('0241', 'Mart', 'KZ', '12','KARAGANDA','15','Adjaian','kfkjfhyau@mail','22');
insert into Customer (CustomerID, Name,Country, State,City,HouseNo,Street,Email,Phone) values ('2201', 'Ali', 'KZ', '12','KYZYLORDA','19','Adjaian','awtdgf@mail','119485');
insert into Customer (CustomerID, Name,Country, State,City,HouseNo,Street,Email,Phone) values ('9371', 'Vlad', 'RU', '12','MOSCOW','23','AdFSFGn','aurhfg@mail','533423');
insert into Customer (CustomerID, Name,Country, State,City,HouseNo,Street,Email,Phone) values ('6431', 'Nasta', 'UZ', '12','TASHKENT','23','SFGVian','urdfyfu@mail','242343');
insert into Customer (CustomerID, Name,Country, State,City,HouseNo,Street,Email,Phone) values ('2871', 'Helga', 'KRG', '12','BISHKEK','33','SKOFIN','lalalsk@mail','65645');
insert into Customer (CustomerID, Name,Country, State,City,HouseNo,Street,Email,Phone) values ('1473', 'Roma', 'BRAZIL', '12','BRAZILIA','18','ASKEOQ','aifudg@mail','72-5425');
insert into Customer (CustomerID, Name,Country, State,City,HouseNo,Street,Email,Phone) values ('9375', 'John', 'USA', '12','MIAMI','1','MOLAA','awtdfdu@mail','275504');
insert into Customer (CustomerID, Name,Country, State,City,HouseNo,Street,Email,Phone) values ('2745', 'Aki', 'KZ', '12','SHYMKENT','2','LDKISJ','sfdfd@mail','655323');
insert into Customer (CustomerID, Name,Country, State,City,HouseNo,Street,Email,Phone) values ('2341', 'Mila', 'KZ', '12','TARAZ','3','Adjaian','apgigg@mail','42356');
insert into Customer (CustomerID, Name,Country, State,City,HouseNo,Street,Email,Phone) values ('999', 'Akolm', 'USA', '12','LA','4','MOLAA','papiu@mail','43968');
insert into Customer (CustomerID, Name,Country, State,City,HouseNo,Street,Email,Phone) values ('01', 'Akon', 'USA', '12','MANHATTAN','5','KUHFBn','uuuuu@mail','2232');
insert into Customer (CustomerID, Name,Country, State,City,HouseNo,Street,Email,Phone) values ('451', 'Luis', 'KZ', '12','AKTAU','14','Adjaian','ercsfau@mail','266867');
insert into Customer (CustomerID, Name,Country, State,City,HouseNo,Street,Email,Phone) values ('1029', 'Faga', 'USA', '12','MIAMI','5','AQKJFBCB','wefgtau@mail','957');
insert into Customer (CustomerID, Name,Country, State,City,HouseNo,Street,Email,Phone) values ('9090', 'Qaqa', 'USA', '12','MIAMI','8','KSJDNCn','ayshgf@mail','968');
insert into Customer (CustomerID, Name,Country, State,City,HouseNo,Street,Email,Phone) values ('7541', 'Kara', 'KZ', '12','ALMATY','14','Adjaian','nnnau@mail','8438');
insert into Customer (CustomerID, Name,Country, State,City,HouseNo,Street,Email,Phone) values ('45451', 'Mona', 'KZ', '12','KARAGANDA','15','Adjaian','aaauau@mail','2552');
insert into Customer (CustomerID, Name,Country, State,City,HouseNo,Street,Email,Phone) values ('7675', 'Liza', 'KZ', '12','KYZYLORDA','19','Adjaian','kkkk@mail','3285');
insert into Customer (CustomerID, Name,Country, State,City,HouseNo,Street,Email,Phone) values ('3445', 'Vola', 'RU', '12','MOSCOW','23','AdFSFGn','zszszg@mail','5999');
insert into Customer (CustomerID, Name,Country, State,City,HouseNo,Street,Email,Phone) values ('34567', 'Nzaja', 'UZ', '12','TASHKENT','23','SFGVian','huytcu@mail','221143');
insert into Customer (CustomerID, Name,Country, State,City,HouseNo,Street,Email,Phone) values ('87757', 'Qgdrda', 'UZ', '12','TASHKENT','23','SFGVian','khugyu@mail','28863');

insert into Tracking (PkgID,RegistrationNo,CurrentCity,CurrentTime,DeliveryTime,Status) values ('74976', 'UK07-1', 'MIAMI', '2021-04-26 13:27:35','2021-04-27 17:31:51','Out For Delivery');
insert into Tracking (PkgID,RegistrationNo,CurrentCity,CurrentTime,DeliveryTime,Status) values ('98466', 'UK07-19', 'MIAMI', '2021-03-26 13:27:35','2021-04-27 14:30:00','Out For Delivery');
insert into Tracking (PkgID,RegistrationNo,CurrentCity,CurrentTime,DeliveryTime,Status) values ('23658', 'UK07-12', 'MIAMI', '2021-01-26 12:27:35','2020-04-27 17:00:00','Delivered');
insert into Tracking (PkgID,RegistrationNo,CurrentCity,CurrentTime,DeliveryTime,Status) values ('99976', 'UK07-19', 'MIAMI', '2020-05-26 11:56:43','2020-04-27 12:30:51','Delivered');
insert into Tracking (PkgID,RegistrationNo,CurrentCity,CurrentTime,DeliveryTime,Status) values ('11111', 'UK07-10', 'MIAMI', '2021-02-26 10:27:35','2021-04-27 11:31:51','Out For Delivery');
insert into Tracking (PkgID,RegistrationNo,CurrentCity,CurrentTime,DeliveryTime,Status) values ('99999', 'UK07-14', 'MIAMI', '2021-09-26 14:43:30','2021-04-27 17:51:40','Out For Delivery');
insert into Tracking (PkgID,RegistrationNo,CurrentCity,CurrentTime,DeliveryTime,Status) values ('33333', 'UK07-16', 'MIAMI', '2020-04-26 18:23:10','2020-04-27 19:00:00','Out For Delivery');

insert into Vehicle_Warehouse (RegistrationNo,Type) values ('UK07-19','	Truck');
insert into Vehicle_Warehouse (RegistrationNo,Type) values ('UK07-10','Truck');
insert into Vehicle_Warehouse (RegistrationNo,Type) values ('UK07-1','	Plane');
insert into Vehicle_Warehouse (RegistrationNo,Type) values ('UK07-12','	Truck');
insert into Vehicle_Warehouse (RegistrationNo,Type) values ('UK07-14','	Warehouse');
insert into Vehicle_Warehouse (RegistrationNo,Type) values ('UK07-15','	Plane');
insert into Vehicle_Warehouse (RegistrationNo,Type) values ('UK07-16','	Plane');

insert into service (ServiceID, ServiceType, PackageType, Weight, Amount, Speed)  values ('serv0','normal','Flat envelope','754','6','5 day delivery');
insert into service (ServiceID, ServiceType, PackageType, Weight, Amount, Speed)  values ('serv1','prepaid','Larger box','234','24','10 day delivery');
insert into service (ServiceID, ServiceType, PackageType, Weight, Amount, Speed)  values ('serv2','normal','Flat envelope','50','300','4 day delivery');
insert into service (ServiceID, ServiceType, PackageType, Weight, Amount, Speed)  values ('serv3','prepaid','Larger box','84','1','delivered');
insert into service (ServiceID, ServiceType, PackageType, Weight, Amount, Speed)  values ('serv4','postpaid','Flat envelope','20','2','delivered');
insert into service (ServiceID, ServiceType, PackageType, Weight, Amount, Speed)  values ('serv5','postpaid','Larger box','19','1','7 day delivery');
insert into service (ServiceID, ServiceType, PackageType, Weight, Amount, Speed)  values ('serv6','normal','Flat envelope','24','4','5 day delivery');
insert into service (ServiceID, ServiceType, PackageType, Weight, Amount, Speed)  values ('serv7','prepaid','Larger box','4','245','1 day delivery');
insert into service (ServiceID, ServiceType, PackageType, Weight, Amount, Speed)  values ('serv8','normal','Flat envelope','12','24','3 day delivery');

insert into PackageDelivery (CustomerID, PkgID, ReceiverName, Email, Phone, Country, State, City, Zipcode, Street, DateOfRequest) values ('0001','74976','Adam','aidhhau@mail','848','KZ','12','ALMATY','0011','Adjaian','2021-04-26 13:27:35');
insert into PackageDelivery (CustomerID, PkgID, ReceiverName, Email, Phone, Country, State, City, Zipcode, Street, DateOfRequest) values ('0241','94734','Mart','kfkjfhyau@mail','22','KZ','12','KARAGANDA','0836','Adjaian','2021-03-26 13:27:35');
insert into PackageDelivery (CustomerID, PkgID, ReceiverName, Email, Phone, Country, State, City, Zipcode, Street, DateOfRequest) values ('2201','23658','Ali','awtdgf@mail','119485','KZ','12','KYZYLORDA','0411','Adjaian','2021-01-26 12:27:35');
insert into PackageDelivery (CustomerID, PkgID, ReceiverName, Email, Phone, Country, State, City, Zipcode, Street, DateOfRequest) values ('9371','99976','Vlad','aurhfg@mail','533423','RU','12','MOSCOW','8871','AdFSFGn','2020-05-26 11:56:43');
insert into PackageDelivery (CustomerID, PkgID, ReceiverName, Email, Phone, Country, State, City, Zipcode, Street, DateOfRequest) values ('451','11111','Luis','ercsfau@mail','266867','KZ','12','AKTAU','9381','Adjaian','2021-04-27 11:31:51');
insert into PackageDelivery (CustomerID, PkgID, ReceiverName, Email, Phone, Country, State, City, Zipcode, Street, DateOfRequest) values ('45451','99999','Mona','aaauau@mail','2552','KZ','12','KARAGANDA','0354','Adjaian','2020-04-27 19:00:00');
insert into PackageDelivery (CustomerID, PkgID, ReceiverName, Email, Phone, Country, State, City, Zipcode, Street, DateOfRequest) values ('3445','33333','Vola','zszszg@mail','5999','RU','12','MOSCOW','1234','AdFSFGn','2020-04-26 18:23:10');
insert into PackageDelivery (CustomerID, PkgID, ReceiverName, Email, Phone, Country, State, City, Zipcode, Street, DateOfRequest) values ('9090','98466','Qaqa','ayshgf@mail','968','USA','12','MIAMI','8761','KSJDNCn','2021-04-26 13:27:35');

insert into transaction (PkgID, CustomerID, ServiceID, Time, Amount, PaymentType, Account) values ('74976','0001','serv2','2021-04-26 13:27:35','300','card','059834');
insert into transaction (PkgID, CustomerID, ServiceID, Time, Amount, PaymentType, Account) values ('23658','2201','serv0','2021-01-26 12:27:35','6','card','9847');
insert into transaction (PkgID, CustomerID, ServiceID, Time, Amount, PaymentType, Account) values ('94734','0241','serv1','2021-03-26 13:27:35','24','card','9938634');
insert into transaction (PkgID, CustomerID, ServiceID, Time, Amount, PaymentType, Account) values ('99976','9371','serv3','2020-05-26 11:56:43','1','card','345383');
insert into transaction (PkgID, CustomerID, ServiceID, Time, Amount, PaymentType, Account) values ('99999','45451','serv4','2020-04-27 19:00:00','2','card','000296');
insert into transaction (PkgID, CustomerID, ServiceID, Time, Amount, PaymentType, Account) values ('98466','9090','serv5','2021-04-26 13:27:35','1','card','736537');

insert into international (PkgID, Value, Contents) values ('33333','97836','msdbkhg');
insert into international (PkgID, Value, Contents) values ('11111','384','pqisrdg');
insert into international (PkgID, Value, Contents) values ('66666','423','kjagdeq');
insert into international (PkgID, Value, Contents) values ('78877','394','qwedfdg');
insert into international (PkgID, Value, Contents) values ('73426','324','vsvtsh');
insert into international (PkgID, Value, Contents) values ('87563','248','lshfrs');
insert into international (PkgID, Value, Contents) values ('76766','9274','retdrrs');

insert into Declaration (DeclarationID, PkgID, Title, Description) values ('dec1','33333','djkhie','wkjex8uxhg');
insert into Declaration (DeclarationID, PkgID, Title, Description) values ('dec2','11111','slodcj','wowowowow');
insert into Declaration (DeclarationID, PkgID, Title, Description) values ('dec3','66666','momidn','oaoaoaoa');
insert into Declaration (DeclarationID, PkgID, Title, Description) values ('dec4','78877','mkomk','ulalalala');
insert into Declaration (DeclarationID, PkgID, Title, Description) values ('dec5','73426','fifififi','okokokoks');
insert into Declaration (DeclarationID, PkgID, Title, Description) values ('dec6','76766','alohama','munyanya');
insert into Declaration (DeclarationID, PkgID, Title, Description) values ('dec7','87563','kuku','ktotam');



--queries
--#1 Find all customers who had a package on that truck at the time of the crash.

SELECT Name FROM Customer
WHERE Customer.CustomerID IN(
	SELECT CustomerID FROM PackageDelivery
	WHERE PkgID IN(
		SELECT DISTINCT PkgID
			FROM Tracking
			WHERE RegistrationNo='UK07-19'
			AND Status = 'Out For Delivery'
			));

--#2 Find all recipients who had a package on that truck at the time of the crash.
SELECT ReceiverName FROM PackageDelivery
WHERE PkgID IN(
	SELECT DISTINCT PkgID FROM Tracking
	WHERE RegistrationNo='UK07-19'
	AND Status = 'Out For Delivery');

--#3 Find the last successful delivery by that truck prior to the crash.
SELECT PkgID FROM Tracking
WHERE DeliveryTime=(SELECT MAX(DeliveryTime) FROM Tracking
	WHERE RegistrationNo='UK07-19'
	AND Status = 'Delivered');

--#B)Find the customer who has shipped the most packages in the past year.
SELECT CustomerID FROM packagedelivery
WHERE extract(year from DateOfRequest)=2020 GROUP BY CustomerID ORDER BY count(*) DESC LIMIT 1;

--#C) Find the customer who has spent the most money on shipping in the past year.
SELECT CustomerID from Transaction
WHERE extract(year from time)=2020
GROUP BY CustomerID
ORDER BY sum(amount) desc LIMIT 1;

--#D) Find the street with the most customers.
SELECT Street FROM Customer GROUP BY Street ORDER BY count(*) DESC LIMIT 1;

--#E) Find those packages that were not delivered within the promised time.
SELECT DISTINCT Transaction.PkgID
FROM Transaction,Tracking,PackageDelivery,Service
WHERE Transaction.PkgID=Tracking.PkgID
AND Transaction.ServiceID=Service.ServiceID
AND PackageDelivery.PkgID=Transaction.PkgID
AND Tracking.DeliveryTime<Tracking.CurrentTime;

--#BILL)
SELECT Customer.CustomerID, Customer.Name, Transaction.Amount, Customer.HouseNo, Customer.Street, Customer.City, Customer.State, Customer.Country, Customer.Email, Customer.Phone
FROM Customer, Transaction
WHERE Customer.CustomerID = Transaction.CustomerID AND Transaction.ServiceID IN(
        SELECT ServiceID
        FROM Service
        WHERE ServiceType = 'Postpaid')
UNION
SELECT Customer.CustomerID, Customer.Name, 0, Customer.HouseNo, Customer.Street, Customer.City, Customer.State, Customer.Country, Customer.Email, Customer.Phone
FROM Customer WHERE Customer.CustomerID not IN (
		SELECT CustomerID FROM Transaction)
UNION
SELECT Customer.CustomerID, Customer.Name, 0, Customer.HouseNo, Customer.Street, Customer.City, Customer.State, Customer.Country, Customer.Email, Customer.Phone
FROM Customer, Transaction
WHERE Customer.CustomerID = Transaction.CustomerID AND Transaction.ServiceID IN(
        SELECT ServiceID
        FROM Service
        WHERE ServiceType!= 'Postpaid');

--select 1
SELECT * FROM Service;
--select 2
SELECT * FROM Transaction;



