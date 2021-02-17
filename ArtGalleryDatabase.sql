DROP DATABASE IF EXISTS ArtGallery;

CREATE DATABASE IF NOT EXISTS ArtGallery;

USE ArtGallery;


-- Staff Roles 
CREATE TABLE role (
    RoleID char(4) NOT NULL,
    Name varchar(20) NOT NULL,
    Responsibility varchar(255) NOT NULL,
    CONSTRAINT PK_role PRIMARY KEY(RoleID)
);

-- Staff Members 
CREATE TABLE staff (
    StaffID char(8) NOT NULL,
    RoleID char(4) NOT NULL,
    FirstName varchar(20) NOT NULL,
    LastName varchar(30) NOT NULL,
    Email varchar(50) NOT NULL,
    PhoneNumber varchar(15) NOT NULL,
    StreetName varchar(50) NOT NULL,
    HouseNumber int(3) NOT NULL,
    FlatNumber int(3),
    PostCode varchar(10) NOT NULL,
    City varchar(30) NOT NULL,
    CONSTRAINT PK_staff PRIMARY KEY(StaffID),
    CONSTRAINT FK_staff_role FOREIGN KEY(RoleID) REFERENCES role(RoleID)
);

-- Permanent Exhibition Rooms
CREATE TABLE permRoom (
    PermRoomID char(5) NOT NULL,
    Theme varchar(50),
    WallSlots int(2) NOT NULL,
    SculptureSlots int(2) NOT NULL,
    PermStaffID char(8) NOT NULL,
    CONSTRAINT PK_permRoom PRIMARY KEY(PermRoomID),
    CONSTRAINT FK_staff_to_permroom FOREIGN KEY(PermStaffID) REFERENCES staff(StaffID)
);

-- Temporary Exhibition Rooms 
CREATE TABLE tempRoom (
    TempRoomID char(5) NOT NULL,
    WallSlots int(2) NOT NULL,
    SculptureSlots int(2) NOT NULL,
    Availability boolean NOT NULL,
    PricePerDay decimal(5,2) NOT NULL,
    TempStaffID char(8) NOT NULL,
    CONSTRAINT PK_tempRoom PRIMARY KEY(TempRoomID),
    CONSTRAINT FK_staff_to_temproom FOREIGN KEY(TempStaffID) REFERENCES staff(StaffID)
);

-- Art Styles 
CREATE TABLE artStyle (
    ArtStyleID char(4) NOT NULL,
    Name varchar(20) NOT NULL,
    Description varchar(255),
    TimeOfOrigin varchar(30) NOT NULL,
    CONSTRAINT PK_artStyle PRIMARY KEY (ArtStyleID)
);

-- Authors
CREATE TABLE author (
    AuthorID char(4) NOT NULL,
    Alias varchar(50),
    FirstName varchar(50),
    LastName varchar(50),
    ActiveYears varchar(30),
    CountryOfOrigin varchar(30),
    CONSTRAINT PK_author PRIMARY KEY(AuthorID)
);

-- Art Pieces
CREATE TABLE galleryArt (
    ArtPieceID char(5) NOT NULL,
    IfSculpture boolean NOT NULL,
    Title varchar(100),
    AuthorID char(4) NOT NULL,
    ArtStyleID char(4) NOT NULL,
    TimeOfCreation varchar(30) NOT NULL,
    PermRoomID char(5),
    CONSTRAINT PK_galleryArt PRIMARY KEY (ArtPieceID),
    CONSTRAINT FK_galleryArt_author FOREIGN KEY(AuthorID) REFERENCES author(AuthorID),
    CONSTRAINT FK_gallerArt_artStyle FOREIGN KEY(ArtStyleID) REFERENCES artStyle(ArtStyleID),
    CONSTRAINT FK_galleryArt_permRoom FOREIGN KEY(PermRoomID) REFERENCES permRoom(PermRoomID)

);


-- Customers 
CREATE TABLE customer (
    CustomerID char(6) NOT NULL,
    FirstName varchar(20) NOT NULL,
    LastName varchar(30) NOT NULL,
    Email varchar(50) NOT NULL,
    PhoneNumber varchar(11),
    StreetName varchar(50),
    HouseNumber int(3),
    FlatNumber int(3),
    PostCode varchar(10),
    City varchar(30),
    CONSTRAINT PK_customer PRIMARY KEY(CustomerID)

);

-- Temporary Exhibition Room Booking 
CREATE TABLE booking (
    BookingID char(6) NOT NULL,
    CustomerID char(6) NOT NULL,
    ExhibitionTitle varchar(100) NOT NULL,
    StartDate date NOT NULL,
    EndDate date NOT NULL,
   -- FullPrice decimal(9,2) NOT NULL,
    CONSTRAINT PK_booking PRIMARY KEY(BookingID),
    CONSTRAINT FK_booking_customer FOREIGN KEY(CustomerID) REFERENCES customer(CustomerID),
    CONSTRAINT check_StartDate_EndDate CHECK(EndDate > StartDate)
);

CREATE TABLE booking_2_room (
    BookingID char(6) NOT NULL,
    TempRoomID char(5) NOT NULL,
    CONSTRAINT PK_booking_2_room PRIMARY KEY(BookingID, TempRoomID),
    CONSTRAINT FK_booking_ref FOREIGN KEY(BookingID) REFERENCES booking(BookingID),
    CONSTRAINT FK_tempRoom_ref FOREIGN KEY(TempRoomID) REFERENCES tempRoom(TempRoomID)
);

