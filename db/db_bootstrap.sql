CREATE DATABASE vesti_db;
CREATE USER 'webapp'@'%';
GRANT ALL PRIVILEGES ON vesti_db.* TO 'webapp'@'%';
FLUSH PRIVILEGES;

USE vesti_db;

CREATE TABLE client
(
    clientID       INT AUTO_INCREMENT NOT NULL,
    ssn            VARCHAR(9)         NOT NULL,
    phone_number   VARCHAR(15)        NOT NULL,
    email          VARCHAR(50)        NOT NULL,
    birthdate      DATE               NOT NULL,
    street_address VARCHAR(50)        NOT NULL,
    city           VARCHAR(50)        NOT NULL,
    state          VARCHAR(50),
    country        VARCHAR(50)        NOT NULL,
    postal_code    VARCHAR(50),
    first_name     VARCHAR(50)        NOT NULL,
    middle_name    VARCHAR(50)        NOT NULL,
    last_name      VARCHAR(50)        NOT NULL,
    PRIMARY KEY (clientID)
);



CREATE TABLE portfolio
(
    portfolioID INT AUTO_INCREMENT NOT NULL,
    value       DECIMAL(13, 4)     NOT NULL,
    name        VARCHAR(50)        NOT NULL,
    clientID    INT                NOT NULL,
    PRIMARY KEY (portfolioID),
    FOREIGN KEY (clientID) references client (clientID)
);

CREATE TABLE investment_profile
(
    investment_profileID INT AUTO_INCREMENT                                                                                                     NOT NULL,
    investment_attitude  ENUM ('Very Conservative', 'Somewhat Conservative', 'Moderate', 'Somewhat Aggressive', 'Very Aggressive')              NOT NULL,
    investment_purpose   ENUM ('Growth', 'Retirement', 'Asset Preservation')                                                                    NOT NULL,
    investment_timeframe ENUM ('Less Than One Year', '1-2 Years', '3-5 Years', '5-10 Years', '10-15 Years', '15-25 Years','More Than 25 Years') NOT NULL,
    risk_tolerance       ENUM ('Averese', 'Moderate', 'Extreme')                                                                                NOT NULL,
    portfolioID          INT                                                                                                                    NOT NULL,
    PRIMARY KEY (investment_profileID),
    FOREIGN KEY (portfolioID) references portfolio (portfolioID)
);

CREATE TABLE stock
(
    ticker      VARCHAR(10)    NOT NULL,
    date_bought DATETIME       NOT NULL,
    quantity    DECIMAL(13, 3) NOT NULL,
    portfolioID INT            NOT NULL,
    PRIMARY KEY (ticker, date_bought, quantity),
    FOREIGN KEY (portfolioID) references portfolio (portfolioID)
);


CREATE TABLE advisor
(
    advisorID    INT AUTO_INCREMENT NOT NULL,
    phone_number VARCHAR(15)        NOT NULL,
    email        VARCHAR(50)        NOT NULL,
    first_name   VARCHAR(50)        NOT NULL,
    middle_name  VARCHAR(50)        NOT NULL,
    last_name    VARCHAR(50)        NOT NULL,
    clientID     INT                NOT NULL,
    PRIMARY KEY (advisorID),
    FOREIGN KEY (clientID) references client (clientID)
);

CREATE TABLE administrator
(
    adminID      INT AUTO_INCREMENT NOT NULL,
    phone_number VARCHAR(15)        NOT NULL,
    email        VARCHAR(50)        NOT NULL,
    first_name   VARCHAR(50)        NOT NULL,
    middle_name  VARCHAR(50)        NOT NULL,
    last_name    VARCHAR(50)        NOT NULL,
    advisorID    INT                NOT NULL,
    PRIMARY KEY (adminID),
    FOREIGN KEY (advisorID) references advisor (advisorID)
);

-- client sample data generated with Mockaroo
insert into client (clientID, ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code,
                    first_name, middle_name, last_name)
values (1, '790--87-8203', '418-715-3228', 'lcattermull0@berkeley.edu', '10/3/1964', '0307 Donald Parkway', 'Yelwa',
        null, 'Nigeria', null, 'Orlando', 'Lelia', 'Cattermull');
insert into client (clientID, ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code,
                    first_name, middle_name, last_name)
