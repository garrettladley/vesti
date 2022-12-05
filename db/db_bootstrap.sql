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
    FOREIGN KEY (adminID) REFERENCES administrator (adminID)
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
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('870-619-5982', 'bfrank7@disqus.com', 'Ronni', 'Brennan', 'Frank');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('987-696-5803', 'cyeates8@webmd.com', 'Midge', 'Curcio', 'Yeates');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('857-707-5895', 'lgadaud9@auda.org.au', 'Angela', 'Liane', 'Gadaud');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('610-592-4739', 'jspellara@amazon.co.uk', 'Sandor', 'Juliana', 'Spellar');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('066-402-4750', 'achableb@is.gd', 'Heinrik', 'Anthony', 'Chable');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('727-191-2891', 'gnicollsc@wired.com', 'Wylma', 'Gabriello', 'Nicolls');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('750-328-5870', 'kgrowyd@google.com.au', 'Hilde', 'Kathy', 'Growy');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('581-602-1321', 'kkobierieckie@people.com.cn', 'Elijah', 'Kial', 'Kobieriecki');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('822-425-5235', 'fdanslowf@statcounter.com', 'Juliane', 'Ferris', 'Danslow');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('140-161-2505', 'lcellerg@about.com', 'Belva', 'Lorraine', 'Celler');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('549-833-4965', 'alidsterh@seesaa.net', 'Meade', 'Allys', 'Lidster');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('910-014-4497', 'wspiveyi@soup.io', 'Karrah', 'Witty', 'Spivey');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('240-925-5968', 'nkleingrubj@aboutads.info', 'Micky', 'Nert', 'Kleingrub');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('275-578-9040', 'sbretellek@disqus.com', 'Tammie', 'Sigfried', 'Bretelle');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('150-804-8659', 'fhayhowl@squarespace.com', 'Emmye', 'Franciska', 'Hayhow');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('028-713-5181', 'bchapellem@list-manage.com', 'Kennan', 'Basil', 'Chapelle');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('091-600-8453', 'nhannigann@cisco.com', 'Blondy', 'Ned', 'Hannigan');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('062-741-0647', 'tdoncomo@sakura.ne.jp', 'Alejoa', 'Theodor', 'Doncom');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('215-450-1237', 'ewaplep@squarespace.com', 'Shae', 'Elmira', 'Waple');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('090-866-1896', 'averteyq@yelp.com', 'Arni', 'Ami', 'Vertey');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('571-257-2506', 'fkemwallr@ustream.tv', 'Natasha', 'Fonsie', 'Kemwall');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('137-814-6756', 'charnesss@bluehost.com', 'Adora', 'Clyve', 'Harness');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('289-733-9019', 'kkarslaket@wikispaces.com', 'Shirlee', 'Kirsteni', 'Karslake');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('852-072-2589', 'vmalimu@discovery.com', 'Berry', 'Vania', 'Malim');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('972-398-5031', 'wgoodersonv@mediafire.com', 'Farrell', 'Wildon', 'Gooderson');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('182-549-9439', 'agennrichw@cbslocal.com', 'Connie', 'Amelia', 'Gennrich');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('651-294-6768', 'gshinfieldx@comcast.net', 'Rouvin', 'Grete', 'Shinfield');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('529-942-3819', 'gswatlandy@sun.com', 'Allard', 'Gilberta', 'Swatland');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('282-263-6440', 'csouthworthz@ow.ly', 'Dorotea', 'Chrysler', 'Southworth');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('513-516-2893', 'dchardin10@samsung.com', 'Johnathon', 'Delmar', 'Chardin');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('563-893-7135', 'bsommer11@taobao.com', 'Vikki', 'Berkeley', 'Sommer');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('653-034-5165', 'wgrzesiewicz12@csmonitor.com', 'Marissa', 'Wyndham', 'Grzesiewicz');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('140-970-5673', 'cclinkard13@deviantart.com', 'Austen', 'Chadwick', 'Clinkard');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('109-101-0281', 'gbradane14@shutterfly.com', 'Coop', 'Georgianna', 'Bradane');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('648-907-2647', 'mvase15@princeton.edu', 'Hayyim', 'Marven', 'Vase');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('082-749-6089', 'dprobyn16@amazon.co.jp', 'Karlan', 'Denice', 'Probyn');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('352-217-3527', 'gbeavington17@businesswire.com', 'Skell', 'Gavrielle', 'Beavington');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('281-193-1390', 'cducarme18@bloglovin.com', 'Dimitri', 'Cedric', 'ducarme');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('925-631-5883', 'gholdforth19@va.gov', 'Desmond', 'Gwenette', 'Holdforth');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('608-541-8974', 'fcassley1a@qq.com', 'Nolana', 'Florie', 'Cassley');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('035-151-0778', 'ldevenish1b@discovery.com', 'Philip', 'Laurent', 'Devenish');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('001-075-7218', 'ushovel1c@answers.com', 'Flory', 'Upton', 'Shovel');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('257-219-1989', 'amacsherry1d@free.fr', 'Brewster', 'Ag', 'MacSherry');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('019-253-7239', 'npassfield1e@springer.com', 'Fania', 'Northrup', 'Passfield');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('644-920-4125', 'ifairley1f@so-net.ne.jp', 'Ricardo', 'Iris', 'Fairley');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('837-296-2672', 'htowers1g@unblog.fr', 'Dorita', 'Hurlee', 'Towers');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('076-085-2687', 'mcrippell1h@auda.org.au', 'Marianna', 'Missy', 'Crippell');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('824-750-9607', 'deddoes1i@ask.com', 'Leonerd', 'Dorthy', 'Eddoes');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('884-532-4491', 'bharbach1j@independent.co.uk', 'Ignacius', 'Bobbe', 'Harbach');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('417-442-7946', 'dgrahlman1k@ucsd.edu', 'Billy', 'Delaney', 'Grahlman');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('135-886-1705', 'ejeanequin1l@cpanel.net', 'Archambault', 'Em', 'Jeanequin');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('368-817-7633', 'hmishaw1m@usnews.com', 'Lainey', 'Hinze', 'Mishaw');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('320-121-9695', 'cgarnsworthy1n@seattletimes.com', 'Galina', 'Cornelia', 'Garnsworthy');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('939-068-2904', 'cberg1o@thetimes.co.uk', 'Mayer', 'Cornie', 'Berg');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('676-189-4976', 'mgarrett1p@cam.ac.uk', 'Hillier', 'Muhammad', 'Garrett');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('684-736-2797', 'wrodolico1q@narod.ru', 'Darcee', 'Winne', 'Rodolico');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('651-358-5927', 'omcconaghy1r@europa.eu', 'Nowell', 'Oswald', 'McConaghy');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('170-004-3584', 'pstockford1s@posterous.com', 'Ham', 'Pris', 'Stockford');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('099-450-0705', 'gelsom1t@ucla.edu', 'Frederic', 'Geri', 'Elsom');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('133-652-4860', 'dbriton1u@fc2.com', 'Erick', 'Darby', 'Briton');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('983-290-9189', 'mblanchet1v@blinklist.com', 'Felisha', 'Manny', 'Blanchet');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('201-703-6598', 'gralfe1w@mediafire.com', 'Urbanus', 'Gray', 'Ralfe');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('965-241-9346', 'hsandwich1x@apache.org', 'Berny', 'Harper', 'Sandwich');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('145-946-7464', 'lhowells1y@reddit.com', 'Winonah', 'Lucho', 'Howells');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('988-428-4917', 'mjoules1z@histats.com', 'Patsy', 'Miguela', 'Joules');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('336-711-5851', 'jbrearty20@geocities.com', 'Rupert', 'Johna', 'Brearty');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('050-226-8548', 'bdaughtrey21@yandex.ru', 'Olin', 'Berna', 'Daughtrey');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('903-483-3931', 'bscibsey22@xrea.com', 'Darcee', 'Bronny', 'Scibsey');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('538-419-0192', 'bmozzini23@hubpages.com', 'Abel', 'Brand', 'Mozzini');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('880-806-1254', 'kwollen24@facebook.com', 'Marna', 'Krysta', 'Wollen');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('371-055-7714', 'whabbergham25@illinois.edu', 'Grover', 'Winnie', 'Habbergham');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('771-050-0254', 'ablackborne26@cloudflare.com', 'Manya', 'Andreana', 'Blackborne');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('520-325-2074', 'bjorczyk27@sbwire.com', 'Benoite', 'Benn', 'Jorczyk');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('632-153-8132', 'ggallone28@admin.ch', 'Adrienne', 'Ginnie', 'Gallone');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('968-624-5526', 'gcromly29@ifeng.com', 'Nev', 'Geno', 'Cromly');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('594-277-5397', 'rrannigan2a@sciencedaily.com', 'Ozzie', 'Rina', 'Rannigan');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('892-638-8941', 'gpearne2b@webmd.com', 'Kennedy', 'Gleda', 'Pearne');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('157-185-5560', 'rcole2c@blogspot.com', 'Buckie', 'Rainer', 'Cole');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('965-325-4273', 'ejorger2d@ibm.com', 'Hasheem', 'Ennis', 'Jorger');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('933-871-8037', 'squaltro2e@flickr.com', 'Weylin', 'Shela', 'Qualtro');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('401-517-4560', 'wcapewell2f@cloudflare.com', 'Noland', 'Wylma', 'Capewell');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('412-455-4942', 'tslowcock2g@elegantthemes.com', 'Heidie', 'Tamar', 'Slowcock');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('726-713-5942', 'jsang2h@edublogs.org', 'Cornell', 'Jim', 'Sang');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('480-399-3832', 'bmcgilroy2i@nature.com', 'Jillayne', 'Brunhilde', 'McGilroy');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('160-654-2176', 'kdangerfield2j@accuweather.com', 'Vivie', 'Kalli', 'Dangerfield');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('527-534-0619', 'cbartkowiak2k@nyu.edu', 'Katha', 'Clerc', 'Bartkowiak');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('670-215-7919', 'scromack2l@wsj.com', 'Arleen', 'Sydel', 'Cromack');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('354-746-6800', 'tchipp2m@people.com.cn', 'Davey', 'Trstram', 'Chipp');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('821-321-4774', 'nbowle2n@aol.com', 'Blondy', 'Nolan', 'Bowle');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('910-965-6468', 'ajeaneau2o@etsy.com', 'Flory', 'Allie', 'Jeaneau');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('758-675-2954', 'bjendrys2p@eventbrite.com', 'Freemon', 'Bar', 'Jendrys');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('725-131-1937', 'gabramov2q@japanpost.jp', 'Genia', 'Guinna', 'Abramov');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('332-519-6666', 'relverstone2r@php.net', 'Hanny', 'Rob', 'Elverstone');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('228-273-0181', 'btorricella2s@elegantthemes.com', 'Bertine', 'Brucie', 'Torricella');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('542-432-4852', 'tevery2t@ucsd.edu', 'Yorke', 'Townsend', 'Every');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('702-630-4873', 'mterbrug2u@state.gov', 'Vaughan', 'Myca', 'Terbrug');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('842-933-5277', 'arochewell2v@hubpages.com', 'Yvette', 'Afton', 'Rochewell');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('838-888-5308', 'izimmermeister2w@ameblo.jp', 'Donetta', 'Ignazio', 'Zimmermeister');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('210-893-9401', 'fglastonbury2x@huffingtonpost.com', 'Sabra', 'Fowler', 'Glastonbury');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('663-819-0647', 'osilverthorne2y@spiegel.de', 'Chip', 'Orsola', 'Silverthorne');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('458-090-6292', 'dpedican2z@hibu.com', 'Pavel', 'Donica', 'Pedican');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('597-470-0123', 'biashvili30@mlb.com', 'Antonius', 'Brittaney', 'Iashvili');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('015-582-1329', 'hrotham31@sphinn.com', 'Verne', 'Haleigh', 'Rotham');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('682-611-0738', 'ibocking32@buzzfeed.com', 'Guido', 'Inge', 'Bocking');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('127-183-2661', 'sosgood33@bbb.org', 'Bryana', 'Sheffield', 'Osgood');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('497-188-4958', 'astanlack34@cam.ac.uk', 'Celestyn', 'Ashby', 'Stanlack');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('182-219-7313', 'gcorrigan35@sphinn.com', 'Shirline', 'Giustina', 'Corrigan');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('423-234-0278', 'bdullaghan36@blogspot.com', 'Germaine', 'Baryram', 'Dullaghan');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('998-901-1585', 'vrispen37@xinhuanet.com', 'Kellie', 'Violante', 'Rispen');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('589-878-5094', 'akirley38@list-manage.com', 'Breena', 'Anna-diana', 'Kirley');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('424-453-1559', 'hpierro39@sciencedirect.com', 'Patrice', 'Hoebart', 'Pierro');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('566-845-2616', 'gparsall3a@hc360.com', 'Gisele', 'Glenn', 'Parsall');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('352-434-8935', 'lfairpo3b@statcounter.com', 'Jolee', 'Linus', 'Fairpo');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('493-817-8718', 'lgergolet3c@ebay.com', 'Kipp', 'Laverna', 'Gergolet');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('933-577-9351', 'padshede3d@mayoclinic.com', 'Stacie', 'Patrica', 'Adshede');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('739-742-8926', 'tphear3e@ning.com', 'Rawley', 'Tabbatha', 'Phear');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('865-362-4448', 'dsaull3f@usgs.gov', 'Hogan', 'Delores', 'Saull');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('754-482-7302', 'bharvett3g@arizona.edu', 'Godiva', 'Bel', 'Harvett');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('765-769-7059', 'hcarass3h@google.com.au', 'Dirk', 'Hartley', 'Carass');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('881-558-7862', 'hgambrell3i@imgur.com', 'Vivianne', 'Harlin', 'Gambrell');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('056-127-5484', 'asybe3j@rambler.ru', 'Wylma', 'Audre', 'Sybe');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('709-122-6147', 'agunda3k@time.com', 'Livvyy', 'Alvan', 'Gunda');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('007-143-9263', 'vlockyer3l@cdbaby.com', 'Glad', 'Vitia', 'Lockyer');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('297-776-8309', 'grussel3m@theatlantic.com', 'Harriette', 'Galen', 'Russel');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('581-905-4196', 'jbruna3n@fotki.com', 'Verney', 'Jaquelin', 'Bruna');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('965-040-4685', 'nbarkas3o@addtoany.com', 'Meta', 'Nestor', 'Barkas');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('668-780-9081', 'dbarton3p@google.nl', 'Clea', 'Demetrius', 'Barton');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('451-109-6478', 'lbeagan3q@foxnews.com', 'Inez', 'Lancelot', 'Beagan');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('582-809-9614', 'jditchfield3r@hubpages.com', 'Felicia', 'Josie', 'Ditchfield');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('405-084-3277', 'ttimmermann3s@mediafire.com', 'Emmye', 'Therine', 'Timmermann');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('404-237-0262', 'amichele3t@washington.edu', 'Chelsea', 'Archer', 'Michele');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('053-954-6689', 'smariel3u@businessweek.com', 'Tracey', 'Sherie', 'Mariel');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('295-026-0907', 'gbelly3v@bloomberg.com', 'Reta', 'Gerladina', 'Belly');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('119-488-0547', 'escatchard3w@xinhuanet.com', 'Gabbie', 'Evey', 'Scatchard');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('949-756-3596', 'tadger3x@reuters.com', 'Miriam', 'Trumaine', 'Adger');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('723-721-4878', 'lmackeogh3y@vinaora.com', 'Sheilakathryn', 'Letitia', 'MacKeogh');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('862-595-2692', 'tfolcarelli3z@goo.ne.jp', 'Constantin', 'Timmie', 'Folcarelli');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('878-599-1431', 'cforcer40@sphinn.com', 'Gwendolin', 'Cacilie', 'Forcer');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('553-388-4708', 'jwybourne41@sun.com', 'Udell', 'Jereme', 'Wybourne');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('645-881-7415', 'cantal42@usda.gov', 'Hyacinthia', 'Carson', 'Antal');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('927-255-4359', 'pmorat43@geocities.jp', 'Doralynn', 'Patrice', 'Morat');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('771-069-7443', 'nhandrick44@goodreads.com', 'Kaycee', 'Nicholas', 'Handrick');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('551-212-5375', 'emackill45@privacy.gov.au', 'Faina', 'Elane', 'MacKill');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('197-561-8321', 'aubank46@sciencedaily.com', 'Karie', 'Aurore', 'Ubank');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('408-654-7281', 'osprague47@mac.com', 'Eloise', 'Obie', 'Sprague');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('913-851-3234', 'scastel48@freewebs.com', 'Janot', 'Silvana', 'Castel');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('715-234-8385', 'rbaudichon49@nhs.uk', 'Georgi', 'Reynold', 'Baudichon');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('284-692-6825', 'rkurth4a@bravesites.com', 'Melesa', 'Robers', 'Kurth');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('404-208-8268', 'ybrearton4b@intel.com', 'Lida', 'Yves', 'Brearton');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('913-330-1443', 'rscuse4c@dell.com', 'Sheryl', 'Ruperto', 'Scuse');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('369-963-8398', 'rdobbison4d@issuu.com', 'Bliss', 'Renato', 'Dobbison');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('165-219-0039', 'torwin4e@nymag.com', 'Culver', 'Talyah', 'Orwin');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('687-665-7694', 'dstiddard4f@wikispaces.com', 'Merle', 'Davita', 'Stiddard');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('553-592-7638', 'ddrew4g@amazon.co.jp', 'Kerk', 'Doralia', 'Drew');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('296-563-9241', 'bmullard4h@usatoday.com', 'Joby', 'Bayard', 'Mullard');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('527-051-2911', 'rcowern4i@nasa.gov', 'Carissa', 'Rik', 'Cowern');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('234-818-7666', 'kglancy4j@dyndns.org', 'Lurlene', 'Kitty', 'Glancy');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('247-255-8659', 'bbuckthought4k@hp.com', 'Janenna', 'Bowie', 'Buckthought');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('059-124-2105', 'easpland4l@typepad.com', 'Igor', 'Eulalie', 'Aspland');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('171-921-5677', 'pdonavan4m@cdbaby.com', 'Ivar', 'Packston', 'Donavan');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('115-075-4469', 'jstraker4n@oaic.gov.au', 'Alex', 'Jobie', 'Straker');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('653-496-4102', 'jlogie4o@squarespace.com', 'Abel', 'Jamesy', 'Logie');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('672-852-3271', 'rgregorio4p@chicagotribune.com', 'Gilbert', 'Rosmunda', 'Gregorio');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('333-009-4190', 'bseelbach4q@github.com', 'Marthena', 'Bernette', 'Seelbach');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('751-363-2363', 'cjosefsson4r@hibu.com', 'Julius', 'Carri', 'Josefsson');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('519-204-2534', 'ajordine4s@jalbum.net', 'Juan', 'Aile', 'Jordine');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('975-219-5794', 'ssweetsur4t@weather.com', 'Rudie', 'Shandra', 'Sweetsur');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('585-249-1902', 'tcoronado4u@diigo.com', 'Rick', 'Tymothy', 'Coronado');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('977-754-4782', 'rguinn4v@tinyurl.com', 'Pansy', 'Rozele', 'Guinn');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('169-266-9131', 'mlamey4w@geocities.com', 'Freedman', 'Maisie', 'Lamey');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('282-211-3043', 'dtwinbourne4x@wiley.com', 'Cassandre', 'Daryle', 'Twinbourne');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('346-025-3802', 'jmainson4y@nifty.com', 'Bryn', 'Jeana', 'Mainson');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('162-309-0966', 'wfain4z@si.edu', 'Annecorinne', 'Westley', 'Fain');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('956-230-5436', 'mtatem50@gov.uk', 'Cassaundra', 'Meridel', 'Tatem');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('243-991-8857', 'aoherlihy51@com.com', 'Anthony', 'Annadiana', 'Oherlihy');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('172-072-8845', 'bcoenraets52@topsy.com', 'Inna', 'Benedicto', 'Coenraets');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('709-850-7839', 'estocks53@tamu.edu', 'Alejandrina', 'Esme', 'Stocks');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('716-876-2080', 'vryott54@prnewswire.com', 'Cletus', 'Vidovik', 'Ryott');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('501-473-4446', 'dlindsley55@yellowbook.com', 'Kenna', 'Darya', 'Lindsley');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('237-100-3757', 'amelledy56@nyu.edu', 'Rosalind', 'Angel', 'Melledy');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('316-477-8395', 'klivingston57@economist.com', 'Cher', 'Kinsley', 'Livingston');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('520-109-4656', 'akhomin58@unc.edu', 'Nita', 'Aurore', 'Khomin');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('220-404-9826', 'rcurtiss59@who.int', 'Onfre', 'Rhiamon', 'Curtiss');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('424-228-3527', 'klabeuil5a@spiegel.de', 'Manfred', 'Kamila', 'Labeuil');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('984-558-9161', 'ishoute5b@elpais.com', 'Donavon', 'Issy', 'Shoute');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('662-267-5960', 'dbruckstein5c@wikimedia.org', 'Delcina', 'Darb', 'Bruckstein');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('340-132-0664', 'igatlin5d@infoseek.co.jp', 'Connor', 'Ivory', 'Gatlin');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('548-779-5834', 'jainge5e@mac.com', 'Sallie', 'Jakie', 'Ainge');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('196-015-1509', 'gharower5f@wikipedia.org', 'Alfi', 'Gates', 'Harower');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('143-658-9028', 'rportail5g@sohu.com', 'Deina', 'Rorke', 'Portail');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('759-498-8000', 'wswadlinge5h@twitter.com', 'Billye', 'Wynnie', 'Swadlinge');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('668-333-7208', 'dhovell5i@ibm.com', 'Roxine', 'Daune', 'Hovell');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('848-259-0879', 'rgoley5j@newsvine.com', 'Elvira', 'Rowney', 'Goley');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('167-834-8269', 'dboorn5k@yahoo.co.jp', 'Elfrida', 'Dorelia', 'Boorn');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('441-262-4479', 'srentalll5l@intel.com', 'Evin', 'Suzann', 'Rentalll');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('041-522-8626', 'alooker5m@discuz.net', 'Felita', 'Alessandro', 'Looker');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('725-177-7883', 'asictornes5n@csmonitor.com', 'Berkeley', 'April', 'Sictornes');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('424-719-8149', 'lbert5o@wikia.com', 'Melody', 'Lulita', 'Bert');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('190-222-0303', 'danstead5p@slideshare.net', 'Isabeau', 'Drucy', 'Anstead');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('848-617-8399', 'dmatura5q@list-manage.com', 'Marlow', 'Dalston', 'Matura');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('176-974-0490', 'icaldaro5r@nasa.gov', 'Madonna', 'Izak', 'Caldaro');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('922-061-1606', 'dbalding5s@washingtonpost.com', 'Marylynne', 'Dniren', 'Balding');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('271-555-7072', 'jdelacourt5t@live.com', 'Laurena', 'Joyan', 'Delacourt');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('452-019-3107', 'fseivertsen5u@163.com', 'Sig', 'Farley', 'Seivertsen');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('199-077-5003', 'mosmond5v@squarespace.com', 'Alessandro', 'Mannie', 'Osmond');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('515-424-5985', 'rleathlay5w@yellowbook.com', 'Sabine', 'Reggis', 'Leathlay');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('235-433-7283', 'tbartoszinski5x@huffingtonpost.com', 'Brynne', 'Teresita', 'Bartoszinski');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('037-106-5251', 'dbruce5y@hhs.gov', 'Rozamond', 'Darice', 'Bruce');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('090-705-6524', 'fkuhnhardt5z@google.com.hk', 'Jeanelle', 'Francklyn', 'Kuhnhardt');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('807-476-3133', 'dmartignoni60@nationalgeographic.com', 'Dyan', 'Dorothee', 'Martignoni');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('233-036-3707', 'nstelljes61@webeden.co.uk', 'Trudi', 'Nickey', 'Stelljes');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('003-968-8801', 'pever62@cyberchimps.com', 'Ossie', 'Peg', 'Ever');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('040-963-3043', 'tlannin63@auda.org.au', 'Waylon', 'Tamqrah', 'Lannin');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('841-688-9518', 'gpeploe64@buzzfeed.com', 'Franklyn', 'Gavin', 'Peploe');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('262-064-2850', 'tedsell65@toplist.cz', 'Stanislaw', 'Thayne', 'Edsell');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('628-106-6748', 'cnorville66@nature.com', 'Bond', 'Chere', 'Norville');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('161-147-8342', 'cberrisford67@businessinsider.com', 'Mahmoud', 'Creigh', 'Berrisford');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('087-475-6132', 'jgrinyer68@blogtalkradio.com', 'Rachel', 'Jenine', 'Grinyer');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('513-251-1625', 'slissemore69@upenn.edu', 'Belle', 'Sheffie', 'Lissemore');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('796-408-6458', 'lkitcat6a@shutterfly.com', 'Aylmar', 'Louella', 'Kitcat');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('618-711-0130', 'sbraime6b@cdbaby.com', 'Jenna', 'Shayne', 'Braime');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('995-643-8546', 'ktuny6c@cbslocal.com', 'Farlay', 'Kermit', 'Tuny');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('415-500-1465', 'dpitchers6d@reverbnation.com', 'Shep', 'Darn', 'Pitchers');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('359-352-6284', 'theardman6e@miitbeian.gov.cn', 'Fern', 'Tallulah', 'Heardman');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('492-992-9922', 'msivyour6f@imdb.com', 'Papagena', 'Milzie', 'Sivyour');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('314-241-5870', 'mlindenboim6g@wisc.edu', 'Quent', 'Milissent', 'Lindenboim');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('020-979-8769', 'nbatram6h@twitter.com', 'Emanuele', 'Nanette', 'Batram');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('362-406-1434', 'lthunderchief6i@opera.com', 'Mary', 'Lolita', 'Thunderchief');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('008-653-7135', 'asnoddin6j@google.es', 'Anette', 'Alexandrina', 'Snoddin');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('782-999-0281', 'wattrey6k@engadget.com', 'Davidde', 'Winny', 'Attrey');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('373-218-2147', 'bsherlaw6l@sina.com.cn', 'Cassie', 'Brit', 'Sherlaw');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('201-327-8301', 'mbeushaw6m@networksolutions.com', 'Magnum', 'Maxy', 'Beushaw');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('125-431-2289', 'cstoneham6n@instagram.com', 'Sammy', 'Cathrin', 'Stoneham');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('635-910-8602', 'ncullity6o@zimbio.com', 'Julian', 'Nolan', 'Cullity');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('668-170-3168', 'dgors6p@wikimedia.org', 'Brennen', 'Dunc', 'Gors');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('660-697-2778', 'ksabbins6q@who.int', 'Wesley', 'Kyrstin', 'Sabbins');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('980-093-8923', 'dbuer6r@squarespace.com', 'Patty', 'Domingo', 'Buer');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('863-712-6009', 'atarn6s@wp.com', 'Kimberley', 'Agretha', 'Tarn');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('304-408-0465', 'syann6t@kickstarter.com', 'Arnaldo', 'Sabrina', 'Yann');
insert into administrator (phone_number, email, first_name, middle_name, last_name)
values ('276-764-3934', 'jhaquin6u@biblegateway.com', 'Moll', 'Joshua', 'Haquin');


