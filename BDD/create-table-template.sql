-- Active: 1723971947654@@mysql-myriam.alwaysdata.net@3306@myriam_studiazproject
CREATE TABLE role(  
    idRole int NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
    name VARCHAR(45) NULL,
    description VARCHAR(150) NULL
);

CREATE TABLE users(
  idUser INT NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'Primary Key',
  surname VARCHAR(50) NOT NULL,
  forename VARCHAR(100) NOT NULL,
  mail VARCHAR(50) NULL,
  password VARCHAR (500) NULL,
  passwordKey VARCHAR(500) NULL,
  telephone VARCHAR(12) NULL,
  dateEmbauche DATE NULL,
  dateRenvoi DATE NULL,
  subjectId VARCHAR(150) NULL,
  idRole INT NULL COMMENT 'Forein Key To role',
  FOREIGN KEY (idRole) REFERENCES role(idRole)
);

CREATE TABLE theatre(
  idTheatre INT NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'Primary Key',
  name VARCHAR(45) NULL,
  address VARCHAR(100) NULL,
  addressBis VARCHAR(100) NULL,
  postalCode VARCHAR(15) NULL,
  city VARCHAR(100) NULL,
  mail VARCHAR(100) NULL,
  phone VARCHAR(100) NULL,
  website VARCHAR(45) NULL,
  idDirecteur INT NOT NULL COMMENT 'Forein Key To users',
  FOREIGN KEY (idDirecteur) REFERENCES users(idUser)
);

CREATE TABLE salles(
  idSalle INT NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'Primary Key',
  name VARCHAR(45) NULL,
  numero VARCHAR(45) NULL,
  capacity INT NULL,
  description VARCHAR(500) NULL,
  idTheatre INT NULL COMMENT 'Forein Key To theatre',
  idRegisseur INT NULL COMMENT 'Forein Key To users',
  FOREIGN KEY (idTheatre) REFERENCES theatre(idTheatre),
  FOREIGN KEY (idRegisseur) REFERENCES users(idUser)
);

CREATE TABLE seances(
  idSeances INT NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'Primary Key',
  date DATETIME NULL,
  groupe VARCHAR(45) NULL,
  description VARCHAR(500) NULL,
  modalite VARCHAR(500) NULL,
  price DECIMAL NULL,
  idSalle INT NULL COMMENT 'Forein Key To salles',
  FOREIGN KEY (idSalle) REFERENCES salles(idSalle)
);

INSERT INTO role (name, description) VALUES 
('PDG', 'Possède les théâtres et les directeurs'),
('Directeur', 'Dirige un théâtre et sa configuration. Gère les régisseurs'),
('Régisseur', "S'occupe d'une salle");

UPDATE role 
SET description = "Dirige un théâtre et sa configuration. Gère les régisseurs. Gère la programmation du théâtre"
WHERE idRole=2;
