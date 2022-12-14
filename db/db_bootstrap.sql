CREATE DATABASE vesti_db;
GRANT ALL PRIVILEGES ON vesti_db.* TO 'webapp'@'%';
FLUSH PRIVILEGES;

USE vesti_db;

CREATE TABLE administrator
(
    adminID      INT AUTO_INCREMENT NOT NULL,
    phone_number VARCHAR(15) NOT NULL,
    email        VARCHAR(50) NOT NULL,
    first_name   VARCHAR(50) NOT NULL,
    middle_name  VARCHAR(50),
    last_name    VARCHAR(50) NOT NULL,
    PRIMARY KEY (adminID),
    CONSTRAINT Unique_Contact_Info UNIQUE (phone_number, email)
);

CREATE TABLE advisor
(
    advisorID    INT AUTO_INCREMENT NOT NULL,
    phone_number VARCHAR(15) NOT NULL,
    email        VARCHAR(50) NOT NULL,
    first_name   VARCHAR(50) NOT NULL,
    middle_name  VARCHAR(50),
    last_name    VARCHAR(50) NOT NULL,
    PRIMARY KEY (advisorID),
    CONSTRAINT Unique_Contact_Info UNIQUE (phone_number, email)
);

CREATE TABLE admin_advisor
(
    advisorID INT NOT NULL,
    adminID   INT NOT NULL,
    FOREIGN KEY (advisorID) REFERENCES advisor (advisorID),
    FOREIGN KEY (adminID) REFERENCES administrator (adminID),
    CONSTRAINT Unique_Bridge UNIQUE (advisorID, adminID)
);

CREATE TABLE client
(
    clientID       INT AUTO_INCREMENT NOT NULL,
    ssn            VARCHAR(11) NOT NULL,
    phone_number   VARCHAR(15) NOT NULL,
    email          VARCHAR(50) NOT NULL,
    birthdate      DATE        NOT NULL,
    street_address VARCHAR(50) NOT NULL,
    city           VARCHAR(50) NOT NULL,
    state          VARCHAR(50),
    country        VARCHAR(50) NOT NULL,
    postal_code    VARCHAR(50),
    first_name     VARCHAR(50) NOT NULL,
    middle_name    VARCHAR(50),
    last_name      VARCHAR(50) NOT NULL,
    advisorID      INT         NOT NULL,
    PRIMARY KEY (clientID),
    FOREIGN KEY (advisorID) references advisor (advisorID),
    CONSTRAINT Unique_Contact_Info UNIQUE (phone_number, email)
);



CREATE TABLE portfolio
(
    portfolioID INT AUTO_INCREMENT NOT NULL,
    value       DECIMAL(13, 4) NOT NULL DEFAULT 0.0000,
    name        VARCHAR(50)    NOT NULL,
    clientID    INT            NOT NULL,
    PRIMARY KEY (portfolioID),
    FOREIGN KEY (clientID) references client (clientID)
);

CREATE TABLE investment_profile
(
    investment_profileID INT AUTO_INCREMENT NOT NULL,
    investment_attitude  ENUM ('Very Conservative', 'Somewhat Conservative', 'Moderate', 'Somewhat Aggressive', 'Very Aggressive') NOT NULL,
    investment_purpose   ENUM ('Growth', 'Retirement', 'Asset Preservation') NOT NULL,
    investment_timeframe ENUM ('Less Than One Year', '1-2 Years', '3-5 Years', '5-10 Years', '10-15 Years', '15-25 Years','More Than 25 Years') NOT NULL,
    risk_tolerance       ENUM ('Averse', 'Moderate', 'Extreme') NOT NULL,
    portfolioID          INT NOT NULL,
    PRIMARY KEY (investment_profileID),
    FOREIGN KEY (portfolioID) references portfolio (portfolioID)
);

CREATE TABLE stock
(
    ticker      VARCHAR(10)    NOT NULL,
    date_bought DATETIME       NOT NULL,
    value       DECIMAL(13, 4) NOT NULL DEFAULT 0.0000,
    quantity    DECIMAL(13, 3) NOT NULL,
    portfolioID INT            NOT NULL,
    PRIMARY KEY (ticker, date_bought, quantity),
    FOREIGN KEY (portfolioID) references portfolio (portfolioID)
);

-- administrator sample data generated with Mockaroo
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('667-070-7361', 'eflahive0@gmpg.org', 'Saleem', 'Estel', 'Flahive'),
       ('785-217-3445', 'cnewing1@chronoengine.com', 'Mirelle', 'Christophe', 'Newing'),
       ('320-405-0506', 'jmalim2@instagram.com', 'Bret', 'Jana', 'Malim');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('752-233-5225', 'lfagan0@is.gd', 'Onfre', 'Lorrin', 'Fagan');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('504-952-8313', 'aosgodby1@meetup.com', 'Uri', 'Alistair', 'Osgodby');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('586-949-9270', 'lgottelier2@chronoengine.com', 'Hersch', 'Liam', 'Gottelier');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('493-195-2985', 'tbushnell3@addthis.com', 'Inez', 'Tallou', 'Bushnell');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('896-303-6598', 'cfeldhammer4@themeforest.net', 'Alina', 'Claudetta', 'Feldhammer');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('846-085-3174', 'facland5@google.it', 'Selene', 'Fonzie', 'Acland');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('074-166-2041', 'lmcmillam6@skyrock.com', 'Ervin', 'Lissy', 'McMillam');

-- advisor sample data generated with Mockaroo
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('965-539-4107', 'wrafter0@zimbio.com', 'Kingsly', 'Waldon', 'Rafter'),
       ('041-076-1509', 'cshimony1@theguardian.com', 'Stephana', 'Clementia', 'Shimony'),
       ('544-341-8309', 'ddyers2@tumblr.com', 'Lyndell', 'Dallas', 'Dyers'),
       ('763-216-2655', 'rcleland3@discuz.net', 'Dannie', 'Rufe', 'Cleland'),
       ('648-381-1188', 'agowry4@w3.org', 'Karim', 'Audry', 'Gowry');