-- Donations made by Customers 
CREATE TABLE donation (
    DonationID char(6) NOT NULL,
    CustomerID char(6) NOT NULL,
    AccountNumber varchar(20) NOT NULL,
    Amount decimal(8,2) NOT NULL,
    Comment varchar(255),
    CONSTRAINT PK_donation PRIMARY KEY(DonationID),
    CONSTRAINT FK_donation_customer FOREIGN KEY(CustomerID) REFERENCES customer(CustomerID)
);

-- ...................................................................................... Insert Data ........................................................................................................................................

-- Staff roles 

INSERT INTO role (RoleID, Name, Responsibility) VALUES ('R001', 'Perm Room Staff', 'Taking care of permanent exhibition rooms');
INSERT INTO role (RoleID, Name, Responsibility) VALUES ('R002', 'Temp Room Staff', 'Taking care of temporary exhibition rooms');
INSERT INTO role (RoleID, Name, Responsibility) VALUES ('R003', 'Manager', 'Managing');
INSERT INTO role (RoleID, Name, Responsibility) VALUES ('R004', 'Security', 'Securing ');

-- staff Members

INSERT INTO staff (StaffID,RoleID,FirstName,LastName,Email,PhoneNumber,StreetName,HouseNumber,FlatNumber,PostCode,City) VALUES ("25949405","R001","MacKenzie","Glenn","urna@conubianostra.com","37942 164254","Massa Rd.",90,NULL,"U7H 9TJ","Pak Pattan");
INSERT INTO staff (StaffID,RoleID,FirstName,LastName,Email,PhoneNumber,StreetName,HouseNumber,FlatNumber,PostCode,City) VALUES ("37598844","R001","Vielka","Sears","id.blandit@Inscelerisque.ca","69489 333567","Odio. St.",72,NULL,"ID3 8TL","Villers-la-Ville");
INSERT INTO staff (StaffID,RoleID,FirstName,LastName,Email,PhoneNumber,StreetName,HouseNumber,FlatNumber,PostCode,City) VALUES ("7457836","R001","Lilah","Burch","nisl@tincidunt.com","14236 594878","Orci. Avenue",58,NULL,"F5 1EX","Warwick");
INSERT INTO staff (StaffID,RoleID,FirstName,LastName,Email,PhoneNumber,StreetName,HouseNumber,FlatNumber,PostCode,City) VALUES ("34828894","R003","Alexa","Medina","vitae@etultricesposuere.ca","07137 834981","Eu St.",80,"13","PH0Y 5OA","St. Asaph");
INSERT INTO staff (StaffID,RoleID,FirstName,LastName,Email,PhoneNumber,StreetName,HouseNumber,FlatNumber,PostCode,City) VALUES ("11275770","R003","Dennis","Blackwell","ipsum@aliquam.net","27855 503809","Fermentum Rd.",92,NULL,"VY6 4IP","Dipignano");
INSERT INTO staff (StaffID,RoleID,FirstName,LastName,Email,PhoneNumber,StreetName,HouseNumber,FlatNumber,PostCode,City) VALUES ("5712443","R002","Dominic","Justice","a.feugiat.tellus@feugiat.com","58093 112999","Tincidunt Rd.",34,NULL,"SQ5 7ZD","Surat");
INSERT INTO staff (StaffID,RoleID,FirstName,LastName,Email,PhoneNumber,StreetName,HouseNumber,FlatNumber,PostCode,City) VALUES ("30081088","R001","Edward","Lindsey","primis.in.faucibus@gravida.co.uk","05372 574200","Lacus Rd.",91,NULL,"O2I 6QE","Acoz");
INSERT INTO staff (StaffID,RoleID,FirstName,LastName,Email,PhoneNumber,StreetName,HouseNumber,FlatNumber,PostCode,City) VALUES ("6406562","R002","Cole","Mason","ultrices@neque.net","02947 740563","Ornare. St.",77,NULL,"O0 2IH","Houthalen-Helchteren");
INSERT INTO staff (StaffID,RoleID,FirstName,LastName,Email,PhoneNumber,StreetName,HouseNumber,FlatNumber,PostCode,City) VALUES ("41640140","R002","Eugenia","Roach","magna.Phasellus@estvitae.edu","26717 664457","Aliquet Av.",98,NULL,"T5B 9DH","Mathura");
INSERT INTO staff (StaffID,RoleID,FirstName,LastName,Email,PhoneNumber,StreetName,HouseNumber,FlatNumber,PostCode,City) VALUES ("14912246","R002","Charde","Hall","sit.amet@DonecegestasAliquam.org","47450 001893","Feugiat. Rd.",16,"22","E92 7SF","Daejeon");
INSERT INTO staff (StaffID,RoleID,FirstName,LastName,Email,PhoneNumber,StreetName,HouseNumber,FlatNumber,PostCode,City) VALUES ("47471228","R004","Cheyenne","Nelson","blandit@euismodin.com","36356 223259","Gravida. Avenue",21,"35","L70 1LG","Ehein");


-- Insert data to permRoom Table