-- advisor sample data generated with Mockaroo
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('965-539-4107', 'wrafter0@zimbio.com', 'Kingsly', 'Waldon', 'Rafter'),
       ('041-076-1509', 'cshimony1@theguardian.com', 'Stephana', 'Clementia', 'Shimony'),
       ('544-341-8309', 'ddyers2@tumblr.com', 'Lyndell', 'Dallas', 'Dyers'),
       ('763-216-2655', 'rcleland3@discuz.net', 'Dannie', 'Rufe', 'Cleland'),
       ('648-381-1188', 'agowry4@w3.org', 'Karim', 'Audry', 'Gowry');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('803-169-6370', 'jlouisot0@amazon.co.uk', 'Bondon', 'Jemmy', 'Louisot');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('552-872-5328', 'abraidon1@cdbaby.com', 'Mair', 'Appolonia', 'Braidon');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('530-796-9915', 'wbellinger2@w3.org', 'Milton', 'Wernher', 'Bellinger');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('604-930-8474', 'nchidzoy3@ebay.com', 'Merry', 'Nora', 'Chidzoy');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('551-154-6851', 'sskechley4@cyberchimps.com', 'Valle', 'Stacee', 'Skechley');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('296-386-6036', 'asmeuin5@zimbio.com', 'Guenevere', 'Alma', 'Smeuin');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('702-590-3870', 'gpedrocco6@oaic.gov.au', 'Lyell', 'Gaile', 'Pedrocco');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('540-234-7158', 'averne7@xinhuanet.com', 'Raul', 'Ashla', 'Verne');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('036-203-1897', 'charome8@blogspot.com', 'Isidora', 'Chrysler', 'Harome');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('763-394-8288', 'jofarris9@hp.com', 'Royal', 'Jenine', 'O''Farris');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('983-556-9899', 'tuzellia@skype.com', 'Charyl', 'Timotheus', 'Uzelli');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('044-912-9798', 'droufb@wordpress.com', 'Eydie', 'Deana', 'Rouf');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('538-760-0539', 'awalfordc@walmart.com', 'Donn', 'Augustina', 'Walford');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('387-164-0828', 'gclutheramd@newyorker.com', 'Loutitia', 'Gerrie', 'Clutheram');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('470-036-0729', 'mmacgiollae@sourceforge.net', 'Virgie', 'Myriam', 'MacGiolla');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('185-382-0084', 'jivashintsovf@surveymonkey.com', 'Adelind', 'Jessika', 'Ivashintsov');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('452-803-0993', 'btocquevilleg@nifty.com', 'Sully', 'Bonny', 'Tocqueville');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('699-440-4241', 'kderwinh@digg.com', 'Katerina', 'Kennith', 'Derwin');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('181-071-8696', 'gsaddletoni@blogger.com', 'Jilly', 'Gaultiero', 'Saddleton');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('511-662-1406', 'euccellij@sfgate.com', 'Klement', 'Ellissa', 'Uccelli');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('095-781-8792', 'jchristoforouk@ihg.com', 'Rica', 'Jasper', 'Christoforou');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('103-447-2402', 'tteacyl@goo.ne.jp', 'Brewer', 'Thomas', 'Teacy');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('132-433-5180', 'fgobelm@java.com', 'Malinda', 'Faulkner', 'Gobel');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('163-310-4322', 'etrussloven@hugedomains.com', 'David', 'Erinn', 'Trusslove');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('409-230-6669', 'bhilldropo@yelp.com', 'Sella', 'Bondon', 'Hilldrop');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('129-908-7462', 'hoehmep@google.com.au', 'Dorelle', 'Hyacintha', 'Oehme');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('869-543-1424', 'odemeisq@scientificamerican.com', 'Cyrus', 'Orbadiah', 'De Meis');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('863-688-8580', 'sredgewellr@cnbc.com', 'Megan', 'Sarene', 'Redgewell');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('624-468-8400', 'mtadlows@goo.gl', 'Somerset', 'Melissa', 'Tadlow');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('071-863-0593', 'mrayburnt@github.com', 'Marje', 'Marjy', 'Rayburn');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('943-995-4308', 'cmarcieku@twitpic.com', 'Derrek', 'Cliff', 'Marciek');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('090-390-7271', 'scecelyv@simplemachines.org', 'Rosemaria', 'Sarena', 'Cecely');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('865-029-3327', 'zshildrickw@netscape.com', 'Richart', 'Zacharia', 'Shildrick');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('069-395-8376', 'bmosex@ucoz.ru', 'Taddeusz', 'Brynn', 'Mose');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('950-301-6197', 'sschukerty@prnewswire.com', 'Sid', 'Shaina', 'Schukert');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('411-340-5046', 'cbaackz@ocn.ne.jp', 'Luz', 'Cornie', 'Baack');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('025-278-3747', 'lcompston10@wikispaces.com', 'Gareth', 'Lionel', 'Compston');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('581-703-3295', 'bgarment11@intel.com', 'Tori', 'Bertina', 'Garment');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('293-035-2107', 'aenstone12@globo.com', 'Michaelina', 'Adena', 'Enstone');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('012-507-5482', 'cmulqueeny13@vinaora.com', 'Avril', 'Celestyn', 'Mulqueeny');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('547-642-9292', 'pspinks14@toplist.cz', 'Ced', 'Packston', 'Spinks');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('374-767-2313', 'gbeynkn15@dagondesign.com', 'Olivie', 'Gard', 'Beynkn');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('313-652-0803', 'odetloff16@edublogs.org', 'Heall', 'Odell', 'Detloff');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('136-019-3369', 'wanwyl17@a8.net', 'Sallie', 'Winn', 'Anwyl');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('464-736-2086', 'mgodsil18@ocn.ne.jp', 'Birk', 'Maryellen', 'Godsil');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('259-020-7746', 'ejenteau19@webmd.com', 'Elihu', 'Emlynn', 'Jenteau');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('346-047-7059', 'rdimblebee1a@indiatimes.com', 'Nadia', 'Robin', 'Dimblebee');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('153-374-5320', 'dparzizek1b@aboutads.info', 'Cristine', 'Darice', 'Parzizek');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('972-402-3557', 'bbrakewell1c@ca.gov', 'Yard', 'Bernete', 'Brakewell');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('552-269-3866', 'cshurrocks1d@house.gov', 'Georgi', 'Calvin', 'Shurrocks');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('047-126-6036', 'mdagg1e@weather.com', 'Terra', 'Morgen', 'Dagg');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('729-529-7852', 'dganniclifft1f@webnode.com', 'Rudd', 'Daron', 'Ganniclifft');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('120-019-7570', 'imccaster1g@state.gov', 'Mary', 'Ives', 'McCaster');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('419-705-8271', 'sclements1h@tripadvisor.com', 'Feodora', 'Stoddard', 'Clements');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('969-876-3846', 'kkenneway1i@ca.gov', 'Bil', 'Kania', 'Kenneway');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('885-612-4519', 'dgravenall1j@abc.net.au', 'Serena', 'Dayle', 'Gravenall');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('883-372-1728', 'pwilson1k@independent.co.uk', 'Timi', 'Paulie', 'Wilson');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('879-070-3091', 'alegendre1l@amazon.com', 'Nev', 'Armand', 'Legendre');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('484-588-6601', 'jsmedmore1m@feedburner.com', 'Elbertine', 'Janos', 'Smedmore');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('469-657-2598', 'gyokley1n@uiuc.edu', 'Richmond', 'Gus', 'Yokley');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('988-441-7208', 'rchazette1o@disqus.com', 'Rodd', 'Rayner', 'Chazette');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('783-742-4600', 'mluckes1p@reverbnation.com', 'Joey', 'Madella', 'Luckes');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('992-678-6153', 'mcausey1q@hatena.ne.jp', 'Ara', 'Mona', 'Causey');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('287-590-1081', 'ghuman1r@1688.com', 'Malorie', 'Guy', 'Human');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('711-475-1367', 'pcarbett1s@infoseek.co.jp', 'Inger', 'Pierre', 'Carbett');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('092-592-1472', 'drainger1t@chicagotribune.com', 'Shay', 'Drucie', 'Rainger');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('814-612-1262', 'lmercey1u@wix.com', 'Flemming', 'Leigh', 'Mercey');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('751-815-1451', 'erye1v@google.com.hk', 'Riane', 'Editha', 'Rye');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('966-041-8029', 'bhancock1w@paypal.com', 'Annamarie', 'Brina', 'Hancock');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('726-893-2717', 'kgariff1x@mail.ru', 'Mile', 'Katina', 'Gariff');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('844-974-3700', 'rgrangier1y@spotify.com', 'Alberto', 'Ronda', 'Grangier');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('911-161-3815', 'bsharville1z@apache.org', 'Newton', 'Barbie', 'Sharville');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('848-751-4243', 'rmizzi20@loc.gov', 'Johnnie', 'Rudyard', 'Mizzi');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('175-865-6566', 'kskates21@yellowpages.com', 'Jade', 'Kalli', 'Skates');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('202-804-2536', 'kdalmeida22@narod.ru', 'Tomkin', 'Katharina', 'D''Almeida');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('615-695-3318', 'dhitzmann23@amazon.co.uk', 'Nye', 'Ddene', 'Hitzmann');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('319-094-4935', 'lsineath24@indiatimes.com', 'Gifford', 'Lorant', 'Sineath');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('537-408-0924', 'scroxley25@i2i.jp', 'Martita', 'Sabina', 'Croxley');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('383-886-5356', 'oshord26@mac.com', 'Melitta', 'Oby', 'Shord');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('098-370-0689', 'ptowner27@nhs.uk', 'Angele', 'Patty', 'Towner');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('448-664-5501', 'cknapp28@ebay.com', 'Vasilis', 'Caz', 'Knapp');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('413-029-6594', 'zbirden29@tripod.com', 'Lorry', 'Zora', 'Birden');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('024-424-1485', 'rbartolomeu2a@theatlantic.com', 'Milli', 'Rivalee', 'Bartolomeu');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('792-344-0159', 'jfontelles2b@sakura.ne.jp', 'Arlana', 'Josi', 'Fontelles');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('234-794-0993', 'tsteuart2c@google.com', 'Filmore', 'Trisha', 'Steuart');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('497-649-1823', 'bgoldhawk2d@booking.com', 'Tadd', 'Bail', 'Goldhawk');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('739-846-8181', 'kgittis2e@apache.org', 'Mimi', 'Kinsley', 'Gittis');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('821-590-3853', 'bhowsan2f@acquirethisname.com', 'Abie', 'Brana', 'Howsan');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('394-010-0259', 'tgarnam2g@adobe.com', 'Jerrie', 'Tori', 'Garnam');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('716-158-6885', 'shobbing2h@deviantart.com', 'Pascal', 'Sidonia', 'Hobbing');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('653-613-3166', 'adicke2i@yellowbook.com', 'Reuben', 'Agretha', 'Dicke');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('140-430-9801', 'ybobasch2j@jimdo.com', 'Gabey', 'Yetty', 'Bobasch');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('704-487-9040', 'kzumbusch2k@cocolog-nifty.com', 'Eziechiele', 'Kim', 'Zumbusch');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('124-986-4228', 'nerdes2l@hubpages.com', 'Matti', 'Nikolas', 'Erdes');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('874-076-6152', 'rollis2m@t.co', 'Denis', 'Randie', 'Ollis');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('013-325-0746', 'acockin2n@sfgate.com', 'Maegan', 'Aveline', 'Cockin');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('839-848-1365', 'kveschambes2o@delicious.com', 'Richart', 'Keane', 'Veschambes');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('938-923-1321', 'lmanhood2p@comcast.net', 'Paddie', 'Luis', 'Manhood');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('323-649-5608', 'tbridgstock2q@bizjournals.com', 'Lev', 'Tatiana', 'Bridgstock');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('650-352-9157', 'ebrideau2r@i2i.jp', 'Alvis', 'Edy', 'Brideau');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('405-516-6363', 'maleevy2s@mashable.com', 'Gladi', 'Melody', 'Aleevy');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('941-105-2596', 'vlister2t@imdb.com', 'Eulalie', 'Vickie', 'Lister');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('073-379-4127', 'fmidden2u@dedecms.com', 'Pate', 'Faunie', 'Midden');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('269-547-4952', 'opoulsen2v@msu.edu', 'Jed', 'Othello', 'Poulsen');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('041-595-4897', 'kmorratt2w@tumblr.com', 'Bogey', 'Korey', 'Morratt');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('249-477-3289', 'ggallichan2x@youku.com', 'Gus', 'Gloriana', 'Gallichan');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('567-224-2562', 'cjeanet2y@google.de', 'Fayre', 'Cchaddie', 'Jeanet');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('758-587-8930', 'mfillingham2z@surveymonkey.com', 'Traver', 'Marsha', 'Fillingham');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('196-830-7712', 'tsedge30@hostgator.com', 'Aryn', 'Thor', 'Sedge');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('208-429-3780', 'gmaber31@deliciousdays.com', 'Cheri', 'Giulio', 'Maber');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('247-270-8706', 'fshaplin32@fastcompany.com', 'Honey', 'Fay', 'Shaplin');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('830-599-4013', 'ttumber33@usda.gov', 'Claresta', 'Torrance', 'Tumber');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('706-524-4974', 'hcottrell34@hostgator.com', 'Kory', 'Helen-elizabeth', 'Cottrell');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('423-657-8300', 'nleopard35@vkontakte.ru', 'Joey', 'Nerita', 'Leopard');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('374-904-0245', 'kstarzaker36@shinystat.com', 'Kerrie', 'Korry', 'Starzaker');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('040-280-0560', 'pocurneen37@irs.gov', 'Claire', 'Papageno', 'O''Curneen');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('731-274-5930', 'phuonic38@gmpg.org', 'Fifine', 'Pierre', 'Huonic');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('193-652-7907', 'mmathes39@twitpic.com', 'Tandy', 'Malorie', 'Mathes');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('274-731-1102', 'ehallmark3a@so-net.ne.jp', 'Donn', 'Ethelind', 'Hallmark');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('838-075-5266', 'iughelli3b@vistaprint.com', 'Valentina', 'Ichabod', 'Ughelli');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('880-770-2803', 'nreinard3c@chronoengine.com', 'Alard', 'Nelly', 'Reinard');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('699-378-0166', 'lalpin3d@prweb.com', 'Karleen', 'Lynnette', 'Alpin');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('598-665-4441', 'aroglieri3e@people.com.cn', 'Sharlene', 'Agnes', 'Roglieri');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('042-123-1109', 'cdebrett3f@bizjournals.com', 'Shane', 'Cordi', 'De Brett');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('796-847-7357', 'bdimanche3g@tripod.com', 'Jan', 'Baillie', 'Dimanche');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('667-345-6905', 'mluckwell3h@edublogs.org', 'Tabbatha', 'Merry', 'Luckwell');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('854-968-7509', 'cstaddom3i@imageshack.us', 'Flo', 'Carmine', 'Staddom');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('306-282-4004', 'ebale3j@yellowpages.com', 'Benjy', 'Eric', 'Bale');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('024-585-6635', 'achristoffels3k@goo.gl', 'Barrett', 'Alick', 'Christoffels');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('172-295-2892', 'gren3l@geocities.com', 'Judith', 'Gregoire', 'Ren');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('203-781-3972', 'aknappett3m@utexas.edu', 'Free', 'Aurelie', 'Knappett');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('908-803-7669', 'lcavilla3n@php.net', 'Lynn', 'Lorri', 'Cavilla');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('630-103-4254', 'bhause3o@reuters.com', 'Bastian', 'Brynne', 'Hause');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('438-243-2604', 'dlyddiatt3p@edublogs.org', 'Olia', 'Davidde', 'Lyddiatt');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('977-556-8777', 'cboise3q@dedecms.com', 'Heda', 'Cornelius', 'Boise');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('154-486-6996', 'nsawart3r@mlb.com', 'Rollo', 'Nat', 'Sawart');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('265-004-0462', 'gvignaux3s@t-online.de', 'Grayce', 'Gilly', 'Vignaux');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('858-572-6593', 'czanetto3t@skyrock.com', 'Iver', 'Camella', 'Zanetto');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('660-697-0281', 'asartin3u@independent.co.uk', 'Drusie', 'Alden', 'Sartin');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('933-924-8309', 'hmitchelhill3v@sciencedirect.com', 'Laureen', 'Huberto', 'Mitchelhill');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('498-347-4126', 'gelijah3w@sbwire.com', 'Cherie', 'Geraldine', 'Elijah');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('832-766-8514', 'schatelot3x@about.me', 'Garvy', 'Sibyl', 'Chatelot');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('710-582-0374', 'npalmar3y@ebay.co.uk', 'Iorgos', 'Normand', 'Palmar');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('096-944-9399', 'twidocks3z@bloglines.com', 'Laverna', 'Tracey', 'Widocks');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('367-636-3967', 'rbattleson40@clickbank.net', 'Gilemette', 'Rhianon', 'Battleson');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('721-506-3977', 'kodunneen41@cyberchimps.com', 'Joella', 'Kaycee', 'O''Dunneen');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('513-451-4627', 'bfarncomb42@japanpost.jp', 'Kristina', 'Brad', 'Farncomb');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('084-633-8127', 'jbarrar43@admin.ch', 'Everett', 'Jandy', 'Barrar');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('147-618-6790', 'edornan44@comsenz.com', 'Millard', 'Edsel', 'Dornan');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('080-254-7811', 'jrouge45@spotify.com', 'Knox', 'Joaquin', 'Rouge');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('153-938-1228', 'kfirpi46@apple.com', 'Storm', 'Katerina', 'Firpi');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('820-486-9159', 'tamsden47@photobucket.com', 'Loraine', 'Thalia', 'Amsden');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('486-152-0420', 'sdelgadillo48@java.com', 'Clarisse', 'Suzy', 'Delgadillo');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('708-422-7275', 'fcannings49@nydailynews.com', 'Meagan', 'Francesco', 'Cannings');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('352-976-9848', 'sheadingham4a@ucoz.ru', 'Gunar', 'Sophia', 'Headingham');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('680-758-3723', 'jgodart4b@addtoany.com', 'Louisa', 'Junia', 'Godart');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('650-345-4764', 'sdonnell4c@stanford.edu', 'Barde', 'Sharyl', 'Donnell');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('192-248-1663', 'gcallingham4d@slate.com', 'Brodie', 'Gwyneth', 'Callingham');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('713-529-9481', 'cstockings4e@washingtonpost.com', 'Garnette', 'Constancia', 'Stockings');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('203-851-1495', 'bperfili4f@parallels.com', 'Isahella', 'Belva', 'Perfili');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('355-585-9854', 'hlawling4g@wordpress.com', 'Esme', 'Hatti', 'Lawling');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('263-214-3344', 'vbanbury4h@toplist.cz', 'Pier', 'Vin', 'Banbury');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('742-585-6610', 'abisco4i@yahoo.com', 'Rey', 'Arnaldo', 'Bisco');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('057-842-7295', 'alinfitt4j@ed.gov', 'Maia', 'Alano', 'Linfitt');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('760-905-8534', 'pshulem4k@instagram.com', 'Valeda', 'Parker', 'Shulem');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('258-124-5330', 'tskullet4l@bravesites.com', 'Hilton', 'Tammi', 'Skullet');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('830-457-8768', 'mdebeneditti4m@cisco.com', 'Meriel', 'Merle', 'De Beneditti');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('852-992-5693', 'wfernihough4n@plala.or.jp', 'Brnaba', 'Willis', 'Fernihough');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('249-958-9176', 'reccersley4o@sfgate.com', 'Claudine', 'Rolland', 'Eccersley');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('376-337-6376', 'tmyner4p@digg.com', 'Lydon', 'Toinette', 'Myner');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('987-275-7449', 'mnerney4q@microsoft.com', 'Minor', 'Michell', 'Nerney');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('278-667-6401', 'uhookes4r@usa.gov', 'Basile', 'Udale', 'Hookes');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('640-151-9162', 'kedis4s@godaddy.com', 'Corine', 'Kareem', 'Edis');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('989-942-9974', 'jwythill4t@privacy.gov.au', 'Marjy', 'Janna', 'Wythill');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('869-531-4596', 'cwhistlecroft4u@census.gov', 'Danna', 'Cletus', 'Whistlecroft');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('522-596-4056', 'rdorward4v@springer.com', 'Pru', 'Rowney', 'Dorward');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('357-857-3732', 'lsavary4w@plala.or.jp', 'Brenna', 'Lois', 'Savary');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('812-452-6534', 'jgaliford4x@jugem.jp', 'Sumner', 'Jud', 'Galiford');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('612-607-1389', 'bcowderay4y@timesonline.co.uk', 'Darcee', 'Bjorn', 'Cowderay');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('042-291-9922', 'rpflieger4z@exblog.jp', 'Belia', 'Renato', 'Pflieger');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('597-925-1700', 'gropkins50@google.pl', 'Phaedra', 'Germain', 'Ropkins');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('426-929-9719', 'jmctear51@ox.ac.uk', 'Tatiania', 'Jocelin', 'McTear');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('790-014-0145', 'borourke52@sohu.com', 'Neille', 'Bondie', 'O''Rourke');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('424-112-9191', 'sduffy53@shop-pro.jp', 'Aland', 'Stafani', 'Duffy');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('420-608-6353', 'dtilt54@dell.com', 'Webb', 'Don', 'Tilt');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('481-697-6433', 'atring55@upenn.edu', 'Yettie', 'Audra', 'Tring');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('640-496-6667', 'coffer56@nbcnews.com', 'Elyssa', 'Camey', 'Offer');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('584-754-6393', 'marundale57@studiopress.com', 'Malchy', 'Milena', 'Arundale');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('587-953-9645', 'ggiven58@china.com.cn', 'Anabella', 'Gussie', 'Given');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('288-640-8651', 'mobert59@webeden.co.uk', 'Ardisj', 'Meredith', 'Obert');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('548-951-8601', 'mroman5a@bravesites.com', 'Abner', 'Michaella', 'Roman');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('709-717-0540', 'lparzizek5b@woothemes.com', 'Judas', 'Lorianne', 'Parzizek');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('625-716-6442', 'ctedstone5c@theguardian.com', 'Conny', 'Cortney', 'Tedstone');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('561-301-1133', 'rcastelot5d@bloglines.com', 'Flora', 'Ramsey', 'Castelot');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('911-419-5076', 'atompkins5e@un.org', 'Audrey', 'Aridatha', 'Tompkins');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('832-572-4057', 'bdoumer5f@infoseek.co.jp', 'Berky', 'Berenice', 'Doumer');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('215-980-4765', 'jsteinhammer5g@blog.com', 'Jase', 'Jeffrey', 'Steinhammer');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('128-996-3925', 'dcanwell5h@hao123.com', 'Charita', 'Dusty', 'Canwell');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('173-314-9586', 'mhutcheson5i@army.mil', 'Nanny', 'Marcelia', 'Hutcheson');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('368-547-0216', 'iyankov5j@mashable.com', 'Sydelle', 'Irena', 'Yankov');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('976-208-8752', 'fclapson5k@senate.gov', 'Holli', 'Friedrich', 'Clapson');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('111-846-1101', 'wweson5l@omniture.com', 'Hermina', 'Weber', 'Weson');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('782-169-7749', 'esevern5m@webeden.co.uk', 'Cort', 'Evin', 'Severn');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('459-070-5217', 'ktilby5n@de.vu', 'Butch', 'Kacy', 'Tilby');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('298-779-6132', 'bmaccostye5o@hhs.gov', 'Kirstyn', 'Benedicto', 'MacCostye');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('687-912-2791', 'pbernette5p@moonfruit.com', 'Moira', 'Paulie', 'Bernette');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('434-643-6983', 'cgerrill5q@ow.ly', 'Shurwood', 'Charlean', 'Gerrill');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('058-794-8289', 'ealhirsi5r@aol.com', 'Eli', 'Erroll', 'Al Hirsi');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('615-677-1253', 'rshearman5s@mlb.com', 'Marquita', 'Rois', 'Shearman');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('454-870-1476', 'gspillane5t@booking.com', 'Trip', 'Garfield', 'Spillane');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('441-911-5498', 'vmabbot5u@smugmug.com', 'Darda', 'Valerie', 'Mabbot');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('448-675-8525', 'dmeriton5v@pinterest.com', 'Earvin', 'Dotty', 'Meriton');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('394-052-4381', 'nmeach5w@pbs.org', 'Jarrad', 'Nataline', 'Meach');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('733-298-1111', 'cdoodson5x@51.la', 'Anna-diana', 'Clem', 'Doodson');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('484-834-1758', 'nrabson5y@wiley.com', 'Wilek', 'Nedda', 'Rabson');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('998-254-0679', 'tjephcott5z@uiuc.edu', 'Alyss', 'Taffy', 'Jephcott');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('070-365-1184', 'scorden60@theatlantic.com', 'Lindon', 'Seymour', 'Corden');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('870-815-8370', 'rmollen61@tripadvisor.com', 'Reeba', 'Reggie', 'Mollen');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('661-612-6401', 'ojarrelt62@yellowpages.com', 'Tony', 'Osgood', 'Jarrelt');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('562-163-5269', 'apedrol63@flickr.com', 'Cheslie', 'Addy', 'Pedrol');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('519-518-5736', 'hmacaulay64@samsung.com', 'Madeleine', 'Hilly', 'MacAulay');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('958-358-1940', 'swillshear65@feedburner.com', 'Prince', 'Sapphira', 'Willshear');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('703-653-6919', 'agarnall66@dropbox.com', 'Wildon', 'Althea', 'Garnall');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('845-670-1183', 'mmaroney67@irs.gov', 'Alonso', 'Melly', 'Maroney');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('637-732-6149', 'hridhole68@cam.ac.uk', 'Wadsworth', 'Hedvig', 'Ridhole');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('823-617-6458', 'fadams69@vk.com', 'Fredra', 'Fransisco', 'Adams');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('978-808-6910', 'edimaria6a@nydailynews.com', 'Manya', 'Esme', 'Di Maria');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('698-188-2875', 'gnelthorpe6b@seattletimes.com', 'Delaney', 'Gui', 'Nelthorpe');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('846-472-9457', 'sstorrar6c@bloglines.com', 'Lulu', 'Sergio', 'Storrar');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('404-190-1426', 'sstebbings6d@mysql.com', 'Lyndsay', 'Sherill', 'Stebbings');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('866-107-2865', 'umcghie6e@spotify.com', 'Kelley', 'Urbanus', 'McGhie');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('870-559-8043', 'xelsop6f@google.ru', 'Tabbitha', 'Xylina', 'Elsop');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('135-903-5271', 'olapwood6g@infoseek.co.jp', 'Salim', 'Odell', 'Lapwood');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('490-767-0496', 'dmullord6h@behance.net', 'Garfield', 'Dottie', 'Mullord');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('149-460-9587', 'hpadbery6i@feedburner.com', 'Tracey', 'Harv', 'Padbery');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('031-662-2573', 'pnorfolk6j@google.it', 'Floris', 'Perceval', 'Norfolk');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('829-026-3537', 'kgotter6k@hugedomains.com', 'Staford', 'Katrina', 'Gotter');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('096-703-5062', 'jpeschke6l@fema.gov', 'L;urette', 'Johan', 'Peschke');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('826-366-5830', 'shofler6m@plala.or.jp', 'Kristi', 'Sven', 'Hofler');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('777-732-7161', 'gdocherty6n@omniture.com', 'Thalia', 'Glynn', 'Docherty');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('870-732-3921', 'ahaggerwood6o@imgur.com', 'Cull', 'Ashly', 'Haggerwood');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('946-381-9874', 'wtommaseo6p@1und1.de', 'Jeannie', 'Wendie', 'Tommaseo');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('786-453-8403', 'mpirnie6q@pagesperso-orange.fr', 'Celisse', 'Merrill', 'Pirnie');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('031-253-5537', 'adowty6r@canalblog.com', 'Kelby', 'Agata', 'Dowty');
insert into advisor (phone_number, email, first_name, middle_name, last_name)
values ('828-848-3535', 'dglenton6s@google.com.br', 'Celka', 'Demetris', 'Glenton');


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
       (5, 1);