insert into advisor (phone_number, email, first_name, middle_name, last_name) values ('347-216-0827', 'pmolesworth0@nsw.gov.au', 'Elicia', 'Pietro', 'Molesworth');
insert into advisor (phone_number, email, first_name, middle_name, last_name) values ('303-073-9015', 'hberkeley1@plala.or.jp', 'Isadora', 'Huey', 'Berkeley');
insert into advisor (phone_number, email, first_name, middle_name, last_name) values ('854-499-8482', 'afairlem2@auda.org.au', 'Jeffie', 'Alaine', 'Fairlem');
insert into advisor (phone_number, email, first_name, middle_name, last_name) values ('575-379-1897', 'lpugsley3@mayoclinic.com', 'Jessi', 'Lucila', 'Pugsley');
insert into advisor (phone_number, email, first_name, middle_name, last_name) values ('379-759-3051', 'doldroyde4@lulu.com', 'Alfi', 'Danell', 'Oldroyde');
insert into advisor (phone_number, email, first_name, middle_name, last_name) values ('496-212-6228', 'cwretham5@fema.gov', 'Hunt', 'Cullie', 'Wretham');
insert into advisor (phone_number, email, first_name, middle_name, last_name) values ('261-772-7093', 'lree6@infoseek.co.jp', 'Annemarie', 'Lewie', 'Ree');
insert into advisor (phone_number, email, first_name, middle_name, last_name) values ('883-165-1721', 'wbernhardt7@paginegialle.it', 'Sarina', 'Winona', 'Bernhardt');
insert into advisor (phone_number, email, first_name, middle_name, last_name) values ('321-050-9772', 'dprimmer8@plala.or.jp', 'Noelle', 'Delores', 'Primmer');
insert into advisor (phone_number, email, first_name, middle_name, last_name) values ('566-591-1032', 'nivain9@statcounter.com', 'Jerad', 'Nicky', 'Ivain');
insert into advisor (phone_number, email, first_name, middle_name, last_name) values ('234-381-3959', 'jscutchingsa@harvard.edu', 'Maryjo', 'Jacqui', 'Scutchings');
insert into advisor (phone_number, email, first_name, middle_name, last_name) values ('440-777-4045', 'drayerb@1und1.de', 'Willabella', 'Dyan', 'Rayer');
insert into advisor (phone_number, email, first_name, middle_name, last_name) values ('442-935-2730', 'aspellaceyc@mapy.cz', 'Valida', 'Antony', 'Spellacey');
insert into advisor (phone_number, email, first_name, middle_name, last_name) values ('733-892-8768', 'kblundind@cbc.ca', 'Mayor', 'Kienan', 'Blundin');
insert into advisor (phone_number, email, first_name, middle_name, last_name) values ('359-887-0235', 'bfishponde@geocities.jp', 'Agnesse', 'Barrie', 'Fishpond');
insert into advisor (phone_number, email, first_name, middle_name, last_name) values ('160-232-8007', 'mbrunif@nationalgeographic.com', 'Kial', 'Meggie', 'Bruni');
insert into advisor (phone_number, email, first_name, middle_name, last_name) values ('752-689-4021', 'hmewettg@samsung.com', 'Orlan', 'Hunter', 'Mewett');
insert into advisor (phone_number, email, first_name, middle_name, last_name) values ('501-898-6973', 'hsummerlieh@i2i.jp', 'Giffer', 'Hi', 'Summerlie');
insert into advisor (phone_number, email, first_name, middle_name, last_name) values ('093-150-8899', 'abrimblei@angelfire.com', 'Karmen', 'Aldwin', 'Brimble');
insert into advisor (phone_number, email, first_name, middle_name, last_name) values ('403-385-9593', 'rwhildej@wikimedia.org', 'Northrop', 'Robb', 'Whilde');
insert into advisor (phone_number, email, first_name, middle_name, last_name) values ('575-742-0179', 'fcovellek@sogou.com', 'Artemus', 'Fionna', 'Covelle');
insert into advisor (phone_number, email, first_name, middle_name, last_name) values ('580-239-1970', 'dwrighteml@newyorker.com', 'Gil', 'Deny', 'Wrightem');
insert into advisor (phone_number, email, first_name, middle_name, last_name) values ('996-747-2815', 'scrouchm@meetup.com', 'Jobyna', 'Salaidh', 'Crouch');
insert into advisor (phone_number, email, first_name, middle_name, last_name) values ('584-333-0964', 'acominellon@constantcontact.com', 'Leonelle', 'Andre', 'Cominello');
insert into advisor (phone_number, email, first_name, middle_name, last_name) values ('142-986-3495', 'kabelovo@vimeo.com', 'Dale', 'Kleon', 'Abelov');
insert into advisor (phone_number, email, first_name, middle_name, last_name) values ('625-989-3509', 'mromeop@ucla.edu', 'Brittni', 'Mel', 'Romeo');
insert into advisor (phone_number, email, first_name, middle_name, last_name) values ('218-562-7828', 'apinwillq@rediff.com', 'Bryan', 'Auguste', 'Pinwill');
insert into advisor (phone_number, email, first_name, middle_name, last_name) values ('647-519-1406', 'kdellowr@ifeng.com', 'Vicky', 'Kessia', 'Dellow');
insert into advisor (phone_number, email, first_name, middle_name, last_name) values ('634-871-3373', 'vtidgewells@goo.gl', 'Pia', 'Vaclav', 'Tidgewell');
insert into advisor (phone_number, email, first_name, middle_name, last_name) values ('432-121-9087', 'stabaryt@hatena.ne.jp', 'Angel', 'Saw', 'Tabary');
insert into advisor (phone_number, email, first_name, middle_name, last_name) values ('976-003-5152', 'spauncefortu@abc.net.au', 'Vin', 'Simonette', 'Pauncefort');
insert into advisor (phone_number, email, first_name, middle_name, last_name) values ('922-396-0487', 'tkainzv@sogou.com', 'Margette', 'Trescha', 'Kainz');
insert into advisor (phone_number, email, first_name, middle_name, last_name) values ('619-505-5382', 'rdallmanw@spiegel.de', 'Alissa', 'Redd', 'Dallman');
insert into advisor (phone_number, email, first_name, middle_name, last_name) values ('798-450-2744', 'aflickerx@irs.gov', 'Zara', 'Alethea', 'Flicker');
insert into advisor (phone_number, email, first_name, middle_name, last_name) values ('726-613-6790', 'beisaky@elegantthemes.com', 'Bordy', 'Brinn', 'Eisak');
insert into advisor (phone_number, email, first_name, middle_name, last_name) values ('207-566-5255', 'lsiddellz@foxnews.com', 'Brandise', 'Lin', 'Siddell');
insert into advisor (phone_number, email, first_name, middle_name, last_name) values ('773-240-5032', 'itschirasche10@latimes.com', 'Edin', 'Isidora', 'Tschirasche');
insert into advisor (phone_number, email, first_name, middle_name, last_name) values ('463-973-4181', 'kmieville11@bloglines.com', 'Leta', 'Kristian', 'Mieville');
insert into advisor (phone_number, email, first_name, middle_name, last_name) values ('306-561-5637', 'mpina12@irs.gov', 'Catarina', 'Mario', 'Pina');
insert into advisor (phone_number, email, first_name, middle_name, last_name) values ('645-430-7760', 'vwhitely13@paginegialle.it', 'Charin', 'Vassily', 'Whitely');
insert into advisor (phone_number, email, first_name, middle_name, last_name) values ('541-010-3053', 'abastie14@illinois.edu', 'Cherianne', 'Alexia', 'Bastie');
insert into advisor (phone_number, email, first_name, middle_name, last_name) values ('669-064-2640', 'hdessent15@youtube.com', 'Gwynne', 'Hildagarde', 'Dessent');
insert into advisor (phone_number, email, first_name, middle_name, last_name) values ('120-846-2323', 'lhalling16@flickr.com', 'Bryana', 'Lynelle', 'Halling');
insert into advisor (phone_number, email, first_name, middle_name, last_name) values ('851-441-2322', 'yskitch17@berkeley.edu', 'Gran', 'Yulma', 'Skitch');
insert into advisor (phone_number, email, first_name, middle_name, last_name) values ('026-417-2702', 'arulf18@wsj.com', 'Brittaney', 'Andra', 'Rulf');

-- admin_advisor sample data generated with Mockaroo
insert into admin_advisor (advisorID, adminID)
values (1, 1),
       (1, 2),
       (1, 3),
       (2, 1),
       (2, 2),
       (2, 3),
       (3, 1),
       (3, 2),
       (4, 2),
       (4, 3),
       (5, 1),
       (6, 7),
       (7, 5),
       (8, 8),
       (9, 2),
       (10, 10),
       (11, 1);
insert into admin_advisor (advisorID, adminID) values (12, 10);
insert into admin_advisor (advisorID, adminID) values (13, 8);
insert into admin_advisor (advisorID, adminID) values (14, 4);
insert into admin_advisor (advisorID, adminID) values (15, 9);
insert into admin_advisor (advisorID, adminID) values (16, 1);
insert into admin_advisor (advisorID, adminID) values (17, 10);
insert into admin_advisor (advisorID, adminID) values (18, 8);
insert into admin_advisor (advisorID, adminID) values (19, 2);
insert into admin_advisor (advisorID, adminID) values (20, 5);
insert into admin_advisor (advisorID, adminID) values (21, 3);
insert into admin_advisor (advisorID, adminID) values (22, 8);
insert into admin_advisor (advisorID, adminID) values (23, 3);
insert into admin_advisor (advisorID, adminID) values (24, 10);
insert into admin_advisor (advisorID, adminID) values (25, 10);
insert into admin_advisor (advisorID, adminID) values (26, 6);
insert into admin_advisor (advisorID, adminID) values (27, 9);
insert into admin_advisor (advisorID, adminID) values (28, 3);
insert into admin_advisor (advisorID, adminID) values (29, 9);
insert into admin_advisor (advisorID, adminID) values (30, 6);
insert into admin_advisor (advisorID, adminID) values (31, 7);
insert into admin_advisor (advisorID, adminID) values (32, 8);
insert into admin_advisor (advisorID, adminID) values (33, 5);
insert into admin_advisor (advisorID, adminID) values (34, 6);
insert into admin_advisor (advisorID, adminID) values (35, 10);
insert into admin_advisor (advisorID, adminID) values (36, 9);
insert into admin_advisor (advisorID, adminID) values (37, 3);
insert into admin_advisor (advisorID, adminID) values (38, 10);
insert into admin_advisor (advisorID, adminID) values (39, 8);
insert into admin_advisor (advisorID, adminID) values (40, 9);
insert into admin_advisor (advisorID, adminID) values (41, 6);
insert into admin_advisor (advisorID, adminID) values (42, 2);
insert into admin_advisor (advisorID, adminID) values (43, 9);
insert into admin_advisor (advisorID, adminID) values (44, 9);
insert into admin_advisor (advisorID, adminID) values (45, 7);
insert into admin_advisor (advisorID, adminID) values (46, 5);
insert into admin_advisor (advisorID, adminID) values (47, 6);
insert into admin_advisor (advisorID, adminID) values (48, 4);
insert into admin_advisor (advisorID, adminID) values (49, 4);
insert into admin_advisor (advisorID, adminID) values (50, 10);