values (2, '086--32-9594', '922-044-3554', 'joldred1@ning.com', '8/13/1950', '4869 Tennyson Center', 'Paris 11',
        'Île-de-France', 'France', '75542 CEDEX 11', 'Hermione', 'Johanna', 'Oldred');
insert into client (clientID, ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code,
                    first_name, middle_name, last_name)
values (3, '174--97-0987', '263-864-9628', 'efairy2@smugmug.com', '4/14/1950', '185 Steensland Junction', 'Bang Saphan',
        null, 'Thailand', '77140', 'Arin', 'Essa', 'Fairy');
insert into client (clientID, ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code,
                    first_name, middle_name, last_name)
values (4, '186--96-6884', '281-242-3406', 'jnorthwood3@princeton.edu', '5/6/1986', '2739 Kipling Pass', 'Olympia',
        'Washington', 'United States', '98516', 'Elyn', 'John', 'Northwood');
insert into client (clientID, ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code,
                    first_name, middle_name, last_name)
values (5, '390--14-0999', '170-527-0484', 'bstonall4@tinypic.com', '5/8/1978', '4 Nova Lane', 'Kademangan', null,
        'Indonesia', null, 'Agata', 'Betsey', 'Stonall');
insert into client (clientID, ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code,
                    first_name, middle_name, last_name)
values (6, '765--26-7913', '333-742-4651', 'ymcveigh5@blinklist.com', '6/25/1980', '872 Elgar Circle', 'Mubi', null,
        'Nigeria', null, 'Dennie', 'Yolande', 'McVeigh');
insert into client (clientID, ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code,
                    first_name, middle_name, last_name)
values (7, '840--72-6576', '317-013-3501', 'ulondesborough6@ow.ly', '5/16/1983', '20189 Ridgeway Park', 'Xinpeicun',
        null, 'China', null, 'Lyndel', 'Ulises', 'Londesborough');
insert into client (clientID, ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code,
                    first_name, middle_name, last_name)
values (8, '269--27-6299', '604-877-6556', 'bkain7@issuu.com', '5/13/1968', '898 John Wall Street', 'Nagiba', null,
        'Philippines', '5501', 'Happy', 'Brit', 'Kain');
insert into client (clientID, ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code,
                    first_name, middle_name, last_name)
values (9, '640--45-6073', '216-620-8797', 'fsilber8@time.com', '3/17/1987', '2323 Superior Pass', 'Mubi', null,
        'Nigeria', null, 'Douglass', 'Freeman', 'Silber');
insert into client (clientID, ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code,
                    first_name, middle_name, last_name)
values (10, '672--00-5561', '516-319-8776', 'ghowison9@umich.edu', '5/14/1966', '761 Bartillon Avenue', 'Kamuli', null,
        'Uganda', null, 'Donaugh', 'Gunther', 'Howison');

-- portfolio sample data generated with Mockaroo
insert into portfolio (portfolioID, value, name, clientID)
values (1, 398327799.4082, 'vulputate luctus cum', 1);
insert into portfolio (portfolioID, value, name, clientID)
values (2, 183013941.8683, 'primis in faucibus orci luctus et ultrices posuere cubilia curae', 2);
insert into portfolio (portfolioID, value, name, clientID)
values (3, 608709058.4136, 'turpis a pede posuere nonummy integer non velit donec diam', 3);
insert into portfolio (portfolioID, value, name, clientID)
values (4, 222315406.6487, 'integer non velit donec diam', 4);
insert into portfolio (portfolioID, value, name, clientID)
values (5, 898079309.8176, 'ultrices libero non mattis pulvinar', 5);
insert into portfolio (portfolioID, value, name, clientID)
values (6, 461554233.389, 'in', 6);
insert into portfolio (portfolioID, value, name, clientID)
values (7, 245048286.9651, 'aliquam quis turpis eget elit sodales scelerisque mauris', 7);
insert into portfolio (portfolioID, value, name, clientID)
values (8, 79599465.2704, 'quisque', 8);
insert into portfolio (portfolioID, value, name, clientID)
values (9, 639541884.0557, 'dictumst morbi vestibulum velit', 9);
insert into portfolio (portfolioID, value, name, clientID)
values (10, 234507376.6997, 'neque sapien placerat ante nulla', 10);