insert into admin_advisor (advisorID, adminID)
values (159, 115);
insert into admin_advisor (advisorID, adminID)
values (17, 49);
insert into admin_advisor (advisorID, adminID)
values (2, 116);
insert into admin_advisor (advisorID, adminID)
values (204, 187);
insert into admin_advisor (advisorID, adminID)
values (34, 52);
insert into admin_advisor (advisorID, adminID)
values (35, 180);
insert into admin_advisor (advisorID, adminID)
values (218, 62);
insert into admin_advisor (advisorID, adminID)
values (91, 20);
insert into admin_advisor (advisorID, adminID)
values (192, 105);
insert into admin_advisor (advisorID, adminID)
values (237, 235);
insert into admin_advisor (advisorID, adminID)
values (127, 26);
insert into admin_advisor (advisorID, adminID)
values (133, 131);
insert into admin_advisor (advisorID, adminID)
values (149, 143);
insert into admin_advisor (advisorID, adminID)
values (174, 208);
insert into admin_advisor (advisorID, adminID)
values (28, 210);
insert into admin_advisor (advisorID, adminID)
values (16, 179);
insert into admin_advisor (advisorID, adminID)
values (37, 200);
insert into admin_advisor (advisorID, adminID)
values (238, 72);
insert into admin_advisor (advisorID, adminID)
values (232, 151);
insert into admin_advisor (advisorID, adminID)
values (192, 139);
insert into admin_advisor (advisorID, adminID)
values (130, 214);
insert into admin_advisor (advisorID, adminID)
values (103, 35);
insert into admin_advisor (advisorID, adminID)
values (182, 238);
insert into admin_advisor (advisorID, adminID)
values (56, 173);
insert into admin_advisor (advisorID, adminID)
values (16, 110);
insert into admin_advisor (advisorID, adminID)
values (223, 142);
insert into admin_advisor (advisorID, adminID)
values (125, 6);
insert into admin_advisor (advisorID, adminID)
values (143, 61);
insert into admin_advisor (advisorID, adminID)
values (192, 39);
insert into admin_advisor (advisorID, adminID)
values (94, 52);
insert into admin_advisor (advisorID, adminID)
values (175, 225);
insert into admin_advisor (advisorID, adminID)
values (65, 187);
insert into admin_advisor (advisorID, adminID)
values (161, 246);
insert into admin_advisor (advisorID, adminID)
values (219, 105);
insert into admin_advisor (advisorID, adminID)
values (209, 153);
insert into admin_advisor (advisorID, adminID)
values (131, 220);
insert into admin_advisor (advisorID, adminID)
values (187, 93);
insert into admin_advisor (advisorID, adminID)
values (227, 103);
insert into admin_advisor (advisorID, adminID)
values (78, 229);
insert into admin_advisor (advisorID, adminID)
values (142, 77);
insert into admin_advisor (advisorID, adminID)
values (76, 214);
insert into admin_advisor (advisorID, adminID)
values (250, 65);
insert into admin_advisor (advisorID, adminID)
values (140, 91);
insert into admin_advisor (advisorID, adminID)
values (225, 134);
insert into admin_advisor (advisorID, adminID)
values (128, 112);
insert into admin_advisor (advisorID, adminID)
values (70, 56);
insert into admin_advisor (advisorID, adminID)
values (198, 195);
insert into admin_advisor (advisorID, adminID)
values (6, 48);
insert into admin_advisor (advisorID, adminID)
values (177, 159);
insert into admin_advisor (advisorID, adminID)
values (210, 78);
insert into admin_advisor (advisorID, adminID)
values (143, 3);
insert into admin_advisor (advisorID, adminID)
values (179, 129);
insert into admin_advisor (advisorID, adminID)
values (192, 240);
insert into admin_advisor (advisorID, adminID)
values (163, 31);
insert into admin_advisor (advisorID, adminID)
values (217, 102);
insert into admin_advisor (advisorID, adminID)
values (78, 15);
insert into admin_advisor (advisorID, adminID)
values (47, 31);
insert into admin_advisor (advisorID, adminID)
values (42, 98);
insert into admin_advisor (advisorID, adminID)
values (66, 187);
insert into admin_advisor (advisorID, adminID)
values (183, 22);
insert into admin_advisor (advisorID, adminID)
values (247, 77);
insert into admin_advisor (advisorID, adminID)
values (34, 174);
insert into admin_advisor (advisorID, adminID)
values (157, 85);
insert into admin_advisor (advisorID, adminID)
values (179, 8);
insert into admin_advisor (advisorID, adminID)
values (118, 194);
insert into admin_advisor (advisorID, adminID)
values (223, 206);
insert into admin_advisor (advisorID, adminID)
values (164, 77);
insert into admin_advisor (advisorID, adminID)
values (89, 212);
insert into admin_advisor (advisorID, adminID)
values (126, 13);
insert into admin_advisor (advisorID, adminID)
values (124, 37);
insert into admin_advisor (advisorID, adminID)
values (58, 207);
insert into admin_advisor (advisorID, adminID)
values (216, 201);
insert into admin_advisor (advisorID, adminID)
values (32, 100);
insert into admin_advisor (advisorID, adminID)
values (131, 204);
insert into admin_advisor (advisorID, adminID)
values (231, 196);
insert into admin_advisor (advisorID, adminID)
values (46, 62);
insert into admin_advisor (advisorID, adminID)
values (243, 60);
insert into admin_advisor (advisorID, adminID)
values (65, 138);
insert into admin_advisor (advisorID, adminID)
values (222, 152);
insert into admin_advisor (advisorID, adminID)
values (157, 206);
insert into admin_advisor (advisorID, adminID)
values (79, 85);
insert into admin_advisor (advisorID, adminID)
values (52, 57);
insert into admin_advisor (advisorID, adminID)
values (112, 151);
insert into admin_advisor (advisorID, adminID)
values (8, 23);
insert into admin_advisor (advisorID, adminID)
values (117, 165);
insert into admin_advisor (advisorID, adminID)
values (144, 240);
insert into admin_advisor (advisorID, adminID)
values (93, 135);
insert into admin_advisor (advisorID, adminID)
values (178, 17);
insert into admin_advisor (advisorID, adminID)
values (249, 13);
insert into admin_advisor (advisorID, adminID)
values (230, 33);
insert into admin_advisor (advisorID, adminID)
values (243, 129);
insert into admin_advisor (advisorID, adminID)
values (35, 136);
insert into admin_advisor (advisorID, adminID)
values (167, 205);
insert into admin_advisor (advisorID, adminID)
values (47, 144);
insert into admin_advisor (advisorID, adminID)
values (188, 104);
insert into admin_advisor (advisorID, adminID)
values (242, 62);
insert into admin_advisor (advisorID, adminID)
values (44, 33);
insert into admin_advisor (advisorID, adminID)
values (22, 150);
insert into admin_advisor (advisorID, adminID)
values (102, 113);
insert into admin_advisor (advisorID, adminID)
values (20, 97);
insert into admin_advisor (advisorID, adminID)
values (132, 103);
insert into admin_advisor (advisorID, adminID)
values (220, 176);
insert into admin_advisor (advisorID, adminID)
values (8, 238);
insert into admin_advisor (advisorID, adminID)
values (51, 123);
insert into admin_advisor (advisorID, adminID)
values (153, 67);
insert into admin_advisor (advisorID, adminID)
values (116, 92);
insert into admin_advisor (advisorID, adminID)
values (107, 115);
insert into admin_advisor (advisorID, adminID)
values (213, 92);
insert into admin_advisor (advisorID, adminID)
values (98, 247);
insert into admin_advisor (advisorID, adminID)
values (125, 209);
insert into admin_advisor (advisorID, adminID)
values (79, 68);
insert into admin_advisor (advisorID, adminID)
values (36, 71);
insert into admin_advisor (advisorID, adminID)
values (208, 231);
insert into admin_advisor (advisorID, adminID)
values (218, 172);
insert into admin_advisor (advisorID, adminID)
values (152, 120);
insert into admin_advisor (advisorID, adminID)
values (58, 16);
insert into admin_advisor (advisorID, adminID)
values (26, 161);
insert into admin_advisor (advisorID, adminID)
values (130, 138);
insert into admin_advisor (advisorID, adminID)
values (78, 169);
insert into admin_advisor (advisorID, adminID)
values (136, 206);
insert into admin_advisor (advisorID, adminID)
values (95, 159);
insert into admin_advisor (advisorID, adminID)
values (139, 248);
insert into admin_advisor (advisorID, adminID)
values (28, 209);
insert into admin_advisor (advisorID, adminID)
values (81, 129);
insert into admin_advisor (advisorID, adminID)
values (125, 21);
insert into admin_advisor (advisorID, adminID)
values (29, 142);
insert into admin_advisor (advisorID, adminID)
values (183, 213);
insert into admin_advisor (advisorID, adminID)
values (230, 104);
insert into admin_advisor (advisorID, adminID)
values (150, 113);
insert into admin_advisor (advisorID, adminID)
values (184, 5);
insert into admin_advisor (advisorID, adminID)
values (21, 22);
insert into admin_advisor (advisorID, adminID)
values (100, 12);
insert into admin_advisor (advisorID, adminID)
values (82, 106);
insert into admin_advisor (advisorID, adminID)
values (84, 73);
insert into admin_advisor (advisorID, adminID)
values (121, 172);
insert into admin_advisor (advisorID, adminID)
values (69, 231);
insert into admin_advisor (advisorID, adminID)
values (94, 46);
insert into admin_advisor (advisorID, adminID)
values (169, 132);
insert into admin_advisor (advisorID, adminID)
values (53, 141);
insert into admin_advisor (advisorID, adminID)
values (99, 30);
insert into admin_advisor (advisorID, adminID)
values (69, 195);
insert into admin_advisor (advisorID, adminID)
values (141, 116);
insert into admin_advisor (advisorID, adminID)
values (3, 245);
insert into admin_advisor (advisorID, adminID)
values (177, 53);
insert into admin_advisor (advisorID, adminID)
values (6, 139);
insert into admin_advisor (advisorID, adminID)
values (132, 211);
insert into admin_advisor (advisorID, adminID)
values (12, 3);
insert into admin_advisor (advisorID, adminID)
values (104, 69);
insert into admin_advisor (advisorID, adminID)
values (161, 63);
insert into admin_advisor (advisorID, adminID)
values (182, 206);
insert into admin_advisor (advisorID, adminID)
values (164, 175);
insert into admin_advisor (advisorID, adminID)
values (27, 172);
insert into admin_advisor (advisorID, adminID)
values (245, 189);
insert into admin_advisor (advisorID, adminID)
values (118, 219);
insert into admin_advisor (advisorID, adminID)
values (133, 133);
insert into admin_advisor (advisorID, adminID)
values (95, 175);
insert into admin_advisor (advisorID, adminID)
values (7, 32);
insert into admin_advisor (advisorID, adminID)
values (202, 110);
insert into admin_advisor (advisorID, adminID)
values (234, 55);
insert into admin_advisor (advisorID, adminID)
values (40, 179);
insert into admin_advisor (advisorID, adminID)
values (220, 183);
insert into admin_advisor (advisorID, adminID)
values (79, 159);
insert into admin_advisor (advisorID, adminID)
values (107, 136);
insert into admin_advisor (advisorID, adminID)
values (9, 136);
insert into admin_advisor (advisorID, adminID)
values (182, 195);
insert into admin_advisor (advisorID, adminID)
values (249, 178);
insert into admin_advisor (advisorID, adminID)
values (249, 223);
insert into admin_advisor (advisorID, adminID)
values (206, 59);
insert into admin_advisor (advisorID, adminID)
values (65, 108);
insert into admin_advisor (advisorID, adminID)
values (74, 12);
insert into admin_advisor (advisorID, adminID)
values (99, 157);
insert into admin_advisor (advisorID, adminID)
values (115, 249);
insert into admin_advisor (advisorID, adminID)
values (85, 55);
insert into admin_advisor (advisorID, adminID)
values (237, 248);
insert into admin_advisor (advisorID, adminID)
values (80, 67);
insert into admin_advisor (advisorID, adminID)
values (25, 208);
insert into admin_advisor (advisorID, adminID)
values (249, 32);
insert into admin_advisor (advisorID, adminID)
values (161, 57);
insert into admin_advisor (advisorID, adminID)
values (126, 234);
insert into admin_advisor (advisorID, adminID)
values (112, 97);
insert into admin_advisor (advisorID, adminID)
values (50, 195);
insert into admin_advisor (advisorID, adminID)
values (140, 157);
insert into admin_advisor (advisorID, adminID)
values (20, 103);
insert into admin_advisor (advisorID, adminID)
values (161, 118);
insert into admin_advisor (advisorID, adminID)
values (193, 116);
insert into admin_advisor (advisorID, adminID)
values (168, 215);
insert into admin_advisor (advisorID, adminID)
values (174, 175);
insert into admin_advisor (advisorID, adminID)
values (234, 79);
insert into admin_advisor (advisorID, adminID)
values (181, 219);
insert into admin_advisor (advisorID, adminID)
values (3, 151);
insert into admin_advisor (advisorID, adminID)
values (221, 222);
insert into admin_advisor (advisorID, adminID)
values (108, 116);
insert into admin_advisor (advisorID, adminID)
values (100, 24);
insert into admin_advisor (advisorID, adminID)
values (47, 110);
insert into admin_advisor (advisorID, adminID)
values (239, 88);
insert into admin_advisor (advisorID, adminID)
values (20, 244);
insert into admin_advisor (advisorID, adminID)
values (207, 42);
insert into admin_advisor (advisorID, adminID)
values (179, 244);
insert into admin_advisor (advisorID, adminID)
values (238, 189);
insert into admin_advisor (advisorID, adminID)
values (124, 139);
insert into admin_advisor (advisorID, adminID)
values (99, 181);
insert into admin_advisor (advisorID, adminID)
values (208, 152);
insert into admin_advisor (advisorID, adminID)
values (200, 142);
insert into admin_advisor (advisorID, adminID)
values (99, 12);
insert into admin_advisor (advisorID, adminID)
values (221, 141);
insert into admin_advisor (advisorID, adminID)
values (106, 146);
insert into admin_advisor (advisorID, adminID)
values (95, 200);
insert into admin_advisor (advisorID, adminID)
values (234, 97);
insert into admin_advisor (advisorID, adminID)
values (15, 190);
insert into admin_advisor (advisorID, adminID)
values (124, 81);
insert into admin_advisor (advisorID, adminID)
values (44, 92);
insert into admin_advisor (advisorID, adminID)
values (146, 26);
insert into admin_advisor (advisorID, adminID)
values (120, 177);
insert into admin_advisor (advisorID, adminID)
values (13, 94);
insert into admin_advisor (advisorID, adminID)
values (151, 79);
insert into admin_advisor (advisorID, adminID)
values (157, 41);
insert into admin_advisor (advisorID, adminID)
values (180, 179);
insert into admin_advisor (advisorID, adminID)
values (225, 190);
insert into admin_advisor (advisorID, adminID)
values (7, 17);
insert into admin_advisor (advisorID, adminID)
values (176, 235);
insert into admin_advisor (advisorID, adminID)
values (171, 161);
insert into admin_advisor (advisorID, adminID)
values (165, 225);
insert into admin_advisor (advisorID, adminID)
values (159, 76);
insert into admin_advisor (advisorID, adminID)
values (217, 28);
insert into admin_advisor (advisorID, adminID)
values (182, 175);
insert into admin_advisor (advisorID, adminID)
values (41, 62);
insert into admin_advisor (advisorID, adminID)
values (26, 148);
insert into admin_advisor (advisorID, adminID)
values (125, 102);
insert into admin_advisor (advisorID, adminID)
values (165, 73);
insert into admin_advisor (advisorID, adminID)
values (240, 23);
insert into admin_advisor (advisorID, adminID)
values (53, 144);
insert into admin_advisor (advisorID, adminID)
values (224, 214);
insert into admin_advisor (advisorID, adminID)
values (48, 124);
insert into admin_advisor (advisorID, adminID)
values (240, 4);
insert into admin_advisor (advisorID, adminID)
values (114, 54);
insert into admin_advisor (advisorID, adminID)
values (106, 113);
insert into admin_advisor (advisorID, adminID)
values (132, 246);
insert into admin_advisor (advisorID, adminID)
values (78, 45);
insert into admin_advisor (advisorID, adminID)
values (145, 22);
insert into admin_advisor (advisorID, adminID)
values (139, 73);
insert into admin_advisor (advisorID, adminID)
values (196, 108);
insert into admin_advisor (advisorID, adminID)
values (226, 219);
insert into admin_advisor (advisorID, adminID)
values (119, 114);
insert into admin_advisor (advisorID, adminID)
values (99, 219);
insert into admin_advisor (advisorID, adminID)
values (6, 170);
insert into admin_advisor (advisorID, adminID)
values (126, 184);
insert into admin_advisor (advisorID, adminID)
values (212, 97);
insert into admin_advisor (advisorID, adminID)
values (233, 129);
insert into admin_advisor (advisorID, adminID)
values (179, 14);
insert into admin_advisor (advisorID, adminID)
values (114, 196);
insert into admin_advisor (advisorID, adminID)
values (141, 94);
insert into admin_advisor (advisorID, adminID)
values (65, 237);
insert into admin_advisor (advisorID, adminID)
values (121, 144);
insert into admin_advisor (advisorID, adminID)
values (88, 81);
insert into admin_advisor (advisorID, adminID)
values (44, 221);
insert into admin_advisor (advisorID, adminID)
values (211, 126);
insert into admin_advisor (advisorID, adminID)
values (171, 152);
insert into admin_advisor (advisorID, adminID)
values (65, 204);
insert into admin_advisor (advisorID, adminID)
values (232, 38);
insert into admin_advisor (advisorID, adminID)
values (190, 126);
insert into admin_advisor (advisorID, adminID)
values (150, 191);
insert into admin_advisor (advisorID, adminID)
values (122, 94);
insert into admin_advisor (advisorID, adminID)
values (243, 3);
insert into admin_advisor (advisorID, adminID)
values (163, 115);
insert into admin_advisor (advisorID, adminID)
values (207, 141);
insert into admin_advisor (advisorID, adminID)
values (216, 246);
insert into admin_advisor (advisorID, adminID)
values (240, 83);
insert into admin_advisor (advisorID, adminID)
values (126, 137);
insert into admin_advisor (advisorID, adminID)
values (186, 122);
insert into admin_advisor (advisorID, adminID)
values (118, 181);
insert into admin_advisor (advisorID, adminID)
values (47, 111);
insert into admin_advisor (advisorID, adminID)
values (78, 146);
insert into admin_advisor (advisorID, adminID)
values (87, 66);
insert into admin_advisor (advisorID, adminID)
values (189, 118);
insert into admin_advisor (advisorID, adminID)
values (137, 206);
insert into admin_advisor (advisorID, adminID)
values (94, 139);
insert into admin_advisor (advisorID, adminID)
values (176, 123);
insert into admin_advisor (advisorID, adminID)
values (234, 12);
insert into admin_advisor (advisorID, adminID)
values (156, 189);
insert into admin_advisor (advisorID, adminID)
values (123, 154);
insert into admin_advisor (advisorID, adminID)
values (113, 92);
insert into admin_advisor (advisorID, adminID)
values (89, 207);
insert into admin_advisor (advisorID, adminID)
values (206, 124);
insert into admin_advisor (advisorID, adminID)
values (223, 179);
insert into admin_advisor (advisorID, adminID)
values (129, 194);
insert into admin_advisor (advisorID, adminID)
values (194, 35);
insert into admin_advisor (advisorID, adminID)
values (34, 60);
insert into admin_advisor (advisorID, adminID)
values (16, 107);
insert into admin_advisor (advisorID, adminID)
values (157, 106);
insert into admin_advisor (advisorID, adminID)
values (14, 64);
insert into admin_advisor (advisorID, adminID)
values (31, 121);
insert into admin_advisor (advisorID, adminID)
values (158, 189);
insert into admin_advisor (advisorID, adminID)
values (26, 3);
insert into admin_advisor (advisorID, adminID)
values (114, 121);
insert into admin_advisor (advisorID, adminID)
values (22, 154);
insert into admin_advisor (advisorID, adminID)
values (240, 140);
insert into admin_advisor (advisorID, adminID)
values (112, 190);
insert into admin_advisor (advisorID, adminID)
values (35, 144);
insert into admin_advisor (advisorID, adminID)
values (31, 149);
insert into admin_advisor (advisorID, adminID)
values (41, 5);
insert into admin_advisor (advisorID, adminID)
values (25, 32);
insert into admin_advisor (advisorID, adminID)
values (245, 206);
insert into admin_advisor (advisorID, adminID)
values (19, 107);
insert into admin_advisor (advisorID, adminID)
values (13, 152);
insert into admin_advisor (advisorID, adminID)
values (62, 162);
insert into admin_advisor (advisorID, adminID)
values (137, 222);
insert into admin_advisor (advisorID, adminID)
values (62, 174);
insert into admin_advisor (advisorID, adminID)
values (206, 10);
insert into admin_advisor (advisorID, adminID)
values (248, 71);
insert into admin_advisor (advisorID, adminID)
values (14, 150);
insert into admin_advisor (advisorID, adminID)
values (76, 97);
insert into admin_advisor (advisorID, adminID)
values (243, 115);
insert into admin_advisor (advisorID, adminID)
values (183, 98);
insert into admin_advisor (advisorID, adminID)
values (23, 100);
insert into admin_advisor (advisorID, adminID)
values (100, 226);
insert into admin_advisor (advisorID, adminID)
values (232, 225);
insert into admin_advisor (advisorID, adminID)
values (183, 82);
insert into admin_advisor (advisorID, adminID)
values (224, 148);
insert into admin_advisor (advisorID, adminID)
values (25, 40);
insert into admin_advisor (advisorID, adminID)
values (218, 101);
insert into admin_advisor (advisorID, adminID)
values (57, 146);
insert into admin_advisor (advisorID, adminID)
values (228, 147);
insert into admin_advisor (advisorID, adminID)
values (217, 57);
insert into admin_advisor (advisorID, adminID)
values (196, 69);
insert into admin_advisor (advisorID, adminID)
values (156, 59);
insert into admin_advisor (advisorID, adminID)
values (2, 187);
insert into admin_advisor (advisorID, adminID)
values (110, 166);
insert into admin_advisor (advisorID, adminID)
values (52, 4);
insert into admin_advisor (advisorID, adminID)
values (239, 33);
insert into admin_advisor (advisorID, adminID)
values (63, 109);
insert into admin_advisor (advisorID, adminID)
values (201, 220);
insert into admin_advisor (advisorID, adminID)
values (177, 162);
insert into admin_advisor (advisorID, adminID)
values (138, 128);
insert into admin_advisor (advisorID, adminID)
values (104, 19);
insert into admin_advisor (advisorID, adminID)
values (124, 67);
insert into admin_advisor (advisorID, adminID)
values (61, 105);
insert into admin_advisor (advisorID, adminID)
values (209, 207);
insert into admin_advisor (advisorID, adminID)
values (43, 183);
insert into admin_advisor (advisorID, adminID)
values (179, 63);
insert into admin_advisor (advisorID, adminID)
values (133, 27);
insert into admin_advisor (advisorID, adminID)
values (204, 131);
insert into admin_advisor (advisorID, adminID)
values (152, 91);
insert into admin_advisor (advisorID, adminID)
values (46, 109);
insert into admin_advisor (advisorID, adminID)
values (48, 143);
insert into admin_advisor (advisorID, adminID)
values (202, 35);
insert into admin_advisor (advisorID, adminID)
values (91, 249);
insert into admin_advisor (advisorID, adminID)
values (242, 141);
insert into admin_advisor (advisorID, adminID)
values (44, 43);
insert into admin_advisor (advisorID, adminID)
values (148, 20);
insert into admin_advisor (advisorID, adminID)
values (34, 144);
insert into admin_advisor (advisorID, adminID)
values (138, 137);
insert into admin_advisor (advisorID, adminID)
values (47, 25);
insert into admin_advisor (advisorID, adminID)
values (225, 205);
insert into admin_advisor (advisorID, adminID)
values (90, 157);
insert into admin_advisor (advisorID, adminID)
values (16, 245);
insert into admin_advisor (advisorID, adminID)
values (241, 179);
insert into admin_advisor (advisorID, adminID)
values (213, 200);
insert into admin_advisor (advisorID, adminID)
values (92, 170);
insert into admin_advisor (advisorID, adminID)
values (14, 208);
insert into admin_advisor (advisorID, adminID)
values (157, 203);
insert into admin_advisor (advisorID, adminID)
values (191, 231);
insert into admin_advisor (advisorID, adminID)
values (111, 96);
insert into admin_advisor (advisorID, adminID)
values (136, 69);
insert into admin_advisor (advisorID, adminID)
values (229, 192);
insert into admin_advisor (advisorID, adminID)
values (73, 241);
insert into admin_advisor (advisorID, adminID)
values (155, 198);
insert into admin_advisor (advisorID, adminID)
values (33, 71);
insert into admin_advisor (advisorID, adminID)
values (225, 122);
insert into admin_advisor (advisorID, adminID)
values (164, 128);
insert into admin_advisor (advisorID, adminID)
values (100, 39);
insert into admin_advisor (advisorID, adminID)
values (186, 77);
insert into admin_advisor (advisorID, adminID)
values (223, 185);
insert into admin_advisor (advisorID, adminID)
values (197, 20);
insert into admin_advisor (advisorID, adminID)
values (159, 77);
insert into admin_advisor (advisorID, adminID)
values (58, 226);
insert into admin_advisor (advisorID, adminID)
values (28, 52);
insert into admin_advisor (advisorID, adminID)
values (70, 119);
insert into admin_advisor (advisorID, adminID)
values (245, 40);
insert into admin_advisor (advisorID, adminID)
values (183, 45);
insert into admin_advisor (advisorID, adminID)
values (137, 8);
insert into admin_advisor (advisorID, adminID)
values (170, 100);
insert into admin_advisor (advisorID, adminID)
values (139, 137);
insert into admin_advisor (advisorID, adminID)
values (38, 102);
insert into admin_advisor (advisorID, adminID)
values (164, 19);
insert into admin_advisor (advisorID, adminID)
values (219, 247);
insert into admin_advisor (advisorID, adminID)
values (60, 119);
insert into admin_advisor (advisorID, adminID)
values (224, 239);
insert into admin_advisor (advisorID, adminID)
values (215, 70);
insert into admin_advisor (advisorID, adminID)
values (134, 224);
insert into admin_advisor (advisorID, adminID)
values (243, 167);
insert into admin_advisor (advisorID, adminID)
values (216, 180);
insert into admin_advisor (advisorID, adminID)
values (198, 93);
insert into admin_advisor (advisorID, adminID)
values (229, 190);
insert into admin_advisor (advisorID, adminID)
values (249, 200);
insert into admin_advisor (advisorID, adminID)
values (134, 153);
insert into admin_advisor (advisorID, adminID)
values (46, 55);
insert into admin_advisor (advisorID, adminID)
values (198, 156);
insert into admin_advisor (advisorID, adminID)
values (100, 38);
insert into admin_advisor (advisorID, adminID)
values (136, 84);
insert into admin_advisor (advisorID, adminID)
values (131, 55);
insert into admin_advisor (advisorID, adminID)
values (240, 135);
insert into admin_advisor (advisorID, adminID)
values (222, 243);
insert into admin_advisor (advisorID, adminID)
values (200, 38);
insert into admin_advisor (advisorID, adminID)
values (166, 147);
insert into admin_advisor (advisorID, adminID)
values (246, 149);
insert into admin_advisor (advisorID, adminID)
values (152, 4);
insert into admin_advisor (advisorID, adminID)
values (92, 176);
insert into admin_advisor (advisorID, adminID)
values (178, 172);
insert into admin_advisor (advisorID, adminID)
values (58, 27);
insert into admin_advisor (advisorID, adminID)
values (76, 203);
insert into admin_advisor (advisorID, adminID)
values (59, 154);
insert into admin_advisor (advisorID, adminID)
values (118, 233);
insert into admin_advisor (advisorID, adminID)
values (157, 199);
insert into admin_advisor (advisorID, adminID)
values (151, 142);
insert into admin_advisor (advisorID, adminID)
values (227, 176);
insert into admin_advisor (advisorID, adminID)
values (180, 191);
insert into admin_advisor (advisorID, adminID)
values (7, 8);
insert into admin_advisor (advisorID, adminID)
values (9, 69);
insert into admin_advisor (advisorID, adminID)
values (236, 242);
insert into admin_advisor (advisorID, adminID)
values (7, 43);
insert into admin_advisor (advisorID, adminID)
values (186, 40);
insert into admin_advisor (advisorID, adminID)
values (209, 45);
insert into admin_advisor (advisorID, adminID)
values (76, 131);
insert into admin_advisor (advisorID, adminID)
values (172, 244);
insert into admin_advisor (advisorID, adminID)
values (4, 136);
insert into admin_advisor (advisorID, adminID)
values (183, 53);
insert into admin_advisor (advisorID, adminID)
values (66, 53);
insert into admin_advisor (advisorID, adminID)
values (58, 13);
insert into admin_advisor (advisorID, adminID)
values (25, 94);
insert into admin_advisor (advisorID, adminID)
values (182, 183);
insert into admin_advisor (advisorID, adminID)
values (167, 122);
insert into admin_advisor (advisorID, adminID)
values (116, 118);
insert into admin_advisor (advisorID, adminID)
values (82, 194);
insert into admin_advisor (advisorID, adminID)
values (185, 13);
insert into admin_advisor (advisorID, adminID)
values (132, 43);
insert into admin_advisor (advisorID, adminID)
values (155, 147);
insert into admin_advisor (advisorID, adminID)
values (142, 57);
insert into admin_advisor (advisorID, adminID)
values (219, 6);
insert into admin_advisor (advisorID, adminID)
values (31, 137);
insert into admin_advisor (advisorID, adminID)
values (29, 103);
insert into admin_advisor (advisorID, adminID)
values (248, 238);
insert into admin_advisor (advisorID, adminID)
values (65, 132);
insert into admin_advisor (advisorID, adminID)
values (46, 231);
insert into admin_advisor (advisorID, adminID)
values (113, 129);
insert into admin_advisor (advisorID, adminID)
values (222, 190);
insert into admin_advisor (advisorID, adminID)
values (96, 153);
insert into admin_advisor (advisorID, adminID)
values (133, 212);
insert into admin_advisor (advisorID, adminID)
values (50, 74);
insert into admin_advisor (advisorID, adminID)
values (55, 5);
insert into admin_advisor (advisorID, adminID)
values (97, 93);
insert into admin_advisor (advisorID, adminID)
values (173, 83);
insert into admin_advisor (advisorID, adminID)
values (62, 46);
insert into admin_advisor (advisorID, adminID)
values (177, 94);
insert into admin_advisor (advisorID, adminID)
values (132, 64);
insert into admin_advisor (advisorID, adminID)
values (191, 66);
insert into admin_advisor (advisorID, adminID)
values (224, 223);
insert into admin_advisor (advisorID, adminID)
values (10, 63);
insert into admin_advisor (advisorID, adminID)
values (239, 116);
insert into admin_advisor (advisorID, adminID)
values (86, 47);
insert into admin_advisor (advisorID, adminID)
values (180, 148);
insert into admin_advisor (advisorID, adminID)
values (74, 98);
insert into admin_advisor (advisorID, adminID)
values (178, 127);
insert into admin_advisor (advisorID, adminID)
values (202, 235);
insert into admin_advisor (advisorID, adminID)
values (227, 100);
insert into admin_advisor (advisorID, adminID)
values (24, 6);
insert into admin_advisor (advisorID, adminID)
values (107, 77);
insert into admin_advisor (advisorID, adminID)
values (127, 24);
insert into admin_advisor (advisorID, adminID)
values (198, 119);
insert into admin_advisor (advisorID, adminID)
values (244, 76);
insert into admin_advisor (advisorID, adminID)
values (219, 116);
insert into admin_advisor (advisorID, adminID)
values (156, 3);
insert into admin_advisor (advisorID, adminID)
values (50, 223);
insert into admin_advisor (advisorID, adminID)
values (59, 139);
insert into admin_advisor (advisorID, adminID)
values (144, 92);
insert into admin_advisor (advisorID, adminID)
values (215, 66);
insert into admin_advisor (advisorID, adminID)
values (218, 250);
insert into admin_advisor (advisorID, adminID)
values (182, 208);
insert into admin_advisor (advisorID, adminID)
values (174, 186);
insert into admin_advisor (advisorID, adminID)
values (90, 110);
insert into admin_advisor (advisorID, adminID)
values (138, 207);
insert into admin_advisor (advisorID, adminID)
values (96, 162);
insert into admin_advisor (advisorID, adminID)
values (243, 98);
insert into admin_advisor (advisorID, adminID)
values (103, 111);
insert into admin_advisor (advisorID, adminID)
values (55, 164);
insert into admin_advisor (advisorID, adminID)
values (226, 95);
insert into admin_advisor (advisorID, adminID)
values (231, 63);
insert into admin_advisor (advisorID, adminID)
values (232, 3);
insert into admin_advisor (advisorID, adminID)
values (103, 20);
insert into admin_advisor (advisorID, adminID)
values (187, 198);


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
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('824-89-3352', '711-498-3087', 'thugk0@prlog.org', '1969-10-22 12:35:03', '9534 Russell Plaza', 'La Esperanza',
        'Guanajuato', 'Mexico', '37900', 'Vin', 'Timothy', 'Hugk', 46);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('017-81-2423', '307-271-9905', 'ncristea1@ftc.gov', '1954-07-29 04:53:10', '0750 Cherokee Hill', 'Nanam', null,
        'North Korea', null, 'Pansie', 'Nalani', 'Cristea', 26);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('558-94-8049', '943-653-9814', 'dcarpenter2@addthis.com', '1957-06-28 10:13:25', '824 Mitchell Street',
        'Chơn Thành', null, 'Vietnam', null, 'Natala', 'Denys', 'Carpenter', 212);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('522-41-2707', '838-198-4961', 'nblewitt3@economist.com', '1962-08-08 16:48:36', '525 Vermont Center',
        'Santa Anita', 'Guanajuato', 'Mexico', '38900', 'Tallie', 'Noel', 'Blewitt', 26);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('103-54-8777', '224-937-8677', 'sgerhardt4@google.de', '1991-01-03 23:13:53', '063 Buena Vista Junction',
        'Lafia', null, 'Nigeria', null, 'Felix', 'Sandor', 'Gerhardt', 55);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('683-72-0446', '896-523-1384', 'ganthona5@soundcloud.com', '1947-05-22 00:35:47', '5915 Columbus Parkway',
        'Lulindi', null, 'Tanzania', null, 'Cori', 'Griffith', 'Anthona', 101);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('065-99-1028', '783-710-6328', 'drobez6@mashable.com', '1963-03-25 06:29:18', '502 Riverside Terrace',
        'Maoping', null, 'China', null, 'Saunders', 'Duffy', 'Robez', 221);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('223-08-9786', '294-813-4327', 'twheble7@noaa.gov', '1996-11-25 02:43:16', '3 Steensland Point', 'Nangang',
        null, 'China', null, 'Moritz', 'Tobie', 'Wheble', 66);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('487-27-6568', '105-428-0198', 'sbreyt8@goo.gl', '1952-09-30 14:33:07', '1432 American Ash Drive', 'Si Somdet',
        null, 'Thailand', '95130', 'Radcliffe', 'Seumas', 'Breyt', 134);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('596-43-5192', '856-783-2795', 'bnickoll9@simplemachines.org', '1985-02-07 09:19:31', '395 Clemons Road',
        'Nagarakembang', null, 'Indonesia', null, 'Jamie', 'Brigid', 'Nickoll', 2);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('394-68-8455', '274-116-1944', 'cvideana@bandcamp.com', '1990-03-06 14:38:20', '2 Gina Park', 'Toyós', null,
        'Honduras', null, 'Carlynne', 'Cora', 'Videan', 78);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('894-50-0677', '944-829-5284', 'aboutellb@google.com.au', '1971-04-15 04:12:23', '66 Merrick Alley', 'Puncan',
        null, 'Philippines', '9317', 'Verina', 'Aubry', 'Boutell', 196);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('674-10-9644', '811-772-9995', 'mmawbyc@blogspot.com', '1995-08-19 08:30:54', '9 Ruskin Park', 'Phumĭ Véal Srê',
        null, 'Cambodia', null, 'Sigmund', 'My', 'Mawby', 59);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('708-58-0673', '794-200-9820', 'ghalburtond@virginia.edu', '1965-10-22 13:46:23', '56265 1st Street', 'Birr',
        null, 'Ireland', 'R42', 'Dotti', 'Goran', 'Halburton', 88);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('552-56-7817', '463-596-6975', 'lriddele@icio.us', '1954-08-25 19:24:35', '9028 South Court', 'Youssoufia',
        null, 'Morocco', null, 'Edna', 'Lilias', 'Riddel', 29);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('541-77-9868', '438-696-5697', 'ccuelf@shinystat.com', '1958-05-08 07:39:51', '6402 Butterfield Plaza',
        'Victoria', null, 'Argentina', '3153', 'Micheline', 'Claudie', 'Cuel', 95);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('459-18-7734', '319-183-4337', 'dgronauerg@disqus.com', '1953-09-04 22:30:19', '2891 Bashford Street',
        'Krajan Dua Patempuran', null, 'Indonesia', null, 'Shelby', 'Danila', 'Gronauer', 52);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('484-66-3776', '631-354-4976', 'sbreedsh@mac.com', '1945-11-19 01:40:24', '78 Hanover Junction',
        'Shangyanzhuang', null, 'China', null, 'Virge', 'Shell', 'Breeds', 234);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('238-26-6284', '152-193-9085', 'nlanyoni@cnbc.com', '1982-04-06 18:18:18', '247 Mosinee Point', 'Layu', null,
        'China', null, 'Merline', 'Nancie', 'Lanyon', 242);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('332-49-4443', '442-701-3797', 'rbremnerj@ebay.co.uk', '1950-08-29 04:20:50', '0 Aberg Trail', 'Wailang', null,
        'China', null, 'Reece', 'Rozalin', 'Bremner', 228);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('852-91-3042', '841-704-1440', 'fgallenk@mit.edu', '1981-03-08 03:17:49', '6642 Blackbird Hill', 'Sam Phran',
        null, 'Thailand', '73110', 'Missie', 'Filbert', 'Gallen', 209);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('910-13-8902', '467-236-9988', 'zflowerdenl@goo.gl', '1977-03-25 14:02:58', '0949 Elka Road', 'Dūāb', null,
        'Afghanistan', null, 'Forster', 'Zorana', 'Flowerden', 181);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('392-13-1780', '644-302-6997', 'jbalchm@bloomberg.com', '1987-03-08 18:04:47', '85325 Hintze Hill', 'Nantai',
        null, 'China', null, 'Ives', 'Jeniece', 'Balch', 156);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('351-07-8397', '811-180-4164', 'awernhern@google.ru', '1992-10-20 10:50:41', '87174 Bellgrove Point',
        'Barbalha', null, 'Brazil', '63180-000', 'Lovell', 'Amalee', 'Wernher', 218);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('987-68-4436', '410-580-3955', 'iwelldrakeo@hugedomains.com', '1993-04-25 20:19:17', '940 Spaight Point',
        'El Asintal', null, 'Guatemala', '11009', 'Leighton', 'Issi', 'Welldrake', 163);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('232-62-9557', '326-144-1161', 'esarsonsp@qq.com', '1988-04-12 16:03:44', '4 Mendota Court', 'Eslāmābād', null,
        'Iran', null, 'Frieda', 'Eba', 'Sarsons', 52);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('293-84-4288', '214-759-1144', 'tbarkasq@google.ru', '1952-02-13 19:06:42', '44995 Sullivan Avenue', 'Bradag',
        null, 'Indonesia', null, 'Freedman', 'Tania', 'Barkas', 92);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('656-37-9556', '663-819-3564', 'lbindleyr@blogtalkradio.com', '1966-02-13 20:56:43', '50 Riverside Hill',
        'Zhoutie', null, 'China', null, 'Marga', 'Leland', 'Bindley', 170);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('034-09-7006', '327-316-7718', 'aattestones@deviantart.com', '1997-09-24 09:44:13', '64615 Loomis Junction',
        'Vostochnoe Degunino', null, 'Russia', '412184', 'Saunders', 'Abbie', 'Atte-Stone', 111);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('153-30-6324', '692-728-7011', 'nparadycet@comsenz.com', '1996-09-30 03:12:12', '31127 Independence Alley',
        'Al ‘Alamayn', null, 'Egypt', null, 'Wainwright', 'Natasha', 'Paradyce', 196);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('257-93-4954', '430-862-7698', 'dlysteu@mashable.com', '1966-10-16 15:58:36', '98 Hansons Plaza', 'Pasarkayu',
        null, 'Indonesia', null, 'Ellary', 'Dimitri', 'Lyste', 184);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('650-64-0005', '978-925-1353', 'wkennadyv@techcrunch.com', '1970-02-23 05:31:57', '4 Golf View Road', 'Kaulon',
        null, 'Indonesia', null, 'Jolyn', 'Wade', 'Kennady', 193);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('473-25-9442', '861-137-7559', 'mawtyw@themeforest.net', '1947-05-16 19:14:40', '39856 New Castle Way',
        'Huangbu', null, 'China', null, 'Jenica', 'Melloney', 'Awty', 140);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('388-76-9559', '923-358-2804', 'jretallackx@archive.org', '1999-04-30 17:52:25', '9 Grayhawk Avenue',
        'Majagual', null, 'Dominican Republic', '11604', 'Brand', 'Jacenta', 'Retallack', 160);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('151-35-4718', '631-770-2026', 'cparrishy@youku.com', '1981-05-02 10:00:16', '3887 Graedel Junction', 'Bagrāmī',
        null, 'Afghanistan', null, 'Morna', 'Caprice', 'Parrish', 142);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('260-53-9348', '411-894-2457', 'skittz@tinypic.com', '1981-07-25 05:54:20', '37 Lerdahl Plaza', 'Kaliasin',
        null, 'Indonesia', null, 'Talyah', 'Suzanne', 'Kitt', 1);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('079-32-3744', '185-482-6634', 'esquibbs10@flavors.me', '1982-03-28 14:05:31', '63 Waxwing Plaza', 'Tongjiang',
        null, 'China', null, 'Cleopatra', 'Ellary', 'Squibbs', 205);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('379-10-2648', '363-285-1366', 'baimeric11@ftc.gov', '1945-07-22 05:13:59', '50 Sauthoff Terrace', 'Kalawit',
        null, 'Philippines', '7124', 'Lorin', 'Bryn', 'Aimeric', 218);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('619-81-3275', '342-864-3991', 'rtattersfield12@ebay.co.uk', '1952-08-24 00:22:46', '5 Sunbrook Court',
        'Nurmijärvi', null, 'Finland', '01901', 'Constance', 'Reed', 'Tattersfield', 209);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('354-18-9996', '847-971-4371', 'rkildale13@vkontakte.ru', '1963-08-09 11:07:17', '3 Stuart Street',
        'Xiashixiang', null, 'China', null, 'Christel', 'Reeba', 'Kildale', 136);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('318-54-1628', '662-433-0533', 'vlammin14@cyberchimps.com', '1982-12-22 08:23:17', '4 Rigney Circle',
        'Prey Veng', null, 'Cambodia', null, 'Derrik', 'Valdemar', 'Lammin', 4);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('910-01-4803', '801-207-3433', 'nbraben15@accuweather.com', '1949-07-09 11:20:22', '63 Towne Pass', 'Kołbiel',
        null, 'Poland', '05-340', 'Dulcea', 'Nani', 'Braben', 40);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('634-71-0510', '870-149-3736', 'dosiaghail16@yahoo.com', '1994-04-26 10:39:59', '86 Florence Street', 'Fenggao',
        null, 'China', null, 'Daryl', 'Dixie', 'O''Siaghail', 107);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('000-63-2323', '560-299-0259', 'jbastistini17@paypal.com', '1992-11-26 13:55:41', '898 Oxford Crossing',
        'Limoeiro do Norte', null, 'Brazil', '62930-000', 'Johnath', 'Junie', 'Bastistini', 170);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('744-47-4647', '823-738-9671', 'mdavenhill18@narod.ru', '1979-10-07 22:48:19', '58458 Anzinger Center',
        'Ubon Ratchathani', null, 'Thailand', '67150', 'Nikki', 'Mandie', 'Davenhill', 103);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('235-23-4368', '708-957-0548', 'mineson19@multiply.com', '1987-11-24 19:39:46', '592 Barby Drive', 'Kinshasa',
        null, 'Democratic Republic of the Congo', null, 'Rakel', 'Matti', 'Ineson', 25);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('572-60-8968', '178-359-5688', 'tchrichton1a@sitemeter.com', '1973-03-13 05:02:07', '504 Sauthoff Avenue',
        'Dresden', 'Sachsen', 'Germany', '01156', 'Lucian', 'Timmie', 'Chrichton', 244);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('866-49-0066', '672-818-2347', 'pknapman1b@sogou.com', '1991-02-09 09:21:15', '7 Village Green Plaza', 'Tyvriv',
        null, 'Ukraine', null, 'Celka', 'Padriac', 'Knapman', 81);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('864-04-3280', '952-807-7902', 'esetch1c@unesco.org', '1953-02-06 23:27:51', '2159 Grayhawk Pass', 'Shuiyuan',
        null, 'China', null, 'Dacia', 'Edward', 'Setch', 245);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('573-43-6918', '996-676-1692', 'bholt1d@columbia.edu', '1959-11-07 09:08:29', '8 Russell Crossing',
        'Néa Flogitá', null, 'Greece', null, 'Isadore', 'Baxy', 'Holt', 184);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('901-71-7871', '103-683-6791', 'lwillden1e@mediafire.com', '1956-10-09 06:12:01', '4 Hoffman Lane', 'Kahama',
        null, 'Tanzania', null, 'Purcell', 'Lemmy', 'Willden', 133);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('968-51-8483', '893-586-2422', 'rbarthram1f@loc.gov', '1948-08-15 03:03:25', '32576 Schlimgen Way', 'Mramani',
        null, 'Comoros', null, 'Lothaire', 'Ricky', 'Barthram', 222);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('771-06-9681', '573-528-7599', 'kquinion1g@newsvine.com', '1952-12-25 11:28:21', '1 Clove Road', 'Ķegums', null,
        'Latvia', null, 'Tabina', 'Kienan', 'Quinion', 177);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('713-22-5206', '242-549-8142', 'hlighterness1h@google.com.au', '1954-04-03 03:53:52', '6 Hauk Parkway',
        'Béthune', 'Nord-Pas-de-Calais', 'France', '62404 CEDEX', 'Casandra', 'Herve', 'Lighterness', 22);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('816-63-8512', '457-729-2339', 'clayburn1i@ted.com', '1973-11-28 18:22:18', '3257 Arizona Court', 'Ifon', null,
        'Nigeria', null, 'Camille', 'Cairistiona', 'Layburn', 56);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('862-27-8210', '684-300-2982', 'kaimson1j@yale.edu', '1963-05-21 21:07:54', '8325 Prentice Lane', 'Khadīr',
        null, 'Afghanistan', null, 'Dorthy', 'Kirby', 'Aimson', 159);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('120-23-6399', '415-525-4739', 'dfrick1k@paginegialle.it', '1984-05-22 02:17:47', '46793 Rieder Alley', 'Solna',
        'Stockholm', 'Sweden', '169 35', 'Ilene', 'Delainey', 'Frick', 30);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('265-89-5035', '675-969-5541', 'drobbins1l@liveinternet.ru', '1952-06-09 05:36:22', '2661 Ridge Oak Road',
        'Mombasa', null, 'Kenya', null, 'Saloma', 'Delmar', 'Robbins', 105);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('831-82-0988', '535-890-0832', 'aamerici1m@indiatimes.com', '1998-04-10 08:17:13', '117 Troy Junction',
        'Sivers’k', null, 'Ukraine', null, 'Derrick', 'Agustin', 'Americi', 41);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('295-55-4660', '226-218-5616', 'snarraway1n@issuu.com', '1972-01-06 01:14:15', '2727 Golf View Road',
        'Askersund', 'Örebro', 'Sweden', '696 91', 'Sancho', 'Susette', 'Narraway', 74);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('714-53-4936', '540-806-7977', 'mcockshut1o@istockphoto.com', '1951-02-16 22:52:36', '84543 Iowa Point',
        'Xiaochengzi', null, 'China', null, 'Ford', 'Mace', 'Cockshut', 98);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('735-98-1943', '918-249-6927', 'sbewshaw1p@desdev.cn', '1986-06-15 05:22:12', '92357 Messerschmidt Trail',
        'Tulsa', 'Oklahoma', 'United States', '74184', 'Ad', 'Shara', 'Bewshaw', 208);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('511-48-1898', '373-564-3180', 'hwortley1q@ebay.com', '1977-04-18 09:41:10', '025 Almo Court',
        'Chervonopartyzans’k', null, 'Ukraine', null, 'Patrica', 'Hebert', 'Wortley', 215);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('265-70-5212', '713-392-6712', 'dagget1r@flickr.com', '1988-03-29 08:20:02', '1690 Hoffman Avenue', 'Shuibian',
        null, 'China', null, 'Lela', 'Deanne', 'Agget', 197);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('359-75-5201', '701-188-8010', 'tbowdon1s@yale.edu', '1949-12-14 08:11:32', '670 Dahle Alley', 'Bantog', null,
        'Philippines', '2445', 'Jim', 'Teresina', 'Bowdon', 93);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('025-33-7346', '411-878-7204', 'kbodocs1t@yahoo.co.jp', '1962-11-18 01:31:39', '47992 Mariners Cove Center',
        'Phu Luang', null, 'Thailand', '42230', 'Thaxter', 'Kristal', 'Bodocs', 68);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('689-44-4839', '445-410-6168', 'swatmough1u@dagondesign.com', '1948-01-31 14:19:05', '514 7th Way',
        'Zheleznogorsk', null, 'Russia', '307156', 'Bentley', 'Salvatore', 'Watmough', 70);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('652-38-0119', '971-842-7224', 'jcowmeadow1v@bluehost.com', '1978-04-08 00:54:27', '36 Stoughton Way', 'Dongxi',
        null, 'China', null, 'Vernen', 'Jacqui', 'Cowmeadow', 93);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('669-59-9689', '279-822-0303', 'hferreira1w@google.com.hk', '1985-08-09 19:29:58', '8009 Cottonwood Crossing',
        'Songgang', null, 'China', null, 'Marris', 'Ham', 'Ferreira', 12);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('381-80-1052', '535-541-9632', 'aflorio1x@webmd.com', '1974-02-01 12:13:43', '714 Utah Pass', 'Bolderaja', null,
        'Latvia', null, 'Lincoln', 'Ailene', 'Florio', 231);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('143-48-6793', '492-322-2391', 'bbalassi1y@qq.com', '1996-09-07 04:55:40', '3433 Sachs Hill', 'Shuangshipu',
        null, 'China', null, 'Hatty', 'Bonni', 'Balassi', 152);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('829-47-4080', '226-403-0361', 'cbottomley1z@mtv.com', '1959-08-21 21:33:17', '2 Southridge Trail', 'Astromil',
        'Porto', 'Portugal', '4585-794', 'Bryn', 'Colan', 'Bottomley', 122);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('210-12-7719', '924-841-6854', 'rnattrass20@ask.com', '1960-09-12 23:43:27', '1 Schmedeman Place', 'Manevychi',
        null, 'Ukraine', null, 'Heall', 'Rafa', 'Nattrass', 161);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('907-53-9916', '287-623-1000', 'choldworth21@smh.com.au', '1973-07-21 05:09:27', '0 Crownhardt Circle',
        'Ágio Pnévma', null, 'Greece', null, 'Laureen', 'Christean', 'Holdworth', 223);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('531-82-2797', '362-301-0632', 'bjaine22@cbsnews.com', '1958-10-30 00:33:36', '7 Eagan Pass', 'Ikalamavony',
        null, 'Madagascar', null, 'Hanan', 'Benjamin', 'Jaine', 49);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('937-78-7654', '274-320-5637', 'rdrohun23@ucoz.com', '1958-06-18 09:46:48', '9141 Norway Maple Road',
        'Неготино', null, 'Macedonia', '1236', 'Fan', 'Royce', 'Drohun', 48);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('201-03-0417', '891-700-0703', 'dsheffield24@bloglovin.com', '1984-01-31 05:24:43', '3416 Waxwing Plaza',
        'Santos Dumont', null, 'Brazil', '36240-000', 'Israel', 'Denis', 'Sheffield', 151);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('784-78-3458', '146-120-4664', 'ccamosso25@redcross.org', '1987-03-09 14:52:37', '95621 Summit Parkway',
        'Wujian', null, 'China', null, 'Brandea', 'Cayla', 'Camosso', 14);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('410-35-9853', '941-591-1069', 'npaternoster26@vkontakte.ru', '1998-06-22 06:52:43', '4334 Scoville Circle',
        'Sivers’k', null, 'Ukraine', null, 'Ki', 'Nina', 'Paternoster', 181);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('318-75-2963', '138-665-1097', 'mtrevett27@google.com.au', '1999-03-31 08:11:09', '341 Spenser Drive',
        'Fonteleite', 'Porto', 'Portugal', '4745-530', 'Augy', 'Morley', 'Trevett', 54);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('630-59-4449', '688-816-4114', 'jarbuckel28@dell.com', '1948-08-03 21:33:02', '8 Jenna Place', 'Jiaodai', null,
        'China', null, 'Bryce', 'Jodie', 'Arbuckel', 225);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('814-87-3814', '827-907-9153', 'bchatt29@ted.com', '1946-09-07 06:50:50', '19104 Evergreen Lane', 'Bartica',
        null, 'Guyana', null, 'Shelbi', 'Bibbie', 'Chatt', 85);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('255-92-3396', '314-403-1471', 'omatveyev2a@over-blog.com', '1979-08-12 08:37:21', '4518 Dovetail Lane',
        'Tongyang', null, 'China', null, 'Kippy', 'Orson', 'Matveyev', 160);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('647-69-4572', '396-227-3936', 'ehanigan2b@hao123.com', '1984-01-28 01:20:14', '5802 Golf Park', 'Placencia',
        null, 'Belize', null, 'Desiree', 'Eziechiele', 'Hanigan', 151);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('201-69-1408', '151-327-3505', 'jeidelman2c@imgur.com', '1974-12-12 11:25:24', '1 Lindbergh Avenue', 'Bozkow',
        null, 'Poland', '51-376', 'Daniela', 'Johann', 'Eidelman', 138);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('528-16-2857', '588-460-9038', 'nmellodey2d@msu.edu', '1988-02-22 11:16:46', '7 Marcy Hill', 'Marisgama', null,
        'Indonesia', null, 'Mill', 'Nealon', 'Mellodey', 203);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('267-56-0114', '943-813-8618', 'sbarlee2e@discovery.com', '1993-02-15 11:09:44', '752 Homewood Trail',
        'Gampang', null, 'Indonesia', null, 'Myrle', 'Sharron', 'Barlee', 150);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('691-21-4525', '380-849-6584', 'biban2f@tinypic.com', '1963-04-09 01:51:11', '99 Westend Road', 'Naha-shi',
        null, 'Japan', '903-0826', 'Pris', 'Brooks', 'Iban', 55);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('862-06-1411', '338-361-7499', 'scrutchfield2g@behance.net', '1953-01-30 01:59:27', '15398 Superior Court',
        'Sidamukti', null, 'Indonesia', null, 'Emmaline', 'Shea', 'Crutchfield', 30);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('636-15-8990', '714-949-7826', 'pscreech2h@123-reg.co.uk', '1976-05-19 08:38:00', '30 Oak Valley Crossing',
        'Węgorzyno', null, 'Poland', '73-155', 'Maddy', 'Paten', 'Screech', 41);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('221-51-2853', '156-839-3197', 'jlebond2i@godaddy.com', '1951-04-19 17:15:23', '65811 Welch Crossing',
        'Jacareí', null, 'Brazil', '12300-000', 'Keir', 'Josee', 'Lebond', 14);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('452-84-2158', '778-556-8351', 'crefford2j@imdb.com', '1982-03-02 09:06:21', '8 Debra Pass', 'Prosyana', null,
        'Ukraine', null, 'Teddie', 'Cullie', 'Refford', 191);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('098-54-9528', '914-268-4211', 'hroderham2k@dailymotion.com', '1970-07-15 22:30:59', '08 Schurz Park',
        'Salinas', null, 'Ecuador', null, 'Gibby', 'Hubert', 'Roderham', 21);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('774-13-8193', '597-874-6619', 'esturm2l@prnewswire.com', '1945-09-17 18:37:16', '5 Paget Plaza', 'Březová',
        null, 'Czech Republic', '747 44', 'Deeann', 'Esther', 'Sturm', 113);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('099-74-1313', '176-386-9135', 'ecastro2m@diigo.com', '1953-01-01 16:03:33', '8656 Harper Trail', 'G’uzor',
        null, 'Uzbekistan', null, 'Riordan', 'Edythe', 'Castro', 107);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('866-71-9312', '829-520-8047', 'eiglesias2n@europa.eu', '1967-10-29 06:13:51', '68 Nobel Street', 'Xankandi',
        null, 'Azerbaijan', null, 'Wayland', 'Emily', 'Iglesias', 31);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('355-88-2755', '805-361-8709', 'asemered2o@arizona.edu', '1970-08-01 21:54:24', '443 Luster Street',
        'Huanggang', null, 'China', null, 'Orin', 'Alvis', 'Semered', 166);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('579-92-0043', '226-805-1047', 'salexsandrov2p@nifty.com', '1976-04-10 20:07:27', '3084 Cottonwood Park',
        'Oebobo', null, 'Indonesia', null, 'Magdalene', 'Stafford', 'Alexsandrov', 57);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('557-07-2434', '803-347-4419', 'ematzl2q@yelp.com', '1991-03-29 08:44:45', '375 Orin Circle', 'Shirbīn', null,
        'Egypt', null, 'Tove', 'Elwood', 'Matzl', 100);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('879-84-1477', '504-134-4843', 'fshaxby2r@java.com', '1982-04-19 01:04:36', '2 Armistice Point', 'Nglengkir',
        null, 'Indonesia', null, 'Corbett', 'Fax', 'Shaxby', 67);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('449-20-0315', '450-171-0858', 'dbrimilcombe2s@tripadvisor.com', '1998-08-09 22:19:13', '03887 Debs Hill',
        'Shanglu', null, 'China', null, 'Allianora', 'Dael', 'Brimilcombe', 126);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('346-26-5851', '316-443-8600', 'gcorns2t@reference.com', '1954-10-07 05:17:32', '0 Sullivan Center',
        'Tiedonglu', null, 'China', null, 'Steffi', 'Gustavo', 'Corns', 108);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('803-52-5453', '653-121-4106', 'lepelett2u@topsy.com', '1959-03-25 03:54:28', '212 Esker Parkway', 'Bassar',
        null, 'Togo', null, 'Ludovico', 'Liane', 'Epelett', 164);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('263-63-3796', '454-955-3066', 'crudloff2v@bloglovin.com', '1964-04-10 18:19:07', '2 Florence Road', 'Güiria',
        null, 'Venezuela', null, 'Nolan', 'Clovis', 'Rudloff', 25);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('364-48-5940', '678-941-1564', 'reye2w@istockphoto.com', '1966-09-12 11:14:10', '6 Shoshone Pass', 'Vannes',
        'Bretagne', 'France', '56004 CEDEX', 'Arron', 'Riordan', 'Eye', 122);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('546-60-3441', '437-244-4862', 'shedditch2x@java.com', '1947-11-05 18:54:11', '96181 Crownhardt Park',
        'Itiruçu', null, 'Brazil', '45350-000', 'Kinsley', 'Shelley', 'Hedditch', 156);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('411-22-6898', '604-976-4295', 'rruane2y@devhub.com', '1978-04-18 07:14:30', '0160 Sherman Avenue', 'Bjästa',
        'Västernorrland', 'Sweden', '893 23', 'Keane', 'Rollins', 'Ruane', 68);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('355-99-9614', '735-125-9449', 'klytton2z@usda.gov', '1986-02-27 19:14:02', '58 Superior Circle', 'Flagstaff',
        null, 'South Africa', '4821', 'Baxie', 'Karly', 'Lytton', 26);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('331-92-5534', '768-753-0163', 'celis30@ifeng.com', '1978-10-31 14:34:58', '363 Jana Junction', 'Tauranga',
        null, 'New Zealand', '3144', 'Heinrik', 'Cecilla', 'Elis', 110);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('961-53-7839', '922-926-4535', 'kmattioli31@reuters.com', '1956-08-10 22:37:02', '738 Lillian Park', 'Acobamba',
        null, 'Peru', null, 'Moyna', 'Kalil', 'Mattioli', 190);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('134-27-7819', '640-282-8731', 'fsimanek32@arstechnica.com', '1988-06-29 08:37:05', '0 Welch Avenue',
        'Genisséa', null, 'Greece', null, 'Codi', 'Farica', 'Simanek', 136);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('861-55-9524', '296-930-2363', 'mjakeman33@reddit.com', '1955-09-01 06:08:35', '17844 Continental Circle',
        'Pule', null, 'Indonesia', null, 'Walden', 'Merrielle', 'Jakeman', 235);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('843-17-8110', '458-295-4988', 'dkemmer34@sohu.com', '1965-01-10 05:24:30', '8 Hintze Hill', 'Itabaiana', null,
        'Brazil', '49500-000', 'Sanderson', 'Drud', 'Kemmer', 36);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('943-09-5433', '852-489-1978', 'pjewsbury35@over-blog.com', '1948-08-03 23:05:58', '0623 Becker Point', 'Jami',
        null, 'Indonesia', null, 'Fran', 'Paxon', 'Jewsbury', 179);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('875-70-1124', '285-855-5395', 'darnholz36@toplist.cz', '1983-07-18 12:24:30', '99289 Debs Point',
        'Juan Adrián', null, 'Dominican Republic', '11506', 'Lionel', 'Dalila', 'Arnholz', 36);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('054-11-0682', '897-254-9646', 'lsexty37@nps.gov', '1954-09-07 11:25:15', '4822 Lawn Circle', 'Andahuaylas',
        null, 'Peru', null, 'Erastus', 'Leyla', 'Sexty', 117);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('834-81-4367', '356-880-6773', 'acarleton38@illinois.edu', '1973-09-20 13:12:49', '46 Dorton Trail', 'Tafeng',
        null, 'China', null, 'Mayne', 'Ariel', 'Carleton', 48);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('574-39-3634', '591-533-1820', 'vhaverson39@about.com', '1995-12-19 07:47:16', '57000 Crescent Oaks Place',
        'Aginskoye', null, 'Russia', '663580', 'Verna', 'Verene', 'Haverson', 52);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('562-33-9321', '783-587-7367', 'mhumes3a@typepad.com', '1959-05-30 21:29:28', '75 Gina Pass', 'Ресен', null,
        'Macedonia', '7320', 'Poppy', 'Mahmoud', 'Humes', 119);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('028-31-2123', '567-939-8848', 'wconstable3b@vistaprint.com', '1953-12-30 20:05:39', '3 Erie Park', 'Tongxing',
        null, 'China', null, 'Nancey', 'Wynny', 'Constable', 216);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('462-87-1608', '182-771-7281', 'smatthius3c@twitter.com', '1950-08-19 14:58:48', '68 Fairfield Circle',
        'Tanushimarumachi-toyoki', null, 'Japan', '839-1344', 'Shalom', 'Stillmann', 'Matthius', 135);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('474-39-3465', '677-358-0680', 'kpidwell3d@meetup.com', '1963-03-25 20:20:03', '9133 Union Parkway', 'Kumane',
        null, 'Serbia', null, 'Kristian', 'Karly', 'Pidwell', 117);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('087-83-3994', '982-439-6203', 'arecher3e@wisc.edu', '1979-08-10 04:28:55', '118 Ilene Alley', 'Tajrīsh', null,
        'Iran', null, 'Wilona', 'Abner', 'Recher', 174);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('137-98-8678', '982-388-9219', 'ckineton3f@nifty.com', '1981-05-10 23:47:23', '00965 Alpine Center', 'Shilong',
        null, 'China', null, 'Aubrey', 'Coletta', 'Kineton', 168);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('063-68-4538', '169-414-0144', 'ecopes3g@chron.com', '1995-07-04 17:51:31', '06 Clarendon Circle',
        'Palmas De Gran Canaria, Las', 'Canarias', 'Spain', '35005', 'Antonie', 'Elliot', 'Copes', 76);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('642-88-3527', '745-198-3185', 'edanilin3h@arstechnica.com', '1990-06-30 01:39:08', '45163 Waywood Place',
        'Navatat', null, 'Philippines', '0905', 'Nadeen', 'Eustace', 'Danilin', 5);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('550-72-7429', '918-250-7631', 'bspoure3i@networksolutions.com', '1957-11-07 08:49:36', '0 Kim Parkway',
        'Mayingzhuang', null, 'China', null, 'Dominique', 'Buddy', 'Spoure', 4);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('493-15-6178', '860-780-5894', 'ebeyne3j@disqus.com', '1952-12-14 07:06:25', '24 Express Junction', 'Yanwan',
        null, 'China', null, 'Elijah', 'Engracia', 'Beyne', 168);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('472-71-1584', '444-696-2826', 'nberesford3k@miibeian.gov.cn', '1991-04-06 00:15:25', '7677 Superior Place',
        'Det Udom', null, 'Thailand', '34160', 'Venita', 'Nelli', 'Beresford', 123);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('185-12-5813', '806-871-7356', 'kbebis3l@webeden.co.uk', '1983-01-05 02:03:54', '9 Gale Street', 'Konga', null,
        'Indonesia', null, 'Kristian', 'Kylen', 'Bebis', 167);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('850-72-2241', '241-927-2773', 'tranner3m@nydailynews.com', '1991-08-05 20:59:27', '30 Columbus Street',
        'Kadujangkung', null, 'Indonesia', null, 'Susie', 'Teddy', 'Ranner', 183);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('636-58-7521', '813-246-3798', 'sgrishukhin3n@bing.com', '1990-10-11 04:49:08', '7861 Grasskamp Court',
        'Vänersborg', 'Västra Götaland', 'Sweden', '462 22', 'Lauraine', 'Skipton', 'Grishukhin', 131);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('976-06-3488', '535-929-7283', 'cfaux3o@cnbc.com', '1964-07-17 08:41:14', '18783 Monterey Plaza', 'Gemuruh',
        null, 'Indonesia', null, 'Saw', 'Cherye', 'Faux', 120);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('348-85-6092', '623-510-0221', 'apiotr3p@skyrock.com', '1988-11-02 03:59:36', '42514 Quincy Junction',
        'Sampués', null, 'Colombia', '705079', 'Delbert', 'Aldin', 'Piotr', 129);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('310-16-0124', '423-999-0106', 'apougher3q@google.de', '1999-03-15 19:09:37', '1559 Dawn Place', 'Duzhou', null,
        'China', null, 'Lynnell', 'Annabella', 'Pougher', 241);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('979-44-9284', '503-851-3584', 'ecrevy3r@live.com', '1965-01-07 07:22:39', '34310 Dawn Drive', 'Muraharjo',
        null, 'Indonesia', null, 'Eimile', 'Eleonore', 'Crevy', 126);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('731-82-9894', '523-628-9822', 'sabramowsky3s@google.co.uk', '1961-11-09 01:25:53', '71907 Goodland Place',
        'Plavsk', null, 'Russia', '301477', 'Rollie', 'Suzette', 'Abramowsky', 174);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('306-35-8886', '747-344-1951', 'wmatasov3t@mediafire.com', '1949-02-01 06:28:13', '6 Haas Place',
        'Tekstil’shchiki', null, 'Russia', '678126', 'Phillip', 'Winonah', 'Matasov', 202);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('544-57-5805', '312-753-3873', 'kblazej3u@amazon.co.uk', '1945-04-01 14:01:28', '41 Nancy Way', 'Chicago',
        'Illinois', 'United States', '60663', 'Humberto', 'Kaine', 'Blazej', 106);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('339-12-9282', '504-272-0912', 'gsahlstrom3v@shop-pro.jp', '1967-02-11 19:36:19', '800 La Follette Parkway',
        'Jeseník', null, 'Czech Republic', '790 01', 'Delores', 'Gerry', 'Sahlstrom', 153);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('577-86-5029', '298-958-8425', 'rlobbe3w@washingtonpost.com', '1982-06-10 01:44:30', '3 Mayer Parkway',
        'Nakhon Pathom', null, 'Thailand', '40140', 'Marylou', 'Rosetta', 'Lobbe', 82);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('147-14-3483', '663-524-9238', 'kgagin3x@businessinsider.com', '1998-05-03 07:06:25', '4 Caliangt Terrace',
        'Doom', null, 'Indonesia', null, 'Ogden', 'Kean', 'Gagin', 1);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('589-39-9073', '769-426-1255', 'mlauder3y@redcross.org', '1969-02-21 07:16:22', '3 Meadow Ridge Trail', 'Ipala',
        null, 'Guatemala', '20011', 'Dov', 'Matteo', 'Lauder', 132);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('584-96-2102', '367-604-0439', 'mwilloughway3z@wikipedia.org', '1986-11-01 23:56:44', '3244 Sutteridge Court',
        'Zastron', null, 'South Africa', '9951', 'Cullie', 'Maure', 'Willoughway', 107);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('612-85-8563', '839-124-5582', 'shobben40@cocolog-nifty.com', '1975-02-18 10:38:25', '73145 Forster Junction',
        'Da’ao', null, 'China', null, 'Inna', 'Sherrie', 'Hobben', 229);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('357-89-3127', '504-405-0022', 'ttumbridge41@biglobe.ne.jp', '1989-05-18 08:13:55', '4 Buena Vista Place',
        'Shelabolikha', null, 'Russia', '659050', 'Garrick', 'Thia', 'Tumbridge', 242);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('543-68-6795', '257-154-1388', 'tespadater42@google.es', '1969-03-17 07:36:46', '97833 Mandrake Circle', 'Riga',
        null, 'Latvia', null, 'Calley', 'Tasia', 'Espadater', 14);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('150-26-0451', '301-680-8869', 'idopson43@godaddy.com', '1961-07-13 23:52:56', '47 Harbort Lane', 'Chaniá',
        null, 'Greece', null, 'Gianna', 'Imelda', 'Dopson', 192);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('727-45-6910', '927-889-7093', 'gtorr44@amazon.co.uk', '1984-10-23 05:51:20', '56 Clarendon Avenue',
        'Ārt Khwājah', null, 'Afghanistan', null, 'Hazlett', 'Gib', 'Torr', 18);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('432-22-2506', '274-163-3762', 'htrematick45@statcounter.com', '1960-03-17 20:01:50', '0184 Delladonna Circle',
        'Idenao', null, 'Cameroon', null, 'Anstice', 'Horatio', 'Trematick', 140);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('979-13-3002', '531-631-7005', 'smoscone46@kickstarter.com', '1978-08-06 00:32:23', '2 Katie Place', 'Augustów',
        null, 'Poland', '16-303', 'Jill', 'Sheila', 'Moscone', 93);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('548-99-4688', '202-793-2395', 'ldonalson47@posterous.com', '1999-08-14 03:53:59', '9891 Ohio Lane',
        'Washington', 'District of Columbia', 'United States', '20088', 'Jessy', 'Lolita', 'Donalson', 92);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('497-58-4738', '944-915-7968', 'gduff48@yellowbook.com', '1998-02-13 19:35:28', '288 West Parkway', 'Ngilengan',
        null, 'Indonesia', null, 'Urbanus', 'Gaile', 'Duff', 140);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('663-24-3951', '440-567-1413', 'pgeockle49@state.tx.us', '1949-09-16 11:52:36', '61 Warner Way',
        'Nowosielce-Gniewosz', null, 'Poland', '38-507', 'Danya', 'Patrica', 'Geockle', 162);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('278-96-8324', '535-500-3454', 'dclotworthy4a@icq.com', '1998-03-17 03:07:49', '0793 Washington Drive',
        'Santarém', null, 'Brazil', '58928-000', 'Ezekiel', 'Daffy', 'Clotworthy', 141);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('055-92-3529', '908-193-1269', 'clovewell4b@ihg.com', '1958-04-24 12:43:05', '20513 Canary Center', 'Brocēni',
        null, 'Latvia', null, 'Carlita', 'Codie', 'Lovewell', 238);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('964-73-5051', '709-890-7416', 'mpanketh4c@skyrock.com', '1962-07-22 21:11:22', '8 Susan Plaza', 'Rogoza', null,
        'Slovenia', '2327', 'Corabella', 'Mendy', 'Panketh', 161);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('777-50-4600', '385-861-2871', 'abywater4d@de.vu', '1985-07-20 21:19:38', '57 Loeprich Road', 'Trzciana', null,
        'Poland', '36-071', 'Cacilia', 'Anabelle', 'Bywater', 73);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('278-85-8709', '372-660-4146', 'bcurdell4e@bloglines.com', '1962-01-30 07:38:02', '57605 Katie Parkway',
        'Saint-Denis', 'Réunion', 'Reunion', '97471 CEDEX', 'Phoebe', 'Bridget', 'Curdell', 11);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('901-98-9354', '588-961-1626', 'khamnett4f@wikia.com', '1974-07-18 01:27:30', '46 Village Green Junction',
        'Myshkin', null, 'Russia', '152835', 'Emera', 'Kaine', 'Hamnett', 208);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('787-57-1878', '599-223-6112', 'gguild4g@myspace.com', '1978-07-26 21:14:50', '25 Novick Street', 'Lom Sak',
        null, 'Thailand', '67110', 'Lance', 'Gabriel', 'Guild', 117);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('116-20-0009', '538-189-3648', 'astrowan4h@plala.or.jp', '1956-07-28 20:26:06', '6263 Artisan Lane', 'Kathu',
        null, 'South Africa', '1033', 'Arnaldo', 'Alena', 'Strowan', 41);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('187-84-1734', '527-946-9085', 'gveall4i@hibu.com', '1961-10-21 07:58:07', '76941 Del Sol Pass', 'Camp Thorel',
        null, 'Mauritius', null, 'Teodora', 'Goddart', 'Veall', 3);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('825-73-1424', '902-894-7091', 'ebednall4j@umn.edu', '1994-02-01 03:35:56', '10 Lien Plaza', 'Maizuru', null,
        'Japan', '626-0072', 'Ariella', 'Edie', 'Bednall', 127);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('384-10-3586', '866-866-7512', 'lceaser4k@digg.com', '1980-08-12 10:18:16', '31613 Chive Parkway', 'Tulle',
        'Limousin', 'France', '19011 CEDEX', 'Georgena', 'Lilas', 'Ceaser', 50);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('107-88-8431', '276-285-0035', 'ysebire4l@google.fr', '1954-10-26 13:26:59', '18 Sundown Plaza', 'Ziyang', null,
        'China', null, 'Noami', 'Yorgos', 'Sebire', 67);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('929-05-1541', '935-844-4603', 'mlowers4m@miitbeian.gov.cn', '1997-07-21 11:44:54', '05139 Del Sol Crossing',
        'Gongchenqiao', null, 'China', null, 'Lauraine', 'Mark', 'Lowers', 8);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('083-60-1959', '420-929-9441', 'hmattessen4n@hugedomains.com', '1961-10-06 04:08:53', '59 Forest Run Park',
        'Voskehask', null, 'Armenia', null, 'Kipper', 'Horatio', 'Mattessen', 223);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('766-66-5589', '912-894-6369', 'hstannis4o@vk.com', '1975-05-18 16:11:53', '38 Eastlawn Pass', 'Mastaiciai',
        null, 'Lithuania', '60028', 'Annadiane', 'Hervey', 'Stannis', 243);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('518-01-2865', '393-587-6250', 'ebendig4p@i2i.jp', '1997-03-04 02:06:43', '34881 Valley Edge Court', 'Kozy',
        null, 'Poland', '43-340', 'Juliana', 'Em', 'Bendig', 98);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('940-13-8369', '315-430-7229', 'cvotier4q@bloomberg.com', '1960-05-05 07:59:40', '414 Beilfuss Drive',
        'Waoundé', null, 'Senegal', null, 'Tiff', 'Caritta', 'Votier', 7);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('404-04-3294', '492-507-4091', 'wpembridge4r@google.com.hk', '1960-07-06 20:09:06', '78720 Schmedeman Lane',
        'Umanday Centro', null, 'Philippines', '2415', 'Curtice', 'Wait', 'Pembridge', 44);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('415-08-8513', '848-344-9359', 'obodechon4s@goodreads.com', '1973-07-29 18:26:23', '8 Northland Parkway',
        'Khairpur', null, 'Pakistan', '65011', 'Artemas', 'Olin', 'Bodechon', 40);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('331-71-3816', '456-488-2800', 'cfearenside4t@boston.com', '1949-09-26 21:20:18', '83 Del Mar Center',
        'Wanling', null, 'China', null, 'Oren', 'Carina', 'Fearenside', 169);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('180-29-0400', '972-117-0886', 'dlinnell4u@businessweek.com', '1960-07-22 12:08:35', '195 Hermina Plaza',
        'Cipunglu', null, 'Indonesia', null, 'Huntlee', 'Dill', 'Linnell', 39);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('102-51-1866', '820-521-4031', 'mleathlay4v@whitehouse.gov', '1986-09-26 07:13:27', '01 Elgar Lane',
        'Trubchevsk', null, 'Russia', '242251', 'Davis', 'Michaelina', 'Leathlay', 135);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('017-22-4201', '156-520-2532', 'pkenewell4w@vimeo.com', '1957-07-05 23:58:50', '0264 Sommers Hill', 'Pawa',
        null, 'Philippines', '4501', 'Pryce', 'Patrizia', 'Kenewell', 160);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('479-05-8791', '986-319-8430', 'mlusher4x@webnode.com', '1989-09-18 12:23:48', '661 Acker Plaza', 'Socorro',
        null, 'Philippines', '8416', 'Rica', 'Marilee', 'Lusher', 164);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('795-22-5622', '967-145-4480', 'cdabinett4y@dailymail.co.uk', '1963-09-21 18:50:17', '79774 Kipling Crossing',
        'Amahusu', null, 'Indonesia', null, 'Linnie', 'Carla', 'Dabinett', 57);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('518-15-2739', '895-618-7279', 'esimoncello4z@angelfire.com', '1969-05-10 22:53:09', '8718 Crest Line Plaza',
        'Bonak', null, 'Indonesia', null, 'Andras', 'Elia', 'Simoncello', 2);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('917-80-9556', '414-616-4061', 'lmulberry50@angelfire.com', '1963-05-03 14:23:26', '29 Namekagon Court',
        'Seteluk Tengah', null, 'Indonesia', null, 'Wilt', 'Lavena', 'Mulberry', 222);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('607-45-3827', '352-809-8827', 'voconor51@stumbleupon.com', '1960-10-04 15:20:16', '229 Bellgrove Point',
        'Gainesville', 'Florida', 'United States', '32605', 'Marissa', 'Vlad', 'O''Conor', 213);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('201-01-2675', '941-829-3810', 'imaguire52@accuweather.com', '1982-08-29 00:06:16', '1030 Laurel Park',
        'Diawara', null, 'Senegal', null, 'Reynold', 'Isabelita', 'Maguire', 73);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('210-33-0777', '673-855-0380', 'pdallan53@godaddy.com', '1976-05-26 18:22:18', '0455 Sycamore Avenue',
        'Qintong', null, 'China', null, 'Hortense', 'Putnam', 'Dallan', 170);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('797-80-6272', '952-363-7477', 'jgiraudel54@time.com', '1949-03-08 10:18:43', '6 Browning Street',
        'Kiarajangkung', null, 'Indonesia', null, 'Marlon', 'Janet', 'Giraudel', 85);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('773-50-7214', '711-451-8667', 'nsutehall55@yahoo.co.jp', '1956-08-10 14:41:07', '38578 Bartelt Road',
        'Leuwipicung', null, 'Indonesia', null, 'Dory', 'Nolan', 'Sutehall', 46);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('763-06-4614', '937-878-3994', 'anunan56@noaa.gov', '1971-01-31 08:45:39', '1173 Esker Junction', 'Chinch''ŏn',
        null, 'South Korea', null, 'Killy', 'Archambault', 'Nunan', 160);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('463-45-3530', '189-621-5624', 'ecosgriff57@flavors.me', '1949-10-31 09:20:38', '20597 Northfield Place',
        'Bang Yai', null, 'Thailand', '11140', 'Cloe', 'Emlynne', 'Cosgriff', 9);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('975-80-6766', '689-974-7605', 'fbantham58@twitter.com', '1984-09-18 18:31:32', '57103 Summer Ridge Drive',
        'Xinghua', null, 'China', null, 'Nevin', 'Fraser', 'Bantham', 91);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('453-93-0188', '395-971-6196', 'thecks59@comcast.net', '1974-08-28 11:52:50', '8 Mandrake Terrace', 'El Cacao',
        null, 'Dominican Republic', '11511', 'Jorie', 'Tomasine', 'Hecks', 18);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('011-41-0090', '894-673-9983', 'rcolthurst5a@sina.com.cn', '1991-06-07 01:10:07', '629 Old Gate Center',
        'Ambulong', null, 'Philippines', '4234', 'Hans', 'Randa', 'Colthurst', 166);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('161-07-3056', '972-914-9736', 'gsmickle5b@who.int', '1960-03-01 14:26:20', '317 Grover Trail', 'Nurota Shahri',
        null, 'Uzbekistan', null, 'Lucille', 'Grantham', 'Smickle', 13);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('462-82-7020', '426-758-2102', 'jcommander5c@moonfruit.com', '1958-05-17 18:52:53', '19 Park Meadow Trail',
        'Al Bawīţī', null, 'Egypt', null, 'Eleen', 'June', 'Commander', 43);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('924-66-1764', '670-960-8160', 'ecardenas5d@google.it', '1996-10-13 04:41:00', '42249 Fairview Circle',
        'Janakkala', null, 'Finland', '14240', 'Giorgia', 'Eldin', 'Cardenas', 247);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('269-04-6513', '104-868-6518', 'cjanosevic5e@altervista.org', '1965-07-15 22:40:58', '521 7th Trail',
        'Grivenskaya', null, 'Russia', '353798', 'Selene', 'Chlo', 'Janosevic', 77);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('474-55-7054', '908-919-5732', 'sbrushfield5f@samsung.com', '1965-02-11 18:43:34', '28130 Anderson Pass',
        'Thị Trấn Mộc Châu', null, 'Vietnam', null, 'Jen', 'Sheeree', 'Brushfield', 189);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('054-96-1836', '759-388-9450', 'aparsons5g@fda.gov', '1990-07-12 09:53:45', '314 Merchant Alley', 'Campbellton',
        'New Brunswick', 'Canada', 'E3N', 'Friederike', 'Alia', 'Parsons', 70);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('368-69-4958', '166-281-5393', 'dbessell5h@mashable.com', '1976-08-09 04:55:01', '73 Becker Plaza', 'Ferbane',
        null, 'Ireland', 'E32', 'Luella', 'Doralynne', 'Bessell', 68);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('370-41-5326', '579-462-6291', 'aminette5i@virginia.edu', '1971-02-19 06:15:13', '9091 Weeping Birch Trail',
        'Mahong', null, 'China', null, 'Tarra', 'Arliene', 'Minette', 144);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('222-31-3531', '439-941-4182', 'dlanyon5j@slideshare.net', '1991-09-27 21:34:20', '970 Northport Road',
        'Socorro', null, 'Brazil', '13960-000', 'Vanessa', 'Daisy', 'Lanyon', 87);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('498-84-7841', '553-740-0977', 'wclewlow5k@ucla.edu', '1958-02-15 11:46:43', '2419 Fallview Terrace', 'Mouquim',
        'Braga', 'Portugal', '4770-354', 'Andee', 'Wilek', 'Clewlow', 110);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('212-71-2767', '149-529-7229', 'laxelbey5l@indiegogo.com', '1952-02-24 07:41:01', '64618 Golden Leaf Terrace',
        'Bieqiao', null, 'China', null, 'Celina', 'Lilyan', 'Axelbey', 126);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('871-93-0031', '173-346-3421', 'aosipov5m@prlog.org', '1983-05-21 06:52:08', '39 Vernon Trail', 'Mosopa', null,
        'Botswana', null, 'Darius', 'Aigneis', 'Osipov', 169);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('888-21-3232', '821-208-2726', 'ogilchrest5n@mail.ru', '1989-09-09 16:21:08', '414 Dapin Avenue', 'Uiasa', null,
        'Indonesia', null, 'Dalenna', 'Orelie', 'Gilchrest', 10);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('746-79-0760', '504-317-4883', 'rheaven5o@gizmodo.com', '1958-10-03 23:12:21', '7643 Dovetail Plaza', 'Kario',
        null, 'Pakistan', '50251', 'Ertha', 'Ranique', 'Heaven', 151);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('833-98-4734', '347-157-7880', 'dcrassweller5p@vkontakte.ru', '1978-10-10 13:20:35', '53761 Thierer Road',
        'Venlo', 'Provincie Limburg', 'Netherlands', '5904', 'Katrine', 'Deck', 'Crassweller', 142);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('814-48-4422', '850-811-3874', 'ccearley5q@wunderground.com', '1950-01-11 19:41:33', '65 6th Point', 'Helie',
        null, 'China', null, 'Bonni', 'Cassandra', 'Cearley', 93);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('510-92-0353', '635-568-8195', 'rjansen5r@chron.com', '1960-07-20 12:55:53', '7803 Waubesa Terrace',
        'Villa Santa Rita', null, 'Argentina', '4600', 'Ario', 'Ricky', 'Jansen', 233);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('116-10-5383', '430-397-3053', 'ochomiszewski5s@timesonline.co.uk', '1980-04-23 23:00:49',
        '8240 Forest Run Drive', 'Puteran Kidul', null, 'Indonesia', null, 'Lorry', 'Odey', 'Chomiszewski', 4);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('887-88-9965', '300-333-4811', 'mgriston5t@123-reg.co.uk', '1946-11-07 12:15:31', '62716 Calypso Way',
        'Mairana', null, 'Bolivia', null, 'Freddy', 'Mohammed', 'Griston', 181);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('322-39-4928', '830-510-8400', 'cbaison5u@spiegel.de', '1998-11-02 14:33:52', '44525 Southridge Street',
        'Dajanrurung', null, 'Indonesia', null, 'Phaedra', 'Cairistiona', 'Baison', 108);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('289-55-6009', '264-367-6573', 'pjellicorse5v@tuttocitta.it', '1950-10-27 00:09:48', '1077 Forest Run Circle',
        'Krinichnaya', null, 'Ukraine', null, 'Berke', 'Pace', 'Jellicorse', 33);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('977-02-1129', '926-295-9484', 'syakushkin5w@dot.gov', '1997-05-22 07:35:10', '81 Westerfield Junction',
        'Lesuhe', null, 'China', null, 'Jsandye', 'Shanta', 'Yakushkin', 148);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('385-51-5405', '762-438-4355', 'zritchley5x@stumbleupon.com', '1976-02-14 23:07:08', '86 High Crossing Court',
        'Tuanjie', null, 'China', null, 'Jaquelyn', 'Zebulen', 'Ritchley', 96);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('982-28-3093', '359-824-6775', 'adeamaya5y@constantcontact.com', '1991-09-28 07:01:21',
        '8014 Stone Corner Hill', 'Kafachan', null, 'Nigeria', null, 'Ranna', 'Arlee', 'de Amaya', 36);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('124-20-2533', '330-554-3124', 'bfennell5z@businessinsider.com', '1988-12-23 05:12:07', '8995 Eggendart Pass',
        'Arras', 'Nord-Pas-de-Calais', 'France', '62972 CEDEX 9', 'Barnaby', 'Brade', 'Fennell', 13);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('381-96-2034', '727-351-4743', 'cparidge60@posterous.com', '1980-05-23 03:00:53', '60389 Hollow Ridge Alley',
        'Ilopango', null, 'El Salvador', null, 'Eberhard', 'Clarabelle', 'Paridge', 148);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('790-89-6017', '958-264-9399', 'sdaal61@e-recht24.de', '1998-01-29 20:19:06', '0 Vahlen Terrace', 'Paris 15',
        'Île-de-France', 'France', '75509 CEDEX 15', 'Tymon', 'Skye', 'Daal', 105);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('859-32-9068', '692-184-2236', 'mfrankton62@wsj.com', '1955-02-15 06:16:37', '5 Ludington Court', 'Kalanguy',
        null, 'Russia', '674553', 'Chevy', 'Merrick', 'Frankton', 27);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('427-96-3741', '261-845-1819', 'fweare63@tinyurl.com', '1983-10-09 07:30:05', '38556 Shasta Drive', 'Nantes',
        'Pays de la Loire', 'France', '44036 CEDEX 1', 'Alia', 'Fredia', 'Weare', 230);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('051-16-2961', '356-760-4495', 'rgregoraci64@umn.edu', '1993-07-03 16:04:00', '63 Basil Parkway', 'Lyon',
        'Rhône-Alpes', 'France', '69345 CEDEX 07', 'Corbin', 'Rock', 'Gregoraci', 139);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('152-00-4475', '561-695-9804', 'pjansky65@cbslocal.com', '1986-08-29 18:00:48', '027 Forest Court',
        'Canavieiras', null, 'Brazil', '45860-000', 'Hart', 'Paxton', 'Jansky', 25);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('250-35-8480', '542-269-9042', 'llush66@vkontakte.ru', '1965-08-30 16:24:23', '82 Vernon Trail', 'San Fernando',
        null, 'Philippines', '8711', 'Veradis', 'Latrina', 'Lush', 241);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('209-33-4255', '644-112-9117', 'mgaisford67@ovh.net', '1956-08-22 19:30:47', '13342 Farmco Center', 'Auas',
        null, 'Honduras', null, 'Lindsay', 'Mireille', 'Gaisford', 201);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('457-83-3276', '514-843-7256', 'ltreeby68@scribd.com', '1996-11-22 09:54:14', '51148 Green Ridge Lane',
        'Daveluyville', 'Québec', 'Canada', 'R3P', 'Tish', 'Liane', 'Treeby', 88);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('958-65-3767', '748-929-8699', 'jwaldie69@vinaora.com', '1978-04-25 20:59:09', '15709 Ridge Oak Parkway',
        'Paris 16', 'Île-de-France', 'France', '75784 CEDEX 16', 'Maxie', 'Janaya', 'Waldie', 90);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('878-47-5010', '488-290-4315', 'oacom6a@wix.com', '1955-05-28 02:08:00', '38 Jay Plaza', 'Jiujie', null,
        'China', null, 'Gleda', 'Otha', 'Acom', 42);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('668-61-0784', '433-669-0513', 'smccaffrey6b@yolasite.com', '1997-12-29 07:59:15', '5 Kenwood Parkway', 'Biga',
        null, 'Philippines', '7031', 'Rollo', 'Sigismond', 'McCaffrey', 30);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('405-95-9713', '497-149-8910', 'srate6c@nationalgeographic.com', '1988-06-30 02:13:53', '398 Sauthoff Parkway',
        'Cartí Suitupo', null, 'Panama', null, 'Adriena', 'Shellysheldon', 'Rate', 139);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('269-78-4402', '275-413-2232', 'atames6d@guardian.co.uk', '1969-09-01 10:13:25', '986 Melrose Road',
        'Włocławek', null, 'Poland', '87-822', 'Tedda', 'Ad', 'Tames', 60);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('989-06-1647', '977-323-1170', 'cmoultrie6e@illinois.edu', '1967-07-04 04:43:47', '50 Union Place', 'Plast',
        null, 'Russia', '457031', 'Nikaniki', 'Celinda', 'Moultrie', 243);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('487-58-9822', '272-865-1267', 'khumes6f@opensource.org', '1999-06-18 10:01:18', '22559 Boyd Trail',
        'Gunjur Kuta', null, 'Gambia', null, 'Allison', 'Kore', 'Humes', 176);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('842-10-8375', '712-454-8943', 'kchopy6g@feedburner.com', '1956-02-01 23:21:18', '4261 Crescent Oaks Way',
        'Doro Oo', null, 'Indonesia', null, 'Laurena', 'Ki', 'Chopy', 123);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('913-88-6217', '127-938-1273', 'hboffey6h@woothemes.com', '1970-12-23 02:31:56', '605 Loomis Junction',
        'Bolszewo', null, 'Poland', '84-239', 'Robin', 'Honoria', 'Boffey', 133);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('436-00-2671', '206-517-2879', 'swraith6i@geocities.jp', '1978-08-11 07:46:25', '701 Delladonna Avenue',
        'Lianhua', null, 'China', null, 'Leese', 'Stearne', 'Wraith', 149);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('886-05-6074', '491-557-4004', 'rbassick6j@nsw.gov.au', '1985-12-02 18:06:57', '019 Vahlen Circle', 'Mörön',
        null, 'Mongolia', null, 'Celie', 'Reyna', 'Bassick', 80);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('095-94-9659', '153-674-4146', 'hhegden6k@shutterfly.com', '1946-08-21 12:50:24', '44 Bonner Way', 'Wuyao',
        null, 'China', null, 'Udall', 'Hort', 'Hegden', 110);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('548-82-5769', '234-972-6567', 'cstoggles6l@google.ca', '1971-03-24 18:33:55', '67058 Sugar Avenue',
        'Eskilstuna', 'Södermanland', 'Sweden', '635 11', 'Coleman', 'Cozmo', 'Stoggles', 156);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('473-25-4893', '335-597-7690', 'cmcgawn6m@hugedomains.com', '1967-01-13 03:16:24', '7 Park Meadow Center',
        'Huotian', null, 'China', null, 'Gabriel', 'Cordelie', 'McGawn', 201);