-- client sample data generated with Mockaroo
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code,
                    first_name, middle_name, last_name, advisorID)
values ('790-87-8203', '418-715-3228', 'lcattermull0@berkeley.edu', '1964-10-03', '0307 Donald Parkway', 'Yelwa',
        null, 'Nigeria', null, 'Orlando', 'Lelia', 'Cattermull', 1),
       ('086-32-9594', '922-044-3554', 'joldred1@ning.com', '1950-08-13', '4869 Tennyson Center', 'Paris 11',
        'Île-de-France', 'France', '75542 CEDEX 11', 'Hermione', 'Johanna', 'Oldred', 4),
       ('174-97-0987', '263-864-9628', 'efairy2@smugmug.com', '1950-04-14', '185 Steensland Junction', 'Bang Saphan',
        null, 'Thailand', '77140', 'Arin', 'Essa', 'Fairy', 3),
       ('186-96-6884', '281-242-3406', 'jnorthwood3@princeton.edu', '1986-05-06', '2739 Kipling Pass', 'Olympia',
        'Washington', 'United States', '98516', 'Elyn', 'John', 'Northwood', 2),
       ('390-14-0999', '170-527-0484', 'bstonall4@tinypic.com', '1978-05-08', '4 Nova Lane', 'Kademangan', null,
        'Indonesia', null, 'Agata', 'Betsey', 'Stonall', 5),
       ('765-26-7913', '333-742-4651', 'ymcveigh5@blinklist.com', '1980-06-25', '872 Elgar Circle', 'Mubi', null,
        'Nigeria', null, 'Dennie', 'Yolande', 'McVeigh', 1),
       ('840-72-6576', '317-013-3501', 'ulondesborough6@ow.ly', '1983-05-16', '20189 Ridgeway Park', 'Xinpeicun',
        null, 'China', null, 'Lyndel', 'Ulises', 'Londesborough', 2),
       ('269-27-6299', '604-877-6556', 'bkain7@issuu.com', '1968-05-13', '898 John Wall Street', 'Nagiba', null,
        'Philippines', '5501', 'Happy', 'Brit', 'Kain', 2),
       ('640-45-6073', '216-620-8797', 'fsilber8@time.com', '1987-03-17', '2323 Superior Pass', 'Mubi', null,
        'Nigeria', null, 'Douglass', 'Freeman', 'Silber', 3),
       ('672-00-5561', '516-319-8776', 'ghowison9@umich.edu', '1966-05-14', '761 Bartillon Avenue', 'Kamuli', null,
        'Uganda', null, 'Donaugh', 'Gunther', 'Howison', 5);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('946-75-0232', '806-394-1328', 'ablandford0@reuters.com', '1956-02-08 23:33:42', '902 Butterfield Avenue', 'La Troncal', null, 'Ecuador', null, 'Richy', 'Arabelle', 'Blandford', 9);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('287-23-1051', '699-612-6526', 'mgillease1@engadget.com', '1961-08-07 17:58:46', '32 Glacier Hill Court', 'Matsushima', null, 'Japan', '981-0213', 'Chastity', 'Meade', 'Gillease', 26);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('804-07-6030', '491-279-3052', 'ktoke2@icq.com', '1960-06-22 05:28:51', '274 Fisk Pass', 'Bang Na', null, 'Thailand', '10260', 'Renaud', 'Krisha', 'Toke', 43);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('294-29-0315', '698-175-1680', 'sderuggero3@nasa.gov', '1960-02-02 11:58:05', '5589 Village Alley', 'Eydhafushi', null, 'Maldives', null, 'Melania', 'Shelbi', 'De Ruggero', 41);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('476-51-0289', '404-609-5785', 'lledley4@auda.org.au', '1967-03-07 23:46:27', '73784 Summer Ridge Lane', 'Libei', null, 'China', null, 'Barbi', 'Leoline', 'Ledley', 1);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('602-94-8310', '337-106-7332', 'wmongin5@taobao.com', '1980-07-26 04:54:04', '6 Pankratz Street', 'Lajeado', null, 'Brazil', '77645-000', 'Mindy', 'Wren', 'Mongin', 37);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('372-62-7454', '903-402-7201', 'swoollends6@mysql.com', '1982-03-19 13:59:16', '810 Riverside Terrace', 'Xinan', null, 'China', null, 'Rutger', 'Shae', 'Woollends', 34);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('570-01-3579', '115-581-9640', 'cgurdon7@cnet.com', '1978-09-02 13:16:32', '573 Warbler Alley', 'Kyurdarmir', null, 'Azerbaijan', null, 'Ronalda', 'Cassie', 'Gurdon', 34);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('749-15-9090', '686-758-0250', 'kkadar8@wisc.edu', '1969-06-11 17:55:25', '56 Sauthoff Junction', 'Västervik', 'Kalmar', 'Sweden', '593 30', 'Gilly', 'Kamillah', 'Kadar', 49);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('562-45-0316', '173-524-8497', 'ecaddie9@canalblog.com', '1992-01-30 21:00:08', '23 Chive Alley', 'Ambarita', null, 'Indonesia', null, 'Oralle', 'Elena', 'Caddie', 19);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('070-87-2223', '385-818-5743', 'mwallheada@dyndns.org', '1980-10-10 12:52:42', '1738 Northridge Park', 'Loma Bonita', 'Morelos', 'Mexico', '62576', 'Maddy', 'Maximilian', 'Wallhead', 49);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('091-16-8054', '688-580-0440', 'mjillisb@cnbc.com', '1976-01-13 16:52:45', '8956 Rieder Terrace', 'Janes', 'Lisboa', 'Portugal', '2755-123', 'Noak', 'Marthena', 'Jillis', 5);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('323-61-1513', '783-646-6879', 'rlanbertonic@ftc.gov', '1956-05-03 17:58:09', '04501 Dapin Center', 'Chengzhong', null, 'China', null, 'Zachary', 'Rosy', 'Lanbertoni', 13);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('426-17-5077', '651-870-9784', 'mmarchisod@businesswire.com', '1998-05-17 03:56:06', '8 Debra Circle', 'Longjiang', null, 'China', null, 'Joane', 'Morse', 'Marchiso', 48);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('516-11-0055', '564-769-4297', 'okuhlmeye@google.ru', '1984-10-26 01:30:14', '0770 1st Alley', 'São Martinho', 'Porto', 'Portugal', '4780-320', 'Cornie', 'Oren', 'Kuhlmey', 43);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('608-94-1886', '858-813-4626', 'lbereclothf@friendfeed.com', '1995-03-10 09:35:43', '8 Old Gate Street', 'Carolina', null, 'South Africa', '1185', 'Casper', 'Lil', 'Berecloth', 1);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('251-86-4289', '547-388-1298', 'kgallafantg@chicagotribune.com', '1958-04-17 09:29:57', '408 Commercial Terrace', 'Tampocon', null, 'Philippines', '6210', 'Abran', 'Kim', 'Gallafant', 5);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('513-65-8874', '852-561-1191', 'cmatieweh@mapquest.com', '1970-11-13 20:36:31', '77 Jenna Way', 'Chanhe', null, 'China', null, 'Daisi', 'Chic', 'Matiewe', 26);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('451-42-7816', '535-584-8942', 'cboldryi@wikimedia.org', '1988-08-27 16:12:10', '55907 Barnett Park', 'Gaoqiao', null, 'China', null, 'Cassandre', 'Coletta', 'Boldry', 33);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('949-93-5288', '998-816-2771', 'ilaffinj@reference.com', '1965-01-31 19:52:35', '64599 Center Circle', 'Göteborg', 'Västra Götaland', 'Sweden', '417 43', 'Dorie', 'Ignacius', 'Laffin', 48);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('955-17-2836', '652-381-7553', 'mvogeleink@cocolog-nifty.com', '1993-10-07 08:47:40', '9 Mayer Trail', 'Kostanay', null, 'Kazakhstan', null, 'Randolf', 'Mick', 'Vogelein', 10);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('125-34-8008', '249-305-6505', 'ldrippsl@arstechnica.com', '1947-10-22 17:05:44', '2 Fairfield Crossing', 'Lelekovice', null, 'Czech Republic', '664 31', 'Dorene', 'Leela', 'Dripps', 6);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('932-05-4168', '452-935-6551', 'lcardillom@digg.com', '1977-11-07 12:54:42', '9631 4th Junction', 'Jugantang', null, 'Indonesia', null, 'Ives', 'Libby', 'Cardillo', 37);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('789-97-3973', '304-150-0205', 'jatcherleyn@yellowpages.com', '1993-12-24 07:48:54', '64 Sachtjen Parkway', 'La Paz', 'Oaxaca', 'Mexico', '71161', 'Margarita', 'Judi', 'Atcherley', 8);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('158-98-7826', '443-563-6378', 'bswireo@printfriendly.com', '1987-12-31 03:06:21', '8121 Nevada Park', 'Inanwatan', null, 'Indonesia', null, 'Horace', 'Brigid', 'Swire', 34);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('206-03-1671', '128-809-7971', 'cbloxhamp@theguardian.com', '1993-04-15 02:04:38', '419 Scofield Drive', 'Vereshchagino', null, 'Russia', '303642', 'Pearle', 'Curry', 'Bloxham', 41);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('249-63-4426', '193-397-2761', 'molijveq@columbia.edu', '1978-08-05 15:58:03', '12 Mendota Pass', 'Baozi', null, 'China', null, 'Ricky', 'Mireille', 'Olijve', 9);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('388-55-0135', '982-895-4132', 'lsnellerr@engadget.com', '1986-07-01 06:21:49', '6218 Nova Plaza', 'Az Zarbah', null, 'Syria', null, 'Ignazio', 'Lynna', 'Sneller', 30);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('562-23-4358', '729-908-4712', 'gcowhigs@about.me', '1946-04-08 18:24:16', '7 Riverside Trail', 'Rustam jo Goth', null, 'Pakistan', '78051', 'Terrijo', 'Geri', 'Cowhig', 24);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('501-44-7388', '366-520-4300', 'mborgt@alibaba.com', '1995-09-07 02:28:14', '63 Mosinee Point', 'Acli', null, 'Philippines', '1470', 'Bette-ann', 'Muire', 'Borg', 28);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('733-34-6631', '696-246-4584', 'dneevesu@cornell.edu', '1966-12-25 06:25:16', '94052 Cody Terrace', 'Xinghua', null, 'China', null, 'Mei', 'Donny', 'Neeves', 6);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('907-22-3296', '988-654-7893', 'sheitonv@ow.ly', '1975-02-23 19:02:30', '25 International Trail', 'Tairan Camp', null, 'Philippines', '7301', 'Holly-anne', 'Stanleigh', 'Heiton', 36);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('199-76-6038', '600-632-7411', 'ehofw@deliciousdays.com', '1973-03-11 08:09:11', '5 Mandrake Trail', 'Dicun', null, 'China', null, 'Neville', 'Emylee', 'Hof', 18);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('673-77-7160', '405-791-9236', 'hvasyushkhinx@yahoo.com', '1965-06-13 15:59:43', '7844 Burning Wood Lane', 'Lages', 'Porto', 'Portugal', '4620-279', 'Humberto', 'Hurley', 'Vasyushkhin', 49);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('667-27-8214', '250-859-6282', 'akearyy@pagesperso-orange.fr', '1978-02-20 05:07:41', '912 Doe Crossing Terrace', 'Ciela Lebak', null, 'Indonesia', null, 'Karissa', 'Ad', 'Keary', 31);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('393-05-6686', '175-983-4939', 'ihuftonz@kickstarter.com', '1968-02-24 12:44:08', '71609 Cambridge Trail', 'Nahiyat Ghammas', null, 'Iraq', null, 'Murry', 'Ilysa', 'Hufton', 29);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('472-89-9543', '923-331-3525', 'gdaggett10@paginegialle.it', '1987-08-23 03:13:48', '7 Northfield Road', 'Telsen', null, 'Argentina', '9121', 'Justinn', 'Gabriello', 'Daggett', 32);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('312-69-0859', '262-383-4873', 'bconibear11@huffingtonpost.com', '1947-07-15 10:24:59', '1035 Prentice Hill', 'Taibai', null, 'China', null, 'Yoshi', 'Bebe', 'Conibear', 6);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('800-16-9346', '926-328-8586', 'mfilyukov12@people.com.cn', '1984-06-18 09:58:36', '88104 Schlimgen Pass', 'Dok Kham Tai', null, 'Thailand', '56120', 'Tamma', 'Minetta', 'Filyukov', 22);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('086-08-7689', '732-392-5408', 'cwarstall13@google.de', '1986-11-15 21:32:58', '7716 Vahlen Plaza', 'Long Loreh', null, 'Indonesia', null, 'Davidson', 'Casey', 'Warstall', 25);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('721-20-1849', '843-248-9530', 'nkleinerman14@ehow.com', '1988-09-24 07:16:47', '6 Namekagon Alley', 'Meizhuang', null, 'China', null, 'Aloin', 'Niven', 'Kleinerman', 15);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('495-17-6909', '447-371-5814', 'wricarde15@xrea.com', '1978-02-07 18:30:16', '0886 Buhler Street', 'Villa Alemana', null, 'Chile', null, 'Harcourt', 'Worden', 'Ricarde', 30);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('736-13-0342', '744-417-8297', 'lharly16@shareasale.com', '1997-10-25 08:35:23', '23 Browning Trail', 'Kulevcha', null, 'Ukraine', null, 'Quinn', 'Leroi', 'Harly', 48);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('826-48-3810', '341-228-1057', 'ctumulty17@upenn.edu', '1977-01-12 12:03:35', '86 Quincy Junction', 'Las Vegas', null, 'Venezuela', null, 'Antony', 'Celka', 'Tumulty', 45);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('403-31-0928', '857-644-2755', 'acardinale18@homestead.com', '1957-04-15 23:28:50', '6 Forster Hill', 'Kendari', null, 'Indonesia', null, 'Winny', 'Ardisj', 'Cardinale', 9);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('144-57-9447', '855-899-6428', 'cashbey19@booking.com', '1973-09-11 07:03:37', '78377 Springs Way', 'Shirahamachō-usazakiminami', null, 'Japan', '672-8090', 'Clair', 'Charmian', 'Ashbey', 28);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('468-99-8508', '955-404-3423', 'dofield1a@ox.ac.uk', '1955-01-06 20:06:32', '6671 Lerdahl Road', 'Kadubincarung', null, 'Indonesia', null, 'Tara', 'Daffie', 'Ofield', 11);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('202-67-7469', '752-144-1471', 'fstollery1b@ning.com', '1984-03-15 16:39:55', '55 Barnett Park', 'Changuillo', null, 'Peru', null, 'Celinda', 'Fulvia', 'Stollery', 48);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('140-98-4846', '649-379-6866', 'omurton1c@posterous.com', '1997-05-20 04:18:02', '2928 Surrey Center', 'Lewin Kłodzki', null, 'Poland', '57-343', 'Dore', 'Osbourne', 'Murton', 15);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('418-09-2444', '817-608-8766', 'kpietzker1d@adobe.com', '1968-11-06 12:40:46', '5 Hauk Plaza', 'Xinbu', null, 'China', null, 'Matthew', 'Kamilah', 'Pietzker', 34);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('930-85-7883', '502-565-1529', 'mchudleigh1e@nih.gov', '1967-03-04 09:19:27', '005 Walton Alley', 'Shenavan', null, 'Armenia', null, 'Adriana', 'Mathian', 'Chudleigh', 48);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('501-78-4904', '797-630-4942', 'sbranton1f@ucoz.ru', '1969-04-08 02:26:24', '11 Fallview Junction', 'Xiaochi', null, 'China', null, 'Wes', 'Selma', 'Branton', 18);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('197-82-7944', '196-190-8902', 'lmethuen1g@auda.org.au', '1999-11-08 15:19:18', '2328 David Avenue', 'Fonte da Aldeia', 'Bragança', 'Portugal', '5210-325', 'Andra', 'Lacey', 'Methuen', 30);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('627-05-5934', '583-623-8407', 'ifrizell1h@sfgate.com', '1962-10-16 17:56:42', '8546 Beilfuss Parkway', 'Hongyi', null, 'China', null, 'Ryley', 'Ignacio', 'Frizell', 15);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('619-22-0360', '658-448-4292', 'aharfoot1i@sun.com', '1981-08-26 11:43:23', '20 Shelley Way', 'Jiaxian Chengguanzhen', null, 'China', null, 'Marcellus', 'Alfie', 'Harfoot', 49);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('606-64-8660', '803-429-7179', 'mslaght1j@linkedin.com', '1970-02-20 09:59:04', '6206 Roxbury Way', 'Birowo', null, 'Indonesia', null, 'Essy', 'Merrielle', 'Slaght', 50);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('906-07-5061', '759-914-9974', 'dygou1k@friendfeed.com', '1949-10-28 00:57:36', '14596 Kings Center', 'Ipoh', 'Perak', 'Malaysia', '30674', 'Thatcher', 'Dougie', 'Ygou', 22);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('552-43-7339', '423-384-3699', 'tmeese1l@google.cn', '1994-04-12 08:24:03', '723 Scoville Terrace', 'Suya', null, 'Nigeria', null, 'Kial', 'Trixy', 'Meese', 20);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('593-47-8433', '577-635-0572', 'khartzenberg1m@rediff.com', '1998-06-18 12:44:06', '9 Esch Place', 'Beskolen', null, 'Indonesia', null, 'Ariel', 'Kathryne', 'Hartzenberg', 15);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('317-70-5471', '341-805-0772', 'wminghella1n@pbs.org', '1986-01-01 01:19:09', '1916 Almo Junction', 'Zhulebino', null, 'Russia', '140074', 'Nedi', 'Willamina', 'Minghella', 44);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('340-19-8829', '525-861-3390', 'eyegorovnin1o@cbslocal.com', '1964-05-05 19:23:01', '71 Mayfield Point', 'Águia Branca', null, 'Brazil', '29795-000', 'Nanette', 'Ethelred', 'Yegorovnin', 28);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('475-26-0911', '840-469-2495', 'sburrow1p@pbs.org', '1947-04-27 03:09:27', '871 New Castle Parkway', 'Boafeo', null, 'Indonesia', null, 'Marta', 'Shana', 'Burrow', 49);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('303-37-6677', '627-496-7525', 'dmeir1q@arizona.edu', '1987-01-26 05:31:24', '2674 Sycamore Junction', 'Rzozów', null, 'Poland', '32-060', 'Olympie', 'Darius', 'Meir', 6);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('094-19-4179', '604-177-7396', 'kbradder1r@acquirethisname.com', '1969-09-23 05:46:03', '74 Hudson Hill', 'Lordegān', null, 'Iran', null, 'Brenda', 'Kerianne', 'Bradder', 31);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('791-04-1955', '663-247-2087', 'edibiagio1s@php.net', '1986-07-20 00:21:05', '55 Clove Junction', 'Yeniköy', 'Trabzon', 'Turkey', '61300', 'Erasmus', 'Erwin', 'Di Biagio', 50);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('980-83-5816', '737-971-4315', 'rkimbury1t@ibm.com', '1963-10-13 13:01:23', '91751 Roxbury Place', 'Bojongsari', null, 'Indonesia', null, 'Filberto', 'Rozalie', 'Kimbury', 40);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('123-97-1037', '183-445-7943', 'ebransom1u@ftc.gov', '1958-10-01 12:21:58', '264 Bay Street', 'Tumu’ertai', null, 'China', null, 'Christyna', 'Evaleen', 'Bransom', 12);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('575-20-1642', '472-373-8014', 'omcgilleghole1v@umich.edu', '1972-01-02 05:58:30', '70 Bartelt Center', 'Logan Lake', 'British Columbia', 'Canada', 'T3S', 'Sharyl', 'Ozzie', 'McGilleghole', 8);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('094-89-1686', '143-320-5532', 'dmcravey1w@tripadvisor.com', '1974-02-24 19:28:10', '39668 Texas Trail', 'Dongyang', null, 'China', null, 'Jodie', 'Dex', 'McRavey', 6);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('373-93-7436', '598-350-2557', 'rmatthessen1x@dmoz.org', '1947-03-18 13:41:02', '2400 Montana Alley', 'Nelspruit', null, 'South Africa', '1360', 'Hartwell', 'Roxanna', 'Matthessen', 45);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('833-01-0486', '749-109-3767', 'ggimbrett1y@delicious.com', '1970-10-27 02:15:38', '22 Mayer Road', 'Diónysos', null, 'Greece', null, 'Morton', 'Glenine', 'Gimbrett', 45);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('566-74-5623', '958-788-2538', 'bmartschik1z@bizjournals.com', '1961-05-01 08:28:47', '93 Ronald Regan Court', 'Sanxi', null, 'China', null, 'Gretel', 'Babbette', 'Martschik', 15);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('185-56-5666', '289-968-3319', 'pcrecy20@bigcartel.com', '1966-03-11 19:24:59', '4 Milwaukee Center', 'Vale de Figueira', 'Lisboa', 'Portugal', '2695-584', 'Derby', 'Pauly', 'Crecy', 16);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('018-05-5667', '612-181-2672', 'wmconie21@jimdo.com', '1983-08-25 15:02:13', '607 Continental Pass', 'Mingelchaur', null, 'Azerbaijan', null, 'Cosetta', 'Winthrop', 'McOnie', 29);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('768-71-7363', '606-302-7657', 'bcartan22@51.la', '1992-12-17 09:36:57', '15669 Green Lane', 'Xikou', null, 'China', null, 'Octavius', 'Barbey', 'Cartan', 11);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('878-18-1046', '109-355-7721', 'pworge23@cbc.ca', '1999-12-03 21:04:15', '923 Mcguire Court', 'Molodohvardiys’k', null, 'Ukraine', null, 'Tabbitha', 'Peyter', 'Worge', 20);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('212-58-7452', '132-208-2046', 'rshuttell24@time.com', '1956-01-03 16:44:09', '2116 Colorado Avenue', 'Zicheng', null, 'China', null, 'Sonja', 'Robbert', 'Shuttell', 42);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('727-59-2719', '318-916-0584', 'bjuliff25@mit.edu', '1968-03-15 13:20:21', '2 Redwing Avenue', 'Chervonohryhorivka', null, 'Ukraine', null, 'Kaja', 'Becca', 'Juliff', 7);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('296-34-8707', '620-161-0907', 'jwhitlow26@smh.com.au', '1990-11-28 05:10:18', '13 Holmberg Alley', 'Esmeraldas', null, 'Brazil', '35740-000', 'Ina', 'Julina', 'Whitlow', 40);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('522-88-5832', '761-734-1804', 'dmalpas27@oracle.com', '1966-11-03 17:18:09', '5 Lunder Circle', 'Rantīs', null, 'Palestinian Territory', null, 'Sascha', 'Dolly', 'Malpas', 10);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('826-55-7948', '724-234-8641', 'fclamp28@360.cn', '1968-03-18 09:19:25', '1879 Sage Pass', 'Gangtun', null, 'China', null, 'Byron', 'Flinn', 'Clamp', 30);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('860-60-0830', '808-826-5150', 'mkirsop29@zdnet.com', '1971-10-14 15:39:12', '8136 Coleman Circle', 'Xin Bulag', null, 'China', null, 'Camila', 'Murray', 'Kirsop', 32);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('882-23-5766', '216-923-5884', 'ymanuel2a@home.pl', '1980-08-08 10:46:50', '22 Maple Junction', 'Bhamdoûn el Mhatta', null, 'Lebanon', null, 'Maryjane', 'Yvonne', 'Manuel', 13);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('294-13-3101', '681-385-6296', 'cortsmann2b@virginia.edu', '1969-04-22 20:31:46', '90 Morrow Plaza', 'Örebro', 'Örebro', 'Sweden', '700 15', 'Nerty', 'Cosetta', 'Ortsmann', 24);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('904-79-5089', '774-945-5589', 'tsatterfitt2c@ebay.com', '1991-06-22 15:28:41', '8 Towne Terrace', 'Marinhais', 'Santarém', 'Portugal', '2125-106', 'Ase', 'Teodorico', 'Satterfitt', 41);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('121-24-0489', '421-667-8314', 'cmerigot2d@usnews.com', '1955-02-26 18:06:18', '656 Lakewood Pass', 'Kozhevnikovo', null, 'Russia', '422338', 'Roland', 'Christiana', 'Merigot', 12);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('745-58-8377', '535-504-6162', 'sedgeler2e@illinois.edu', '1981-01-27 00:03:01', '322 Shelley Terrace', 'Santa Cruz', 'Ilha da Madeira', 'Portugal', '9100-153', 'Ashlan', 'Sherwin', 'Edgeler', 38);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('254-97-2617', '693-569-6688', 'pblakeman2f@wufoo.com', '1977-07-20 23:31:05', '30289 Mesta Alley', 'Tuchengzi', null, 'China', null, 'Isis', 'Pierre', 'Blakeman', 29);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('847-99-6062', '691-719-6368', 'bbrettor2g@github.com', '1951-11-04 10:19:18', '77 Iowa Parkway', 'Yamoto', null, 'Japan', '981-0503', 'Hobard', 'Brenda', 'Brettor', 49);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name, middle_name, last_name, advisorID) values ('311-88-3938', '233-359-8954', 'lhabbeshaw2h@squarespace.com', '1992-08-31 18:36:59', '9 Algoma Terrace', 'Ngaruawahia', null, 'New Zealand', '3742', 'Violante', 'Leelah', 'Habbeshaw', 25);

