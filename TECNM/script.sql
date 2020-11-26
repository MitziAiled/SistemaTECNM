use tecnmmvc;

CREATE TABLE roles (
idrol int NOT NULL,
nombrerol VARCHAR(100) NOT NULL,
PRIMARY KEY (idrol)
);

CREATE TABLE usuario (
clavemaestro int NOT NULL,
prefijo VARCHAR(255) NOT NULL,
nombre VARCHAR(255) NOT NULL ,
apellidopat VARCHAR(255) NOT NULL ,
apellidomat VARCHAR(255) NOT NULL ,
mail VARCHAR(255) NOT NULL,
tel VARCHAR(255) NOT NULL,
depto VARCHAR(255) NOT NULL,
usser VARCHAR(255) NOT NULL ,
pass VARCHAR(255) NOT NULL ,
rol int NOT NULL ,
PRIMARY KEY (clavemaestro),
FOREIGN KEY (rol) references roles(idrol)
);

CREATE TABLE maestro(
idmaestro int NOT NULL AUTO_INCREMENT,
clavemaestro int NOT NULL,
nombre VARCHAR(255) NOT NULL,
PRIMARY KEY (idmaestro),
FOREIGN KEY (clavemaestro) REFERENCES usuario(clavemaestro)
);

CREATE TABLE carrera(
clavecarrera VARCHAR (255) NOT NULL,
carrera VARCHAR(255) NOT NULL,
jefe VARCHAR(255) NOT NULL,
PRIMARY KEY (clavecarrera)
);