insert into client (ssn, phone_number, email, birthdate, street_address, city, state, country, postal_code, first_name,
                    middle_name, last_name, advisorID)
values ('143-55-2032', '493-267-5274', 'ispinnace6n@dion.ne.jp', '1977-08-20 15:12:14', '42966 Sachs Lane', 'Macapá',
        null, 'Brazil', '68900-000', 'Rabi', 'Ignace', 'Spinnace', 114);


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
insert into portfolio (name, clientID)
values ('molestie', 170);
insert into portfolio (name, clientID)
values ('mi nulla ac enim in', 153);
insert into portfolio (name, clientID)
values ('nonummy integer non velit', 238);
insert into portfolio (name, clientID)
values ('vitae', 26);
insert into portfolio (name, clientID)
values ('in', 172);
insert into portfolio (name, clientID)
values ('convallis', 37);
insert into portfolio (name, clientID)
values ('porttitor lorem', 200);
insert into portfolio (name, clientID)
values ('nulla dapibus', 103);
insert into portfolio (name, clientID)
values ('nec nisi', 201);
insert into portfolio (name, clientID)
values ('bibendum felis sed', 36);
insert into portfolio (name, clientID)
values ('magna', 215);
insert into portfolio (name, clientID)
values ('aliquam quis', 152);
insert into portfolio (name, clientID)
values ('rutrum', 226);
insert into portfolio (name, clientID)
values ('mi in', 159);
insert into portfolio (name, clientID)
values ('morbi quis tortor id', 89);
insert into portfolio (name, clientID)
values ('tempus', 41);
insert into portfolio (name, clientID)
values ('feugiat non pretium', 129);
insert into portfolio (name, clientID)
values ('nullam', 189);
insert into portfolio (name, clientID)
values ('nec sem duis', 125);
insert into portfolio (name, clientID)
values ('in hac habitasse platea dictumst', 132);
insert into portfolio (name, clientID)
values ('suspendisse', 236);
insert into portfolio (name, clientID)
values ('maecenas ut massa', 195);
insert into portfolio (name, clientID)
values ('penatibus et magnis dis', 77);
insert into portfolio (name, clientID)
values ('id consequat in', 198);
insert into portfolio (name, clientID)
values ('rutrum rutrum neque aenean auctor', 186);
insert into portfolio (name, clientID)
values ('convallis', 131);
insert into portfolio (name, clientID)
values ('nam', 19);
insert into portfolio (name, clientID)
values ('ac nibh fusce lacus', 131);
insert into portfolio (name, clientID)
values ('sed accumsan felis ut at', 98);
insert into portfolio (name, clientID)
values ('aliquet maecenas leo', 146);
insert into portfolio (name, clientID)
values ('dolor', 53);
insert into portfolio (name, clientID)
values ('quis justo', 33);
insert into portfolio (name, clientID)
values ('turpis', 160);
insert into portfolio (name, clientID)
values ('morbi vestibulum velit id pretium', 109);
insert into portfolio (name, clientID)
values ('a', 68);
insert into portfolio (name, clientID)
values ('diam cras pellentesque volutpat', 222);
insert into portfolio (name, clientID)
values ('scelerisque quam turpis adipiscing', 6);
insert into portfolio (name, clientID)
values ('amet lobortis sapien sapien non', 115);
insert into portfolio (name, clientID)
values ('odio consequat varius integer ac', 160);
insert into portfolio (name, clientID)
values ('erat eros viverra', 209);
insert into portfolio (name, clientID)
values ('eu orci mauris lacinia sapien', 32);
insert into portfolio (name, clientID)
values ('consequat metus sapien ut nunc', 182);
insert into portfolio (name, clientID)
values ('dictumst maecenas ut massa quis', 30);
insert into portfolio (name, clientID)
values ('eget semper rutrum nulla', 167);
insert into portfolio (name, clientID)
values ('consequat morbi a ipsum integer', 123);
insert into portfolio (name, clientID)
values ('sit', 159);
insert into portfolio (name, clientID)
values ('quis orci', 35);
insert into portfolio (name, clientID)
values ('sem mauris laoreet ut', 107);
insert into portfolio (name, clientID)
values ('lacus at velit vivamus vel', 28);
insert into portfolio (name, clientID)
values ('lectus aliquam', 209);
insert into portfolio (name, clientID)
values ('pede ullamcorper augue', 80);
insert into portfolio (name, clientID)
values ('pharetra magna vestibulum', 16);
insert into portfolio (name, clientID)
values ('id', 234);
insert into portfolio (name, clientID)
values ('non ligula pellentesque ultrices', 195);
insert into portfolio (name, clientID)
values ('sapien', 131);
insert into portfolio (name, clientID)
values ('consectetuer adipiscing elit proin risus', 63);
insert into portfolio (name, clientID)
values ('iaculis congue vivamus', 87);
insert into portfolio (name, clientID)
values ('pulvinar lobortis est', 106);
insert into portfolio (name, clientID)
values ('eget eros elementum pellentesque quisque', 155);
insert into portfolio (name, clientID)
values ('velit id pretium iaculis diam', 223);
insert into portfolio (name, clientID)
values ('in hac habitasse platea', 25);
insert into portfolio (name, clientID)
values ('quam fringilla rhoncus', 114);
insert into portfolio (name, clientID)
values ('sed interdum venenatis', 54);
insert into portfolio (name, clientID)
values ('leo maecenas pulvinar lobortis', 57);
insert into portfolio (name, clientID)
values ('tortor id nulla ultrices aliquet', 215);
insert into portfolio (name, clientID)
values ('duis', 129);
insert into portfolio (name, clientID)
values ('cursus id turpis integer aliquet', 208);
insert into portfolio (name, clientID)
values ('mollis molestie lorem quisque', 87);
insert into portfolio (name, clientID)
values ('mi nulla ac enim', 93);
insert into portfolio (name, clientID)
values ('quam fringilla rhoncus', 135);
insert into portfolio (name, clientID)
values ('commodo placerat praesent blandit nam', 203);
insert into portfolio (name, clientID)
values ('posuere', 155);
insert into portfolio (name, clientID)
values ('lacus', 11);
insert into portfolio (name, clientID)
values ('id mauris', 146);
insert into portfolio (name, clientID)
values ('vitae nisi', 139);
insert into portfolio (name, clientID)
values ('amet erat', 229);
insert into portfolio (name, clientID)
values ('nibh in lectus', 51);
insert into portfolio (name, clientID)
values ('erat nulla', 141);
insert into portfolio (name, clientID)
values ('integer tincidunt ante vel', 62);
insert into portfolio (name, clientID)
values ('non', 121);
insert into portfolio (name, clientID)
values ('nulla suspendisse potenti cras in', 62);
insert into portfolio (name, clientID)
values ('orci', 227);
insert into portfolio (name, clientID)
values ('blandit lacinia erat vestibulum', 208);
insert into portfolio (name, clientID)
values ('orci luctus et ultrices', 234);
insert into portfolio (name, clientID)
values ('congue', 133);
insert into portfolio (name, clientID)
values ('in', 18);
insert into portfolio (name, clientID)
values ('id sapien in sapien iaculis', 19);
insert into portfolio (name, clientID)
values ('justo in blandit ultrices', 8);
insert into portfolio (name, clientID)
values ('nec', 211);
insert into portfolio (name, clientID)
values ('rutrum', 8);
insert into portfolio (name, clientID)
values ('diam', 172);
insert into portfolio (name, clientID)
values ('nulla sed accumsan felis', 219);
insert into portfolio (name, clientID)
values ('vitae nisl aenean lectus', 38);
insert into portfolio (name, clientID)
values ('venenatis lacinia aenean sit amet', 88);
insert into portfolio (name, clientID)
values ('neque aenean auctor gravida sem', 19);
insert into portfolio (name, clientID)
values ('sollicitudin vitae consectetuer eget rutrum', 231);
insert into portfolio (name, clientID)
values ('ut tellus nulla', 217);
insert into portfolio (name, clientID)
values ('elit proin interdum', 168);
insert into portfolio (name, clientID)
values ('aliquet maecenas leo', 232);
insert into portfolio (name, clientID)
values ('mauris non', 151);
insert into portfolio (name, clientID)
values ('convallis', 243);
insert into portfolio (name, clientID)
values ('nascetur', 145);
insert into portfolio (name, clientID)
values ('sit amet', 135);
insert into portfolio (name, clientID)
values ('erat vestibulum sed magna at', 32);
insert into portfolio (name, clientID)
values ('justo nec', 1);
insert into portfolio (name, clientID)
values ('urna pretium nisl ut volutpat', 212);
insert into portfolio (name, clientID)
values ('sem mauris laoreet ut', 111);
insert into portfolio (name, clientID)
values ('ipsum dolor sit', 4);
insert into portfolio (name, clientID)
values ('semper sapien a libero', 93);
insert into portfolio (name, clientID)
values ('nibh in', 237);
insert into portfolio (name, clientID)
values ('eleifend pede libero quis', 245);
insert into portfolio (name, clientID)
values ('pellentesque', 208);
insert into portfolio (name, clientID)
values ('lorem ipsum dolor sit', 38);
insert into portfolio (name, clientID)
values ('tortor', 79);
insert into portfolio (name, clientID)
values ('luctus nec molestie', 152);
insert into portfolio (name, clientID)
values ('sed justo', 129);
insert into portfolio (name, clientID)
values ('lacinia sapien quis libero nullam', 125);
insert into portfolio (name, clientID)
values ('tempus vivamus in felis', 231);
insert into portfolio (name, clientID)
values ('quam', 50);
insert into portfolio (name, clientID)
values ('gravida nisi at nibh', 160);
insert into portfolio (name, clientID)
values ('sem fusce consequat nulla', 83);
insert into portfolio (name, clientID)
values ('augue vel accumsan tellus', 55);
insert into portfolio (name, clientID)
values ('nibh in lectus pellentesque at', 89);
insert into portfolio (name, clientID)
values ('cras pellentesque volutpat', 63);
insert into portfolio (name, clientID)
values ('consectetuer eget rutrum at lorem', 102);
insert into portfolio (name, clientID)
values ('vestibulum rutrum rutrum', 244);
insert into portfolio (name, clientID)
values ('velit vivamus vel nulla eget', 150);
insert into portfolio (name, clientID)
values ('nibh quisque id justo sit', 122);
insert into portfolio (name, clientID)
values ('nam ultrices', 222);
insert into portfolio (name, clientID)
values ('turpis enim blandit mi', 134);
insert into portfolio (name, clientID)
values ('non mauris', 189);
insert into portfolio (name, clientID)
values ('cursus id turpis integer aliquet', 196);
insert into portfolio (name, clientID)
values ('amet cursus id', 33);
insert into portfolio (name, clientID)
values ('at lorem integer tincidunt', 84);
insert into portfolio (name, clientID)
values ('vehicula condimentum curabitur in libero', 127);
insert into portfolio (name, clientID)
values ('a nibh', 187);
insert into portfolio (name, clientID)
values ('pharetra magna', 44);
insert into portfolio (name, clientID)
values ('morbi', 250);
insert into portfolio (name, clientID)
values ('ipsum dolor sit', 213);
insert into portfolio (name, clientID)
values ('hendrerit at', 234);
insert into portfolio (name, clientID)
values ('odio odio elementum', 175);
insert into portfolio (name, clientID)
values ('tortor sollicitudin', 88);
insert into portfolio (name, clientID)
values ('erat eros viverra', 141);
insert into portfolio (name, clientID)
values ('dictumst etiam faucibus', 184);
insert into portfolio (name, clientID)
values ('convallis eget', 119);
insert into portfolio (name, clientID)
values ('diam', 106);
insert into portfolio (name, clientID)
values ('cursus id turpis integer aliquet', 185);
insert into portfolio (name, clientID)
values ('leo', 149);
insert into portfolio (name, clientID)
values ('in hac habitasse platea dictumst', 185);
insert into portfolio (name, clientID)
values ('habitasse platea dictumst maecenas', 167);
insert into portfolio (name, clientID)
values ('aenean auctor', 193);
insert into portfolio (name, clientID)
values ('non mi integer ac neque', 67);
insert into portfolio (name, clientID)
values ('aliquet', 172);
insert into portfolio (name, clientID)
values ('vestibulum', 61);
insert into portfolio (name, clientID)
values ('at', 105);
insert into portfolio (name, clientID)
values ('eu', 106);
insert into portfolio (name, clientID)
values ('a pede', 141);
insert into portfolio (name, clientID)
values ('in quis justo maecenas rhoncus', 123);
insert into portfolio (name, clientID)
values ('nisl venenatis lacinia aenean sit', 36);
insert into portfolio (name, clientID)
values ('ultrices aliquet', 192);
insert into portfolio (name, clientID)
values ('nisi', 24);
insert into portfolio (name, clientID)
values ('tortor risus dapibus augue', 160);
insert into portfolio (name, clientID)
values ('vivamus vestibulum sagittis sapien cum', 178);
insert into portfolio (name, clientID)
values ('platea dictumst aliquam augue', 5);
insert into portfolio (name, clientID)
values ('convallis nunc', 70);
insert into portfolio (name, clientID)
values ('integer tincidunt ante vel', 88);
insert into portfolio (name, clientID)
values ('habitasse platea dictumst morbi vestibulum', 145);
insert into portfolio (name, clientID)
values ('nunc commodo placerat', 8);
insert into portfolio (name, clientID)
values ('augue a suscipit', 22);
insert into portfolio (name, clientID)
values ('leo odio porttitor', 206);
insert into portfolio (name, clientID)
values ('rhoncus sed vestibulum sit', 114);
insert into portfolio (name, clientID)
values ('diam cras pellentesque volutpat dui', 247);
insert into portfolio (name, clientID)
values ('adipiscing elit', 89);
insert into portfolio (name, clientID)
values ('aliquet massa', 232);
insert into portfolio (name, clientID)
values ('pharetra', 63);
insert into portfolio (name, clientID)
values ('pellentesque ultrices mattis', 224);
insert into portfolio (name, clientID)
values ('sit amet eleifend pede', 96);
insert into portfolio (name, clientID)
values ('ornare consequat lectus in est', 73);
insert into portfolio (name, clientID)
values ('convallis morbi odio odio', 85);
insert into portfolio (name, clientID)
values ('pulvinar', 191);
insert into portfolio (name, clientID)
values ('morbi', 169);
insert into portfolio (name, clientID)
values ('viverra dapibus nulla suscipit ligula', 145);
insert into portfolio (name, clientID)
values ('sapien quis libero nullam sit', 176);
insert into portfolio (name, clientID)
values ('ac nulla', 25);
insert into portfolio (name, clientID)
values ('volutpat', 87);
insert into portfolio (name, clientID)
values ('aliquet massa id', 214);
insert into portfolio (name, clientID)
values ('odio condimentum id luctus', 86);
insert into portfolio (name, clientID)
values ('nulla nisl', 144);
insert into portfolio (name, clientID)
values ('rutrum nulla tellus', 4);
insert into portfolio (name, clientID)
values ('sed interdum venenatis turpis enim', 33);
insert into portfolio (name, clientID)
values ('eu magna vulputate', 105);
insert into portfolio (name, clientID)
values ('luctus et ultrices posuere', 136);
insert into portfolio (name, clientID)
values ('pulvinar sed nisl nunc rhoncus', 43);
insert into portfolio (name, clientID)
values ('ligula pellentesque ultrices phasellus id', 34);
insert into portfolio (name, clientID)
values ('enim', 30);
insert into portfolio (name, clientID)
values ('amet sem', 49);
insert into portfolio (name, clientID)
values ('ultrices posuere cubilia curae', 203);
insert into portfolio (name, clientID)
values ('dapibus augue vel', 200);
insert into portfolio (name, clientID)
values ('curabitur in libero ut', 236);
insert into portfolio (name, clientID)
values ('sed sagittis', 174);
insert into portfolio (name, clientID)
values ('vel ipsum', 108);
insert into portfolio (name, clientID)
values ('parturient montes', 176);
insert into portfolio (name, clientID)
values ('interdum venenatis', 88);
insert into portfolio (name, clientID)
values ('in tempor turpis nec', 110);
insert into portfolio (name, clientID)
values ('viverra dapibus nulla suscipit ligula', 135);
insert into portfolio (name, clientID)
values ('in leo', 138);
insert into portfolio (name, clientID)
values ('parturient montes nascetur', 28);
insert into portfolio (name, clientID)
values ('at nunc commodo placerat', 132);
insert into portfolio (name, clientID)
values ('quisque erat', 243);
insert into portfolio (name, clientID)
values ('ut', 27);
insert into portfolio (name, clientID)
values ('porttitor pede justo eu', 157);
insert into portfolio (name, clientID)
values ('diam', 193);
insert into portfolio (name, clientID)
values ('lacus', 95);
insert into portfolio (name, clientID)
values ('posuere cubilia', 152);
insert into portfolio (name, clientID)
values ('felis', 22);
insert into portfolio (name, clientID)
values ('ultrices vel augue', 68);
insert into portfolio (name, clientID)
values ('phasellus id', 5);
insert into portfolio (name, clientID)
values ('enim sit', 67);
insert into portfolio (name, clientID)
values ('amet eros suspendisse accumsan tortor', 138);
insert into portfolio (name, clientID)
values ('venenatis', 24);
insert into portfolio (name, clientID)
values ('integer', 107);
insert into portfolio (name, clientID)
values ('bibendum', 213);
insert into portfolio (name, clientID)
values ('lacus morbi', 182);
insert into portfolio (name, clientID)
values ('porttitor', 22);
insert into portfolio (name, clientID)
values ('ultrices libero non mattis pulvinar', 123);
insert into portfolio (name, clientID)
values ('vitae', 145);
insert into portfolio (name, clientID)
values ('imperdiet et commodo', 161);
insert into portfolio (name, clientID)
values ('est donec', 51);
insert into portfolio (name, clientID)
values ('posuere', 68);
insert into portfolio (name, clientID)
values ('in quis', 53);
insert into portfolio (name, clientID)
values ('tempus semper est quam pharetra', 227);
insert into portfolio (name, clientID)
values ('pellentesque viverra pede ac', 63);
insert into portfolio (name, clientID)
values ('donec quis', 249);
insert into portfolio (name, clientID)
values ('nisi vulputate nonummy maecenas tincidunt', 101);
insert into portfolio (name, clientID)
values ('suscipit nulla elit', 214);
insert into portfolio (name, clientID)
values ('sit amet eleifend', 116);


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
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Moderate', 'Retirement', '1-2 Years', 'Averse', 15);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Conservative', 'Retirement', 'Less Than One Year', 'Extreme', 16);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Conservative', 'Growth', '3-5 Years', 'Moderate', 17);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Conservative', 'Growth', '1-2 Years', 'Averse', 18);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Conservative', 'Growth', '1-2 Years', 'Moderate', 19);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Aggressive', 'Growth', 'More Than 25 Years', 'Averse', 20);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Conservative', 'Growth', '3-5 Years', 'Moderate', 21);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Aggressive', 'Asset Preservation', 'Less Than One Year', 'Moderate', 22);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Conservative', 'Retirement', '3-5 Years', 'Extreme', 23);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Aggressive', 'Retirement', '1-2 Years', 'Moderate', 24);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Conservative', 'Asset Preservation', '1-2 Years', 'Extreme', 25);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Moderate', 'Retirement', 'More Than 25 Years', 'Extreme', 26);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Conservative', 'Asset Preservation', '1-2 Years', 'Moderate', 27);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Moderate', 'Retirement', '5-10 Years', 'Moderate', 28);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Aggressive', 'Asset Preservation', '1-2 Years', 'Averse', 29);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Aggressive', 'Retirement', '5-10 Years', 'Moderate', 30);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Aggressive', 'Growth', '1-2 Years', 'Extreme', 31);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Aggressive', 'Retirement', 'Less Than One Year', 'Moderate', 32);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Moderate', 'Growth', 'Less Than One Year', 'Averse', 33);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Aggressive', 'Growth', '10-15 Years', 'Moderate', 34);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Conservative', 'Retirement', '1-2 Years', 'Moderate', 35);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Aggressive', 'Asset Preservation', 'More Than 25 Years', 'Moderate', 36);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Moderate', 'Growth', '1-2 Years', 'Averse', 37);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Conservative', 'Retirement', '3-5 Years', 'Extreme', 38);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Aggressive', 'Growth', '1-2 Years', 'Moderate', 39);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Moderate', 'Growth', '1-2 Years', 'Moderate', 40);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Aggressive', 'Retirement', '5-10 Years', 'Moderate', 41);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Aggressive', 'Asset Preservation', '1-2 Years', 'Averse', 42);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Aggressive', 'Retirement', '1-2 Years', 'Moderate', 43);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Conservative', 'Growth', '1-2 Years', 'Moderate', 44);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Moderate', 'Retirement', 'More Than 25 Years', 'Averse', 45);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Aggressive', 'Growth', '5-10 Years', 'Extreme', 46);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Moderate', 'Retirement', 'Less Than One Year', 'Extreme', 47);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Moderate', 'Asset Preservation', 'Less Than One Year', 'Averse', 48);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Conservative', 'Asset Preservation', '1-2 Years', 'Moderate', 49);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Conservative', 'Asset Preservation', '5-10 Years', 'Averse', 50);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Conservative', 'Retirement', '5-10 Years', 'Moderate', 51);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Conservative', 'Growth', '5-10 Years', 'Averse', 52);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Conservative', 'Growth', '1-2 Years', 'Extreme', 53);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Moderate', 'Growth', '1-2 Years', 'Moderate', 54);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Moderate', 'Asset Preservation', 'More Than 25 Years', 'Averse', 55);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Conservative', 'Retirement', '5-10 Years', 'Extreme', 56);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Aggressive', 'Growth', '10-15 Years', 'Moderate', 57);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Conservative', 'Asset Preservation', 'More Than 25 Years', 'Averse', 58);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Conservative', 'Asset Preservation', '5-10 Years', 'Moderate', 59);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Conservative', 'Asset Preservation', '10-15 Years', 'Extreme', 60);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Aggressive', 'Growth', '10-15 Years', 'Extreme', 61);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Conservative', 'Retirement', '15-25 Years', 'Moderate', 62);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Conservative', 'Asset Preservation', '15-25 Years', 'Averse', 63);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Conservative', 'Asset Preservation', '3-5 Years', 'Extreme', 64);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Conservative', 'Retirement', '1-2 Years', 'Averse', 65);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Moderate', 'Retirement', '1-2 Years', 'Averse', 66);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Conservative', 'Growth', '3-5 Years', 'Moderate', 67);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Conservative', 'Asset Preservation', 'Less Than One Year', 'Extreme', 68);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Moderate', 'Asset Preservation', 'More Than 25 Years', 'Averse', 69);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Moderate', 'Retirement', '10-15 Years', 'Averse', 70);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Moderate', 'Retirement', 'Less Than One Year', 'Averse', 71);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Conservative', 'Retirement', '3-5 Years', 'Extreme', 72);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Aggressive', 'Retirement', '1-2 Years', 'Averse', 73);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Moderate', 'Retirement', '15-25 Years', 'Moderate', 74);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Conservative', 'Growth', '5-10 Years', 'Extreme', 75);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Conservative', 'Asset Preservation', 'More Than 25 Years', 'Averse', 76);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Aggressive', 'Retirement', '1-2 Years', 'Extreme', 77);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Conservative', 'Asset Preservation', '1-2 Years', 'Moderate', 78);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Aggressive', 'Retirement', '15-25 Years', 'Averse', 79);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Aggressive', 'Asset Preservation', '15-25 Years', 'Extreme', 80);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Aggressive', 'Growth', '5-10 Years', 'Moderate', 81);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Conservative', 'Growth', '1-2 Years', 'Extreme', 82);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Moderate', 'Growth', '15-25 Years', 'Averse', 83);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Conservative', 'Retirement', 'Less Than One Year', 'Averse', 84);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Aggressive', 'Growth', '3-5 Years', 'Extreme', 85);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Aggressive', 'Retirement', 'More Than 25 Years', 'Moderate', 86);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Conservative', 'Asset Preservation', '1-2 Years', 'Moderate', 87);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Aggressive', 'Growth', 'Less Than One Year', 'Extreme', 88);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Aggressive', 'Asset Preservation', '10-15 Years', 'Averse', 89);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Aggressive', 'Retirement', '15-25 Years', 'Moderate', 90);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Aggressive', 'Retirement', '15-25 Years', 'Extreme', 91);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Moderate', 'Asset Preservation', '15-25 Years', 'Averse', 92);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Aggressive', 'Retirement', '3-5 Years', 'Extreme', 93);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Conservative', 'Retirement', '1-2 Years', 'Extreme', 94);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Moderate', 'Asset Preservation', '10-15 Years', 'Averse', 95);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Conservative', 'Retirement', '5-10 Years', 'Extreme', 96);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Moderate', 'Asset Preservation', '3-5 Years', 'Averse', 97);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Moderate', 'Growth', '5-10 Years', 'Averse', 98);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Moderate', 'Asset Preservation', 'More Than 25 Years', 'Averse', 99);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Aggressive', 'Asset Preservation', '15-25 Years', 'Averse', 100);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Aggressive', 'Growth', 'Less Than One Year', 'Extreme', 101);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Aggressive', 'Retirement', 'Less Than One Year', 'Averse', 102);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Moderate', 'Asset Preservation', 'Less Than One Year', 'Extreme', 103);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Aggressive', 'Asset Preservation', '3-5 Years', 'Extreme', 104);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Conservative', 'Retirement', '1-2 Years', 'Moderate', 105);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Conservative', 'Asset Preservation', '3-5 Years', 'Moderate', 106);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Aggressive', 'Growth', 'Less Than One Year', 'Averse', 107);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Aggressive', 'Growth', 'Less Than One Year', 'Extreme', 108);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Conservative', 'Growth', '1-2 Years', 'Averse', 109);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Moderate', 'Asset Preservation', '5-10 Years', 'Averse', 110);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Conservative', 'Asset Preservation', 'More Than 25 Years', 'Extreme', 111);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Moderate', 'Asset Preservation', 'Less Than One Year', 'Averse', 112);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Aggressive', 'Growth', 'More Than 25 Years', 'Moderate', 113);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Moderate', 'Retirement', '10-15 Years', 'Extreme', 114);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Conservative', 'Retirement', '15-25 Years', 'Moderate', 115);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Moderate', 'Asset Preservation', 'More Than 25 Years', 'Extreme', 116);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Aggressive', 'Retirement', '5-10 Years', 'Moderate', 117);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Moderate', 'Retirement', '1-2 Years', 'Extreme', 118);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Aggressive', 'Growth', '5-10 Years', 'Moderate', 119);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Conservative', 'Retirement', '10-15 Years', 'Moderate', 120);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Moderate', 'Retirement', '10-15 Years', 'Averse', 121);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Aggressive', 'Asset Preservation', '3-5 Years', 'Averse', 122);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Moderate', 'Asset Preservation', 'Less Than One Year', 'Averse', 123);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Aggressive', 'Asset Preservation', 'More Than 25 Years', 'Averse', 124);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Moderate', 'Growth', '3-5 Years', 'Averse', 125);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Aggressive', 'Asset Preservation', '5-10 Years', 'Extreme', 126);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Aggressive', 'Retirement', '3-5 Years', 'Moderate', 127);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Conservative', 'Asset Preservation', 'More Than 25 Years', 'Averse', 128);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Conservative', 'Growth', '10-15 Years', 'Moderate', 129);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Conservative', 'Asset Preservation', 'More Than 25 Years', 'Moderate', 130);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Conservative', 'Asset Preservation', '1-2 Years', 'Moderate', 131);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Aggressive', 'Growth', '1-2 Years', 'Moderate', 132);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Conservative', 'Asset Preservation', '10-15 Years', 'Extreme', 133);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Moderate', 'Retirement', '3-5 Years', 'Extreme', 134);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Moderate', 'Retirement', 'Less Than One Year', 'Averse', 135);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Aggressive', 'Growth', '15-25 Years', 'Averse', 136);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Moderate', 'Growth', '5-10 Years', 'Extreme', 137);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Aggressive', 'Asset Preservation', '5-10 Years', 'Extreme', 138);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Moderate', 'Growth', 'Less Than One Year', 'Averse', 139);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Moderate', 'Asset Preservation', '1-2 Years', 'Extreme', 140);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Moderate', 'Growth', '1-2 Years', 'Averse', 141);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Aggressive', 'Asset Preservation', '5-10 Years', 'Moderate', 142);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Moderate', 'Asset Preservation', 'More Than 25 Years', 'Averse', 143);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Conservative', 'Growth', '5-10 Years', 'Averse', 144);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Conservative', 'Growth', '3-5 Years', 'Extreme', 145);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Aggressive', 'Asset Preservation', '3-5 Years', 'Moderate', 146);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Aggressive', 'Retirement', '5-10 Years', 'Moderate', 147);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Conservative', 'Growth', '3-5 Years', 'Moderate', 148);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Aggressive', 'Asset Preservation', '10-15 Years', 'Moderate', 149);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Conservative', 'Growth', 'Less Than One Year', 'Extreme', 150);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Conservative', 'Retirement', '1-2 Years', 'Averse', 151);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Aggressive', 'Growth', '15-25 Years', 'Extreme', 152);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Aggressive', 'Growth', '5-10 Years', 'Averse', 153);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Conservative', 'Growth', '15-25 Years', 'Moderate', 154);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Conservative', 'Retirement', '10-15 Years', 'Moderate', 155);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Conservative', 'Asset Preservation', '3-5 Years', 'Extreme', 156);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Aggressive', 'Asset Preservation', '10-15 Years', 'Extreme', 157);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Conservative', 'Asset Preservation', 'Less Than One Year', 'Extreme', 158);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Moderate', 'Asset Preservation', '15-25 Years', 'Extreme', 159);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Conservative', 'Retirement', '5-10 Years', 'Moderate', 160);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Conservative', 'Growth', '5-10 Years', 'Moderate', 161);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Moderate', 'Asset Preservation', '1-2 Years', 'Moderate', 162);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Aggressive', 'Growth', '5-10 Years', 'Extreme', 163);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Conservative', 'Retirement', 'More Than 25 Years', 'Moderate', 164);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Aggressive', 'Retirement', 'Less Than One Year', 'Moderate', 165);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Aggressive', 'Retirement', '3-5 Years', 'Moderate', 166);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Moderate', 'Growth', 'Less Than One Year', 'Averse', 167);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Aggressive', 'Retirement', '1-2 Years', 'Extreme', 168);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Moderate', 'Asset Preservation', '1-2 Years', 'Extreme', 169);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Aggressive', 'Asset Preservation', '5-10 Years', 'Extreme', 170);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Moderate', 'Retirement', '15-25 Years', 'Extreme', 171);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Aggressive', 'Retirement', 'More Than 25 Years', 'Averse', 172);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Aggressive', 'Growth', 'Less Than One Year', 'Averse', 173);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Conservative', 'Asset Preservation', '3-5 Years', 'Averse', 174);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Aggressive', 'Retirement', '3-5 Years', 'Extreme', 175);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Aggressive', 'Retirement', 'Less Than One Year', 'Averse', 176);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Conservative', 'Retirement', 'Less Than One Year', 'Extreme', 177);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Conservative', 'Retirement', '10-15 Years', 'Moderate', 178);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Aggressive', 'Retirement', '5-10 Years', 'Averse', 179);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Conservative', 'Asset Preservation', '15-25 Years', 'Extreme', 180);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Aggressive', 'Growth', '10-15 Years', 'Moderate', 181);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Moderate', 'Growth', 'Less Than One Year', 'Extreme', 182);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Aggressive', 'Growth', 'More Than 25 Years', 'Extreme', 183);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Aggressive', 'Growth', '10-15 Years', 'Averse', 184);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Aggressive', 'Asset Preservation', '1-2 Years', 'Moderate', 185);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Aggressive', 'Retirement', '1-2 Years', 'Moderate', 186);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Aggressive', 'Asset Preservation', '5-10 Years', 'Extreme', 187);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Aggressive', 'Asset Preservation', '5-10 Years', 'Averse', 188);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Conservative', 'Retirement', '1-2 Years', 'Extreme', 189);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Conservative', 'Asset Preservation', '10-15 Years', 'Averse', 190);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Aggressive', 'Asset Preservation', '15-25 Years', 'Extreme', 191);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Conservative', 'Asset Preservation', '3-5 Years', 'Moderate', 192);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Aggressive', 'Growth', '5-10 Years', 'Averse', 193);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Moderate', 'Retirement', '10-15 Years', 'Averse', 194);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Conservative', 'Asset Preservation', '10-15 Years', 'Averse', 195);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Moderate', 'Asset Preservation', '10-15 Years', 'Averse', 196);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Conservative', 'Growth', '3-5 Years', 'Moderate', 197);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Aggressive', 'Asset Preservation', '15-25 Years', 'Extreme', 198);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Aggressive', 'Growth', '10-15 Years', 'Extreme', 199);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Aggressive', 'Retirement', '10-15 Years', 'Extreme', 200);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Aggressive', 'Retirement', '3-5 Years', 'Extreme', 201);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Moderate', 'Retirement', 'Less Than One Year', 'Extreme', 202);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Conservative', 'Retirement', '10-15 Years', 'Moderate', 203);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Moderate', 'Asset Preservation', '3-5 Years', 'Extreme', 204);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Conservative', 'Asset Preservation', 'Less Than One Year', 'Averse', 205);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Conservative', 'Asset Preservation', 'More Than 25 Years', 'Averse', 206);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Conservative', 'Growth', 'Less Than One Year', 'Averse', 207);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Conservative', 'Asset Preservation', '1-2 Years', 'Averse', 208);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Conservative', 'Retirement', '1-2 Years', 'Extreme', 209);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Moderate', 'Asset Preservation', '15-25 Years', 'Extreme', 210);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Conservative', 'Retirement', 'More Than 25 Years', 'Averse', 211);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Aggressive', 'Growth', '5-10 Years', 'Extreme', 212);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Aggressive', 'Retirement', '15-25 Years', 'Averse', 213);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Aggressive', 'Retirement', '15-25 Years', 'Moderate', 214);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Aggressive', 'Growth', '5-10 Years', 'Extreme', 215);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Aggressive', 'Growth', '15-25 Years', 'Averse', 216);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Moderate', 'Growth', '10-15 Years', 'Moderate', 217);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Aggressive', 'Asset Preservation', '3-5 Years', 'Averse', 218);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Conservative', 'Asset Preservation', '1-2 Years', 'Extreme', 219);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Conservative', 'Asset Preservation', '1-2 Years', 'Moderate', 220);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Aggressive', 'Growth', '3-5 Years', 'Extreme', 221);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Conservative', 'Retirement', 'Less Than One Year', 'Averse', 222);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Aggressive', 'Asset Preservation', 'More Than 25 Years', 'Averse', 223);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Aggressive', 'Retirement', '1-2 Years', 'Averse', 224);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Aggressive', 'Retirement', '10-15 Years', 'Moderate', 225);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Aggressive', 'Growth', '15-25 Years', 'Extreme', 226);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Conservative', 'Retirement', 'Less Than One Year', 'Extreme', 227);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Conservative', 'Asset Preservation', '10-15 Years', 'Averse', 228);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Aggressive', 'Asset Preservation', '3-5 Years', 'Extreme', 229);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Moderate', 'Asset Preservation', '15-25 Years', 'Extreme', 230);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Aggressive', 'Asset Preservation', '1-2 Years', 'Extreme', 231);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Conservative', 'Retirement', 'More Than 25 Years', 'Moderate', 232);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Aggressive', 'Retirement', '5-10 Years', 'Averse', 233);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Aggressive', 'Asset Preservation', 'Less Than One Year', 'Moderate', 234);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Conservative', 'Retirement', '3-5 Years', 'Extreme', 235);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Aggressive', 'Asset Preservation', '3-5 Years', 'Extreme', 236);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Conservative', 'Asset Preservation', '10-15 Years', 'Moderate', 237);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Conservative', 'Retirement', '3-5 Years', 'Averse', 238);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Conservative', 'Asset Preservation', '10-15 Years', 'Extreme', 239);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Conservative', 'Asset Preservation', 'Less Than One Year', 'Averse', 240);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Aggressive', 'Growth', '3-5 Years', 'Averse', 241);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Conservative', 'Growth', '10-15 Years', 'Moderate', 242);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Aggressive', 'Asset Preservation', 'Less Than One Year', 'Averse', 243);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Conservative', 'Growth', 'More Than 25 Years', 'Moderate', 244);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Somewhat Aggressive', 'Asset Preservation', '15-25 Years', 'Averse', 245);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Aggressive', 'Asset Preservation', '5-10 Years', 'Averse', 246);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Moderate', 'Retirement', '10-15 Years', 'Extreme', 247);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Conservative', 'Asset Preservation', '1-2 Years', 'Extreme', 248);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Conservative', 'Growth', '10-15 Years', 'Extreme', 249);
insert into investment_profile (investment_attitude, investment_purpose, investment_timeframe, risk_tolerance,
                                portfolioID)