INSERT INTO permRoom (PermRoomID,Theme,WallSlots,SculptureSlots,PermStaffID) VALUES ('PR001',"Post-war World",18,2,"25949405");
INSERT INTO permRoom (PermRoomID,Theme,WallSlots,SculptureSlots,PermStaffID) VALUES ('PR002',NULL,10,9,"25949405");
INSERT INTO permRoom (PermRoomID,Theme,WallSlots,SculptureSlots,PermStaffID) VALUES ('PR003',"Rococo",20,6,"30081088");
INSERT INTO permRoom (PermRoomID,Theme,WallSlots,SculptureSlots,PermStaffID) VALUES ('PR004',"Nature",19,6,"37598844");
INSERT INTO permRoom (PermRoomID,Theme,WallSlots,SculptureSlots,PermStaffID) VALUES ('PR005',"Baroque",4,9,"47471228");
INSERT INTO permRoom (PermRoomID,Theme,WallSlots,SculptureSlots,PermStaffID) VALUES ('PR006',"Memento Mori",5,3,"30081088");
INSERT INTO permRoom (PermRoomID,Theme,WallSlots,SculptureSlots,PermStaffID) VALUES ('PR007',"Oil Paintings",19,10,"47471228");
INSERT INTO permRoom (PermRoomID,Theme,WallSlots,SculptureSlots,PermStaffID) VALUES ('PR008',NULL,11,2,"37598844");
INSERT INTO permRoom (PermRoomID,Theme,WallSlots,SculptureSlots,PermStaffID) VALUES ('PR009',"Renaissance",12,10,"7457836");
INSERT INTO permRoom (PermRoomID,Theme,WallSlots,SculptureSlots,PermStaffID) VALUES ('PR010',"Portraits",15,9,"37598844");


-- Insert data into Temporary Exhibition Room

INSERT INTO tempRoom (TempRoomID,WallSlots,SculptureSlots,Availability,PricePerDay,TempStaffID) VALUES ('TR001',19,8,False,"66.82","14912246");
INSERT INTO tempRoom (TempRoomID,WallSlots,SculptureSlots,Availability,PricePerDay,TempStaffID) VALUES ('TR002',8,6,True,"64.88","6406562");
INSERT INTO tempRoom (TempRoomID,WallSlots,SculptureSlots,Availability,PricePerDay,TempStaffID) VALUES ('TR003',20,7,True,"122.23","41640140");
INSERT INTO tempRoom (TempRoomID,WallSlots,SculptureSlots,Availability,PricePerDay,TempStaffID) VALUES ('TR004',2,4,True,"59.21","5712443");
INSERT INTO tempRoom (TempRoomID,WallSlots,SculptureSlots,Availability,PricePerDay,TempStaffID) VALUES ('TR005',15,10,False,"114.61","14912246");


-- Insert Art Styles

INSERT INTO artStyle (ArtStyleID,Name,Description,TimeOfOrigin) VALUES ('AS01',"Impressionism","Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed","XIX century");
INSERT INTO artStyle (ArtStyleID,Name,Description,TimeOfOrigin) VALUES ('AS02',"Art Nouveau","Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at","C.1890 - 1910");
INSERT INTO artStyle (ArtStyleID,Name,Description,TimeOfOrigin) VALUES ('AS03',"Expressionism","Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur","XX century");
INSERT INTO artStyle (ArtStyleID,Name,Description,TimeOfOrigin) VALUES ('AS04',"Romanticism","Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed","End of XVIII century");
INSERT INTO artStyle (ArtStyleID,Name,Description,TimeOfOrigin) VALUES ('AS05',"Modernism","Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus.","Late XIX century");
INSERT INTO artStyle (ArtStyleID,Name,Description,TimeOfOrigin) VALUES ('AS06',"Naturalism","Lorem ipsum dolor sit","Late XIX century");
INSERT INTO artStyle (ArtStyleID,Name,Description,TimeOfOrigin) VALUES ('AS07',"Neo-Classicism","Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing","Early XIX century");
INSERT INTO artStyle (ArtStyleID,Name,Description,TimeOfOrigin) VALUES ('AS08',"Neo-Impressionism","Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque","1884-1886");
INSERT INTO artStyle (ArtStyleID,Name,Description,TimeOfOrigin) VALUES ('AS09',"Orientalism","Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at","XIX century");
INSERT INTO artStyle (ArtStyleID,Name,Description,TimeOfOrigin) VALUES ('AS10',"Post-Impressionism","Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque","XX century");
INSERT INTO artStyle (ArtStyleID,Name,Description,TimeOfOrigin) VALUES ('AS11',"Pointilism","Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus.","1886");
INSERT INTO artStyle (ArtStyleID,Name,Description,TimeOfOrigin) VALUES ('AS12',"Realism","Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus.","mid-XIX century");
INSERT INTO artStyle (ArtStyleID,Name,Description,TimeOfOrigin) VALUES ('AS13',"Symbolism","Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut","Late XIX century");
INSERT INTO artStyle (ArtStyleID,Name,Description,TimeOfOrigin) VALUES ('AS14',"Cubism","Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravida non,","1910s - 1920s");
INSERT INTO artStyle (ArtStyleID,Name,Description,TimeOfOrigin) VALUES ('AS15',"Art Deco","Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque","Late XIX century");
INSERT INTO artStyle (ArtStyleID,Name,Description,TimeOfOrigin) VALUES ('AS16',"Dada","Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien,","1916");
INSERT INTO artStyle (ArtStyleID,Name,Description,TimeOfOrigin) VALUES ('AS17',"Abstraction","Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien,","Early XX century");
INSERT INTO artStyle (ArtStyleID,Name,Description,TimeOfOrigin) VALUES ('AS18',"Conceptual Art","Lorem ipsum dolor sit amet, consectetuer adipiscing elit.","1960s");
INSERT INTO artStyle (ArtStyleID,Name,Description,TimeOfOrigin) VALUES ('AS19',"Surrealism","Lorem ipsum dolor sit","1910s");
INSERT INTO artStyle (ArtStyleID,Name,Description,TimeOfOrigin) VALUES ('AS20',"Renaissance","Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor.","XIV century");
INSERT INTO artStyle (ArtStyleID,Name,Description,TimeOfOrigin) VALUES ('AS21',"Academic Art","Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravida non,","1560s - 1900s");

