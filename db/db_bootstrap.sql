CREATE DATABASE vesti_db;
GRANT ALL PRIVILEGES ON vesti_db.* TO 'webapp'@'%';
FLUSH PRIVILEGES;

USE vesti_db;

CREATE TABLE administrator
(
    adminID      INT AUTO_INCREMENT NOT NULL,
    phone_number VARCHAR(15)        NOT NULL,
    email        VARCHAR(50)        NOT NULL,
    first_name   VARCHAR(50)        NOT NULL,
    middle_name  VARCHAR(50)        NOT NULL,
    last_name    VARCHAR(50)        NOT NULL,
    PRIMARY KEY (adminID)
);

CREATE TABLE advisor
(
    advisorID    INT AUTO_INCREMENT NOT NULL,
    phone_number VARCHAR(15)        NOT NULL,
    email        VARCHAR(50)        NOT NULL,
    first_name   VARCHAR(50)        NOT NULL,
    middle_name  VARCHAR(50)        NOT NULL,
    last_name    VARCHAR(50)        NOT NULL,
    PRIMARY KEY (advisorID)
);

CREATE TABLE admin_advisor
(
    advisorID INT NOT NULL,
    adminID   INT NOT NULL,
    FOREIGN KEY (advisorID) REFERENCES advisor (advisorID),
    FOREIGN KEY (adminID) REFERENCES administrator (adminID),
    UNIQUE (advisorID, adminID)
);

CREATE TABLE client
(
    clientID       INT AUTO_INCREMENT NOT NULL,
    ssn            VARCHAR(11)        NOT NULL,
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
    advisorID      INT                NOT NULL,
    PRIMARY KEY (clientID),
    FOREIGN KEY (advisorID) references advisor (advisorID)
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
    risk_tolerance       ENUM ('Averse', 'Moderate', 'Extreme')                                                                                 NOT NULL,
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

-- administrator sample data generated with Mockaroo
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('667-070-7361', 'eflahive0@gmpg.org', 'Saleem', 'Estel', 'Flahive'),
       ('785-217-3445', 'cnewing1@chronoengine.com', 'Mirelle', 'Christophe', 'Newing'),
       ('320-405-0506', 'jmalim2@instagram.com', 'Bret', 'Jana', 'Malim');

-- advisor sample data generated with Mockaroo
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('965-539-4107', 'wrafter0@zimbio.com', 'Kingsly', 'Waldon', 'Rafter'),
       ('041-076-1509', 'cshimony1@theguardian.com', 'Stephana', 'Clementia', 'Shimony'),
       ('544-341-8309', 'ddyers2@tumblr.com', 'Lyndell', 'Dallas', 'Dyers'),
       ('763-216-2655', 'rcleland3@discuz.net', 'Dannie', 'Rufe', 'Cleland'),
       ('648-381-1188', 'agowry4@w3.org', 'Karim', 'Audry', 'Gowry');

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
       (5, 1);

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

-- portfolio sample data generated with Mockaroo
insert into portfolio (value, name, clientID)
values (0, 'Savings', 1),
       (0, 'John''s College Fund', 2),
       (0, 'Trading Bot', 3),
       (0, 'Meme', 4),
       (0, 'Retirement', 5),
       (0, 'Algorithmic Trading Bot', 6),
       (0, 'Rapid Growth', 7),
       (0, 'Risk Averse', 8),
       (0, 'Asset Pres', 9),
       (0, 'Retirement', 10),
       (0, 'John''s First Portfolio', 1),
       (0, 'Tech', 5),
       (0, 'Healthcare', 5),
       (0, 'Energy', 5);


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
       ('DVN', '2020-06-06 20:57:56', 1000.0, 14)