-- investment_profile sample data generated with Mockaroo
insert into investment_profile (investment_profileID, investment_attitude, investment_purpose, investment_timeframe,
                                risk_tolerance, portfolioID)
values (1, 'Very Conservative', 'Asset Preservation', 'Less Than One Year', 'Moderate', 1);
insert into investment_profile (investment_profileID, investment_attitude, investment_purpose, investment_timeframe,
                                risk_tolerance, portfolioID)
values (2, 'Very Conservative', 'Growth', 'More Than 25 Years', 'Extreme', 2);
insert into investment_profile (investment_profileID, investment_attitude, investment_purpose, investment_timeframe,
                                risk_tolerance, portfolioID)
values (3, 'Somewhat Aggressive', 'Retirement', 'Less Than One Year', 'Extreme', 3);
insert into investment_profile (investment_profileID, investment_attitude, investment_purpose, investment_timeframe,
                                risk_tolerance, portfolioID)
values (4, 'Somewhat Aggressive', 'Growth', '1-2 Years', 'Extreme', 4);
insert into investment_profile (investment_profileID, investment_attitude, investment_purpose, investment_timeframe,
                                risk_tolerance, portfolioID)
values (5, 'Very Aggressive', 'Growth', '1-2 Years', 'Extreme', 5);
insert into investment_profile (investment_profileID, investment_attitude, investment_purpose, investment_timeframe,
                                risk_tolerance, portfolioID)
values (6, 'Very Aggressive', 'Asset Preservation', '15-25 Years', 'Moderate', 6);
insert into investment_profile (investment_profileID, investment_attitude, investment_purpose, investment_timeframe,
                                risk_tolerance, portfolioID)
values (7, 'Very Conservative', 'Asset Preservation', '3-5 Years', 'Extreme', 7);
insert into investment_profile (investment_profileID, investment_attitude, investment_purpose, investment_timeframe,
                                risk_tolerance, portfolioID)
values (8, 'Somewhat Conservative', 'Growth', '1-2 Years', 'Extreme', 8);
insert into investment_profile (investment_profileID, investment_attitude, investment_purpose, investment_timeframe,
                                risk_tolerance, portfolioID)
values (9, 'Very Conservative', 'Growth', '3-5 Years', 'Moderate', 9);
insert into investment_profile (investment_profileID, investment_attitude, investment_purpose, investment_timeframe,
                                risk_tolerance, portfolioID)
values (10, 'Moderate', 'Retirement', '15-25 Years', 'Averese', 10);

-- stock sample data generated with Mockaroo
insert into stock (ticker, date_bought, quantity, portfolioID)
values ('MAA^I', '2007-08-01 05:22:09', 414788924.292, 1);
insert into stock (ticker, date_bought, quantity, portfolioID)
values ('SB^C', '2022-02-08 03:09:52', 72872220.712, 2);
insert into stock (ticker, date_bought, quantity, portfolioID)
values ('DWAQ', '2020-06-07 21:33:38', 525809318.28, 3);
insert into stock (ticker, date_bought, quantity, portfolioID)
values ('DMB', '2016-07-14 21:36:55', 3502448.067, 4);
insert into stock (ticker, date_bought, quantity, portfolioID)
values ('CHRW', '2001-06-13 12:16:36', 97862105.522, 5);
insert into stock (ticker, date_bought, quantity, portfolioID)
values ('TLI', '2016-03-02 18:55:26', 587199896.582, 6);
insert into stock (ticker, date_bought, quantity, portfolioID)
values ('ALLY^A', '2010-12-24 02:03:27', 166252659.659, 7);
insert into stock (ticker, date_bought, quantity, portfolioID)
values ('PEY', '2014-09-27 06:39:14', 940229916.516, 8);
insert into stock (ticker, date_bought, quantity, portfolioID)
values ('DSU', '2006-06-06 03:05:00', 226722663.328, 9);
insert into stock (ticker, date_bought, quantity, portfolioID)
values ('QINC', '2007-06-06 20:57:56', 154038977.902, 10);