-- Insert Authors

INSERT INTO author (AuthorID,Alias,FirstName,LastName,ActiveYears,CountryOfOrigin) VALUES ('A001',NULL,'Antonio','Canova','1757-1822','Italy');
INSERT INTO author (AuthorID,Alias,FirstName,LastName,ActiveYears,CountryOfOrigin) VALUES ('A002',"Sandro Boticelli","Alessandro","Filipepi","1445-1510","Italy");
INSERT INTO author (AuthorID,Alias,FirstName,LastName,ActiveYears,CountryOfOrigin) VALUES ('A003',NULL,"Afons Maria","Mucha","1860-1939","Czechia");
INSERT INTO author (AuthorID,Alias,FirstName,LastName,ActiveYears,CountryOfOrigin) VALUES ('A004',NULL,"Gustav","Klimt","1862-1918","Austria");
INSERT INTO author (AuthorID,Alias,FirstName,LastName,ActiveYears,CountryOfOrigin) VALUES ('A005',NULL,"Jan Alojzy","Matejko","1838-1893","Poland");
INSERT INTO author (AuthorID,Alias,FirstName,LastName,ActiveYears,CountryOfOrigin) VALUES ('A006',NULL,"Salvador","Dali","1904-1989","Spain");
INSERT INTO author (AuthorID,Alias,FirstName,LastName,ActiveYears,CountryOfOrigin) VALUES ('A007',NULL,"Pablo","Picasso","1881-1973","Spain");
INSERT INTO author (AuthorID,Alias,FirstName,LastName,ActiveYears,CountryOfOrigin) VALUES ('A008',NULL,"Claude","Monet","1840-1926","France");
INSERT INTO author (AuthorID,Alias,FirstName,LastName,ActiveYears,CountryOfOrigin) VALUES ('A009',NULL,"Francisco","Goya","1746-1828","France");
INSERT INTO author (AuthorID,Alias,FirstName,LastName,ActiveYears,CountryOfOrigin) VALUES ('A010',NULL,"Vincent","van Gogh","1853-1890","Netherlands");
INSERT INTO author (AuthorID,Alias,FirstName,LastName,ActiveYears,CountryOfOrigin) VALUES ('A011',NULL,"Michelangelo","di Lodovicio Buonarotti Simoni","1475-1564","Italy");



-- Art Pices 
INSERT INTO galleryArt (ArtPieceID,IfSculpture,Title,AuthorID,ArtStyleID,TimeOfCreation,PermRoomID) VALUES ('AP001',False,'The Birth of Venus','A002','AS20','1486','PR005');
INSERT INTO galleryArt (ArtPieceID,IfSculpture,Title,AuthorID,ArtStyleID,TimeOfCreation,PermRoomID) VALUES ('AP002',False,'Gismonda','A003','AS02','1894','PR002');
INSERT INTO galleryArt (ArtPieceID,IfSculpture,Title,AuthorID,ArtStyleID,TimeOfCreation,PermRoomID) VALUES ('AP003',False,'The Kiss','A004','AS13','1908','PR003');
INSERT INTO galleryArt (ArtPieceID,IfSculpture,Title,AuthorID,ArtStyleID,TimeOfCreation,PermRoomID) VALUES ('AP004',False,'Battle of Grunwald','A005','AS21','1879','PR002');
INSERT INTO galleryArt (ArtPieceID,IfSculpture,Title,AuthorID,ArtStyleID,TimeOfCreation,PermRoomID) VALUES ('AP005',False,'The Persistence of Memory','A006','AS19','1931','PR007');
INSERT INTO galleryArt (ArtPieceID,IfSculpture,Title,AuthorID,ArtStyleID,TimeOfCreation,PermRoomID) VALUES ('AP006',False,'Guernica','A007','AS14','1937','PR007');
INSERT INTO galleryArt (ArtPieceID,IfSculpture,Title,AuthorID,ArtStyleID,TimeOfCreation,PermRoomID) VALUES ('AP007',False,'The Lunch','A008','AS01','1873','PR004');
INSERT INTO galleryArt (ArtPieceID,IfSculpture,Title,AuthorID,ArtStyleID,TimeOfCreation,PermRoomID) VALUES ('AP008',False,'Saturn Devouring His Son','A009','AS04','1819-1823','PR001');
INSERT INTO galleryArt (ArtPieceID,IfSculpture,Title,AuthorID,ArtStyleID,TimeOfCreation,PermRoomID) VALUES ('AP009',False,'The Starry Night','A010','AS10','1889','PR002');
INSERT INTO galleryArt (ArtPieceID,IfSculpture,Title,AuthorID,ArtStyleID,TimeOfCreation,PermRoomID) VALUES ('AP010',True,'David','A011','AS20','1501-1504','PR010');
INSERT INTO galleryArt (ArtPieceID,IfSculpture,Title,AuthorID,ArtStyleID,TimeOfCreation,PermRoomID) VALUES ('AP011',True,'Psyche Awakend by Cupids Kiss','A001','AS04','1793','PR008');
INSERT INTO galleryArt (ArtPieceID,IfSculpture,Title,AuthorID,ArtStyleID,TimeOfCreation,PermRoomID) VALUES ('AP012',False,'Vase with Twelve Sunflowers','A010','AS10','1888','PR009');
INSERT INTO galleryArt (ArtPieceID,IfSculpture,Title,AuthorID,ArtStyleID,TimeOfCreation,PermRoomID) VALUES ('AP013',False,'Spring','A003','AS02','1896','PR006');


