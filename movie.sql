CREATE DATABASE MovieApp;
CREATE USER admin_app IDENTIFIED BY "sql1412**";

-- Création des TABLES
CREATE TABLE `users` (
	id serial primary key,
    last_name varchar(100) not null,
    first_name varchar(100) not null,
    email varchar(100) not null,
    date_of_birth date not null,
    isAdmin boolean not null
)engine=INNODB;


CREATE TABLE `tarifs`(
	id serial primary key,
    tarifs varchar(100) not null
)engine=INNODB;


CREATE TABLE `paiement`(
	id serial primary key,
    mode_paiement varchar(100) not null
)engine=INNODB;


CREATE TABLE `horaires`(
	id int not null auto_increment primary key,
	hour_beginning datetime not null,
	FOREIGN KEY (id) REFERENCES seances(id_heure)
)engine=INNODB;


CREATE TABLE `salles`(
	id serial primary key,
	name varchar(100) not null,
    number_of_chair int not null
)engine=INNODB;


CREATE TABLE `complex`(
	id serial primary key,
	address varchar(100) not null,
    postal int not null,
    place_name varchar(100) not null
)engine=INNODB;


CREATE TABLE `seances`(
	id int not null AUTO_INCREMENT primary key,
    id_cinemas int not null,
	date datetime not null,
    heure datetime not null,
    id_heure int not null,
    lieu varchar(100) not null,
    name varchar(100) not null,
    FOREIGN KEY(id_cinemas) REFERENCES complex(id),
    FOREIGN KEY(id_heure) REFERENCES horaires(id),
)engine=INNODB;


CREATE TABLE `films`(
	id int not null AUTO_INCREMENT primary key,
    movie varchar(100) not null,
    description text not null,
    id_movie int not null,
    FOREIGN KEY (id_movie) REFERENCES seances(id),
)engine=INNODB;


CREATE TABLE `place`(
	id int auto_increment not null primary key,
	number_of_place int not null
)engine=INNODB;

------------------------------------------------------------------

--Création des CLIENTS
INSERT INTO `users` (last_name, first_name, email, date_of_birth, isAdmin) VALUES
('Graham','Leanne ','sincere@april.biz', '1996-06-18',false),
('Howell','Ervin ','shanna@melissa.tv', '1985-01-28',false),
('Bauch','Clement ','cathan@yesenia.net', '1992-01-01',false),
('Jacobson','Rodolf ','jrodolf@yopmail.fr', '1978-03-27',false),
('Lebsack','Patricia  ','plebsack.OConner@kory.org', '1986-03-19',true);

-- Création des TARIFS
INSERT INTO `tarifs` (tarifs) VALUES
('plein'),
('etudiant'),
('moins de 14 ans');

-- Création des SÉANCES
INSERT INTO `seances` (id_cinemas, date, heure, lieu, name) VALUES
(1,'2022-02-01 14:30:00', '14:30','mk2 françois mittérand', 'Avengers'),
(2,'2022-02-01 14:30:00', '08:30','mk2 Quai de la loire', 'Avengers End Game'),
(3,'2022-02-01 14:30:00', '07:30','Pathée', 'Avengers Infinity Wars'),
(4,'2022-02-01 14:30:00', '17:30','UGC Berçy', 'Avengers Civil Wars'),
(5,'2022-02-011 14:30:00', '12:30','Grand Rex', 'Avengers Ère dUltron');

-- Création des SALLES
INSERT INTO `salles` (name, number_of_chair) VALUES 
('Salle 1', 300), 
('Salle 2', 300), 
('Salle 3', 300), 
('Salle 4', 300), 
('Salle 5', 300);

-- Création des FILMS
INSERT INTO `films` (movie, description) VALUES
('Avengers','Lorem ipsum dolor sit amet'),
('Avengers End Game','Lorem ipsum dolor sit amet'),
('Avengers Infinity Wars','Lorem ipsum dolor sit amet'),
('Avengers Civil Wars','Lorem ipsum dolor sit amet'),
('Avengers Ère dUltron','Lorem ipsum dolor sit amet');

-- Création des PAIEMENT
INSERT INTO `paiement` (mode_paiement) VALUES
('En Ligne'),
('Sur Place');

-- Création des COMPLEX
INSERT INTO `complex` (address, postal, place_name) VALUES
('1 rue Clavel',75014,'mk2 françois mittérand'),
('9 rue Frnçois Mittérand',75013,'mk2 Quai de la loire'),
('10 rue Plateau',75010,'Pathée'),
('15 Aveneue Simon Bolivar',75013,'UGC Berçy'),
('A356 Avenue JEan JAUR7S',75013,'Grand Rex');

-- Création des HORAIRES
INSERT INTO `horaires` (hour_beginning) VALUES
('14:30'),
('08:30'),
('07:30'),
('17:30'),
('12:30');

-- Création des PLACES
INSERT INTO `place` (number_of_place) VALUES
(300),
(300),
(300),
(300),
(300);