-- advisor sample data generated with Mockaroo
insert into advisor (advisorID, phone_number, email, first_name, middle_name, last_name, clientID)
values (1, '965-539-4107', 'wrafter0@zimbio.com', 'Kingsly', 'Waldon', 'Rafter', 1);
insert into advisor (advisorID, phone_number, email, first_name, middle_name, last_name, clientID)
values (2, '041-076-1509', 'cshimony1@theguardian.com', 'Stephana', 'Clementia', 'Shimony', 2);
insert into advisor (advisorID, phone_number, email, first_name, middle_name, last_name, clientID)
values (3, '544-341-8309', 'ddyers2@tumblr.com', 'Lyndell', 'Dallas', 'Dyers', 3);
insert into advisor (advisorID, phone_number, email, first_name, middle_name, last_name, clientID)
values (4, '763-216-2655', 'rcleland3@discuz.net', 'Dannie', 'Rufe', 'Cleland', 4);
insert into advisor (advisorID, phone_number, email, first_name, middle_name, last_name, clientID)
values (5, '648-381-1188', 'agowry4@w3.org', 'Karim', 'Audry', 'Gowry', 5);
insert into advisor (advisorID, phone_number, email, first_name, middle_name, last_name, clientID)
values (6, '577-131-7742', 'hspender5@list-manage.com', 'Mirna', 'Haily', 'Spender', 6);
insert into advisor (advisorID, phone_number, email, first_name, middle_name, last_name, clientID)
values (7, '394-495-5035', 'jhutchin6@army.mil', 'Gar', 'Jon', 'Hutchin', 7);
insert into advisor (advisorID, phone_number, email, first_name, middle_name, last_name, clientID)
values (8, '892-709-6296', 'eparkhouse7@skype.com', 'Aline', 'Elia', 'Parkhouse', 8);
insert into advisor (advisorID, phone_number, email, first_name, middle_name, last_name, clientID)
values (9, '677-649-2177', 'drichardes8@bloomberg.com', 'Lowrance', 'Dorree', 'Richardes', 9);
insert into advisor (advisorID, phone_number, email, first_name, middle_name, last_name, clientID)
values (10, '032-232-2839', 'ehawkeswood9@dyndns.org', 'Eddie', 'Ewell', 'Hawkeswood', 10);

-- administrator sample data generated with Mockaroo
insert into administrator (adminID, phone_number, email, first_name, middle_name, last_name, advisorID)
values (1, '667-070-7361', 'eflahive0@gmpg.org', 'Saleem', 'Estel', 'Flahive', 1);
insert into administrator (adminID, phone_number, email, first_name, middle_name, last_name, advisorID)
values (2, '785-217-3445', 'cnewing1@chronoengine.com', 'Mirelle', 'Christophe', 'Newing', 2);
insert into administrator (adminID, phone_number, email, first_name, middle_name, last_name, advisorID)
values (3, '320-405-0506', 'jmalim2@instagram.com', 'Bret', 'Jana', 'Malim', 3);
insert into administrator (adminID, phone_number, email, first_name, middle_name, last_name, advisorID)
values (4, '536-486-1838', 'kincogna3@blogspot.com', 'Mac', 'Kassia', 'Incogna', 4);
insert into administrator (adminID, phone_number, email, first_name, middle_name, last_name, advisorID)
values (5, '034-820-6412', 'lbakewell4@sourceforge.net', 'Jordanna', 'Langsdon', 'Bakewell', 5);
insert into administrator (adminID, phone_number, email, first_name, middle_name, last_name, advisorID)
values (6, '981-000-5332', 'jrattry5@last.fm', 'Cairistiona', 'Janot', 'Rattry', 6);
insert into administrator (adminID, phone_number, email, first_name, middle_name, last_name, advisorID)
values (7, '539-615-5721', 'mmurfett6@reddit.com', 'Jacqueline', 'Malinda', 'Murfett', 7);
insert into administrator (adminID, phone_number, email, first_name, middle_name, last_name, advisorID)
values (8, '581-566-1914', 'icowing7@surveymonkey.com', 'Fabien', 'Isis', 'Cowing', 8);
insert into administrator (adminID, phone_number, email, first_name, middle_name, last_name, advisorID)
values (9, '764-532-6920', 'ashoppee8@geocities.jp', 'Marrissa', 'Adriano', 'Shoppee', 9);
insert into administrator (adminID, phone_number, email, first_name, middle_name, last_name, advisorID)
values (10, '139-681-8510', 'jbonhan9@msu.edu', 'Lanni', 'Jaymee', 'Bonhan', 10);