-- Customers
INSERT INTO customer (CustomerID,FirstName,LastName,Email,PhoneNumber,StreetName,HouseNumber,FlatNumber,PostCode,City) VALUES ("C00001","Wayne","Baker","Nullam.ut.nisi@nisimagnased.edu","40290 035425","Tempor Av.",26,NULL,"V4N 9WT","Rae Lakes");
INSERT INTO customer (CustomerID,FirstName,LastName,Email,PhoneNumber,StreetName,HouseNumber,FlatNumber,PostCode,City) VALUES ("C00002","Jamalia","Gamble","pellentesque@magna.ca","79220 067847","Cursus Rd.",56,NULL,"SW00 5UN","Stockport");
INSERT INTO customer (CustomerID,FirstName,LastName,Email,PhoneNumber,StreetName,HouseNumber,FlatNumber,PostCode,City) VALUES ("C00003","Hilel","Dickerson","rutrum.eu.ultrices@nec.com","94993 963284","Metus Rd.",14,NULL,"KV53 5WL","Anápolis");
INSERT INTO customer (CustomerID,FirstName,LastName,Email,PhoneNumber,StreetName,HouseNumber,FlatNumber,PostCode,City) VALUES ("C00004","Moses","Livingston","lorem.luctus@acturpis.org","56906 918483","Nibh St.",68,"10","U30 1RY","Sevilla");
INSERT INTO customer (CustomerID,FirstName,LastName,Email,PhoneNumber,StreetName,HouseNumber,FlatNumber,PostCode,City) VALUES ("C00005","Malachi","Coffey","rhoncus.id.mollis@Fuscedolor.edu","82454 006471","Duis Road",94,NULL,"NA11 7ZM","Dangjin");
INSERT INTO customer (CustomerID,FirstName,LastName,Email,PhoneNumber,StreetName,HouseNumber,FlatNumber,PostCode,City) VALUES ("C00006","Felicia","Perry","Mauris@egestasa.com","39736 982209","Ultrices Street",48,NULL,"PN14 7GZ","Griesheim");
INSERT INTO customer (CustomerID,FirstName,LastName,Email,PhoneNumber,StreetName,HouseNumber,FlatNumber,PostCode,City) VALUES ("C00007","Tasha","Wong","eget.nisi@tempordiam.co.uk","75108 997579","Ultricies Av.",91,NULL,"KX45 1SA","Thorn");
INSERT INTO customer (CustomerID,FirstName,LastName,Email,PhoneNumber,StreetName,HouseNumber,FlatNumber,PostCode,City) VALUES ("C00008","Fitzgerald","Jennings","cursus.vestibulum.Mauris@dignissimlacusAliquam.com","40069 258151","Cras Avenue",88,NULL,"R01 2FX","Idar-Oberstei");
INSERT INTO customer (CustomerID,FirstName,LastName,Email,PhoneNumber,StreetName,HouseNumber,FlatNumber,PostCode,City) VALUES ("C00009","Deacon","Alston","aliquet.diam.Sed@facilisisnonbibendum.edu","24586 284197","Ornare St.",36,"34","Z86 6YK","Curanilahue");
INSERT INTO customer (CustomerID,FirstName,LastName,Email,PhoneNumber,StreetName,HouseNumber,FlatNumber,PostCode,City) VALUES ("C00010","Ryder","Sherman","nec.tellus.Nunc@urnaconvallis.ca","21360 385530","Pede Ave",25,NULL,"U7S 7PI","Zolder");
INSERT INTO customer (CustomerID,FirstName,LastName,Email,PhoneNumber,StreetName,HouseNumber,FlatNumber,PostCode,City) VALUES ("C00011","Jamal","Melton","vehicula.risus.Nulla@massa.org","63329 332324","Arcu Av.",84,NULL,"J8W 1TY","Krasnoznamensk");
INSERT INTO customer (CustomerID,FirstName,LastName,Email,PhoneNumber,StreetName,HouseNumber,FlatNumber,PostCode,City) VALUES ("C00012","Dustin","Fowler","mauris.aliquam.eu@non.ca","99610 604428","Non Road",39,NULL,"U6L 0UV","Slough");
INSERT INTO customer (CustomerID,FirstName,LastName,Email,PhoneNumber,StreetName,HouseNumber,FlatNumber,PostCode,City) VALUES ("C00013","Gwendolyn","Leach","lacus@neque.net","02672 423909","Montes Avenue",1,NULL,"Z9W 7QI","Parkland County");
INSERT INTO customer (CustomerID,FirstName,LastName,Email,PhoneNumber,StreetName,HouseNumber,FlatNumber,PostCode,City) VALUES ("C00014","Yuri","Cochran","dis@nuncinterdumfeugiat.ca","29500 354275","Ante Rd.",94,NULL,"E7 6JA","North Cowichan");
INSERT INTO customer (CustomerID,FirstName,LastName,Email,PhoneNumber,StreetName,HouseNumber,FlatNumber,PostCode,City) VALUES ("C00015","Bernard","Johnson","blandit@vitae.ca","58983 118839","Eu Rd.",27,NULL,"SI85 7ZY","Hualqui");
INSERT INTO customer (CustomerID,FirstName,LastName,Email,PhoneNumber,StreetName,HouseNumber,FlatNumber,PostCode,City) VALUES ("C00016","Chaney","Mccarty","enim@afacilisisnon.co.uk","06815 133184","Elit. St.",22,NULL,"D1K 0PZ","Tarakan");
INSERT INTO customer (CustomerID,FirstName,LastName,Email,PhoneNumber,StreetName,HouseNumber,FlatNumber,PostCode,City) VALUES ("C00017","Blair","Mejia","eros.Proin@Nullamenim.ca","88362 999825","Scelerisque Ave",35,NULL,"O3P 3CK","Warspite");
INSERT INTO customer (CustomerID,FirstName,LastName,Email,PhoneNumber,StreetName,HouseNumber,FlatNumber,PostCode,City) VALUES ("C00018","Cheryl","Ramirez","nisl.elementum@liberomauris.com","08975 538369","Montes, Avenue",27,NULL,"VW9 5SR","Whakatane");
INSERT INTO customer (CustomerID,FirstName,LastName,Email,PhoneNumber,StreetName,HouseNumber,FlatNumber,PostCode,City) VALUES ("C00019","Shea","Kennedy","rhoncus@ligulaconsectetuerrhoncus.ca","01035 407661","Hendrerit Avenue",50,NULL,"I1M 7PR","Beaufays");
INSERT INTO customer (CustomerID,FirstName,LastName,Email,PhoneNumber,StreetName,HouseNumber,FlatNumber,PostCode,City) VALUES ("C00020","Ignacia","Kirk","mi.lorem.vehicula@nibhvulputatemauris.org","76302 591569","2762 Id, Ave",18,NULL,"C5 7FH","Rockford");
INSERT INTO customer (CustomerID,FirstName,LastName,Email,PhoneNumber,StreetName,HouseNumber,FlatNumber,PostCode,City) VALUES ("C00021","Ashton","Hamilton","est.ac.facilisis@egestaslaciniaSed.ca","57530 198002","At Rd.",49,NULL,"W57 4ZM","Turnhout");
INSERT INTO customer (CustomerID,FirstName,LastName,Email,PhoneNumber,StreetName,HouseNumber,FlatNumber,PostCode,City) VALUES ("C00022","Martin","Merritt","risus.Morbi.metus@eget.edu","10824 049956","Nulla Rd.",26,NULL,"V77 5UT","Neerheylissem");
INSERT INTO customer (CustomerID,FirstName,LastName,Email,PhoneNumber,StreetName,HouseNumber,FlatNumber,PostCode,City) VALUES ("C00023","Quinn","Franklin","ac.turpis@acfermentum.co.uk","82974 887225","1888 Ac Rd.",57,NULL,"M34 9CX","Kurram Agency");
INSERT INTO customer (CustomerID,FirstName,LastName,Email,PhoneNumber,StreetName,HouseNumber,FlatNumber,PostCode,City) VALUES ("C00024","Sebastian","Smith","quis.accumsan@risusDonecegestas.com","98235 573856","6444 Ac, Road",66,"13","A4F 4FU","Salzgitter");
INSERT INTO customer (CustomerID,FirstName,LastName,Email,PhoneNumber,StreetName,HouseNumber,FlatNumber,PostCode,City) VALUES ("C00025","Prescott","Jarvis","felis@leo.com","82399 663778","Velit. Rd.",53,NULL,"QO4 2PQ","Jackson");
INSERT INTO customer (CustomerID,FirstName,LastName,Email,PhoneNumber,StreetName,HouseNumber,FlatNumber,PostCode,City) VALUES ("C00026","Armand","Quinn","nonummy.ipsum@eget.org","91883 928857","Massa. Rd.",44,NULL,"DT6 7IP","Milnathort");
INSERT INTO customer (CustomerID,FirstName,LastName,Email,PhoneNumber,StreetName,HouseNumber,FlatNumber,PostCode,City) VALUES ("C00027","Carlos","Strickland","sed.dui@sedtortorInteger.org","56540 622103","Placerat St.",72,NULL,"NN1R 2PN","Hafizabad");
INSERT INTO customer (CustomerID,FirstName,LastName,Email,PhoneNumber,StreetName,HouseNumber,FlatNumber,PostCode,City) VALUES ("C00028","Lewis","Franco","a.nunc.In@Phasellusfermentum.edu","28561 791394","Molestie Rd.",72,NULL,"NJ09 8QI","Yurzhnouralsk");
INSERT INTO customer (CustomerID,FirstName,LastName,Email,PhoneNumber,StreetName,HouseNumber,FlatNumber,PostCode,City) VALUES ("C00029","Griffin","Summers","tempor@ut.net","01713 779534","Nunc Rd.",35,NULL,"BG7 0MQ","Moorsele");
INSERT INTO customer (CustomerID,FirstName,LastName,Email,PhoneNumber,StreetName,HouseNumber,FlatNumber,PostCode,City) VALUES ("C00030","Susan","Cortez","at@parturientmontesnascetur.co.uk","12293 621056","Auctor St.",56,NULL,"XC9W 0KA","Sterrebeek");
INSERT INTO customer (CustomerID,FirstName,LastName,Email,PhoneNumber,StreetName,HouseNumber,FlatNumber,PostCode,City) VALUES ("C00031","Ashton","Wiggins","Praesent.eu.nulla@nibhPhasellusnulla.co.uk","52578 171275","Elit, Ave",22,"6","U0M 8SB","Okara");
INSERT INTO customer (CustomerID,FirstName,LastName,Email,PhoneNumber,StreetName,HouseNumber,FlatNumber,PostCode,City) VALUES ("C00032","Otto","Zimmerman","sed@pretiumneque.com","49957 109939","Placerat. St.",16,NULL,"JD95 9LO","Saint-Remy");
INSERT INTO customer (CustomerID,FirstName,LastName,Email,PhoneNumber,StreetName,HouseNumber,FlatNumber,PostCode,City) VALUES ("C00033","Arthur","Dickson","Aliquam@dictum.co.uk","83139 812490","Parturient Av.",21,NULL,"Z8 3YP","Valfabbrica");

