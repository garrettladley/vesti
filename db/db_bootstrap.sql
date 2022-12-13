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
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-08-29 01:41:40', 1471.48, 69);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2021-12-15 13:35:21', 755.71, 240);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-08-18 22:13:20', 1699.36, 75);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-04-19 04:49:43', 1767.978, 190);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-10-17 20:03:45', 1883.624, 60);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-01-31 06:32:06', 694.833, 30);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-06-09 08:55:20', 2211.154, 218);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2021-12-03 01:46:27', 952.211, 196);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-09-25 14:49:34', 1074.531, 114);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-01-06 19:30:03', 2071.59, 93);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-01-14 18:00:05', 1938.022, 202);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-03-31 00:00:50', 1836.44, 125);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-07-15 22:56:11', 556.283, 157);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-09-11 01:05:45', 249.964, 206);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-10-17 16:37:48', 665.296, 173);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-02-20 14:52:49', 2269.357, 222);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-09-29 11:41:27', 406.963, 226);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-10-30 12:34:20', 1405.898, 151);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2021-12-28 04:29:34', 1834.124, 95);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-04-23 08:07:34', 1554.021, 224);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-01-02 15:58:55', 493.416, 7);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-10-24 16:15:10', 1691.729, 37);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-04-15 03:36:06', 81.435, 124);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-05-15 19:02:10', 336.303, 54);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2021-12-09 06:45:29', 2171.181, 114);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-03-27 05:00:20', 2126.09, 94);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-08-17 21:09:45', 1324.401, 175);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-09-09 17:43:44', 761.775, 147);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-07-02 05:36:51', 281.397, 33);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2021-12-05 15:08:54', 2348.277, 80);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-05-23 08:02:15', 1576.112, 199);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-10-23 06:20:47', 794.218, 245);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-11-23 01:35:33', 2058.389, 122);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2021-12-07 06:50:13', 2287.897, 129);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-03-31 20:54:02', 1438.669, 39);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2021-12-12 10:09:10', 1135.204, 246);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-04-16 14:29:13', 154.723, 15);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-10-06 08:08:26', 2259.548, 137);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-01-14 22:34:22', 1376.232, 234);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2021-12-01 08:56:40', 775.694, 42);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2021-12-14 05:19:51', 113.76, 145);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-02-24 18:26:17', 1558.987, 78);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-10-05 00:16:04', 1242.187, 222);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-03-06 09:59:24', 1404.976, 34);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-11-14 14:59:17', 1404.507, 218);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-01-23 20:47:14', 2468.296, 80);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-07-11 21:21:08', 460.807, 102);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-09-01 21:32:34', 2416.578, 42);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-04-12 11:45:31', 742.212, 171);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-03-09 20:25:38', 169.22, 118);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-11-23 07:20:58', 2382.276, 159);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-07-05 03:08:36', 2239.907, 98);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-03-13 17:18:12', 1288.344, 198);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-08-15 18:49:18', 879.155, 182);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-08-25 21:34:44', 1810.414, 186);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-07-11 10:32:32', 652.167, 101);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2021-12-30 04:01:11', 2005.866, 175);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-10-09 19:10:24', 1652.151, 177);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-03-28 20:57:00', 2388.913, 49);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-06-17 13:09:58', 1599.264, 181);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-11-26 03:16:26', 2473.778, 145);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-03-20 18:59:52', 2309.435, 160);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-09-25 18:38:50', 1950.735, 201);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-05-19 23:30:46', 984.347, 93);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-01-05 19:11:59', 2290.42, 183);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-07-16 06:59:01', 477.326, 176);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-02-21 04:00:13', 918.45, 164);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-07-11 03:29:28', 1793.157, 74);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-10-15 12:59:24', 969.717, 7);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-08-22 03:02:06', 1904.162, 202);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-07-01 13:37:19', 2279.794, 57);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-09-26 03:56:34', 1174.907, 79);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-03-19 06:55:32', 927.101, 111);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-09-28 13:14:42', 2104.562, 132);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-11-18 23:08:04', 220.288, 166);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-09-04 05:22:16', 1216.92, 19);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-11-28 16:22:47', 144.995, 143);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2021-12-15 11:23:08', 115.751, 238);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-08-28 03:23:45', 1606.5, 185);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-02-13 22:52:14', 684.221, 60);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-01-09 11:53:02', 783.906, 200);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-02-19 13:18:07', 2315.58, 232);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-08-14 16:49:24', 355.22, 155);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-06-10 03:11:11', 588.651, 33);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-02-01 18:56:38', 2313.056, 185);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-06-21 11:11:08', 860.7, 80);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-01-16 21:13:14', 1770.458, 45);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-03-28 11:04:55', 1321.663, 177);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-02-05 09:44:03', 1784.224, 28);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-08-01 21:04:12', 1407.043, 95);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-05-10 16:06:48', 2164.546, 126);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-01-27 19:54:48', 2074.421, 152);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-11-18 02:18:33', 45.591, 40);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2021-12-01 16:35:21', 411.555, 169);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2021-12-28 02:44:39', 1317.153, 247);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2021-12-29 13:40:39', 1282.537, 161);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-03-04 06:33:05', 2110.469, 139);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-02-06 00:51:06', 1303.514, 22);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-11-02 15:28:22', 2190.116, 56);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2021-12-17 06:33:59', 1592.253, 25);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-02-16 10:41:54', 152.378, 219);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-01-23 20:45:19', 762.86, 42);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-06-14 08:44:00', 983.463, 218);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-01-15 06:32:08', 427.186, 19);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-09-16 23:27:07', 123.801, 238);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-09-06 19:24:53', 1741.883, 135);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-09-02 16:00:21', 2038.861, 163);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-11-01 18:48:21', 1188.364, 168);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-05-17 05:53:51', 1710.515, 157);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-09-24 22:51:33', 423.611, 87);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-07-27 13:55:17', 1816.343, 95);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-02-01 00:06:31', 2443.725, 167);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-01-07 19:56:07', 138.429, 59);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-11-06 20:29:08', 1857.965, 50);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-02-21 12:52:41', 1249.211, 136);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-09-29 04:27:07', 920.545, 107);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-07-20 05:39:00', 1290.822, 69);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-03-20 14:58:16', 1968.621, 73);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-07-12 01:30:58', 344.436, 112);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-04-17 17:15:32', 2439.433, 82);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2021-12-14 23:17:33', 2281.178, 86);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-02-14 22:42:06', 239.229, 8);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-11-29 01:45:32', 2275.119, 20);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-01-22 10:03:18', 424.724, 234);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-01-11 02:06:54', 715.799, 30);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-07-06 10:27:29', 736.974, 62);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2021-12-14 03:22:05', 2019.672, 63);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-05-11 14:11:35', 986.345, 245);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-11-22 07:44:12', 1017.502, 130);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-07-26 00:41:16', 1742.723, 147);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-04-27 03:45:53', 912.325, 175);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-07-25 14:16:20', 1614.711, 87);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-09-04 10:13:38', 2022.732, 149);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-02-28 06:15:56', 1638.926, 22);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-07-26 18:33:55', 256.8, 14);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-02-17 23:58:37', 1453.354, 167);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-07-22 05:45:35', 1936.054, 191);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-06-02 10:18:56', 471.369, 26);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-02-14 08:56:51', 1392.513, 13);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-08-06 15:02:43', 600.755, 162);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-08-25 13:08:17', 331.545, 127);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-07-16 10:59:03', 774.922, 90);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-03-26 09:50:36', 2321.742, 218);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2021-12-22 17:47:09', 271.003, 137);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-11-24 14:54:08', 1530.967, 4);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-08-06 09:48:14', 845.444, 1);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2021-12-01 15:46:27', 99.356, 205);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-04-27 22:14:05', 429.147, 103);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-09-11 14:30:00', 1215.854, 69);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-04-19 22:26:01', 417.285, 166);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-09-06 11:09:50', 1000.735, 47);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-03-07 02:07:57', 8.138, 202);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-01-13 15:00:43', 928.501, 10);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-04-09 07:47:32', 613.335, 18);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-03-01 01:22:59', 125.598, 46);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-08-05 15:38:29', 1418.201, 13);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-10-05 11:34:48', 2167.283, 202);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2021-12-25 19:39:25', 490.801, 217);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-03-18 10:50:31', 41.476, 184);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-07-26 23:40:48', 2449.473, 216);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-05-16 05:30:37', 1226.094, 195);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-01-08 02:51:34', 2369.871, 240);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-03-03 02:59:58', 1288.03, 227);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-08-12 16:29:21', 670.421, 69);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-02-09 05:49:31', 2490.825, 108);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-02-07 17:00:55', 1390.356, 166);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-01-04 14:05:25', 131.781, 102);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-03-12 08:48:36', 462.298, 141);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-06-19 04:26:27', 1547.314, 107);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-10-18 10:47:34', 2156.626, 228);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-04-19 12:57:22', 291.56, 143);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-07-06 23:51:09', 2494.496, 88);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-08-11 16:32:11', 858.709, 177);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-10-18 15:11:54', 2268.578, 169);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-04-20 01:41:54', 62.598, 189);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2021-12-11 21:04:51', 74.826, 68);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-05-06 21:45:42', 1465.734, 133);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-03-25 14:08:59', 2124.341, 143);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-02-28 01:25:27', 2182.912, 139);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-07-02 10:31:23', 950.653, 14);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-03-05 11:11:50', 759.537, 190);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-09-22 10:09:02', 324.284, 180);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-04-17 23:48:07', 1637.186, 61);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-02-01 21:49:50', 1960.206, 50);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-02-08 14:23:54', 878.022, 133);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-09-23 00:27:03', 72.592, 204);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-05-27 18:52:08', 1760.821, 218);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-04-01 00:00:09', 1108.195, 35);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-02-17 18:24:47', 1078.3, 135);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-06-16 07:11:24', 1609.526, 248);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-04-22 10:11:54', 638.347, 214);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-02-20 15:55:55', 959.701, 196);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-10-17 05:41:55', 2178.294, 73);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-01-18 22:11:16', 1548.778, 33);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-01-12 04:05:20', 267.097, 127);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2021-12-07 06:44:46', 1097.838, 45);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-11-01 22:40:52', 130.52, 191);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2021-12-27 11:00:47', 1845.276, 64);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-08-13 20:03:41', 2148.471, 228);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-07-14 08:43:02', 2414.148, 42);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-02-26 17:11:17', 2099.516, 185);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-11-27 06:50:11', 2275.697, 78);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-04-24 07:43:55', 684.503, 127);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-03-29 21:22:24', 2227.081, 82);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-11-03 05:24:45', 94.716, 152);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-10-30 12:37:31', 1698.833, 107);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-04-15 12:07:43', 1770.466, 22);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-04-04 18:35:36', 368.331, 60);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2021-12-13 18:50:47', 1824.071, 137);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-10-18 10:23:28', 1470.734, 98);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-06-23 02:54:16', 1410.357, 179);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-08-05 16:06:51', 258.725, 206);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-09-13 20:19:26', 2471.355, 227);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-09-06 17:15:56', 2109.657, 106);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-06-03 20:46:59', 990.485, 151);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-03-03 07:47:46', 2469.64, 63);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-06-17 22:59:49', 616.525, 170);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-07-31 10:43:14', 2254.551, 158);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-10-04 13:29:28', 1121.689, 149);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-02-24 20:12:40', 1358.639, 194);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-10-30 22:32:32', 2173.185, 18);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-06-18 13:47:36', 1880.96, 236);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-03-03 18:23:04', 61.822, 205);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-03-16 09:22:17', 2000.387, 229);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-03-31 01:08:53', 385.832, 185);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-11-11 11:22:51', 1402.056, 218);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-10-31 17:17:47', 983.391, 11);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-06-30 18:41:33', 530.91, 145);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-05-08 02:12:37', 482.437, 50);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-01-23 09:30:27', 129.251, 21);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2021-12-16 22:37:12', 504.495, 111);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-09-11 20:48:00', 1348.135, 68);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-10-10 20:54:55', 546.61, 77);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-04-16 22:23:56', 670.04, 77);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-09-14 03:24:28', 915.07, 122);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-04-08 08:49:53', 1579.671, 239);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-06-24 00:13:20', 1579.068, 107);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-10-28 03:11:54', 1380.458, 186);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2021-12-02 19:51:32', 1143.41, 126);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2021-12-01 13:11:15', 109.945, 241);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2021-12-17 15:46:58', 1749.08, 158);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-02-16 19:39:30', 1901.788, 157);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-08-30 22:30:34', 228.252, 17);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-05-11 14:53:00', 10.522, 122);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-04-06 02:35:30', 2408.539, 127);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-09-23 09:03:36', 28.99, 77);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-02-25 02:40:40', 341.977, 36);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-06-19 13:57:42', 1773.389, 86);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-04-21 04:48:34', 351.616, 146);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-04-13 04:09:14', 40.812, 85);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-06-25 20:03:16', 189.043, 61);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-10-31 17:51:47', 2291.373, 189);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-11-14 20:03:33', 1874.337, 144);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-11-30 03:39:01', 212.144, 61);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2021-12-12 15:13:45', 440.538, 169);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2021-12-07 20:26:31', 1841.359, 127);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-09-09 19:51:09', 1471.377, 102);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-04-16 15:59:06', 26.139, 165);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-09-15 22:56:01', 1041.068, 156);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-10-29 07:12:09', 612.577, 46);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-01-04 16:26:17', 1253.989, 225);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-06-14 09:14:00', 1951.933, 157);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-08-18 16:48:22', 2384.612, 107);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2021-12-24 08:17:57', 1477.348, 217);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-07-06 20:47:32', 706.462, 46);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-04-30 08:09:50', 2264.087, 72);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-06-15 15:34:03', 732.551, 126);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-06-12 19:37:33', 1232.288, 10);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-05-14 00:35:37', 2389.166, 167);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-06-09 06:44:17', 1459.897, 225);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-07-25 11:21:07', 18.237, 148);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-04-23 02:40:13', 2010.525, 121);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-05-23 23:26:45', 2247.391, 80);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-02-22 01:01:22', 1773.705, 113);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-06-12 07:59:25', 1259.581, 244);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-09-10 18:13:25', 788.061, 61);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-05-23 17:56:04', 750.202, 178);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-06-04 16:28:11', 1548.698, 51);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-03-09 11:55:05', 904.373, 74);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2021-12-13 23:13:36', 2236.243, 184);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-06-19 03:28:21', 1814.747, 61);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-04-08 20:34:50', 2386.693, 3);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-10-11 08:00:18', 2208.995, 19);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-04-22 15:27:20', 1717.575, 36);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-03-03 14:46:25', 468.222, 225);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-05-02 05:42:16', 1508.85, 140);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-11-25 15:54:13', 1712.883, 154);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-01-01 04:20:26', 534.128, 245);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-09-06 06:43:56', 2232.704, 172);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-03-09 09:29:56', 1437.529, 235);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-01-01 20:14:49', 698.467, 19);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-07-14 00:34:19', 304.343, 205);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-09-14 18:00:49', 1593.459, 27);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-01-02 20:58:29', 1861.948, 175);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-11-24 15:16:21', 589.925, 153);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2021-12-11 09:43:35', 2372.893, 128);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-07-17 15:03:32', 1523.167, 164);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-10-18 13:10:48', 1558.954, 164);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-03-21 05:10:29', 1505.085, 26);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-07-27 03:30:43', 2049.128, 84);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2021-12-28 18:12:31', 1289.623, 42);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-01-11 02:07:13', 2160.879, 219);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-07-16 19:50:22', 1055.126, 68);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-04-27 22:18:07', 1951.012, 88);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-02-07 02:45:01', 989.481, 123);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-11-05 05:15:04', 1221.541, 40);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-05-14 01:11:40', 1174.333, 8);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-07-20 07:53:23', 244.021, 83);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2021-12-12 22:45:50', 1700.528, 148);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-08-03 01:24:31', 2197.339, 7);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-09-20 17:50:19', 334.773, 200);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-05-10 01:40:28', 1550.943, 11);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-01-31 20:10:40', 1761.947, 4);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-10-12 06:28:45', 1357.703, 27);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-11-27 12:38:08', 1140.646, 162);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-11-17 14:51:30', 529.974, 8);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-01-16 20:12:45', 71.72, 76);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-02-13 08:51:17', 261.735, 198);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-05-26 18:23:22', 1327.85, 21);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-01-30 10:51:31', 20.7, 1);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-04-28 01:43:14', 1279.006, 186);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-10-03 19:33:53', 1375.767, 243);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-05-19 15:42:39', 959.537, 228);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-03-26 10:43:45', 294.82, 126);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2021-12-14 22:14:54', 827.437, 92);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-01-27 04:53:51', 1318.427, 100);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-10-26 22:39:23', 2431.511, 130);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-08-24 09:16:54', 1773.255, 41);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-07-11 22:55:38', 34.501, 228);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-03-14 14:28:40', 1943.505, 126);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-04-16 17:17:39', 639.347, 3);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-06-05 02:00:48', 966.723, 241);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-07-17 21:22:04', 2014.255, 248);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2021-12-22 05:16:37', 202.479, 138);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-06-06 19:53:27', 1002.472, 119);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-10-22 06:32:37', 2291.084, 191);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-03-22 05:47:34', 2075.734, 138);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-08-07 22:20:14', 668.036, 192);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-11-07 06:50:06', 1757.236, 178);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-03-25 07:53:29', 150.173, 151);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-07-10 10:14:18', 381.053, 178);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-05-05 18:46:31', 1968.535, 83);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-09-29 12:57:57', 1334.837, 174);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-11-20 20:40:23', 992.167, 56);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-06-20 23:47:40', 2259.563, 69);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-02-24 20:17:40', 861.269, 205);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-10-26 23:25:04', 286.969, 110);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-10-26 19:51:13', 144.183, 91);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-06-27 23:25:57', 2315.426, 113);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-09-16 19:04:55', 2022.507, 88);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-11-02 03:48:08', 1766.488, 228);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-08-02 13:18:47', 941.35, 233);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-03-23 00:06:41', 20.137, 48);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-07-12 00:02:49', 480.06, 208);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-06-03 06:12:52', 1622.388, 130);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-11-25 23:46:33', 2178.876, 18);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2021-12-11 19:39:28', 1568.833, 144);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-03-11 19:09:53', 2433.988, 85);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-11-30 13:51:42', 62.258, 88);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-03-17 19:49:11', 869.472, 180);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-02-11 01:01:37', 1090.75, 161);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-09-08 17:18:20', 774.259, 138);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2021-12-22 13:40:48', 1322.428, 214);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-02-02 10:59:41', 1725.055, 74);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-01-14 12:13:38', 966.282, 96);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-08-04 18:14:06', 2115.468, 19);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-05-25 02:33:44', 1930.173, 106);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-03-08 23:18:31', 843.459, 165);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-11-29 00:29:32', 653.775, 179);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2021-12-23 20:49:54', 2489.463, 183);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-11-16 23:43:48', 1105.922, 154);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-01-07 02:07:01', 2275.024, 34);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-05-12 13:05:11', 1284.025, 223);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-09-27 02:16:53', 1596.743, 54);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-04-03 01:11:47', 1019.591, 26);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-06-25 01:16:30', 1697.476, 44);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-08-27 02:53:04', 623.511, 71);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-02-06 07:03:55', 1283.366, 143);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-11-21 11:35:50', 1664.666, 217);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-07-02 03:03:17', 810.824, 64);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-03-26 07:52:08', 1822.232, 33);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-03-18 11:01:15', 836.385, 22);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-02-24 12:27:35', 2059.275, 108);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-05-12 23:30:40', 1344.15, 58);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-05-04 04:19:57', 1689.822, 200);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-02-22 03:22:36', 907.814, 36);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-08-29 11:00:40', 1505.912, 69);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-09-16 13:36:32', 2498.751, 6);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-03-06 00:04:46', 1808.838, 167);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-07-29 11:01:22', 796.668, 78);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-03-14 18:37:48', 763.649, 112);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-03-13 19:57:29', 1564.668, 3);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-05-29 10:26:27', 1805.313, 154);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-09-14 10:23:54', 1433.68, 181);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-07-28 02:27:24', 1459.87, 120);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-11-10 13:10:08', 1047.714, 74);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-04-07 08:38:37', 1906.962, 190);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2021-12-06 03:48:00', 1798.961, 18);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-09-07 14:58:46', 542.987, 56);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-11-11 23:06:06', 2049.309, 20);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-04-02 19:39:38', 344.384, 99);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-06-01 19:41:05', 1682.02, 51);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2021-12-12 08:58:12', 2425.575, 119);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-11-03 15:40:57', 231.739, 234);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-05-11 10:33:32', 201.02, 159);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-07-03 17:54:29', 1004.17, 181);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-06-10 23:18:36', 1225.404, 59);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-07-01 22:40:28', 356.15, 221);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-03-30 08:35:25', 690.668, 2);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-04-02 13:40:19', 1780.787, 123);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-10-03 08:02:18', 1021.829, 177);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-08-06 06:21:55', 2380.426, 176);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-05-20 16:10:06', 283.997, 87);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-01-23 11:08:06', 1706.546, 219);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-05-04 01:13:45', 2326.195, 93);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-04-25 23:24:48', 55.803, 175);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-10-24 03:00:35', 576.441, 227);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2021-12-10 04:51:33', 278.66, 173);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-07-08 13:50:48', 1037.229, 135);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-05-13 16:34:59', 755.692, 8);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-06-20 11:41:51', 1111.353, 130);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-05-24 00:30:01', 478.653, 93);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-10-28 00:06:49', 876.431, 115);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-05-11 12:44:39', 1588.576, 60);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2021-12-01 04:20:46', 1793.953, 131);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-03-18 10:12:56', 849.119, 209);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-05-19 15:22:25', 606.879, 3);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2021-12-17 19:51:09', 2461.292, 120);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-02-17 01:00:04', 1752.085, 47);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-08-26 18:18:47', 466.461, 211);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-03-12 13:25:03', 1895.602, 151);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-06-15 11:29:22', 2424.687, 241);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-04-17 10:46:26', 952.584, 50);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-04-11 14:01:15', 243.806, 223);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-01-06 20:55:00', 1034.406, 149);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-02-18 08:38:22', 2089.884, 79);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-03-31 20:34:23', 2384.525, 86);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-09-24 18:47:55', 1051.918, 155);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-02-27 01:34:39', 510.79, 88);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2021-12-22 20:32:42', 775.804, 119);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-08-24 08:54:00', 1893.302, 76);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2021-12-20 09:37:57', 779.018, 243);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-07-23 00:33:37', 646.712, 202);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-06-14 18:25:46', 380.89, 219);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-02-09 09:28:37', 1124.686, 106);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2021-12-24 08:57:02', 1190.176, 165);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-05-16 08:15:14', 2015.66, 60);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-10-16 03:08:54', 980.302, 204);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-04-14 08:36:53', 1006.562, 186);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-11-24 00:59:52', 691.916, 142);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-06-06 01:06:13', 2418.929, 38);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-06-02 11:46:08', 203.769, 193);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-07-18 15:04:28', 1943.898, 95);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-08-16 11:55:39', 1884.748, 239);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-09-15 04:58:00', 19.253, 182);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-03-26 11:06:32', 5.359, 207);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-08-17 05:18:18', 407.997, 183);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-10-27 02:17:53', 1455.843, 1);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-11-02 06:25:51', 2081.317, 176);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-04-29 14:37:57', 1511.211, 151);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-07-15 14:36:56', 2491.955, 128);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2021-12-14 01:26:21', 38.174, 112);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-05-30 09:11:21', 1617.276, 15);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-03-03 19:01:06', 2265.49, 15);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-03-21 23:15:26', 1147.24, 76);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-02-14 09:15:12', 140.361, 77);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-07-20 21:19:17', 75.04, 33);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-01-27 18:49:45', 1635.434, 31);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-04-13 06:26:24', 1487.633, 153);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-10-03 20:23:35', 2391.515, 166);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-07-07 15:31:58', 1604.274, 120);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-09-03 04:53:10', 166.68, 32);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-02-14 18:52:26', 2059.536, 217);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2021-12-13 09:57:19', 997.01, 32);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-06-28 06:11:05', 810.384, 34);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-11-17 07:55:20', 425.34, 76);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-10-17 09:25:52', 458.05, 228);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-08-24 15:22:43', 1277.381, 193);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-10-02 12:05:29', 2427.629, 6);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-10-27 00:56:14', 1748.753, 210);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2021-12-22 15:15:33', 764.834, 126);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-06-20 22:16:55', 2236.908, 168);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-06-25 15:02:06', 1240.932, 186);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-10-06 06:16:17', 1689.613, 77);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-07-15 04:42:00', 2286.569, 92);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-11-30 08:57:09', 2114.668, 116);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-04-16 20:04:12', 526.514, 77);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-07-01 19:57:46', 350.888, 163);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-07-04 02:19:21', 709.652, 148);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-01-27 09:03:10', 828.828, 32);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-06-23 00:51:23', 642.01, 244);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-08-05 01:13:31', 2373.927, 75);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-10-12 14:54:57', 1147.382, 216);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-03-20 01:05:04', 878.781, 68);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-11-17 01:06:07', 2310.73, 69);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2021-12-29 18:40:25', 2067.974, 46);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-06-13 18:48:02', 894.421, 51);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-10-23 05:48:03', 1079.551, 90);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2021-12-04 08:25:43', 1713.425, 226);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-06-22 10:42:07', 1093.055, 57);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-09-14 01:43:17', 713.989, 69);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-10-21 06:06:36', 1402.589, 87);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-08-15 22:39:24', 484.945, 175);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-08-19 17:30:07', 952.815, 8);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-04-07 08:27:06', 1452.264, 58);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-03-21 12:01:06', 626.538, 197);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-08-14 19:46:08', 1239.828, 152);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-05-23 15:16:59', 1669.326, 239);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-01-19 05:18:00', 70.407, 86);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-06-08 07:11:49', 918.378, 181);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-10-23 06:19:41', 1392.902, 111);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2021-12-20 12:54:13', 2182.564, 8);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-08-08 07:52:52', 1860.304, 74);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-05-23 06:36:45', 930.284, 226);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-07-04 08:32:33', 2269.269, 163);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2021-12-15 18:29:35', 2059.318, 206);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-09-02 22:49:26', 1201.294, 94);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-06-24 22:14:34', 2360.702, 62);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-02-21 22:23:06', 1149.678, 46);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-07-21 04:02:20', 285.727, 159);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-04-25 05:34:18', 2124.477, 31);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-06-22 11:09:42', 2081.367, 205);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-03-06 17:11:32', 1129.466, 60);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-11-23 02:55:07', 427.059, 139);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-02-24 03:34:33', 342.111, 239);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-10-06 10:43:43', 670.22, 169);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-04-22 09:22:33', 753.606, 62);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-07-25 01:06:01', 1294.418, 223);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-07-19 14:52:42', 877.366, 228);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-06-16 08:42:59', 1606.603, 64);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-01-24 16:33:06', 1929.088, 150);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2021-12-04 23:31:02', 1860.798, 81);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-01-07 15:34:19', 2272.853, 145);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-09-05 02:18:38', 908.804, 140);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-08-30 05:51:06', 1821.745, 62);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-01-08 17:26:02', 352.783, 34);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-10-06 15:59:24', 1960.607, 243);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-08-31 19:05:49', 664.926, 134);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-06-22 15:18:56', 2112.457, 102);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2021-12-22 19:07:37', 1884.2, 135);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-01-27 20:18:05', 2373.399, 85);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-04-18 11:30:56', 532.67, 243);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-07-29 05:52:11', 564.141, 85);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-01-01 17:57:36', 2125.876, 143);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-06-26 15:17:59', 1195.079, 103);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-07-08 02:26:56', 878.942, 124);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-11-02 06:24:51', 1351.204, 16);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-06-13 05:21:49', 2129.094, 46);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-05-18 00:29:00', 1456.152, 4);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-04-02 22:48:44', 892.05, 74);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-04-18 19:04:42', 1899.534, 25);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-01-01 12:04:13', 2215.626, 86);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-04-13 20:18:35', 2381.872, 14);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-11-07 20:54:09', 2411.886, 49);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-08-30 03:48:18', 2005.402, 40);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-07-29 06:13:05', 634.408, 182);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-06-03 13:53:52', 723.519, 76);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-01-27 20:44:07', 2482.17, 221);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-09-17 08:13:36', 333.179, 49);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-04-06 16:05:27', 1952.793, 174);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-10-10 00:51:30', 188.339, 17);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-06-24 16:33:16', 2328.081, 44);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-01-29 18:53:07', 597.74, 114);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-10-20 03:02:59', 1453.151, 165);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-11-02 08:32:03', 2448.833, 150);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-04-13 08:58:09', 74.122, 235);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-11-15 15:20:01', 1696.142, 7);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2021-12-10 06:31:43', 568.044, 16);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-11-12 09:10:04', 944.044, 80);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-07-11 04:35:26', 2209.108, 182);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-07-22 07:53:23', 2476.166, 73);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-07-03 23:45:47', 840.675, 234);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-09-01 12:01:21', 176.469, 144);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2021-12-31 04:28:19', 480.858, 202);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-07-12 15:56:43', 2139.176, 241);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-10-16 07:49:36', 342.228, 21);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-07-23 09:06:20', 503.792, 18);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-06-20 09:30:54', 2010.287, 163);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-10-28 14:47:26', 1948.512, 92);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-10-13 18:19:48', 62.642, 65);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-08-24 07:07:42', 1612.359, 233);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-07-28 17:32:39', 330.794, 86);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-03-27 18:20:14', 1416.764, 88);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-10-31 11:03:27', 413.017, 66);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-11-08 22:08:14', 1737.401, 47);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-11-13 21:58:17', 1805.019, 114);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-02-20 16:22:05', 1311.874, 9);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-03-19 22:53:10', 1230.645, 101);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-09-21 13:20:16', 2015.151, 50);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-05-01 23:13:53', 928.339, 11);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-01-20 00:13:48', 321.181, 236);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-01-18 16:28:10', 24.047, 105);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-06-13 00:10:33', 497.494, 85);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-07-25 13:37:31', 231.738, 21);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-05-14 16:26:27', 1278.939, 181);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2021-12-29 22:01:33', 842.084, 126);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-05-09 07:35:23', 46.106, 215);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2021-12-18 10:25:38', 759.595, 49);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-07-19 00:59:12', 2321.475, 7);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-02-17 18:36:56', 1078.822, 128);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-08-20 02:03:35', 1286.786, 149);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2021-12-18 18:49:27', 2275.513, 28);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-11-19 08:17:44', 733.162, 33);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-05-11 19:33:25', 1739.735, 8);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-03-17 01:31:42', 982.44, 119);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2021-12-10 19:34:52', 680.969, 60);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-10-28 23:45:39', 359.733, 86);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-07-24 04:24:52', 454.233, 215);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2021-12-27 18:57:23', 462.818, 59);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-06-03 00:15:35', 79.605, 221);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-03-22 15:03:19', 1047.749, 139);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-03-11 11:29:34', 2433.598, 199);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-03-18 09:43:41', 1003.14, 1);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-10-13 01:16:13', 1094.396, 74);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-03-25 01:37:36', 2309.164, 129);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-05-04 03:37:49', 1468.296, 238);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2021-12-03 18:01:58', 1936.406, 128);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-06-03 02:32:54', 1052.994, 245);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-07-04 16:30:41', 344.572, 34);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2021-12-20 12:23:52', 2479.766, 1);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-09-01 08:59:06', 1690.188, 85);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-02-21 11:42:08', 294.47, 216);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-05-13 08:44:32', 388.465, 127);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-03-31 12:09:42', 1039.123, 37);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-08-07 09:17:43', 811.465, 205);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-01-09 21:00:15', 1006.091, 79);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-04-26 22:16:56', 1326.083, 6);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-09-02 21:09:19', 1763.329, 123);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-04-10 05:07:52', 1072.731, 127);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-10-03 00:15:50', 445.169, 89);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-08-04 12:06:55', 1529.173, 49);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-05-13 04:21:34', 1805.489, 191);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-04-24 14:28:21', 1091.516, 225);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2021-12-04 03:36:18', 2449.341, 206);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-08-26 09:49:51', 1721.002, 137);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-07-27 04:10:14', 1638.349, 158);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-11-07 15:14:51', 1473.97, 189);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2021-12-09 04:02:34', 689.861, 207);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-03-07 16:05:16', 1529.798, 11);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-01-16 12:24:10', 529.991, 74);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-07-02 13:35:29', 839.825, 120);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-03-24 18:55:09', 1179.89, 122);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2021-12-23 11:59:07', 2437.97, 125);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-07-05 11:50:00', 405.264, 231);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-09-06 06:34:29', 1987.089, 21);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2021-12-12 15:00:42', 2062.071, 206);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-09-29 18:45:28', 1264.672, 218);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-02-03 06:28:00', 675.279, 85);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-04-03 21:38:34', 1929.66, 90);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-01-12 02:19:31', 1008.108, 218);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-06-30 23:03:23', 1101.918, 103);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-09-06 13:37:56', 473.766, 228);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-01-03 09:31:49', 1419.46, 75);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-11-18 04:43:22', 2272.338, 115);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-03-17 21:05:15', 2181.903, 188);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-11-10 02:04:55', 738.302, 16);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-05-30 17:49:37', 639.298, 104);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-03-20 00:33:39', 338.028, 127);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-11-26 10:07:03', 1104.453, 162);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-05-02 10:07:14', 122.316, 110);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2021-12-29 07:12:34', 745.996, 236);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-04-29 21:05:05', 1017.304, 247);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-02-06 12:56:30', 33.673, 195);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-09-13 13:06:28', 1779.578, 46);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-11-02 08:58:00', 387.449, 190);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-07-15 12:58:55', 801.193, 58);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-01-18 23:47:20', 1264.972, 1);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-07-11 00:46:59', 355.059, 13);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-09-28 17:34:42', 1619.297, 91);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2021-12-10 09:07:04', 1764.009, 211);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-08-27 04:51:32', 38.949, 54);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-01-25 20:55:09', 685.072, 202);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-03-04 03:27:25', 1901.245, 65);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-10-14 12:14:51', 1630.504, 127);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-01-08 21:57:33', 351.776, 170);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-04-04 03:04:57', 1069.024, 101);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-11-04 05:23:10', 1253.107, 158);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-07-24 03:40:02', 175.917, 6);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-05-13 16:54:53', 414.991, 186);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-05-25 01:17:52', 308.801, 58);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-07-21 16:51:06', 1169.362, 130);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-07-10 11:13:15', 1788.869, 2);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-04-23 13:25:18', 2413.183, 110);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-09-15 00:50:28', 100.838, 247);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-01-02 21:16:28', 1527.725, 185);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-10-19 04:49:06', 1470.539, 165);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-03-30 03:00:04', 563.729, 241);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-05-03 17:02:18', 1897.799, 202);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-05-05 20:16:57', 613.242, 1);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-06-14 17:16:16', 660.838, 121);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-11-07 02:03:35', 921.605, 194);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-10-12 22:22:34', 1553.548, 126);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-08-15 12:46:46', 655.305, 35);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2021-12-11 19:45:41', 1156.493, 16);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-05-05 10:13:25', 1400.081, 234);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-01-14 18:21:00', 2143.232, 71);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-06-03 08:59:53', 1979.586, 29);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-08-21 09:33:15', 803.739, 39);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-07-16 03:21:10', 1499.312, 206);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-02-18 13:46:12', 1066.403, 184);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-01-23 13:19:45', 789.76, 202);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-02-02 06:59:36', 1465.02, 179);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-07-02 21:50:11', 1472.944, 215);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2021-12-22 04:09:02', 1371.126, 6);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-09-30 11:10:38', 443.472, 244);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-03-04 23:56:03', 603.858, 69);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-02-23 18:25:40', 895.393, 36);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-07-03 23:10:02', 93.701, 133);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-08-21 18:19:24', 1459.645, 158);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-09-03 13:43:26', 1334.011, 178);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-10-27 19:09:58', 1806.582, 14);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-05-03 19:05:05', 173.435, 223);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2021-12-11 18:01:27', 434.235, 38);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-11-16 01:27:40', 1561.62, 238);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-05-10 15:17:20', 664.49, 250);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-10-24 23:50:00', 1374.842, 188);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-03-22 06:42:52', 2103.584, 123);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-06-28 04:57:02', 1147.983, 201);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-08-10 14:56:16', 2391.434, 38);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2021-12-31 12:49:03', 1515.748, 25);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-05-18 12:46:25', 2244.268, 140);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-03-09 16:45:07', 165.093, 203);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-06-04 03:50:25', 1802.426, 103);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-02-24 18:27:58', 522.24, 185);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-08-31 14:55:33', 199.898, 5);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-06-07 09:24:15', 1352.179, 247);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-02-28 20:10:34', 795.65, 141);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-01-05 16:14:23', 687.483, 70);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-03-01 19:18:22', 2095.897, 171);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2021-12-08 03:13:22', 1903.139, 159);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-03-05 02:27:36', 169.313, 64);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-06-12 21:52:19', 787.194, 240);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2021-12-15 09:40:29', 1972.7, 240);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-08-15 21:11:36', 1732.006, 35);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-09-11 21:53:51', 1893.245, 239);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-10-23 00:07:35', 2222.612, 209);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-06-22 22:47:58', 293.321, 99);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-03-15 01:35:14', 15.36, 20);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2021-12-13 00:25:22', 641.973, 242);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-06-12 13:52:49', 2208.562, 69);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-05-06 06:03:21', 1832.093, 138);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-03-06 23:38:45', 381.899, 156);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-09-05 00:02:43', 2330.465, 137);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-02-27 16:07:30', 625.431, 25);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-01-30 09:02:59', 1607.976, 170);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-03-17 15:45:41', 902.566, 107);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-07-15 23:39:39', 1700.471, 176);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2021-12-15 12:33:54', 1287.78, 176);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-03-23 16:34:29', 2395.181, 202);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-11-25 13:14:48', 815.543, 48);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-09-29 00:39:44', 1932.157, 48);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-06-23 13:32:48', 1853.073, 188);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-07-25 21:05:13', 532.733, 27);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-06-19 13:18:58', 2447.732, 199);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-07-29 10:44:10', 1987.524, 21);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-01-06 02:32:14', 174.458, 225);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2021-12-18 17:02:06', 1462.548, 9);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-09-04 23:34:33', 1295.165, 106);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-10-13 21:08:03', 2377.54, 16);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-06-21 00:09:44', 853.422, 30);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2021-12-25 20:03:22', 559.76, 215);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-08-10 12:52:44', 240.467, 38);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-11-04 13:51:28', 66.865, 243);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-10-22 11:33:57', 1134.516, 231);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-11-06 20:16:01', 2490.341, 201);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-04-28 12:12:21', 143.358, 130);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-07-15 23:27:32', 2491.105, 227);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-11-08 13:54:39', 1901.966, 18);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-07-21 00:23:08', 2138.709, 115);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-03-03 11:09:20', 298.732, 28);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-11-23 08:36:42', 2318.494, 175);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-04-20 03:50:36', 2455.434, 103);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-05-07 08:06:27', 878.695, 77);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-08-13 19:39:10', 1144.009, 208);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-10-25 09:38:49', 1799.691, 113);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-03-12 17:31:54', 477.985, 164);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-08-05 11:43:04', 23.343, 121);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-03-31 21:22:59', 2436.785, 113);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-11-14 10:27:39', 666.716, 68);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-06-11 18:43:50', 523.968, 113);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-03-04 16:29:37', 1830.203, 42);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-08-25 09:52:11', 1221.377, 157);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-02-18 01:28:19', 1029.753, 111);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-08-01 11:35:58', 699.187, 139);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-01-07 07:59:41', 1915.999, 170);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-10-11 08:03:11', 376.214, 37);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-06-06 16:48:41', 1309.9, 152);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-01-09 11:20:35', 404.649, 73);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-03-05 02:55:01', 1102.438, 60);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-09-28 08:07:07', 584.799, 135);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-07-21 01:12:26', 2217.084, 162);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-04-11 19:29:47', 1432.708, 203);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-09-03 20:28:53', 1942.846, 108);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-07-28 16:56:30', 2278.994, 209);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-10-20 14:06:37', 728.941, 78);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-04-27 05:53:24', 1156.734, 6);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-03-18 12:38:47', 840.317, 86);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-10-30 00:08:44', 1427.049, 201);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-06-30 03:19:45', 380.673, 51);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-11-05 16:54:59', 2061.536, 159);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2021-12-02 16:47:18', 2019.824, 55);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-04-13 15:59:50', 2455.955, 204);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-04-28 07:49:10', 553.856, 80);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-08-30 14:09:50', 218.405, 80);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-04-14 14:41:15', 485.376, 215);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-04-20 07:43:20', 1094.049, 194);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-03-15 06:35:38', 2451.985, 215);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2021-12-25 01:58:36', 1825.181, 116);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-09-03 16:47:28', 41.044, 82);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-02-02 06:12:11', 1488.838, 186);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-02-10 00:03:38', 997.9, 17);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-09-15 09:48:46', 93.224, 123);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-07-29 05:44:54', 2110.545, 39);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-04-15 13:06:52', 2246.217, 113);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-07-06 12:35:00', 1812.699, 4);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-09-16 08:58:17', 1697.305, 222);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-09-27 12:43:55', 1397.778, 171);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-05-30 13:05:49', 1516.96, 90);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-08-09 13:47:21', 1296.045, 125);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-07-13 11:51:02', 563.744, 121);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-07-29 15:47:19', 2306.498, 117);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2021-12-13 13:00:47', 878.026, 49);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-07-30 01:49:27', 374.137, 58);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-01-23 01:58:33', 1465.573, 87);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-06-19 14:22:18', 1310.657, 136);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-10-18 18:53:35', 1098.384, 233);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-10-04 15:11:05', 666.219, 244);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-01-19 14:06:15', 1344.552, 220);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2021-12-04 08:07:31', 2269.977, 159);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-05-16 03:34:12', 2014.075, 232);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-06-21 04:10:00', 1706.979, 192);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-05-15 02:24:09', 1812.935, 4);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-04-11 22:26:16', 1911.854, 69);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-03-09 23:43:21', 798.769, 28);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-11-17 19:52:27', 1026.933, 211);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-06-19 17:30:01', 87.84, 229);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-05-22 03:00:26', 1198.66, 114);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-09-15 18:32:01', 234.427, 65);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-08-29 11:22:29', 2486.859, 244);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-10-24 08:21:34', 2103.837, 2);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-03-22 06:00:16', 1986.757, 242);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-08-11 02:55:25', 2251.129, 114);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-09-19 00:31:07', 1366.185, 213);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-06-03 04:05:40', 808.694, 122);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-02-28 01:09:15', 983.487, 59);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-08-10 00:49:53', 557.577, 245);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-06-11 03:40:52', 1860.073, 45);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-04-03 03:36:23', 1553.72, 147);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-10-13 15:18:25', 1976.877, 76);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-07-01 20:04:41', 2410.564, 67);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-02-21 10:27:38', 237.16, 236);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-09-21 06:46:21', 1264.704, 30);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-04-29 21:21:25', 2013.947, 44);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-06-14 17:43:55', 1070.516, 90);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2021-12-12 02:23:07', 2340.979, 53);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-06-22 13:10:50', 108.719, 108);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-08-08 21:03:47', 765.331, 237);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-04-07 23:51:34', 1986.415, 159);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-11-02 03:11:23', 1644.379, 124);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-04-08 11:24:04', 2473.077, 199);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-01-09 02:04:49', 155.273, 174);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-08-11 12:59:55', 2265.226, 127);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-08-30 20:52:52', 1393.885, 47);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-04-27 12:05:21', 416.102, 42);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-10-10 11:45:33', 378.707, 187);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-01-06 10:15:57', 717.032, 127);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-08-19 01:35:17', 364.032, 13);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-05-26 05:19:23', 2224.748, 75);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-09-26 16:01:35', 1499.289, 6);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2021-12-05 09:00:32', 96.399, 50);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-10-03 13:49:11', 1179.525, 209);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-08-11 16:18:02', 484.851, 81);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-03-13 20:15:16', 243.547, 131);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-07-01 19:40:24', 2258.165, 182);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-04-05 15:57:03', 1785.005, 92);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-01-22 18:10:20', 137.546, 223);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-03-26 07:14:58', 231.989, 71);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-10-18 17:32:40', 669.068, 54);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-10-29 17:45:32', 1599.323, 63);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-05-28 17:27:03', 1947.854, 75);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-05-03 17:55:28', 70.597, 159);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-06-27 03:00:12', 1947.99, 111);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-07-12 04:40:06', 1054.965, 46);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-02-13 07:07:32', 149.762, 99);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-02-14 10:08:49', 2022.935, 60);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-03-26 19:23:24', 2217.073, 108);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-06-09 10:12:50', 1462.903, 81);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-01-01 16:21:36', 2081.606, 9);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-08-14 17:28:54', 1176.487, 31);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-02-04 08:58:28', 1532.801, 72);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-10-17 18:50:38', 1978.811, 228);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-10-21 23:17:20', 1380.835, 122);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-01-11 20:11:14', 168.008, 59);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-10-27 04:55:24', 773.169, 114);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-02-20 04:47:01', 1093.931, 169);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-07-22 01:40:09', 1684.761, 192);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-02-20 08:45:02', 1506.766, 179);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-09-19 21:53:46', 927.144, 149);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-01-02 03:44:21', 1865.685, 68);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-02-15 20:22:59', 1318.665, 224);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-02-04 16:30:41', 1214.937, 140);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-09-19 10:22:48', 1891.538, 228);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-03-17 20:49:05', 923.959, 24);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-04-30 14:09:14', 106.024, 114);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-02-22 08:49:16', 1607.197, 128);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-03-21 13:11:12', 708.518, 190);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-03-13 15:51:22', 1257.722, 86);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-05-31 05:04:51', 2167.552, 191);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-05-14 07:22:54', 894.922, 243);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-11-04 21:02:53', 684.27, 124);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-02-26 03:15:48', 2364.325, 19);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-10-05 13:28:01', 1066.9, 34);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-02-06 00:46:21', 1688.981, 238);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-04-18 11:13:27', 1589.209, 79);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-05-17 08:08:50', 1828.026, 212);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-11-06 18:15:33', 104.613, 20);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-05-09 21:20:38', 1658.342, 11);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-03-22 00:49:45', 1935.785, 139);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-01-14 23:24:18', 1707.887, 44);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-05-11 16:10:00', 2288.239, 182);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-05-11 07:15:13', 2460.229, 20);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-06-14 15:01:16', 1816.245, 240);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-10-29 18:05:54', 1740.431, 169);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-03-14 05:13:18', 2205.264, 20);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-04-02 12:53:18', 598.311, 113);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-07-15 02:13:30', 87.812, 210);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-11-21 00:02:12', 1340.165, 214);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-11-10 00:01:39', 745.894, 52);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-04-07 15:15:04', 1636.881, 204);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-01-03 07:20:54', 409.883, 17);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2022-05-23 12:26:52', 1673.415, 228);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-09-21 14:58:38', 1437.895, 58);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-04-20 04:35:39', 1187.483, 14);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-04-18 02:44:27', 1526.771, 141);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-07-20 00:57:16', 2412.565, 49);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-04-26 22:00:56', 1427.992, 210);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-11-05 22:55:41', 1772.428, 225);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-02-25 10:07:42', 1009.279, 233);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-08-07 00:35:39', 2030.0, 68);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-05-01 12:53:08', 663.863, 9);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-05-06 19:43:00', 1056.203, 35);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-01-21 06:38:45', 607.047, 59);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-04-22 18:33:35', 594.006, 174);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-03-27 09:31:36', 2103.902, 179);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-03-30 23:07:27', 664.483, 126);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-11-17 05:11:50', 1186.252, 114);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-11-15 19:32:35', 1332.555, 120);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2021-12-01 14:05:25', 1189.722, 2);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-04-14 15:23:23', 2240.336, 145);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-03-02 15:22:47', 1918.857, 158);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-09-23 22:10:25', 1597.694, 64);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-08-24 15:04:17', 993.01, 206);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-08-07 05:59:52', 569.271, 210);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-06-12 21:49:10', 181.91, 240);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-01-27 16:55:30', 946.08, 48);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-10-15 00:25:14', 2217.227, 105);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-09-16 20:46:55', 1950.569, 191);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-03-01 14:57:37', 1245.459, 95);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-05-30 14:58:44', 1791.688, 248);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2021-12-08 04:55:51', 798.198, 111);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-02-05 07:31:03', 976.462, 114);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-03-09 13:44:44', 457.229, 113);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-09-15 12:25:03', 395.134, 16);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NFLX', '2021-12-29 09:19:33', 606.675, 105);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-04-23 20:04:37', 62.895, 235);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-10-27 00:44:32', 1681.434, 241);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-02-15 04:13:39', 508.43, 26);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('META', '2022-02-24 11:52:20', 746.571, 20);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-05-09 22:16:27', 2334.424, 41);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-04-18 10:10:19', 333.864, 202);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-06-24 19:28:11', 1501.102, 134);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-10-02 03:44:16', 2358.826, 117);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2022-06-05 12:03:37', 467.983, 146);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-10-15 10:21:12', 2431.615, 83);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-07-31 05:27:31', 706.628, 148);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AMZN', '2021-12-31 12:59:16', 2068.363, 45);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-03-05 14:11:06', 1058.864, 189);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('TSLA', '2022-02-07 08:09:13', 2454.895, 237);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('MSFT', '2022-08-23 06:57:04', 1227.214, 127);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('QQQ', '2022-04-15 08:39:13', 853.172, 95);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('GOOG', '2022-10-05 07:41:22', 2433.299, 126);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('JPM', '2022-10-03 19:53:21', 695.731, 77);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-09-27 14:53:38', 1565.355, 33);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('AAPL', '2022-03-16 22:26:28', 494.719, 114);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('SPY', '2022-03-16 18:43:27', 2307.116, 72);
insert into stock (ticker, date_bought, quantity, portfolioID) values ('NVDA', '2022-01-10 06:31:29', 1935.972, 238);