values ('Very Conservative', 'Growth', '10-15 Years', 'Extreme', 250);


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
insert into stock (ticker, date_bought, quantity, portfolioID) values ('VZ', '2022-08-28 18:10:33', 1433.773, 27);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('PIM', '2022-11-07 11:07:10', 810.244, 142);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SMED', '2022-11-28 18:41:56', 2144.911, 13);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('WHLRP', '2022-03-05 03:37:05', 1653.448, 217);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('C', '2022-08-09 01:54:17', 1746.154, 111);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QUAD', '2022-03-22 08:11:54', 1515.024, 202);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('STI^A', '2022-11-27 23:09:53', 2311.639, 73);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SSW^H', '2022-11-30 23:13:56', 2141.26, 195);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NXJ', '2021-12-12 06:07:16', 580.242, 21);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ACCO', '2022-10-21 11:32:57', 1780.921, 60);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('VLY.WS', '2022-04-30 08:57:20', 478.236, 22);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('BREW', '2022-07-12 15:52:18', 1590.145, 171);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GEVO', '2022-08-25 07:18:43', 462.346, 131);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('LIVE', '2022-05-17 10:02:35', 162.809, 9);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SUNW', '2022-05-04 06:01:09', 1155.582, 2);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('PEP', '2022-10-24 06:41:14', 150.069, 1);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MOG.B', '2022-06-30 21:46:50', 561.111, 193);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('LGI', '2022-03-22 08:41:33', 1577.428, 162);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ARII', '2021-12-31 23:57:07', 90.181, 95);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('FSCE', '2022-10-28 15:48:02', 76.072, 229);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QUMU', '2022-06-04 15:27:33', 1236.717, 7);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('VLGEA', '2022-10-31 23:33:02', 1264.515, 48);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ODP', '2022-01-11 06:17:15', 2056.365, 91);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MMM', '2021-12-29 18:20:03', 705.745, 154);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('RMD', '2021-12-27 00:29:16', 1065.232, 213);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-03-14 10:37:42', 1275.631, 160);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('PNRA', '2022-02-20 17:32:53', 850.066, 124);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SFE', '2022-05-07 18:56:30', 2344.911, 219);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('EIGI', '2022-05-07 19:05:08', 212.636, 44);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TNP^C', '2022-06-29 14:04:28', 1111.535, 16);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ROST', '2022-06-21 12:49:28', 732.87, 104);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JILL', '2022-03-23 03:13:45', 1762.284, 239);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ESXB', '2022-06-03 20:30:44', 577.332, 24);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('EW', '2022-03-30 21:30:46', 400.935, 155);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ARI^C', '2021-12-02 15:37:33', 1422.077, 94);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CNOB', '2021-12-04 14:35:54', 1703.761, 226);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SNDX', '2022-06-03 13:52:03', 917.858, 87);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SNA', '2022-09-18 15:21:39', 1252.628, 43);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('BFS^C', '2022-10-25 17:11:19', 130.197, 49);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('WKHS', '2022-07-12 17:51:41', 125.016, 9);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ANTM', '2022-06-24 00:05:40', 1960.411, 161);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CRIS', '2022-01-11 18:51:57', 4.085, 250);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('WKHS', '2021-12-09 03:04:24', 1923.149, 2);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GENC', '2022-11-02 01:34:46', 353.245, 130);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('UAA', '2022-09-20 02:27:13', 225.337, 187);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('VRML', '2022-07-06 19:54:04', 885.267, 118);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TRHC', '2022-07-24 01:36:24', 952.382, 119);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('PFL', '2022-06-14 02:33:21', 1821.452, 144);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('LPI', '2021-12-30 21:45:07', 1991.449, 182);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ISSC', '2021-12-02 00:08:32', 1620.736, 111);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MT', '2022-08-21 02:12:16', 2087.796, 163);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('BQH', '2022-09-13 14:20:38', 2205.238, 134);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SSKN', '2022-10-21 04:02:47', 224.799, 31);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CMU', '2022-06-25 02:19:19', 1140.698, 198);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('FTV', '2022-07-20 12:50:59', 809.931, 36);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CPSI', '2022-06-26 20:47:32', 834.149, 97);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CIZ', '2022-04-20 19:37:23', 859.663, 129);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('PFMT', '2022-10-26 03:21:24', 723.531, 39);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ADUS', '2022-10-09 22:46:09', 2281.782, 125);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TAX', '2022-10-03 07:56:29', 586.148, 61);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CTR', '2022-08-15 20:04:31', 223.004, 44);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SGMO', '2022-06-09 22:42:01', 544.016, 83);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('KMM', '2022-08-04 03:30:19', 2318.065, 230);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVFY', '2022-08-13 21:07:10', 1630.047, 156);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('DRYS', '2022-07-16 19:17:16', 357.081, 230);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GBT', '2022-04-01 18:24:09', 240.356, 150);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('DRYS', '2022-01-22 23:41:53', 1293.917, 170);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('KFS', '2022-01-10 01:26:25', 300.571, 155);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CATS', '2022-05-26 17:00:21', 1331.928, 121);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('HD', '2022-03-23 10:56:09', 736.639, 226);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SRSC', '2022-11-03 17:40:22', 808.819, 7);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MO', '2022-07-06 07:57:12', 1792.984, 94);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AB', '2022-05-03 14:04:58', 999.684, 54);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('DSM', '2022-02-04 16:09:15', 2274.724, 244);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GIGM', '2022-04-07 03:56:26', 423.372, 50);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('B', '2022-09-04 11:16:25', 2494.332, 112);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ADMA', '2022-06-01 01:57:32', 18.948, 180);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QBAK', '2022-08-02 13:36:28', 1779.238, 48);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('FFIN', '2022-08-26 01:06:35', 824.571, 94);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ARLZ', '2022-03-27 15:03:39', 940.983, 139);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('IPKW', '2022-04-12 11:50:27', 1865.395, 196);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('RM', '2022-11-26 19:06:45', 798.728, 236);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NKTR', '2022-09-26 20:19:03', 1305.452, 241);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('RP', '2022-07-27 03:33:12', 1390.467, 203);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JONE', '2022-10-28 09:59:01', 1230.153, 92);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ANSS', '2022-10-15 05:19:24', 11.348, 104);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CRR', '2022-11-13 20:01:13', 319.825, 3);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('VER^F', '2022-08-30 03:00:58', 1684.957, 86);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ETB', '2022-10-15 11:44:07', 360.488, 131);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('METC', '2022-06-07 02:01:06', 1160.531, 25);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CTU', '2022-04-07 04:55:53', 2188.176, 227);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('WEN', '2022-11-23 00:44:13', 713.602, 93);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MRIN', '2022-01-08 11:29:10', 117.836, 235);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CATO', '2022-09-05 01:28:15', 768.946, 22);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CECE', '2022-07-05 19:05:16', 1033.875, 129);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('PJC', '2021-12-01 02:09:40', 796.324, 150);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('DAN', '2022-09-29 14:00:51', 1871.143, 250);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SSW^E', '2021-12-24 18:48:47', 292.6, 98);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JE^A', '2022-09-08 12:40:38', 916.565, 67);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('STZ', '2022-10-26 19:48:13', 2425.143, 167);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('HRMN', '2022-03-08 01:18:39', 2396.184, 224);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('PKOH', '2022-10-25 03:54:15', 1893.189, 161);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CMCM', '2022-03-27 04:21:41', 2411.378, 142);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('DWIN', '2022-05-25 21:09:42', 254.833, 38);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('COR', '2022-06-21 13:03:05', 5.54, 111);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SBH', '2022-01-23 04:20:09', 209.493, 30);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('WPPGY', '2022-04-29 23:18:41', 2229.906, 192);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ITUB', '2022-02-03 01:42:55', 1258.718, 32);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('DDR^J', '2022-04-02 06:00:57', 1812.841, 112);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AXGN', '2021-12-07 12:35:16', 763.75, 220);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('INNL', '2022-02-01 07:05:33', 1604.483, 194);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('RAS^A', '2022-09-19 18:50:17', 1340.217, 180);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('PSA^T', '2022-10-17 13:27:55', 473.071, 212);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('WVVIP', '2022-08-06 13:20:50', 413.483, 115);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CLNS^D', '2022-10-13 21:57:54', 1263.627, 20);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MYCC', '2022-06-24 13:12:43', 521.722, 168);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('RGLD', '2022-05-07 16:42:06', 214.821, 22);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MDWD', '2021-12-11 01:36:30', 955.319, 45);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ISSC', '2022-01-06 17:48:59', 999.43, 197);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('REXR^A', '2022-07-26 23:24:42', 767.135, 77);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GPIAU', '2021-12-18 04:43:26', 1327.158, 131);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SAJA', '2022-05-26 03:04:34', 315.818, 190);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MITT^A', '2022-06-16 09:14:37', 1402.275, 40);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CSU', '2022-01-21 20:08:27', 1611.348, 18);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JSYN', '2021-12-14 15:16:43', 6.659, 14);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('PFMT', '2022-07-08 09:48:50', 2103.384, 160);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('VGM', '2022-01-23 02:59:01', 2451.996, 131);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('DYSL', '2022-10-22 02:04:19', 2031.34, 78);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('FFBC', '2022-10-23 18:51:33', 2411.255, 244);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('KFRC', '2022-01-05 20:00:02', 223.949, 98);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('EGRX', '2022-05-21 18:47:44', 1315.959, 30);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ASNA', '2022-06-03 12:14:29', 2483.488, 84);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('PTI', '2022-08-31 09:59:18', 1755.56, 180);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('RDS.A', '2022-07-09 21:43:18', 1909.323, 236);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MNRO', '2022-08-30 14:37:26', 2407.393, 87);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('LMB', '2022-06-02 10:17:09', 2102.618, 184);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SLIM', '2022-06-28 04:00:51', 1851.633, 243);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ARDX', '2022-03-24 09:25:43', 2109.817, 71);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('IPL^D', '2022-01-27 13:49:18', 1166.33, 179);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AER', '2022-05-08 15:56:54', 1464.685, 44);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ORI', '2022-02-14 14:25:17', 2174.862, 176);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TTOO', '2022-08-24 11:32:53', 60.45, 111);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TDE', '2022-10-03 17:40:07', 1969.827, 8);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SELB', '2022-09-25 23:45:34', 1052.908, 197);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('WBT', '2022-06-18 09:01:02', 1262.796, 140);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TEN', '2021-12-07 09:54:30', 1210.07, 212);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QNST', '2022-04-10 07:18:35', 1188.669, 166);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SBPH', '2022-06-30 02:30:10', 764.309, 230);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NM^H', '2022-09-28 19:14:19', 1337.413, 17);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('EVT', '2022-06-22 10:45:25', 1792.945, 89);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('VRTS', '2022-09-04 16:07:06', 528.342, 216);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('DSLV', '2022-10-07 20:49:45', 883.01, 4);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CAC', '2022-08-23 17:39:11', 96.835, 36);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GBLIZ', '2021-12-12 06:05:58', 905.663, 212);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('BORN', '2022-02-06 06:08:14', 248.81, 67);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CGI', '2022-02-01 18:38:59', 1708.228, 192);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOODP', '2022-08-28 13:26:28', 2118.676, 245);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ANDAR', '2022-11-07 18:36:51', 1857.171, 38);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('DKT', '2022-05-28 19:59:55', 1334.725, 14);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SNP', '2022-01-09 08:33:52', 379.051, 89);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AGM.A', '2022-05-08 01:46:28', 945.899, 233);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ABM', '2022-10-05 23:20:30', 2364.872, 8);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('XCRA', '2022-05-10 20:39:46', 2330.218, 248);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CYS^B', '2022-04-02 20:51:49', 1188.658, 124);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('PFM', '2022-04-28 07:26:00', 1829.058, 236);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-07-29 04:36:24', 1221.711, 26);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('APDN', '2022-06-13 17:53:37', 959.317, 92);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CEA', '2022-11-01 14:16:47', 2471.3, 12);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SCSS', '2022-02-25 08:51:42', 1311.864, 187);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('RDHL', '2021-12-06 11:30:45', 2417.661, 221);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('RPRX', '2022-05-13 21:55:07', 20.164, 42);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('RIV', '2022-02-16 10:59:30', 2239.343, 97);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JAKK', '2022-01-30 12:44:39', 2139.355, 228);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ZTS', '2022-06-10 02:21:26', 1762.548, 71);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NWL', '2021-12-12 23:01:32', 817.758, 24);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('EGAN', '2022-03-10 19:52:55', 1492.288, 1);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('RARE', '2022-11-15 09:22:37', 1913.672, 209);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TTPH', '2022-05-04 23:24:45', 1628.138, 211);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TOO', '2022-09-02 08:56:26', 2100.836, 28);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CSGP', '2022-10-15 08:05:30', 22.506, 40);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('VDSI', '2022-01-27 01:07:13', 227.419, 5);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('HYZD', '2022-05-07 06:41:38', 557.001, 210);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CRT', '2022-10-12 00:35:18', 577.973, 236);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('PBT', '2021-12-28 01:03:39', 2274.655, 122);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CATO', '2022-06-17 05:06:44', 1590.626, 70);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CNC', '2022-01-07 12:35:10', 2155.698, 166);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('DWAT', '2021-12-21 18:57:12', 249.779, 76);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TWN', '2022-03-17 16:26:58', 1526.404, 183);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('FENX', '2022-04-19 11:24:21', 2405.352, 34);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('WG', '2022-03-25 02:12:30', 921.862, 161);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CTL', '2021-12-30 20:31:24', 1878.285, 127);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('STAG^C', '2022-06-18 09:25:40', 1917.39, 83);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('PCOM', '2022-04-21 19:24:50', 1370.845, 136);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('APRI', '2022-05-22 16:59:36', 1586.807, 225);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('BBOX', '2021-12-24 08:22:07', 2259.531, 22);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('THLD', '2022-05-03 01:07:47', 1045.65, 200);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CWBC', '2022-05-08 16:58:10', 969.158, 164);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NSH', '2022-09-29 17:04:43', 387.699, 33);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ZG', '2022-05-23 11:23:51', 609.594, 192);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('FTW', '2022-05-01 21:52:36', 288.068, 250);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MTX', '2022-02-01 09:42:33', 351.003, 19);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('PLD', '2022-04-08 00:37:54', 2264.572, 117);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('DY', '2022-01-30 00:22:02', 365.789, 40);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CXRX', '2021-12-13 04:04:39', 347.164, 246);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SNBC', '2022-08-14 18:50:40', 630.909, 202);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('DLTH', '2021-12-08 22:25:06', 891.313, 165);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('DCO', '2022-07-19 09:42:40', 1735.767, 21);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MICT', '2022-01-02 22:26:47', 1172.828, 97);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ACRE', '2022-07-25 05:43:28', 839.421, 100);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ITT', '2022-09-07 16:59:36', 2090.745, 231);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CSB', '2022-10-28 22:28:39', 2210.85, 163);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NCS', '2022-03-26 17:18:20', 2188.87, 177);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SJI', '2022-08-09 23:58:55', 51.655, 193);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CFCO', '2022-10-25 07:03:00', 1943.115, 188);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SGZA', '2022-07-08 18:07:00', 1894.151, 239);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('XBKS', '2022-03-09 04:39:36', 2181.213, 7);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SKYS', '2022-03-17 06:22:53', 1075.803, 22);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('FOMX', '2022-03-07 16:13:59', 2476.984, 46);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('HVT', '2022-02-20 06:45:45', 401.737, 48);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ENJ', '2022-02-02 21:10:02', 648.111, 170);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CCM', '2022-02-06 18:33:39', 624.894, 96);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('HTBX', '2022-04-21 06:49:30', 1312.416, 21);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('UNF', '2022-02-16 08:22:28', 340.116, 160);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('BF.B', '2022-10-27 20:05:29', 2105.738, 138);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ABR^C', '2022-03-21 21:46:49', 1251.617, 154);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('PAG', '2022-01-26 01:41:37', 2429.239, 173);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('LULU', '2022-04-03 02:59:45', 608.095, 165);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ISP', '2022-02-19 20:11:33', 795.255, 1);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('EHTH', '2022-06-02 10:29:06', 431.641, 119);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SSD', '2022-04-05 23:05:08', 1063.573, 159);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SCVL', '2021-12-04 15:24:42', 319.285, 17);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('IRET', '2022-03-01 09:06:10', 2157.89, 7);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('IMRNW', '2022-07-11 22:12:58', 398.056, 32);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('WOW', '2022-03-24 04:26:15', 964.031, 219);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('RICK', '2022-10-30 19:09:10', 1205.331, 246);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SAGE', '2022-10-07 07:12:23', 1130.331, 243);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CNTY', '2022-01-28 11:04:07', 1637.008, 48);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('APDN', '2022-05-29 00:59:42', 1026.299, 249);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SIRI', '2022-05-27 22:33:41', 785.694, 79);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('RVT', '2022-09-21 05:31:32', 599.663, 208);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('FTXD', '2022-02-10 14:01:59', 2169.692, 215);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('BJZ', '2022-03-17 16:16:52', 1792.764, 56);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SID', '2022-03-11 07:52:02', 1076.878, 58);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CMA', '2022-06-18 14:57:07', 1094.312, 145);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('EMD', '2022-08-25 00:44:54', 788.611, 115);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ENIC', '2022-02-07 14:16:22', 525.014, 241);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('PLBC', '2021-12-26 07:39:12', 127.738, 110);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('INTC', '2022-08-16 14:19:26', 2287.804, 204);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('UBSH', '2022-10-08 07:59:10', 367.405, 87);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ABUS', '2022-07-14 13:50:06', 1878.855, 172);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AHGP', '2022-01-28 14:45:25', 800.289, 131);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('IMKTA', '2022-03-03 00:47:28', 1720.793, 238);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('LSXMB', '2022-01-19 10:59:52', 618.13, 179);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('DELT', '2022-02-03 05:11:27', 373.222, 231);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ABCB', '2022-07-07 11:02:08', 1848.989, 217);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('PCYO', '2022-09-29 03:03:06', 391.66, 235);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('BLDR', '2022-02-15 22:26:33', 2244.172, 33);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('WFC^Q', '2022-11-15 16:10:28', 354.0, 140);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('KN', '2021-12-27 11:39:04', 835.167, 101);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('USB', '2022-03-08 14:17:48', 2402.935, 27);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SSW^G', '2022-09-19 11:43:38', 1718.137, 184);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('WAL', '2022-04-25 18:49:17', 1319.319, 125);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('RCMT', '2022-04-14 06:18:36', 2276.295, 178);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('FTXN', '2022-09-06 09:43:47', 1854.453, 227);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SBRAP', '2022-10-14 04:30:56', 932.695, 113);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('YELP', '2022-03-21 09:43:53', 809.562, 87);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('KREF', '2022-08-08 04:24:31', 678.17, 14);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MIII', '2022-11-09 10:57:27', 2225.009, 97);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CTBI', '2022-11-09 11:33:12', 2398.603, 185);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CDNA', '2022-03-11 16:49:02', 774.26, 193);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('OPK', '2022-10-06 12:09:29', 1416.942, 5);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SHW', '2022-11-06 01:04:23', 1703.541, 77);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('WBKC', '2021-12-11 20:07:15', 53.099, 51);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TXRH', '2022-07-09 09:03:06', 1183.106, 19);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('UHAL', '2022-01-27 19:32:35', 355.722, 79);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('RDI', '2022-10-07 12:37:21', 18.972, 134);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-07-02 22:10:24', 1096.391, 141);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JBT', '2022-07-25 10:28:26', 200.972, 243);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GYRO', '2022-10-19 23:26:45', 2105.738, 222);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('UDR', '2022-05-08 00:46:22', 2486.628, 184);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVLS', '2022-01-26 18:45:01', 1746.869, 232);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ZN', '2022-04-15 17:38:02', 1053.207, 90);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ALP^O', '2022-08-04 00:55:14', 166.511, 75);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GNT', '2022-05-16 16:39:14', 1685.131, 219);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GRX', '2022-06-26 06:02:23', 638.262, 155);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('HSON', '2022-01-16 05:13:11', 1797.954, 65);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('HIO', '2022-07-08 13:06:28', 2184.977, 117);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('FLIC', '2022-02-20 02:36:17', 1998.885, 155);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ABT', '2022-04-23 22:54:33', 1327.11, 215);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('OVAS', '2022-09-20 16:19:36', 121.332, 196);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('DXCM', '2021-12-31 11:28:57', 1494.28, 176);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('USDP', '2022-02-28 09:54:25', 404.182, 222);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('OAKS^A', '2022-11-25 01:20:51', 1145.857, 65);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('FBNK', '2022-09-22 12:15:09', 750.309, 190);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('KRMA', '2022-10-30 17:22:48', 2414.571, 114);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JGH', '2022-05-12 05:39:56', 1743.937, 34);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('PKE', '2022-04-16 06:41:23', 1412.419, 122);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('KMF', '2022-02-23 01:38:45', 300.736, 136);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('VLRS', '2022-02-02 00:01:12', 1509.43, 243);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CCD', '2022-09-15 09:43:42', 1854.199, 69);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CSTR', '2022-04-09 15:23:30', 1977.31, 116);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SDLP', '2021-12-09 03:29:53', 103.927, 36);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MIND', '2022-08-31 23:57:09', 1315.075, 184);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GFF', '2022-10-17 23:42:34', 1521.533, 129);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSN', '2021-12-07 21:32:31', 194.705, 113);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SYNL', '2022-05-04 00:09:54', 2178.547, 249);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('DYNT', '2021-12-10 12:13:13', 858.109, 208);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ADM', '2022-09-05 07:09:30', 672.506, 222);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AIN', '2022-07-28 00:01:13', 959.989, 6);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('IGF', '2022-02-22 04:07:44', 2110.814, 62);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NDP', '2021-12-30 08:35:52', 1615.312, 8);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('FMS', '2022-03-30 07:01:22', 345.682, 226);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MGEN', '2022-08-12 06:09:30', 2175.881, 142);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CYRN', '2022-02-05 15:34:22', 444.705, 236);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('DHI', '2022-04-24 09:26:24', 1856.093, 174);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('VGM', '2022-04-01 18:20:46', 295.177, 101);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('EIX', '2022-08-15 16:48:22', 755.794, 215);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NEE^H', '2022-09-23 15:33:38', 941.294, 24);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CNTF', '2021-12-05 13:41:11', 421.489, 58);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SMG', '2022-02-25 23:50:52', 1235.955, 138);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('RDS.A', '2022-02-08 01:43:02', 247.65, 14);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GCVRZ', '2022-04-12 06:46:55', 251.159, 179);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('PSA^T', '2022-03-01 00:57:12', 2268.626, 106);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NRK', '2022-09-25 03:18:57', 377.976, 31);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('RBS^H', '2022-10-18 00:06:22', 1953.237, 202);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SWP', '2022-03-10 03:28:36', 556.012, 193);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GLBZ', '2022-10-23 05:12:46', 1681.173, 179);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ADBE', '2022-07-27 02:05:58', 1693.291, 237);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ACXM', '2022-04-27 20:27:04', 52.582, 27);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TRK', '2022-02-05 13:58:18', 751.835, 40);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('UDR', '2022-10-02 21:16:05', 1803.868, 139);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('KTCC', '2022-04-18 09:59:11', 1022.765, 205);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('VGR', '2022-09-07 21:58:21', 1283.641, 243);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CDXS', '2022-01-13 14:49:51', 830.596, 144);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CODI', '2022-07-25 17:50:07', 2269.586, 44);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NTEST', '2022-06-13 17:05:57', 59.874, 85);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AINV', '2022-11-09 10:09:31', 2481.582, 155);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ELVT', '2022-09-04 18:13:29', 152.228, 204);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AHPAW', '2022-07-04 00:31:28', 889.741, 136);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('HAWK', '2022-05-25 11:16:58', 234.143, 190);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CBF', '2021-12-14 12:38:45', 2119.755, 146);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('DBL', '2022-09-30 04:39:06', 680.202, 131);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('EVGBC', '2022-08-23 01:04:26', 2218.483, 8);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('KSU^', '2021-12-20 19:47:39', 759.517, 29);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('IRR', '2022-05-27 13:16:24', 1596.169, 27);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('LFUS', '2022-09-12 10:21:10', 984.299, 210);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('RFP', '2022-04-10 10:19:20', 585.677, 65);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('UBSI', '2021-12-27 01:27:53', 173.326, 116);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CETXW', '2022-04-18 16:53:21', 1756.336, 51);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GE', '2022-04-10 20:36:36', 793.441, 136);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TURN', '2022-03-12 21:02:46', 1521.677, 240);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('PEBK', '2021-12-14 23:06:38', 873.874, 145);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('FBNC', '2022-08-30 17:45:54', 1050.395, 85);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVRO', '2022-10-16 12:34:29', 1843.13, 240);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ICPT', '2022-11-04 01:31:31', 225.816, 85);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('LLL', '2022-02-10 23:59:51', 2120.638, 140);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('EXAS', '2022-09-07 08:30:04', 2275.615, 44);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('WPCS', '2022-03-22 22:13:54', 2337.232, 107);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ADAP', '2022-04-09 23:43:44', 307.198, 153);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('REGI', '2022-05-29 11:25:30', 1367.648, 214);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('IPG', '2022-03-06 11:40:56', 1474.103, 27);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GHC', '2022-09-19 16:44:54', 177.541, 231);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('YTRA', '2022-11-19 18:35:40', 1776.883, 96);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('LBIO', '2022-03-22 19:07:30', 1177.636, 228);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('HMTA', '2022-03-15 01:27:20', 1452.1, 26);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CLH', '2022-08-27 12:14:46', 694.405, 29);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOODP', '2022-08-06 15:07:49', 1804.197, 120);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('B', '2022-03-10 11:38:25', 994.426, 101);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPKE', '2022-08-16 04:19:45', 129.549, 227);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ARRS', '2021-12-17 03:49:18', 1541.288, 218);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ADBE', '2022-05-12 16:08:18', 622.761, 183);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('BIVV', '2022-04-06 08:26:33', 1383.483, 229);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('RCL', '2022-03-31 21:54:38', 2110.701, 57);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NUAN', '2022-03-05 20:21:02', 1200.168, 147);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('HOLX', '2022-09-19 16:18:10', 61.66, 89);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('APO^A', '2022-08-21 09:18:06', 2402.595, 209);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AGZD', '2022-06-07 02:13:01', 800.066, 124);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CR', '2022-09-11 20:20:58', 2010.941, 17);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CVGW', '2022-01-04 22:58:42', 844.708, 152);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('FALN', '2022-05-22 04:25:49', 1078.567, 192);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('LAUR', '2021-12-24 00:57:08', 736.401, 12);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NWY', '2021-12-23 10:28:15', 1923.75, 96);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('IRR', '2022-06-21 03:37:45', 2429.744, 217);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AES^C.CL', '2022-09-29 22:17:24', 2072.029, 52);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GAIN', '2022-01-19 11:10:27', 2290.152, 220);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('IHC', '2022-01-03 02:19:56', 1931.632, 177);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TU', '2022-03-26 12:23:20', 1533.94, 157);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('WYIGU', '2022-04-25 13:28:56', 1717.816, 228);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MORN', '2022-07-03 10:29:42', 735.39, 127);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NMIH', '2022-10-05 09:25:58', 1504.435, 231);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('WMS', '2022-04-27 11:30:30', 2374.71, 103);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ABY', '2022-07-27 02:36:19', 146.359, 17);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NEM', '2022-04-02 06:31:37', 786.278, 108);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('PVTBP', '2022-11-21 00:46:00', 632.979, 59);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ANTM', '2022-01-24 18:13:44', 2130.025, 103);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('HCC', '2022-02-04 22:39:39', 1969.387, 47);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AGN', '2022-09-11 16:10:33', 66.811, 165);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ELJ', '2022-08-27 13:53:57', 2153.657, 184);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('RFEU', '2022-03-10 10:22:00', 2398.968, 207);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('LAWS', '2022-03-04 13:11:09', 870.547, 1);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('HUNTW', '2022-08-19 08:01:20', 205.602, 247);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('EXAC', '2022-04-30 05:44:06', 989.666, 86);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MRK', '2022-01-11 00:24:50', 318.229, 184);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('BOFIL', '2022-11-29 18:28:20', 2066.16, 148);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('FEP', '2022-02-18 04:18:39', 313.144, 141);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GLBR', '2022-08-23 06:56:42', 818.748, 163);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MAGS', '2022-10-16 21:26:21', 865.195, 150);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('FEX', '2022-06-11 01:13:01', 1949.694, 18);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CMCM', '2021-12-18 17:02:00', 1657.072, 80);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SWP', '2022-06-15 10:55:50', 890.511, 237);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('IMMY', '2022-02-22 16:27:53', 1233.283, 169);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('REPH', '2022-03-06 13:21:57', 2472.714, 62);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ISHG', '2022-05-01 21:22:43', 1380.644, 173);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ZG', '2021-12-15 00:11:14', 203.24, 10);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('EDUC', '2022-04-25 07:18:08', 1575.496, 54);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MMAC', '2022-01-24 00:10:34', 1057.886, 59);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JAKK', '2022-11-25 02:22:39', 2306.302, 55);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('COHU', '2022-10-23 19:41:14', 1967.011, 23);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('VAC', '2022-10-27 15:49:49', 511.378, 170);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ANH^B', '2022-07-16 09:50:40', 1153.551, 249);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MOH', '2022-05-13 17:27:49', 2134.617, 232);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('LINC', '2021-12-02 16:12:03', 1603.504, 200);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('KBWY', '2022-02-01 00:39:58', 2221.259, 226);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ERII', '2022-05-19 01:29:43', 977.576, 114);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('WASH', '2022-02-16 14:16:13', 6.888, 68);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMSWA', '2022-05-17 17:37:39', 801.846, 200);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MTEX', '2022-08-23 19:49:33', 1286.952, 50);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('VRIG', '2021-12-04 02:06:31', 1625.483, 99);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('KTWO', '2022-08-13 00:54:58', 1833.121, 89);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('LZB', '2022-05-11 21:23:06', 2365.549, 247);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TEL', '2022-05-04 15:39:29', 1327.101, 127);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('FTRI', '2022-03-01 17:16:20', 916.569, 13);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMH^E', '2021-12-27 05:07:28', 1593.298, 88);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('PRE^I', '2021-12-23 14:28:03', 111.057, 71);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('EQGP', '2022-04-27 06:52:57', 1702.094, 93);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('YGE', '2022-05-13 08:44:45', 201.36, 82);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JGH', '2022-05-20 17:57:20', 136.147, 167);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('PLOW', '2022-11-05 03:14:37', 248.618, 246);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('PSXP', '2022-06-19 09:29:02', 1345.36, 223);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CTRV', '2022-10-26 17:30:57', 2194.882, 27);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('VG', '2022-01-29 10:16:44', 1834.89, 137);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('VVPR', '2022-07-25 02:35:48', 606.735, 167);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('STRM', '2022-04-01 19:27:18', 324.953, 222);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('DFVS', '2022-07-21 14:26:06', 1087.403, 125);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPNS', '2022-04-22 17:41:46', 1538.289, 100);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JNJ', '2022-09-08 01:29:16', 643.139, 167);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('LTC', '2022-09-20 22:23:53', 96.612, 32);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GATX', '2022-05-01 07:16:39', 115.112, 7);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ICD', '2022-07-28 02:16:27', 715.726, 11);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CWCO', '2022-07-04 15:20:57', 431.268, 139);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GNL', '2022-09-29 09:58:29', 273.374, 122);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('PNTR', '2022-01-19 19:28:01', 1595.426, 244);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ABDC', '2022-06-25 12:39:48', 568.387, 16);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('YIN', '2022-04-17 04:33:59', 25.642, 30);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('EGRX', '2022-10-14 14:21:53', 1991.616, 237);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AKAM', '2022-08-11 21:05:19', 1123.219, 230);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CWT', '2022-04-05 04:02:06', 30.182, 173);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('BLW', '2022-08-15 19:49:34', 2210.162, 247);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TISI', '2022-11-10 09:03:15', 2218.143, 192);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CZR', '2022-07-06 23:02:47', 1279.432, 72);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MANH', '2021-12-16 23:46:47', 1058.04, 233);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('COLL', '2022-02-14 14:01:43', 884.248, 143);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CIL', '2022-03-30 15:51:01', 396.889, 227);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AFSI^D', '2022-02-06 12:30:11', 2011.796, 191);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TLI', '2022-01-11 05:33:53', 2298.543, 51);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMRN', '2022-05-26 13:34:53', 611.653, 20);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('USB^O', '2022-06-12 16:22:37', 876.975, 122);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MFA^B', '2022-02-15 12:08:11', 175.348, 159);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSBI', '2022-10-03 22:46:34', 990.731, 141);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('BBC', '2022-08-29 07:59:43', 2159.021, 42);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QLYS', '2021-12-12 04:18:25', 2152.651, 64);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CADC', '2022-05-12 20:35:06', 2325.073, 163);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('HGSH', '2022-11-03 17:36:03', 883.959, 71);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NCIT', '2022-10-15 20:28:37', 298.116, 169);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SNA', '2022-11-13 02:07:25', 131.625, 164);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('FLAT', '2022-08-03 10:28:56', 563.067, 139);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NEFF', '2022-03-20 12:05:49', 232.861, 21);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MHD', '2022-02-01 18:07:49', 1631.153, 199);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CSX', '2022-08-23 10:51:02', 1781.352, 30);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ANET', '2022-09-24 03:37:14', 642.973, 213);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QHC', '2022-02-24 08:15:41', 1542.974, 56);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('KVHI', '2022-01-27 14:23:40', 1816.695, 91);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('FLDM', '2022-03-11 00:33:03', 1200.084, 2);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NMZ', '2022-08-15 18:23:01', 1462.206, 132);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CLRBZ', '2021-12-22 15:43:03', 2437.977, 152);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('HURN', '2022-08-12 18:05:20', 732.428, 211);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('PGC', '2022-03-25 10:03:20', 1699.646, 198);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('WSR', '2022-10-04 15:36:30', 223.576, 175);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CUZ', '2022-09-14 07:00:22', 813.161, 35);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('DYSL', '2022-04-18 15:17:36', 1277.983, 201);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('HUNTW', '2022-10-21 22:30:01', 340.107, 238);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ISIG', '2022-07-30 19:02:45', 388.314, 197);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('UNB', '2022-04-24 20:57:51', 1367.675, 125);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('IVTY', '2022-10-19 19:14:35', 2387.546, 116);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NWFL', '2022-01-21 19:17:35', 1225.188, 233);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NEM', '2022-07-14 20:54:19', 167.783, 195);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NPO', '2022-05-23 09:09:54', 1608.71, 34);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SRUN', '2022-09-08 14:41:31', 975.237, 14);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SLG', '2022-08-19 07:02:34', 760.94, 186);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('PNFP', '2022-09-26 21:55:52', 2318.325, 180);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SQM', '2022-07-17 04:39:47', 1060.63, 239);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SHBI', '2022-09-04 20:56:36', 320.378, 186);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SAL', '2022-01-10 16:13:16', 1245.692, 50);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('EMCF', '2022-03-05 17:51:06', 1973.253, 90);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TBK', '2022-05-11 23:20:20', 376.282, 200);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CHK', '2022-02-28 11:48:45', 2418.827, 80);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('EML', '2022-11-19 08:44:23', 1680.929, 77);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('KMT', '2022-02-01 11:35:51', 1633.95, 150);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ABAC', '2022-01-30 11:41:25', 1398.951, 198);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('PCQ', '2022-04-29 12:41:14', 2177.16, 150);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('APPS', '2022-09-07 02:55:38', 633.778, 36);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMKR', '2022-07-27 03:30:41', 1758.36, 178);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ADP', '2022-11-14 10:05:38', 1702.718, 228);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('WMC', '2022-01-10 15:22:48', 2363.057, 73);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SIGI', '2022-04-03 08:15:34', 2253.211, 113);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NKE', '2022-04-22 21:40:38', 1862.761, 230);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('FRAN', '2021-12-25 07:57:21', 813.093, 89);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AGRO', '2022-03-16 10:23:57', 579.723, 10);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SJI', '2022-03-03 08:36:08', 1010.114, 207);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NTRSP', '2022-03-02 20:52:01', 690.978, 47);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MLR', '2022-05-20 23:41:48', 1793.495, 234);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ARCX', '2022-08-10 12:41:16', 2228.08, 225);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('PYN', '2021-12-05 07:42:05', 572.471, 71);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('XBKS', '2022-01-11 20:03:11', 1209.63, 204);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('EDI', '2022-01-05 23:39:04', 1700.244, 123);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('DSKE', '2022-01-08 03:32:11', 951.751, 97);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AFSI^C', '2022-05-07 22:20:22', 833.606, 198);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NBB', '2022-08-25 14:10:46', 830.288, 205);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CXO', '2022-07-02 11:25:40', 1879.458, 134);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SMSI', '2022-02-24 17:07:35', 1401.623, 159);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NCZ', '2021-12-12 23:16:25', 998.161, 116);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('HDS', '2022-05-30 04:15:44', 1981.627, 225);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SHEN', '2022-06-30 10:36:51', 2007.173, 27);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CYBE', '2022-05-26 02:26:36', 112.137, 10);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SNSS', '2022-06-03 02:02:20', 1465.429, 108);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TCRX', '2022-08-02 11:24:00', 720.346, 215);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('PUI', '2022-07-09 21:30:51', 2398.552, 56);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('OFC', '2021-12-27 13:09:31', 422.271, 11);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AKTS', '2022-02-24 19:43:46', 59.001, 192);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('UNH', '2022-09-16 02:35:09', 734.066, 190);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('HCAPL', '2022-03-15 18:50:17', 1555.97, 173);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CHNR', '2022-03-27 06:41:53', 208.61, 42);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('XIV', '2022-09-27 11:23:46', 1821.844, 168);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ELOS', '2022-07-29 16:29:26', 1748.011, 72);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('PRH', '2021-12-07 21:02:10', 768.166, 150);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ONB', '2022-09-16 07:49:01', 1746.84, 222);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('FSD', '2022-04-03 20:28:47', 1276.586, 29);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QUAD', '2022-05-08 20:19:36', 57.176, 46);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TFX', '2022-02-14 02:42:27', 226.494, 135);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CHCI', '2022-08-14 01:35:01', 737.4, 216);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ORCL', '2022-05-01 15:14:47', 1135.551, 162);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CRH', '2022-01-22 07:45:22', 246.727, 162);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NWPX', '2022-11-05 00:52:56', 900.415, 131);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('WEA', '2021-12-28 15:13:02', 536.474, 191);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('WEB', '2021-12-14 16:59:51', 1625.226, 48);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('KMM', '2022-07-11 10:48:32', 521.691, 145);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MXF', '2022-08-06 06:25:23', 509.485, 68);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CHDN', '2022-06-05 21:48:10', 2380.442, 10);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('WPC', '2022-06-20 19:12:08', 1881.373, 160);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ACHC', '2022-05-28 04:50:10', 1074.742, 81);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CAFD', '2022-02-11 02:41:29', 170.345, 132);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GNTY', '2022-08-04 22:37:10', 526.625, 23);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('RGLS', '2022-02-27 15:43:50', 407.506, 246);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CIG.C', '2022-02-11 12:38:37', 666.728, 126);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SBOT', '2021-12-30 14:23:00', 2246.958, 61);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QUMU', '2022-08-20 11:21:09', 1253.49, 182);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('WSR', '2022-07-27 22:12:41', 1944.556, 128);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('VTTI', '2022-06-20 10:17:21', 163.524, 229);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QEP', '2022-01-11 06:52:55', 54.594, 62);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('DERM', '2022-10-13 19:00:24', 2206.036, 46);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('LUX', '2022-02-18 13:44:34', 832.619, 116);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ZFGN', '2022-05-20 04:23:13', 2285.331, 64);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('EMES', '2022-09-09 01:03:22', 2091.83, 112);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('DFVL', '2022-07-12 10:47:48', 1845.179, 110);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSBK', '2022-09-06 16:57:06', 1343.025, 89);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('LINU', '2022-02-27 05:07:58', 2303.043, 106);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AEMD', '2022-02-26 22:16:30', 1797.765, 159);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('KIM^K', '2022-10-03 14:20:22', 2231.147, 172);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('OXBRW', '2022-05-11 22:27:25', 298.188, 234);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SHW', '2022-03-27 18:59:29', 1861.219, 119);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('FELE', '2022-11-08 21:03:19', 354.619, 143);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('FUEL', '2022-08-16 17:53:20', 389.1, 213);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('RRD', '2022-09-22 06:33:21', 2016.381, 184);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('YDIV', '2022-10-03 08:23:13', 854.544, 62);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NCB', '2021-12-27 20:10:09', 2483.19, 61);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('PFL', '2022-09-29 11:52:41', 0.589, 170);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('IMNP          ', '2022-08-03 15:36:33', 297.379, 202);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NGLS^A', '2022-08-24 01:33:13', 2156.02, 221);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ARCC', '2022-05-26 04:23:25', 2249.105, 14);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('WBT', '2022-07-13 00:30:05', 1606.821, 184);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CRT', '2022-02-22 16:30:18', 1324.523, 221);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('STI.WS.B', '2022-10-09 20:11:37', 2346.973, 108);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('BRFS', '2022-11-23 22:26:27', 2353.713, 55);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AVDL', '2022-05-12 22:40:51', 2184.989, 15);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MBWM', '2021-12-04 13:36:44', 1738.592, 58);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('OBAS', '2022-08-29 20:34:18', 1963.981, 209);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('DTLA^', '2022-09-10 01:49:17', 2472.423, 134);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MTL', '2022-11-27 22:48:00', 660.103, 92);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CME', '2022-04-14 21:52:18', 182.722, 214);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('HOLX', '2022-11-01 15:13:54', 2228.948, 120);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NNDM', '2022-01-17 15:21:07', 1506.85, 176);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('WKHS', '2021-12-23 00:32:46', 157.118, 69);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('PETX', '2022-02-03 01:52:53', 2444.832, 137);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('PAVM', '2022-07-29 10:40:21', 2333.333, 17);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('RFEM', '2022-02-13 15:40:25', 1862.126, 120);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('LDOS', '2022-10-02 16:14:36', 145.959, 105);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('XRAY', '2021-12-15 03:59:45', 2094.716, 67);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('PAACR', '2022-11-19 14:36:05', 491.972, 241);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('OXM', '2022-05-09 15:06:29', 1348.712, 192);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ABCB', '2022-04-23 00:37:23', 2133.244, 160);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('EXR', '2022-11-17 09:54:58', 959.233, 121);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SSRI', '2022-09-18 00:23:20', 2484.055, 225);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('IDE', '2022-05-11 06:16:59', 1740.89, 78);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('COMT', '2022-09-28 11:50:39', 1996.059, 148);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NOV', '2022-01-26 22:55:57', 353.862, 123);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('DB', '2022-04-02 19:21:11', 180.018, 36);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('UBNK', '2022-08-11 02:49:13', 1527.357, 49);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QSR', '2022-07-17 06:18:31', 337.658, 96);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('DOX', '2022-06-02 10:13:39', 476.329, 219);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('BAC', '2022-04-07 22:41:36', 1471.99, 98);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('LEA', '2022-07-04 23:52:13', 1455.917, 23);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AXS^D', '2022-09-03 14:15:17', 1361.994, 159);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('HPF', '2022-07-28 21:28:40', 1011.343, 206);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('LGND', '2022-08-21 05:18:47', 1297.996, 135);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('INXN', '2022-03-13 10:28:52', 1570.149, 148);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MESO', '2022-05-12 16:32:03', 1211.827, 123);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMTD', '2022-03-05 06:00:12', 1766.685, 230);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('BERY', '2022-07-18 13:21:30', 1346.494, 227);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('FNB', '2022-04-08 22:33:49', 658.091, 161);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('LTRPB', '2022-02-25 21:32:02', 288.4, 145);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GS^I', '2022-01-15 12:26:13', 846.49, 45);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('PENN', '2022-07-03 08:34:57', 235.787, 67);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('BKFS', '2022-02-14 18:56:12', 23.68, 21);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('KBWY', '2022-10-02 16:11:47', 525.181, 43);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ALB', '2022-01-01 12:19:50', 1031.944, 22);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('IPKW', '2021-12-15 16:03:38', 1677.538, 47);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MYC', '2022-09-26 15:17:58', 558.781, 39);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TVTY', '2022-11-16 03:24:46', 369.347, 162);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ICUI', '2022-06-07 10:40:14', 1274.12, 163);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('INFR', '2022-02-12 17:11:39', 938.008, 161);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CSTR', '2022-11-20 15:17:13', 2472.517, 249);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('EBAY', '2022-07-15 09:00:19', 502.223, 36);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GTYH', '2022-01-30 03:35:53', 299.774, 116);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('VNCE', '2022-09-24 22:12:03', 83.403, 117);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SCHW', '2022-06-17 02:33:53', 2375.847, 70);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('PCI', '2022-02-09 16:40:51', 2112.979, 89);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ALK', '2022-02-17 18:16:14', 2241.866, 164);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('IVZ', '2022-09-22 19:23:03', 638.271, 249);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MOBL', '2022-04-18 00:43:33', 2089.769, 142);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('DWTR', '2022-03-31 14:18:38', 1676.425, 46);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('LRN', '2022-09-03 16:20:48', 392.613, 96);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('FUL', '2022-01-20 15:49:16', 2196.841, 165);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('DSW', '2022-02-22 06:33:40', 739.346, 187);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('UTMD', '2022-10-12 17:09:07', 2247.175, 236);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SOJB', '2022-08-31 18:56:38', 389.339, 40);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('IID', '2022-05-07 10:57:41', 2018.073, 124);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NGL', '2022-11-12 05:06:50', 1123.539, 195);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('USATP', '2022-10-04 21:15:15', 432.348, 145);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CFI', '2022-05-28 14:01:09', 1797.649, 49);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('FUND', '2022-07-17 17:03:00', 578.376, 212);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ZNGA', '2022-04-02 01:38:09', 1654.882, 101);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('OFS', '2022-03-02 19:16:46', 615.726, 163);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('BGFV', '2022-07-22 04:34:20', 1853.096, 99);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('RICK', '2022-09-07 09:39:41', 1418.628, 60);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AGM^A', '2022-01-01 21:21:33', 2115.505, 105);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AEY', '2022-06-14 13:50:24', 330.276, 238);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('DGICB', '2022-05-05 19:49:40', 2057.485, 10);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CS', '2022-06-12 12:22:17', 102.182, 196);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NXJ', '2022-08-25 02:19:07', 1088.247, 165);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SSB', '2022-08-20 01:55:44', 2458.729, 141);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('EMCG', '2022-05-02 22:08:11', 722.16, 15);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ENT', '2022-07-18 15:20:13', 1808.775, 202);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('PDFS', '2022-07-13 00:24:27', 1173.065, 106);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('IVR^B', '2022-10-20 21:43:46', 452.692, 48);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TPC', '2022-01-22 21:57:43', 1544.274, 186);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SXC', '2022-09-30 06:13:42', 1231.274, 235);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSC', '2022-02-12 15:41:18', 2137.418, 141);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CCXI', '2022-05-01 16:40:36', 81.601, 45);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ARTNA', '2022-11-21 14:02:05', 2048.586, 18);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SID', '2022-09-15 04:59:47', 1950.15, 133);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('WAC', '2022-01-24 07:32:31', 177.316, 242);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TK', '2022-07-29 23:18:28', 1663.299, 151);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('DELT', '2022-02-09 08:52:50', 92.635, 110);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('BFZ', '2022-11-01 11:12:23', 0.829, 93);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('INCY', '2022-09-12 09:07:10', 1967.282, 187);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('DCM', '2022-04-07 08:16:40', 1826.231, 143);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('OCRX', '2022-03-13 18:35:17', 1755.66, 85);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SCI', '2022-01-24 14:31:24', 1106.722, 79);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('OVID', '2022-09-10 09:51:43', 143.19, 47);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('WES', '2022-07-27 07:47:56', 1429.148, 184);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NIM', '2022-03-01 18:13:51', 2248.178, 11);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('PRSC', '2022-05-07 23:09:59', 499.02, 104);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('WF', '2021-12-02 10:52:57', 230.798, 225);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TCP', '2022-04-19 20:54:31', 496.315, 99);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('WHR', '2022-02-26 04:34:55', 1088.604, 36);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('HIG.WS', '2022-04-10 21:42:12', 945.976, 105);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('BLW', '2021-12-09 17:32:32', 2442.631, 200);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JBHT', '2022-07-24 07:31:25', 1251.234, 113);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MILN', '2022-11-03 14:47:56', 1636.19, 149);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MTOR', '2022-03-06 02:12:48', 982.026, 132);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CHK', '2022-04-04 08:45:32', 114.079, 42);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CJJD', '2022-06-05 11:15:21', 930.516, 57);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TTEC', '2022-04-22 10:43:48', 34.19, 69);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ARCB', '2022-07-27 10:54:10', 1792.18, 195);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVO', '2022-09-24 23:10:28', 2077.922, 46);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('INSG', '2022-03-23 01:29:13', 1476.163, 198);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JUNO', '2021-12-27 09:01:16', 954.816, 19);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('POT', '2022-01-01 08:33:00', 2450.476, 145);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AFA', '2022-09-12 08:59:13', 2303.427, 117);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('HBK', '2022-09-16 02:34:39', 2037.99, 175);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SEDG', '2022-08-10 02:53:31', 1402.273, 15);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CLNS^H', '2022-08-27 03:06:31', 206.786, 105);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('HVT.A', '2022-08-06 07:50:37', 1983.622, 237);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JBSS', '2021-12-10 01:32:17', 69.94, 187);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('OXM', '2022-09-14 11:14:55', 1924.033, 51);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AVA', '2022-08-13 13:05:44', 1382.32, 177);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('FEYE', '2022-03-04 03:28:19', 1274.654, 4);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('BLPH', '2022-03-19 23:38:06', 2135.044, 163);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('DECK', '2022-04-13 00:35:44', 1941.728, 162);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CUTR', '2021-12-23 03:00:59', 1431.442, 115);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('PRAN', '2022-10-16 04:00:44', 688.834, 83);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NEM', '2022-10-09 04:25:54', 2459.434, 95);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAWW', '2022-01-30 04:01:05', 2036.478, 99);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MBFIP', '2022-04-22 23:09:22', 2079.867, 46);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GEF', '2022-01-02 02:21:59', 150.099, 199);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('LAYN', '2022-07-28 01:19:50', 1793.264, 180);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('PIE', '2022-06-23 00:57:14', 2113.397, 154);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('APF', '2022-09-17 10:58:35', 871.849, 132);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CWH', '2022-05-03 22:27:20', 450.688, 142);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('EMCF', '2022-10-29 12:31:10', 1109.752, 240);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CPAC', '2022-06-18 05:30:37', 2319.187, 68);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('WFE^A', '2021-12-09 03:49:38', 1544.486, 100);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('RLJE', '2022-04-06 11:09:18', 2245.047, 146);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CHK', '2021-12-28 20:21:59', 1546.888, 184);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NTEC', '2022-04-03 15:23:08', 510.031, 122);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('BL', '2022-01-26 11:47:43', 2019.518, 29);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('RGCO', '2022-07-02 12:15:17', 589.706, 59);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('FTXR', '2022-05-30 07:02:27', 2492.752, 118);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CLDC', '2022-09-24 15:58:21', 2254.089, 123);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TIPT', '2022-01-10 16:37:01', 2321.462, 222);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TDOC', '2022-01-28 12:28:30', 682.397, 105);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('BTEC', '2022-07-26 04:44:57', 300.671, 79);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('WBAI', '2022-04-01 12:50:30', 1310.827, 164);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CRVS', '2022-09-29 14:53:18', 2189.534, 174);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('DMRC', '2022-08-26 15:42:07', 353.241, 101);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ASET', '2022-08-17 18:57:53', 1053.773, 85);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AQMS', '2022-10-18 13:07:44', 907.179, 114);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GSUM', '2022-03-30 09:35:44', 1134.086, 155);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JBSS', '2022-11-23 05:59:13', 899.406, 21);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TGNA', '2022-06-03 19:27:39', 1752.567, 167);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('HTGM', '2022-04-17 00:34:09', 2338.258, 46);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('FDC', '2022-02-14 01:32:39', 2361.81, 27);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('INBK', '2022-06-29 04:50:41', 1195.52, 79);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SXT', '2022-11-12 07:28:10', 663.709, 146);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CORI', '2022-09-26 00:49:18', 610.87, 231);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('VFC', '2022-06-15 16:42:57', 1974.712, 143);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('VEACW', '2022-04-18 20:55:36', 1662.837, 25);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('FFHL', '2022-02-03 06:18:05', 1416.793, 101);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('INWK', '2022-04-30 22:33:33', 1437.469, 130);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('DX^A', '2022-04-02 20:55:10', 1300.462, 94);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('VLRS', '2022-01-31 06:52:47', 1984.928, 158);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GSK', '2022-09-17 00:00:14', 1218.732, 197);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMT^B', '2022-01-23 17:44:45', 2292.622, 32);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('RIC', '2022-09-30 00:14:08', 2432.858, 130);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CFA', '2022-02-25 07:12:28', 2254.199, 122);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('DWAC', '2022-09-27 03:38:23', 880.86, 190);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ICBK', '2022-06-03 13:04:21', 54.679, 206);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QGEN', '2022-05-31 14:00:43', 1051.594, 162);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GASS', '2022-09-02 03:37:26', 1856.378, 190);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('BBY', '2022-08-20 02:22:48', 1787.94, 162);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('LND', '2022-01-02 08:07:46', 1011.392, 187);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NEE^C', '2022-09-01 22:40:59', 841.274, 161);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AOI', '2022-08-22 08:41:13', 188.309, 21);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('VSH', '2022-11-16 22:24:44', 2492.114, 34);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CAH', '2022-02-23 16:14:37', 614.493, 83);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('FLN', '2022-02-10 02:07:46', 280.924, 207);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('KIM^J', '2022-02-02 06:31:43', 2279.478, 104);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('FN', '2022-02-27 16:21:50', 2109.623, 155);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('PFK', '2021-12-04 18:23:14', 622.095, 230);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AKO.A', '2022-02-04 04:08:58', 580.841, 148);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MKL', '2022-03-01 22:03:06', 2042.383, 114);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MTSI', '2022-05-15 11:00:43', 2403.944, 156);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CFR', '2022-01-30 20:53:46', 2007.751, 80);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPNS', '2021-12-07 22:56:40', 877.137, 109);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('STM', '2022-02-14 22:03:39', 2112.034, 69);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('KIM^K', '2022-07-25 11:43:49', 863.091, 45);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('RVLT', '2022-06-14 09:48:48', 109.621, 199);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CRAY', '2021-12-24 08:41:28', 2406.706, 115);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CCIH', '2022-07-02 21:04:20', 1137.212, 133);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('BKCC', '2022-05-30 12:38:26', 1445.877, 107);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('BELFA', '2021-12-28 23:04:36', 1132.858, 136);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GEF', '2022-03-11 15:57:00', 751.697, 6);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('LRGE', '2022-06-26 13:30:54', 2185.08, 32);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CSU', '2022-04-14 01:37:47', 1427.05, 60);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CDNA', '2022-11-22 01:03:19', 544.129, 176);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('HASI', '2022-02-05 00:56:58', 1014.39, 53);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('WVVI', '2022-02-09 02:17:01', 180.482, 211);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('HZO', '2022-08-11 15:31:55', 1476.307, 191);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('WHLR', '2022-03-17 23:06:34', 1271.815, 228);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CCL', '2021-12-09 04:57:50', 448.567, 5);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MCI', '2021-12-24 14:56:44', 1877.658, 107);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('IMMR', '2022-07-01 14:41:15', 265.563, 214);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('FH', '2022-04-17 12:11:32', 87.189, 221);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SIVB', '2022-06-24 22:57:46', 2388.017, 247);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ELECW', '2022-01-16 04:21:34', 2181.248, 187);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CGNT', '2022-02-05 22:50:07', 2218.959, 236);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('LM', '2022-10-27 02:04:11', 1158.1, 99);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('FAD', '2022-04-11 19:51:37', 849.142, 61);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TLYS', '2022-02-03 14:49:32', 1984.949, 246);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MMAC', '2022-05-17 23:18:52', 1274.076, 161);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('EAT', '2022-02-06 16:05:08', 1699.695, 16);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NEE^G', '2022-07-05 06:44:43', 579.96, 37);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SNHY', '2022-02-15 23:27:15', 1837.108, 169);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('FIF', '2021-12-17 21:08:53', 1500.546, 27);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('INO', '2022-03-20 07:17:05', 1695.689, 241);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('BAC^Y', '2022-02-22 09:42:25', 920.726, 176);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMH^C', '2021-12-10 17:16:21', 1110.694, 45);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('LPI', '2022-04-27 23:46:45', 772.271, 182);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ZIONW', '2022-07-12 02:54:38', 406.063, 148);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('BDJ', '2022-01-30 06:00:34', 2268.67, 187);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('BRK.B', '2022-09-14 09:56:48', 1265.578, 132);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('VIPS', '2022-04-27 21:26:12', 1397.052, 217);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MKL', '2021-12-21 16:45:27', 2031.263, 153);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SCZ', '2022-06-22 23:01:48', 815.554, 109);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('FOR', '2022-03-13 04:24:14', 2239.071, 93);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('BAF', '2022-10-01 20:09:04', 566.456, 31);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('BWINB', '2022-08-27 18:58:31', 549.896, 73);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('COF^G', '2022-01-30 13:13:57', 2459.584, 180);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('HPE', '2022-03-19 00:42:46', 2070.171, 30);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CREE', '2022-10-11 12:26:19', 1399.658, 59);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('FLEX', '2022-04-11 17:00:55', 159.113, 216);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVTA', '2022-01-25 07:13:53', 168.869, 66);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPLP', '2022-04-05 00:57:06', 694.266, 222);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CSX', '2022-09-14 07:36:50', 457.811, 158);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('FLL', '2022-03-27 19:30:18', 1105.279, 84);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('OXLCN', '2022-06-04 00:01:33', 302.309, 232);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('FUL', '2022-03-05 08:17:56', 1275.165, 93);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MOS', '2022-06-27 11:01:49', 367.01, 3);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TIL', '2022-11-10 13:39:09', 2186.371, 26);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CUTR', '2022-01-27 00:52:55', 1801.156, 202);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('BXE', '2022-05-21 14:47:48', 2356.851, 220);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('WLK', '2022-02-28 01:00:17', 2287.377, 164);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('RRC', '2022-05-31 10:09:02', 1269.591, 106);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('VIVO', '2022-01-24 21:54:00', 23.876, 35);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ONCS', '2022-04-24 04:34:02', 502.23, 9);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ANH^A', '2022-10-08 20:49:14', 2377.767, 206);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CMD', '2022-10-21 11:36:01', 73.021, 18);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('EZT', '2022-01-21 10:20:17', 427.421, 98);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('RBCN', '2022-08-13 17:20:52', 1106.118, 156);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('BEP', '2022-02-15 16:45:58', 979.378, 245);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AVD', '2022-09-20 23:26:21', 1348.715, 153);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('KWR', '2022-11-04 03:27:46', 1107.956, 215);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NNC', '2022-04-23 09:11:13', 2175.388, 129);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('FPL', '2022-11-11 21:24:39', 127.823, 246);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MTR', '2022-02-05 03:11:40', 669.493, 1);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('DD', '2022-03-14 05:32:43', 1583.901, 14);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GTN.A', '2022-10-07 01:53:57', 383.212, 24);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TWI', '2022-08-28 21:12:32', 767.969, 219);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MOG.A', '2022-06-18 00:08:22', 2294.266, 225);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('BLK', '2022-11-06 09:25:00', 672.537, 186);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MUA', '2022-06-02 17:35:57', 2323.402, 172);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ZTS', '2022-11-18 11:38:50', 1733.158, 14);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MPVD', '2022-08-31 04:51:09', 2461.777, 144);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SNPS', '2022-09-08 17:03:22', 265.909, 120);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('BABY', '2022-10-24 22:43:09', 265.495, 220);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('DCM', '2022-02-06 03:41:04', 734.171, 123);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('BBRG', '2022-08-10 21:11:54', 1386.796, 125);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NATH', '2022-02-03 02:14:21', 419.464, 201);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CDK', '2022-09-30 00:16:30', 1072.31, 9);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ZB^G', '2022-08-24 23:16:19', 995.143, 220);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MICTW', '2022-06-02 10:50:18', 318.108, 103);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TCRX', '2022-05-15 23:20:50', 80.407, 153);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ZIOP', '2022-08-23 23:38:19', 451.745, 243);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TACO', '2022-05-20 02:46:47', 2127.271, 93);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('WBC', '2022-02-01 02:43:22', 2390.254, 97);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('FSB', '2022-10-09 13:57:13', 187.42, 30);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GT', '2022-10-17 08:59:15', 932.027, 243);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('VRSN', '2022-07-08 01:53:48', 1770.972, 90);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MYSZ', '2022-08-08 08:29:33', 307.06, 249);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GHM', '2022-09-21 12:29:28', 690.966, 88);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('WIN', '2022-07-31 19:45:35', 1149.726, 35);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CIB', '2022-10-17 14:59:01', 1873.328, 185);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('YUM', '2022-09-19 17:31:01', 2482.856, 26);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SNSS', '2021-12-28 19:35:21', 1357.089, 179);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('HCN', '2022-04-17 05:53:56', 797.131, 39);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('APTS', '2022-10-26 10:55:28', 31.914, 216);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('IPCC', '2022-08-09 07:22:58', 1001.819, 46);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPLP', '2022-03-29 07:20:35', 379.404, 25);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SMHI', '2022-05-03 06:15:56', 2395.325, 151);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('BGG', '2022-05-02 19:48:52', 1574.565, 229);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MGM', '2022-02-07 23:14:23', 1472.638, 105);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('RST', '2022-05-29 10:05:32', 429.665, 178);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('FF', '2022-03-22 10:15:04', 708.461, 178);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('RELV', '2022-08-07 07:46:08', 2186.99, 146);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TTS', '2022-02-04 21:13:42', 369.138, 189);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CIR', '2022-06-08 21:41:07', 1593.763, 185);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GJH', '2022-05-09 17:51:34', 1295.038, 97);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('DNBF', '2022-05-14 22:00:26', 421.763, 168);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GNE', '2022-04-08 09:40:05', 2189.244, 201);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('EV', '2022-01-04 16:47:09', 1664.796, 248);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SB', '2021-12-14 10:19:39', 2230.039, 217);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('KS', '2022-01-13 03:27:45', 2243.726, 69);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('KEQU', '2022-05-07 05:09:51', 1514.273, 58);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GGZ^A', '2021-12-30 06:14:47', 1178.134, 101);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MNK', '2022-03-22 22:37:01', 828.218, 198);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('LNGR', '2022-02-07 18:00:15', 124.455, 3);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('IVR', '2022-09-09 22:45:30', 1469.682, 102);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ANDAU', '2022-08-09 15:55:24', 355.135, 134);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SSW', '2022-02-04 07:26:39', 154.364, 55);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('DY', '2022-03-24 09:37:39', 1795.176, 207);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TCBIP', '2022-02-28 12:06:36', 847.712, 29);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AVXS', '2022-09-23 15:10:16', 286.141, 211);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('RA', '2021-12-04 22:43:36', 766.662, 177);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AIN', '2022-02-16 02:37:56', 508.388, 152);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('PFMT', '2022-05-11 12:53:14', 1427.185, 162);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ENR', '2022-09-08 19:40:01', 1012.473, 238);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NXN', '2022-05-25 06:57:56', 1468.6, 43);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('WTTR', '2022-03-12 15:16:40', 2252.741, 108);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ESG', '2022-01-09 07:16:48', 2419.212, 119);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('RYI', '2022-02-18 02:06:32', 2449.739, 26);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CDR^B', '2022-02-02 03:43:34', 604.401, 236);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SID', '2022-10-20 21:04:03', 998.156, 9);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMBA', '2022-02-27 04:59:27', 1459.868, 124);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('PRSS', '2022-04-29 17:41:02', 299.048, 241);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QINC', '2022-11-17 14:20:18', 1991.283, 85);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GNTY', '2022-08-20 17:30:41', 386.391, 95);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NTIC', '2022-06-10 16:26:01', 1640.477, 146);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('BKH', '2022-11-11 18:57:59', 2478.813, 62);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('DFVL', '2022-02-10 03:41:26', 1070.172, 110);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSM', '2022-04-26 17:16:08', 2159.213, 124);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('IRET', '2022-06-12 19:23:29', 1150.389, 48);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('FTXD', '2022-07-22 08:02:44', 2027.069, 81);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MED', '2022-07-27 17:06:19', 509.386, 78);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ASB', '2022-11-18 07:28:53', 753.69, 165);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SCX', '2022-03-24 01:42:34', 2328.881, 249);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ABCO', '2022-08-03 23:56:11', 196.63, 65);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JCP', '2021-12-12 01:29:00', 1667.232, 10);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('FBNC', '2022-09-22 18:38:14', 2036.026, 240);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SINA', '2022-05-20 18:21:16', 1906.359, 142);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ATI', '2022-11-22 03:19:29', 2169.633, 3);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ALBO', '2022-07-10 07:18:56', 295.003, 190);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NLY^D', '2022-02-05 01:00:35', 978.559, 205);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GFN', '2022-08-29 05:58:59', 2458.825, 131);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('HCSG', '2022-04-12 09:20:45', 1491.804, 176);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ASC', '2021-12-09 12:40:06', 49.742, 161);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CDTX', '2022-03-23 14:12:46', 333.602, 55);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('EGP', '2022-06-25 14:56:19', 2132.882, 86);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('DVN', '2022-10-07 03:23:48', 2005.162, 117);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('LYG', '2022-05-21 08:57:41', 1403.546, 104);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('full_name', '2022-04-16 22:21:47', 1537.861, 224);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFJ', '2022-10-08 17:49:43', 2333.214, 146);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NEWR', '2022-03-07 12:08:05', 267.246, 66);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('EMCF', '2022-04-08 07:43:16', 1110.125, 46);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SBSI', '2022-10-20 01:24:44', 1248.089, 162);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('LQ', '2022-06-14 19:26:31', 156.755, 134);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TRCB', '2022-11-08 13:45:24', 2345.013, 218);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CUBE', '2022-06-11 22:38:05', 2275.012, 26);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('RNR^C', '2022-03-22 16:08:28', 347.595, 101);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('CRAI', '2022-07-22 01:37:07', 1335.839, 100);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('LECO', '2021-12-25 09:36:15', 1091.027, 203);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('PRFZ', '2022-02-22 12:46:54', 2010.171, 10);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MMU', '2022-11-28 07:33:57', 1587.03, 223);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('FIX', '2021-12-01 04:32:00', 122.286, 49);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ALDX', '2022-10-29 16:23:29', 669.627, 91);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ABT', '2022-09-07 08:36:31', 1193.275, 172);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NOA', '2022-06-13 08:23:15', 524.224, 47);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('WRB', '2022-09-29 05:32:30', 520.683, 112);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('BBP', '2022-02-28 10:24:43', 265.812, 191);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMRC', '2022-05-13 19:33:05', 1058.536, 39);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MHNB.CL', '2022-07-05 00:22:14', 796.272, 92);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('DSWL', '2022-02-04 02:47:05', 231.424, 47);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('PTH', '2022-03-01 20:53:37', 1746.639, 147);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('IZEA', '2022-01-07 10:16:58', 332.94, 217);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('PVTBP', '2022-07-01 20:16:45', 1341.863, 193);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('HHS', '2022-01-16 22:37:17', 522.955, 78);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TVIX', '2022-09-28 05:42:40', 462.737, 136);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('DXC', '2022-03-27 23:46:38', 20.577, 12);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('RPAI', '2022-07-26 13:07:34', 1722.515, 34);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ELON', '2022-10-20 15:56:40', 1365.354, 216);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TANH', '2022-11-27 08:46:00', 2185.754, 82);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('PRFT', '2022-07-29 01:54:44', 1079.571, 174);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('LPX', '2022-03-31 15:36:13', 1009.579, 146);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('KYN^F', '2022-04-16 13:28:31', 1475.536, 39);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('ENH^C', '2022-04-06 10:24:47', 1339.287, 237);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TPVG', '2022-09-14 10:34:37', 1194.948, 134);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('HR', '2022-05-26 14:27:24', 994.261, 30);