-- Booking

INSERT INTO booking (BookingID,CustomerID,ExhibitionTitle,StartDate,EndDate) VALUES ("B00001","C00018","arcu.","2021-10-15","2021-10-24");
INSERT INTO booking (BookingID,CustomerID,ExhibitionTitle,StartDate,EndDate) VALUES ("B00002","C00023","ornare, libero at auctor ullamcorper,","2021-06-28","2021-07-28");
INSERT INTO booking (BookingID,CustomerID,ExhibitionTitle,StartDate,EndDate) VALUES ("B00003","C00024","mi fringilla","2021-02-26","2021-04-26");
INSERT INTO booking (BookingID,CustomerID,ExhibitionTitle,StartDate,EndDate) VALUES ("B00004","C000018","urna et arcu imperdiet","2020-05-06","2020-05-13");
INSERT INTO booking (BookingID,CustomerID,ExhibitionTitle,StartDate,EndDate) VALUES ("B00005","C00001","consectetuer ipsum nunc id","2021-10-14","2021-10-21");
INSERT INTO booking (BookingID,CustomerID,ExhibitionTitle,StartDate,EndDate) VALUES ("B00006","C00020","ligula. Nullam enim.","2021-08-19","2021-09-06");
INSERT INTO booking (BookingID,CustomerID,ExhibitionTitle,StartDate,EndDate) VALUES ("B00007","C00003","odio sagittis semper. Nam tempor","2021-08-14","2021-09-14");
INSERT INTO booking (BookingID,CustomerID,ExhibitionTitle,StartDate,EndDate) VALUES ("B00008","C00005","Etiam bibendum fermentum metus. Aenean","2021-07-07","2021-07-08");
INSERT INTO booking (BookingID,CustomerID,ExhibitionTitle,StartDate,EndDate) VALUES ("B00009","C00004","faucibus orci","2021-02-11","2021-05-24");
INSERT INTO booking (BookingID,CustomerID,ExhibitionTitle,StartDate,EndDate) VALUES ("B00010","C00018","iaculis, lacus pede sagittis","2021-05-20","2021-06-30");
INSERT INTO booking (BookingID,CustomerID,ExhibitionTitle,StartDate,EndDate) VALUES ("B00011","C00012","sagittis semper. Nam tempor diam","2021-05-03","2021-05-05");