CREATE TABLE maestroxcarrera(
id int NOT NULL AUTO_INCREMENT,
carrera VARCHAR(255) NOT NULL,
maestro VARCHAR(255) NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE materia (
id_materia INT NOT NULL AUTO_INCREMENT,
clavemaestro int NOT NULL,
clavemateria VARCHAR (255) NOT NULL,
clavehorario VARCHAR(255) NOT NULL,
materia VARCHAR (255) NOT NULL ,
carrera VARCHAR (255) NOT NULL ,
maestro VARCHAR(255) NOT NULL,
periodoescolar VARCHAR(255) NOT NULL,
turno VARCHAR(255) NOT NULL,
campus int NOT NULL,
grupo VARCHAR(255) NOT NULL,
alumnos int NOT NULL,
semestre INT NOT NULL ,
creditos INT NOT NULL ,
horas_t INT NOT NULL ,
horas_p INT NOT NULL ,
luneshora VARCHAR(20) NULL,
lunessalon VARCHAR(20) NULL,
marteshora VARCHAR(20) NULL,
martessalon VARCHAR(20) NULL,
miercoleshora VARCHAR(20) NULL,
miercolessalon VARCHAR(20) NULL,
jueveshora VARCHAR(20) NULL,
juevessalon VARCHAR(20) NULL,
vierneshora VARCHAR(20) NULL,
viernessalon VARCHAR(20) NULL,
PRIMARY KEY (id_materia),
FOREIGN KEY (clavemaestro) REFERENCES usuario(clavemaestro)
);


INSERT INTO roles VALUES ("1", "Administracion");
INSERT INTO roles VALUES ("2", "Jefe");
INSERT INTO roles VALUES ("3", "Maestro");

INSERT INTO usuario VALUES ("1", "Lic", "Mitzi Ailed", "García", "López", "admin@leon.tecnm.mx", "4771125698", "Administracion", "mitzi", "120997", 1);
INSERT INTO usuario VALUES ("25", "Ing", "Antonio", "Águila", "Reyes", "aguila@leon.tecnm.mx", "4771258745", "Sistemas", "aguila", "12345", 2);
INSERT INTO usuario VALUES ("26", "Doc", "María del Rosario", "Baltazar", "Flores","rosario@leon.tecnm.mx", "4774578455", "Doctorado", "baltazar", "123", 3);
INSERT INTO usuario VALUES ("27", "Ing", "José Gerardo", "Carpio", "Flores", "carpio@leon.tecnm.mx", "4779879875", "Sistemas", "carpiof", "123", 3);
INSERT INTO usuario VALUES ("28", "Doc", "Juan Martín", "Carpio", "Valadez", "juancarpio@leon.tecnm.mx", "4776665748", "Doctorado", "carpiov", "123", 3);
INSERT INTO usuario VALUES ("29", "Lic", "Elizabeth", "Castellanos", "Nolasco", "nolasco@leon.tecnm.mx", "4776544587", "Sistemas", "nolasco", "123", 3);
INSERT INTO usuario VALUES ("30", "Ing", "María Patricia", "Castillo", "Martínez", "patricia@leon.tecnm.mx", "4773655748", "Sistemas", "castillo", "123", 3);
INSERT INTO usuario VALUES ("31", "Ing", "Luis Roberto", "Gallegos", "Muñoz", "gallegos@leon.tecnm.mx", "4773655748", "Sistemas", "gallegos", "123", 3);
INSERT INTO usuario VALUES ("32", "Ing", "Domingo", "García", "Ornelas", "domingo@leon.tecnm.mx", "4773655748", "Sistemas", "domingo", "123", 3);
INSERT INTO usuario VALUES ("33", "Ing", "Hector Federico", "Godínez", "Cabrera", "cabrera@leon.tecnm.mx", "4773655748", "Sistemas", "godinez", "123", 3);
INSERT INTO usuario VALUES ("34", "Ing", "Laura Patricia", "Guevara", "Rangel", "laurap@leon.tecnm.mx", "4773655748", "Sistemas", "laurap", "123", 3);
INSERT INTO usuario VALUES ("35", "Ing", "Luis Eduardo", "Gutiérrez", "Ayala", "ayala@leon.tecnm.mx", "4773655748", "Sistemas", "ayala", "123", 3);
INSERT INTO usuario VALUES ("36", "Ing", "Angélica Benita", "Hernández", "Carranza", "benita@leon.tecnm.mx", "4773655748", "Sistemas", "benita", "123", 3);
INSERT INTO usuario VALUES ("37", "Ing", "Laura", "Juárez", "Guerra", "laura@leon.tecnm.mx", "4773655748", "Sistemas", "laura", "123", 3);
INSERT INTO usuario VALUES ("38", "Ing", "Carlos Rafael", "Levy", "Rojas", "levy@leon.tecnm.mx", "4773655748", "Sistemas", "levy", "123", 3);
INSERT INTO usuario VALUES ("39", "Ing", "Eugenio Conrado", "Marín", "González", "conrado@leon.tecnm.mx", "4773655748", "Sistemas", "conrado", "123", 3);
INSERT INTO usuario VALUES ("40", "Ing", "Ana Columba Zurita", "Martínez", "Aguilar", "columba@leon.tecnm.mx", "4773655748", "Sistemas", "columba", "123", 3);
INSERT INTO usuario VALUES ("41", "Ing", "José Elias", "Martínez", "Arias", "elias@leon.tecnm.mx", "4773655748", "Sistemas", "elias", "123", 3);
INSERT INTO usuario VALUES ("42", "Ing", "Edna Militza", "Martínez", "Prado", "militza@leon.tecnm.mx", "4773655748", "Sistemas", "militza", "123", 3);
INSERT INTO usuario VALUES ("43", "Ing", "Juan Pablo", "Murillo", "Ruiz", "murillo@leon.tecnm.mx", "4773655748", "Sistemas", "murillo", "123", 2);
INSERT INTO usuario VALUES ("44", "Lic", "Angélica María", "Ortiz", "Gaucín", "gaucin@leon.tecnm.mx", "4773655748", "Sistemas", "gaucin", "123", 3);
INSERT INTO usuario VALUES ("45", "Lic", "Héctor José", "Puga", "Soberanes", "pugas@leon.tecnm.mx", "4773655748", "Sistemas", "pugas", "123", 3);
INSERT INTO usuario VALUES ("46", "Lic", "Irma de Jesús", "Ramírez", "Álvarez", "irma@leon.tecnm.mx", "4773655748", "Sistemas", "irma", "123", 3);
INSERT INTO usuario VALUES ("47", "MC", "Martha Alicia", "Rocha", "Sánchez", "martha@leon.tecnm.mx", "4773655748", "Sistemas", "martha", "123", 3);
INSERT INTO usuario VALUES ("48", "Ing", "Luz del Carmen", "Ruiz", "Gaytan", "luzcarmen@leon.tecnm.mx", "4773655748", "Sistemas", "luzcarmen", "123", 3);
INSERT INTO usuario VALUES ("49", "Ing", "Ruth", "Saéz de Nanclarez", "Rodríguez", "ruth@leon.tecnm.mx", "4773655748", "Sistemas", "ruth", "123", 3);
INSERT INTO usuario VALUES ("50", "Maestra", "Ma. Concepción Rocío", "Sánchez", "Cano", "maconcepcionr@leon.tecnm.mx", "4773655748", "Sistemas", "maconcepcionr", "123", 3);
INSERT INTO usuario VALUES ("51", "Ing", "Ma. Concepción", "Sandoval", "Solis", "maconcepcion@leon.tecnm.mx", "4773655748", "Sistemas", "maconcepcion", "123", 3);
INSERT INTO usuario VALUES ("52", "Ing", "Cirino", "Silva", "Tovar", "cirino@leon.tecnm.mx", "4773655748", "Sistemas", "cirino", "123", 3);
INSERT INTO usuario VALUES ("53", "Ing", "José Luis Fernando", "Suárez", "y Gómez", "suarezygomez@leon.tecnm.mx", "4773655748", "Sistemas", "suarezygomez", "123", 3);
INSERT INTO usuario VALUES ("54", "Ing", "Rubén", "Trujillo", "Corona", "trujillo@leon.tecnm.mx", "4773655748", "Sistemas", "trujillo", "123", 3);

INSERT INTO maestro VALUES ("", "25", "Antonio Águila Reyes");
INSERT INTO maestro VALUES ("", "26", "María del Rosario Baltazar Flores");
INSERT INTO maestro VALUES ("", "27", "José Gerardo Carpio Flores");
INSERT INTO maestro VALUES ("", "28", "Juan Martín Carpio Valadez");
INSERT INTO maestro VALUES ("", "29", "Elizabeth Castellanos Nolasco");
INSERT INTO maestro VALUES ("", "30", "María Patricia Castillo Martínez");
INSERT INTO maestro VALUES ("", "31", "Luis Roberto Gallegos Muñoz");
INSERT INTO maestro VALUES ("", "32", "Domingo García Ornelas");
INSERT INTO maestro VALUES ("", "33", "Hector Federico Godínez Cabrera");
INSERT INTO maestro VALUES ("", "34", "Laura Patricia Guevara Rangel");
INSERT INTO maestro VALUES ("", "35", "Luis Eduardo Gutiérrez Ayala");
INSERT INTO maestro VALUES ("", "36", "Angélica Benita Hernández Carranza");
INSERT INTO maestro VALUES ("", "37", "Laura Juárez Guerra");
INSERT INTO maestro VALUES ("", "38", "Carlos Rafael Levy Rojas");
INSERT INTO maestro VALUES ("", "39", "Eugenio Conrado Marín González");
INSERT INTO maestro VALUES ("", "40", "Ana Columba Zurita Martínez Aguilar");
INSERT INTO maestro VALUES ("", "41", "José Elias Martínez Arias");
INSERT INTO maestro VALUES ("", "42", "Edna Militza Martínez Prado");
INSERT INTO maestro VALUES ("", "43", "Juan Pablo Murillo Ruiz");
INSERT INTO maestro VALUES ("", "44", "Angélica María Ortiz Gaucín");
INSERT INTO maestro VALUES ("", "45", "Héctor José Puga Soberanes");
INSERT INTO maestro VALUES ("", "46", "Irma de Jesús Ramírez Álvarez");
INSERT INTO maestro VALUES ("", "47", "Martha Alicia Rocha Sánchez");
INSERT INTO maestro VALUES ("", "48", "Luz del Carmen Ruiz Gaytan");
INSERT INTO maestro VALUES ("", "49", "Ruth Saéz de Nanclarez Rodríguez");
INSERT INTO maestro VALUES ("", "50", "Ma. Concepción Rocío Sánchez Cano");
INSERT INTO maestro VALUES ("", "51", "Ma. Concepción Sandoval Solis");
INSERT INTO maestro VALUES ("", "52", "Cirino Silva Tovar");
INSERT INTO maestro VALUES ("", "53", "José Luis Fernando Suárez y Gómez");
INSERT INTO maestro VALUES ("", "54", "Rubén Trujillo Corona");