-- portfolio sample data generated with Mockaroo
insert into portfolio (name, clientID)
values ('Savings', 1),
       ('John''s College Fund', 2),
       ('Trading Bot', 3),
       ('Meme', 4),
       ('Retirement', 5),
       ('Algorithmic Trading Bot', 6),
       ('Rapid Growth', 7),
       ('Risk Averse', 8),
       ('Asset Pres', 9),
       ('Retirement', 10),
       ('John''s First Portfolio', 1),
       ('Tech', 5),
       ('Healthcare', 5),
       ('Energy', 5);
insert into portfolio (name, clientID) values ('in', 6);
insert into portfolio (name, clientID) values ('nulla facilisi cras non velit', 7);
insert into portfolio (name, clientID) values ('platea', 8);
insert into portfolio (name, clientID) values ('hac habitasse platea dictumst morbi', 9);
insert into portfolio (name, clientID) values ('mauris', 10);
insert into portfolio (name, clientID) values ('dapibus dolor vel est', 11);
insert into portfolio (name, clientID) values ('elementum in hac habitasse', 12);
insert into portfolio (name, clientID) values ('tincidunt lacus at', 13);
insert into portfolio (name, clientID) values ('hendrerit at vulputate vitae', 14);
insert into portfolio (name, clientID) values ('quis turpis', 15);
insert into portfolio (name, clientID) values ('vehicula condimentum curabitur in', 16);
insert into portfolio (name, clientID) values ('odio donec vitae nisi', 17);
insert into portfolio (name, clientID) values ('in', 18);
insert into portfolio (name, clientID) values ('erat vestibulum sed magna at', 19);
insert into portfolio (name, clientID) values ('libero quis', 20);
insert into portfolio (name, clientID) values ('at dolor quis', 21);
insert into portfolio (name, clientID) values ('vel ipsum', 22);
insert into portfolio (name, clientID) values ('ligula', 23);
insert into portfolio (name, clientID) values ('in faucibus', 24);
insert into portfolio (name, clientID) values ('in hac habitasse', 25);
insert into portfolio (name, clientID) values ('dui maecenas tristique est', 26);
insert into portfolio (name, clientID) values ('donec', 27);
insert into portfolio (name, clientID) values ('ultrices aliquet maecenas', 28);
insert into portfolio (name, clientID) values ('dictumst maecenas ut massa quis', 29);
insert into portfolio (name, clientID) values ('ornare consequat lectus in est', 30);
insert into portfolio (name, clientID) values ('odio elementum', 31);
insert into portfolio (name, clientID) values ('nulla ac', 32);
insert into portfolio (name, clientID) values ('ante vestibulum ante', 33);
insert into portfolio (name, clientID) values ('vel lectus in quam fringilla', 34);
insert into portfolio (name, clientID) values ('tristique in', 35);
insert into portfolio (name, clientID) values ('nisi eu orci mauris lacinia', 36);
insert into portfolio (name, clientID) values ('integer aliquet massa id', 37);
insert into portfolio (name, clientID) values ('nascetur', 38);
insert into portfolio (name, clientID) values ('nec sem', 39);
insert into portfolio (name, clientID) values ('nulla sed vel enim sit', 40);
insert into portfolio (name, clientID) values ('hendrerit at', 41);
insert into portfolio (name, clientID) values ('in', 42);
insert into portfolio (name, clientID) values ('accumsan tortor quis turpis', 43);
insert into portfolio (name, clientID) values ('amet eros suspendisse accumsan', 44);
insert into portfolio (name, clientID) values ('semper', 45);
insert into portfolio (name, clientID) values ('id turpis integer aliquet massa', 46);
insert into portfolio (name, clientID) values ('augue vestibulum rutrum', 47);
insert into portfolio (name, clientID) values ('habitasse platea', 48);
insert into portfolio (name, clientID) values ('id', 49);
insert into portfolio (name, clientID) values ('id ornare imperdiet sapien urna', 50);