-- Booking 2 Room
INSERT INTO booking_2_room (BookingID,TempRoomID) VALUES ("B00001","TR002");
INSERT INTO booking_2_room (BookingID,TempRoomID) VALUES ("B00001","TR004");
INSERT INTO booking_2_room (BookingID,TempRoomID) VALUES ("B00001","TR003");
INSERT INTO booking_2_room (BookingID,TempRoomID) VALUES ("B00002","TR002");
INSERT INTO booking_2_room (BookingID,TempRoomID) VALUES ("B00003","TR003");
INSERT INTO booking_2_room (BookingID,TempRoomID) VALUES ("B00003","TR002");
INSERT INTO booking_2_room (BookingID,TempRoomID) VALUES ("B00004","TR004");
INSERT INTO booking_2_room (BookingID,TempRoomID) VALUES ("B00005","TR002");
INSERT INTO booking_2_room (BookingID,TempRoomID) VALUES ("B00006","TR003");
INSERT INTO booking_2_room (BookingID,TempRoomID) VALUES ("B00007","TR002");
INSERT INTO booking_2_room (BookingID,TempRoomID) VALUES ("B00008","TR002");
INSERT INTO booking_2_room (BookingID,TempRoomID) VALUES ("B00008","TR004");
INSERT INTO booking_2_room (BookingID,TempRoomID) VALUES ("B00009","TR002");
INSERT INTO booking_2_room (BookingID,TempRoomID) VALUES ("B00009","TR004");
INSERT INTO booking_2_room (BookingID,TempRoomID) VALUES ("B00010","TR002");

-- Donations

INSERT INTO donation (DonationID,CustomerID,AccountNumber,Amount,Comment) VALUES ("D00001","C00002","27-91-78","581.62","Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna");
INSERT INTO donation (DonationID,CustomerID,AccountNumber,Amount,Comment) VALUES ("D00002","C00005","71-66-40","333.74","Lorem ipsum dolor sit amet, consectetuer");
INSERT INTO donation (DonationID,CustomerID,AccountNumber,Amount,Comment) VALUES ("D00003","C00010","55-72-63","338.48","Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et");
INSERT INTO donation (DonationID,CustomerID,AccountNumber,Amount,Comment) VALUES ("D00004","C00016","99-43-25","919.75","Lorem ipsum dolor");
INSERT INTO donation (DonationID,CustomerID,AccountNumber,Amount,Comment) VALUES ("D00005","C00020","01-06-38","355.66","Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu");
INSERT INTO donation (DonationID,CustomerID,AccountNumber,Amount,Comment) VALUES ("D00006","C00023","64-43-15","212.80","Lorem ipsum dolor sit amet, consectetuer");
INSERT INTO donation (DonationID,CustomerID,AccountNumber,Amount,Comment) VALUES ("D00007","C00027","70-82-38","955.08","Lorem ipsum dolor sit amet,");
INSERT INTO donation (DonationID,CustomerID,AccountNumber,Amount,Comment) VALUES ("D00008","C00030","21-92-28","872.59","Lorem ipsum dolor sit amet, consectetuer");