-- investment_profile sample data generated with Mockaroo
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe,
                                risk_tolerance, portfolioID)
values ('Very Conservative', 'Asset Preservation', 'Less Than One Year', 'Moderate', 1),
       ('Very Conservative', 'Growth', 'More Than 25 Years', 'Extreme', 2),
       ('Somewhat Aggressive', 'Retirement', 'Less Than One Year', 'Extreme', 3),
       ('Somewhat Aggressive', 'Growth', '1-2 Years', 'Extreme', 4),
       ('Moderate', 'Retirement', '15-25 Years', 'Moderate', 5),
       ('Very Aggressive', 'Asset Preservation', '15-25 Years', 'Moderate', 6),
       ('Very Conservative', 'Asset Preservation', '3-5 Years', 'Extreme', 7),
       ('Somewhat Conservative', 'Growth', '1-2 Years', 'Extreme', 8),
       ('Very Conservative', 'Growth', '3-5 Years', 'Moderate', 9),
       ('Moderate', 'Growth', '15-25 Years', 'Averse', 10),
       ('Moderate', 'Growth', '3-5 Years', 'Moderate', 11),
       ('Moderate', 'Growth', '5-10 Years', 'Moderate', 12),
       ('Somewhat Aggressive', 'Growth', '5-10 Years', 'Moderate', 13),
       ('Moderate', 'Growth', '5-10 Years', 'Moderate', 14);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance, portfolioID) values ('Moderate', 'Retirement', '10-15 Years', 'Averse', 15);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance, portfolioID) values ('Very Conservative', 'Retirement', 'Less Than One Year', 'Moderate', 16);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance, portfolioID) values ('Somewhat Aggressive', 'Growth', '1-2 Years', 'Averse', 17);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance, portfolioID) values ('Very Conservative', 'Retirement', 'More Than 25 Years', 'Moderate', 18);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance, portfolioID) values ('Very Aggressive', 'Asset Preservation', '3-5 Years', 'Moderate', 19);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance, portfolioID) values ('Moderate', 'Growth', '1-2 Years', 'Averse', 20);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance, portfolioID) values ('Somewhat Aggressive', 'Growth', 'Less Than One Year', 'Moderate', 21);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance, portfolioID) values ('Somewhat Conservative', 'Asset Preservation', '1-2 Years', 'Extreme', 22);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance, portfolioID) values ('Very Conservative', 'Asset Preservation', '10-15 Years', 'Averse', 23);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance, portfolioID) values ('Somewhat Conservative', 'Asset Preservation', '5-10 Years', 'Moderate', 24);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance, portfolioID) values ('Very Aggressive', 'Growth', '5-10 Years', 'Moderate', 25);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance, portfolioID) values ('Moderate', 'Growth', '1-2 Years', 'Moderate', 26);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance, portfolioID) values ('Somewhat Aggressive', 'Asset Preservation', '3-5 Years', 'Averse', 27);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance, portfolioID) values ('Very Conservative', 'Asset Preservation', '5-10 Years', 'Extreme', 28);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance, portfolioID) values ('Moderate', 'Asset Preservation', 'Less Than One Year', 'Moderate', 29);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance, portfolioID) values ('Somewhat Conservative', 'Retirement', '15-25 Years', 'Extreme', 30);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance, portfolioID) values ('Very Aggressive', 'Asset Preservation', '3-5 Years', 'Averse', 31);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance, portfolioID) values ('Moderate', 'Growth', '1-2 Years', 'Extreme', 32);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance, portfolioID) values ('Somewhat Aggressive', 'Asset Preservation', '15-25 Years', 'Averse', 33);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance, portfolioID) values ('Very Aggressive', 'Growth', 'Less Than One Year', 'Extreme', 34);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance, portfolioID) values ('Somewhat Conservative', 'Retirement', 'More Than 25 Years', 'Extreme', 35);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance, portfolioID) values ('Somewhat Conservative', 'Growth', '1-2 Years', 'Extreme', 36);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance, portfolioID) values ('Very Conservative', 'Asset Preservation', '15-25 Years', 'Averse', 37);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance, portfolioID) values ('Moderate', 'Asset Preservation', '10-15 Years', 'Moderate', 38);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance, portfolioID) values ('Somewhat Conservative', 'Growth', 'More Than 25 Years', 'Extreme', 39);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance, portfolioID) values ('Moderate', 'Retirement', 'Less Than One Year', 'Moderate', 40);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance, portfolioID) values ('Moderate', 'Retirement', 'Less Than One Year', 'Averse', 41);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance, portfolioID) values ('Somewhat Aggressive', 'Growth', '15-25 Years', 'Extreme', 42);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance, portfolioID) values ('Moderate', 'Growth', '1-2 Years', 'Extreme', 43);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance, portfolioID) values ('Very Conservative', 'Asset Preservation', '1-2 Years', 'Moderate', 44);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance, portfolioID) values ('Very Conservative', 'Retirement', '15-25 Years', 'Moderate', 45);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance, portfolioID) values ('Very Conservative', 'Growth', '3-5 Years', 'Moderate', 46);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance, portfolioID) values ('Very Conservative', 'Asset Preservation', '15-25 Years', 'Extreme', 47);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance, portfolioID) values ('Very Conservative', 'Asset Preservation', '1-2 Years', 'Averse', 48);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance, portfolioID) values ('Very Aggressive', 'Retirement', '5-10 Years', 'Extreme', 49);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance, portfolioID) values ('Somewhat Aggressive', 'Growth', '1-2 Years', 'Moderate', 50);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance, portfolioID) values ('Somewhat Conservative', 'Retirement', '1-2 Years', 'Extreme', 51);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance, portfolioID) values ('Somewhat Aggressive', 'Growth', '15-25 Years', 'Moderate', 52);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance, portfolioID) values ('Very Aggressive', 'Asset Preservation', 'Less Than One Year', 'Averse', 53);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance, portfolioID) values ('Somewhat Conservative', 'Asset Preservation', '15-25 Years', 'Averse', 54);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance, portfolioID) values ('Somewhat Conservative', 'Retirement', '1-2 Years', 'Moderate', 55);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance, portfolioID) values ('Very Conservative', 'Growth', '5-10 Years', 'Extreme', 56);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance, portfolioID) values ('Somewhat Aggressive', 'Asset Preservation', '10-15 Years', 'Moderate', 57);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance, portfolioID) values ('Somewhat Conservative', 'Growth', '1-2 Years', 'Averse', 58);