-- ..............................................................................Views................................................................................................................................

-- Gallery Art
DROP VIEW IF EXISTS artworks_view;

CREATE VIEW artworks_view AS
SELECT ga.Title, CONCAT_WS(' ',au.FirstName,au.LastName) AS 'Authors Full Name', 
au.Alias AS 'Authors Alias', 
s.Name AS 'Art Style', 
ga.TimeOfCreation AS 'Created:'
FROM author au
INNER JOIN galleryart ga ON ga.AuthorID = au.AuthorID
INNER JOIN artStyle s ON ga.ArtStyleID = s.ArtStyleID;

-- Authors
DROP VIEW IF EXISTS authors_view;

CREATE VIEW authors_view AS
SELECT au.Alias, CONCAT_WS(' ', au.FirstName, au.LastName) AS 'Full Name', au.ActiveYears AS 'Active Years', au.CountryOfOrigin AS 'Country of Origin'
FROM author au;

-- Users
DROP VIEW IF EXISTS users_view;

CREATE VIEW users_view AS
SELECT User, Host, Password 
FROM mysql.user;

-- Users

-- DEVELOPER
DROP USER IF EXISTS 'dev'@'localhost';
CREATE USER 'dev'@'localhost' IDENTIFIED BY 'developer';

-- STAFF MEMBERs
DROP USER IF EXISTS '25949405'@'localhost';
CREATE USER '25949405'@'localhost' IDENTIFIED BY 'gallery';

DROP USER IF EXISTS '37598844'@'localhost';
CREATE USER '37598844'@'localhost' IDENTIFIED BY 'gallery';

DROP USER IF EXISTS '7457836'@'localhost';
CREATE USER '7457836'@'localhost' IDENTIFIED BY 'gallery';

DROP USER IF EXISTS '5712443'@'localhost';
CREATE USER '5712443'@'localhost' IDENTIFIED BY 'gallery';

DROP USER IF EXISTS '30081088'@'localhost';
CREATE USER '30081088'@'localhost' IDENTIFIED BY 'gallery';

DROP USER IF EXISTS '6406562'@'localhost';
CREATE USER '6406562'@'localhost' IDENTIFIED BY 'gallery';

DROP USER IF EXISTS '41640140'@'localhost';
CREATE USER '41640140'@'localhost' IDENTIFIED BY 'gallery';

DROP USER IF EXISTS '14912246'@'localhost';
CREATE USER '14912246'@'localhost' IDENTIFIED BY 'gallery';

-- managers
DROP USER IF EXISTS '34828894'@'localhost';
CREATE USER '34828894'@'localhost' IDENTIFIED BY 'gallery123';

DROP USER IF EXISTS '11275770'@'localhost';
CREATE USER '11275770'@'localhost' IDENTIFIED BY 'gallery123';

-- Roles
DROP ROLE IF EXISTS gallery_dev, staff, manager, secur;

CREATE ROLE gallery_dev, staff, manager, secur;

-- Permissions

GRANT ALL PRIVILEGES ON *.* TO gallery_dev;
GRANT SELECT, INSERT ON ArtGallery.* TO staff;
GRANT SELECT, INSERT, UPDATE ON ArtGallery.* TO manager;
GRANT DELETE ON ArtGallery.galleryart TO manager;
GRANT SELECT ON ArtGallery.* TO secur;

FLUSH PRIVILEGES;

-- grant roles

GRANT gallery_dev TO 'dev'@'localhost';

GRANT staff TO '25949405'@'localhost';
GRANT staff TO '37598844'@'localhost';
GRANT staff TO '7457836'@'localhost';
GRANT staff TO '5712443'@'localhost';
GRANT staff TO '30081088'@'localhost';
GRANT staff TO '6406562'@'localhost';
GRANT staff TO '41640140'@'localhost';
GRANT staff TO '14912246'@'localhost';

GRANT manager TO '34828894'@'localhost';
GRANT manager TO '11275770'@'localhost';

GRANT secur TO '47471228'@'localhost';


-- set default roles - SET DEFAULT ROLE did not work on my version of xampp
/*
SET DEFAULT ROLE gallery_dev TO 'dev'@'localhost';


SET DEFAULT ROLE staff TO '25949405'@'localhost';
SET DEFAULT ROLE staff TO '37598844'@'localhost';
SET DEFAULT ROLE staff TO '7457836'@'localhost';
SET DEFAULT ROLE staff TO '5712443'@'localhost';
SET DEFAULT ROLE staff TO '30081088'@'localhost';
SET DEFAULT ROLE staff TO '6406562'@'localhost';
SET DEFAULT ROLE staff TO '41640140'@'localhost';
SET DEFAULT ROLE staff TO '14912246'@'localhost';

SET DEFAULT ROLE manager TO '34828894'@'localhost';
SET DEFAULT ROLE manager TO '11275770'@'localhost';

SET DEFAULT ROLE secur TO '47471228'@'localhost';
*/