-- stock sample data generaed with Mockaroo
insert into stock (ticker, date_bought, quantity, portfolioID)
values ('MAA^I', '2022-08-01 05:22:09', 1018.219, 1),
       ('SB^C', '2002-02-08 03:09:52', 40.89, 2),
       ('DWAQ', '2022-06-07 21:33:38', 5258.28, 3),
       ('DMB', '2020-07-14 21:36:55', 35.067, 4),
       ('CHRW', '2008-06-13 12:16:36', 2105.522, 5),
       ('TLI', '2013-03-02 18:55:26', 896.582, 6),
       ('ALLY^A', '2018-12-24 02:03:27', 16.659, 7),
       ('PEY', '2021-09-27 06:39:14', 9402.516, 8),
       ('DSU', '2022-06-06 03:05:00', 3.328, 9),
       ('QINC', '2022-06-06 20:57:56', 77.902, 10),
       ('QINC', '2022-06-06 20:57:56', 97.892, 11),
       ('TSLA', '2020-06-06 20:57:56', 7.12, 12),
       ('PFE', '2020-06-06 20:57:56', 175.625, 13),
       ('DVN', '2020-06-06 20:57:56', 1000.0, 14);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-09-04 11:05:00', 69.383, 5);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-07-29 03:32:06', 20.709, 49);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2021-12-13 21:40:14', 42.003, 59);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-06-05 21:25:08', 90.864, 59);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-10-28 20:31:20', 3.869, 4);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-03-21 08:43:27', 28.712, 8);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-07-08 03:57:45', 53.999, 43);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-10-05 11:53:06', 56.976, 15);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-05-09 02:07:37', 25.443, 52);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-01-02 06:51:21', 39.158, 48);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-03-12 02:18:30', 4.844, 7);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2021-12-04 18:29:57', 75.857, 41);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-07-10 04:44:28', 34.684, 58);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-07-22 06:26:15', 74.819, 15);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-10-03 06:33:29', 78.567, 5);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-07-18 16:23:30', 58.564, 28);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-07-03 11:45:39', 52.006, 34);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-05-11 04:59:34', 84.844, 34);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-05-20 23:21:07', 17.519, 43);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-08-24 06:13:43', 31.181, 24);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-10-21 14:42:16', 65.162, 28);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-10-01 14:27:06', 27.013, 52);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-08-12 08:01:48', 28.115, 18);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2021-12-23 07:59:29', 69.059, 15);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-06-08 21:25:42', 14.066, 11);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-05-30 01:45:46', 92.952, 3);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-01-31 22:23:15', 66.684, 7);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-03-05 21:24:28', 88.892, 24);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-08-04 00:54:17', 91.814, 30);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-03-10 00:52:20', 14.397, 44);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-11-11 19:52:17', 77.956, 9);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-05-05 18:16:54', 11.962, 36);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-02-23 10:00:55', 68.832, 7);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-10-20 12:26:12', 83.053, 36);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-02-19 16:21:56', 38.305, 9);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-07-10 03:33:39', 20.389, 35);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-02-26 16:12:43', 56.756, 35);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-01-25 04:03:38', 84.468, 54);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-07-24 12:06:16', 45.859, 43);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-03-16 17:31:00', 52.253, 17);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-10-11 18:15:05', 93.083, 13);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-07-12 11:13:06', 33.053, 54);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-03-25 14:14:10', 5.9, 20);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-10-07 22:11:59', 97.433, 40);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2021-12-23 01:45:22', 57.838, 13);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-07-23 19:59:20', 88.502, 10);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-03-22 01:36:33', 98.123, 9);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-06-22 03:02:23', 27.312, 10);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-07-08 05:47:15', 88.311, 25);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-03-05 04:31:39', 43.528, 46);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-10-14 03:14:05', 39.121, 47);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-02-19 17:16:22', 14.926, 14);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2021-12-15 21:21:08', 82.584, 57);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-11-17 12:55:08', 43.179, 20);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-10-30 14:29:46', 86.115, 27);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-09-29 01:32:37', 43.856, 45);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-06-07 22:47:50', 85.182, 41);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-01-16 02:55:19', 66.248, 45);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-02-11 17:41:27', 92.098, 25);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-10-11 09:21:11', 55.117, 23);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-08-31 13:25:53', 63.896, 32);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-05-25 23:12:35', 44.508, 46);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-06-21 05:08:42', 33.229, 6);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2021-12-16 18:53:03', 71.344, 19);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-06-21 08:29:40', 99.29, 48);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2021-12-31 00:10:19', 86.044, 22);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-02-20 21:19:08', 88.641, 5);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-11-22 09:07:23', 75.529, 12);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-03-17 19:36:54', 66.572, 20);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-11-03 22:57:22', 69.822, 2);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-09-30 05:44:35', 96.809, 59);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-08-22 05:36:47', 42.477, 2);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-01-28 16:42:49', 4.75, 6);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-05-03 03:08:22', 54.627, 6);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-10-05 19:00:58', 95.837, 16);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-02-07 20:03:45', 55.395, 8);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-03-04 14:08:50', 57.648, 10);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-02-17 10:16:48', 27.609, 14);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-09-14 11:21:45', 0.532, 10);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2021-12-25 18:12:41', 11.705, 40);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-07-28 21:12:46', 58.182, 47);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-09-09 05:11:08', 17.814, 30);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-10-06 00:12:51', 99.966, 7);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-08-19 11:41:50', 1.421, 45);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-04-13 19:12:52', 1.905, 50);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-03-25 15:54:54', 38.402, 8);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-02-13 16:36:15', 31.547, 40);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-10-05 02:25:58', 47.215, 24);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-08-04 02:19:45', 30.952, 50);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-11-04 14:55:09', 89.543, 30);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2021-12-16 01:02:33', 25.905, 35);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2021-12-12 06:24:51', 98.091, 1);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-03-09 05:23:16', 52.611, 39);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2021-12-23 13:34:24', 24.077, 50);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-04-26 19:19:05', 33.709, 13);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-04-07 21:30:56', 52.97, 44);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-06-11 03:40:41', 92.689, 49);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-11-09 19:02:27', 34.878, 2);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-02-03 13:07:59', 91.669, 58);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-02-15 08:17:49', 4.542, 26);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-09-09 14:43:46', 3.651, 25);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-07-08 05:43:46', 69.786, 16);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-09-13 23:51:10', 20.416, 7);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-04-26 17:44:24', 85.164, 7);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-06-23 20:49:51', 66.359, 31);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-02-09 14:17:08', 2.031, 7);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-09-30 14:49:54', 38.554, 38);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-06-17 22:09:15', 5.636, 45);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-08-05 16:54:05', 24.519, 39);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-07-06 17:52:45', 40.461, 30);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-03-28 00:00:23', 6.023, 12);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-05-10 05:30:22', 14.509, 56);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-09-05 18:16:52', 89.734, 49);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-07-18 10:10:52', 91.067, 2);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-02-18 20:48:35', 42.575, 27);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-01-13 01:43:17', 61.149, 8);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-10-22 03:16:19', 48.881, 12);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-04-20 12:30:17', 46.689, 6);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-03-17 18:11:12', 50.31, 26);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-05-13 04:38:37', 81.764, 25);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-05-14 03:33:26', 25.041, 26);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-01-23 07:59:13', 25.829, 43);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-11-07 10:52:45', 14.863, 41);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-05-27 07:33:10', 53.843, 46);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-06-09 18:41:05', 8.301, 1);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-03-15 06:38:23', 17.106, 51);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-02-09 03:00:55', 42.417, 6);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2021-12-27 09:18:05', 86.618, 59);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-04-11 02:51:06', 49.414, 46);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-05-20 00:49:16', 17.105, 23);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-09-03 00:27:14', 17.061, 53);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2021-12-02 16:38:14', 92.723, 55);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-10-14 11:35:18', 56.859, 4);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-09-20 16:45:06', 62.526, 31);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-01-26 15:36:39', 28.178, 59);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2021-12-24 11:15:07', 26.41, 57);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-09-26 17:41:03', 20.867, 55);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-06-05 03:21:01', 93.314, 52);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-11-24 12:01:00', 27.214, 36);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-04-18 07:41:42', 51.279, 35);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-10-13 09:02:23', 3.733, 40);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-05-26 19:57:48', 16.258, 34);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-02-04 11:48:38', 95.79, 13);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-09-13 03:13:43', 34.857, 1);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-05-06 17:13:53', 90.462, 42);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-11-22 20:10:00', 55.502, 10);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-03-26 00:22:34', 96.876, 14);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-09-21 11:51:29', 41.122, 13);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-03-30 04:43:50', 74.55, 26);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-04-28 18:28:19', 30.258, 28);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2021-12-01 01:55:41', 9.995, 14);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-01-05 08:44:06', 98.472, 56);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-09-22 03:52:50', 17.846, 56);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2021-12-08 04:39:49', 34.13, 39);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-01-07 12:18:15', 34.681, 34);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-06-25 05:15:41', 46.395, 56);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-02-17 13:53:49', 88.562, 18);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-05-06 23:52:18', 14.198, 39);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-06-22 14:15:01', 4.306, 47);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-03-11 02:20:07', 62.602, 18);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2021-12-20 18:52:53', 68.926, 25);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-01-01 03:24:25', 24.126, 36);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-07-15 20:11:38', 31.187, 46);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-02-21 18:35:17', 50.302, 30);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-05-13 04:27:27', 84.506, 13);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-07-26 09:23:32', 56.379, 46);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-03-27 06:02:58', 43.735, 26);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-10-15 11:59:08', 67.31, 42);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-08-11 15:51:03', 24.489, 43);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-11-15 02:05:33', 36.037, 8);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-01-13 08:34:17', 16.508, 36);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-10-21 00:57:26', 11.063, 33);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-10-25 07:27:31', 58.638, 33);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-08-02 18:22:02', 72.014, 37);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-09-17 11:25:46', 98.007, 40);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-06-04 06:50:29', 17.49, 10);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-10-13 03:33:17', 0.441, 20);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-10-16 00:03:39', 6.136, 3);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-09-25 02:54:45', 60.426, 59);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-06-04 04:52:18', 83.37, 32);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-04-20 03:54:00', 94.406, 35);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-05-10 01:25:49', 26.23, 31);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-09-05 22:05:06', 1.112, 33);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-04-05 07:18:48', 95.992, 31);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-06-23 12:10:35', 30.386, 55);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-11-04 00:17:33', 96.393, 38);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-03-10 12:43:49', 7.682, 2);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-09-26 02:53:35', 51.352, 29);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-11-30 23:05:04', 1.693, 49);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2021-12-19 03:23:11', 57.828, 20);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-07-18 22:23:26', 35.529, 7);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-04-12 02:25:45', 98.221, 15);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-03-08 15:02:47', 5.433, 40);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-08-29 11:03:45', 61.086, 40);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-09-21 14:03:03', 50.708, 50);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-01-18 18:28:54', 44.576, 19);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-05-19 08:51:57', 49.967, 56);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-10-27 03:55:35', 61.894, 22);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-02-08 18:23:06', 62.671, 28);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-09-06 13:12:14', 88.7, 6);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-08-06 18:13:25', 53.925, 7);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-07-19 10:03:42', 14.052, 21);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-05-19 21:57:09', 77.563, 13);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-11-22 15:01:55', 92.492, 33);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-01-05 01:56:52', 65.01, 7);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2021-12-14 16:59:01', 79.915, 49);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-11-15 10:11:07', 24.455, 32);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-03-15 03:11:26', 48.641, 51);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-07-15 11:08:18', 79.98, 35);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-09-02 08:10:00', 85.703, 10);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-01-25 06:07:37', 32.7, 9);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-04-03 04:41:55', 56.457, 57);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-04-24 04:32:43', 96.058, 53);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-10-03 03:19:41', 37.886, 12);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-05-21 00:22:10', 57.365, 39);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-01-17 18:08:53', 64.67, 40);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-09-21 22:50:17', 42.615, 51);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-02-28 16:21:37', 37.769, 50);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-01-23 08:57:26', 19.709, 48);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-06-05 09:56:18', 58.278, 57);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-11-20 08:00:39', 95.092, 6);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-10-09 01:19:52', 6.05, 8);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-08-25 22:39:10', 0.604, 27);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2021-12-10 16:47:56', 53.079, 15);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-03-08 21:33:18', 56.544, 54);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2021-12-03 19:44:03', 39.261, 47);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-03-03 00:41:06', 92.383, 28);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-11-18 16:32:19', 62.506, 50);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2021-12-31 07:55:08', 74.007, 14);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-09-18 00:23:14', 72.933, 43);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-02-11 16:18:33', 90.995, 14);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-09-01 14:08:42', 44.717, 29);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-04-08 00:35:48', 24.051, 33);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-08-10 18:54:29', 87.987, 10);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2021-12-08 11:28:04', 19.79, 55);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-11-27 11:25:25', 19.303, 50);