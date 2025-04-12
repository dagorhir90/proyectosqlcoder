CREATE DATABASE IF NOT EXISTS bdjudicial;
USE bdjudicial;
CREATE TABLE Cliente (
	id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre_cli VARCHAR(100) NOT NULL,
    apellido_cli VARCHAR(100) NOT NULL,
    dni_cli  INT UNIQUE NOT NULL,
    telefono_cli VARCHAR (20) DEFAULT NULL,
    cuit_cli VARCHAR (20),
    email_cli VARCHAR (40) UNIQUE DEFAULT NULL,
    domicilio_cli VARCHAR (20) DEFAULT NULL
    );
CREATE TABLE Abogado (
	id_abo INT PRIMARY KEY AUTO_INCREMENT,
    nombre_abo VARCHAR(100) NOT NULL,
    apellido_abo VARCHAR(100) NOT NULL,
    matricula_abo  VARCHAR(20),
    especialidades_abo VARCHAR (100) DEFAULT NULL,
    telefono_abo VARCHAR (20),
    mail_abo VARCHAR (40) UNIQUE DEFAULT NULL
    );
CREATE TABLE Caso (
	id_caso INT PRIMARY KEY AUTO_INCREMENT,
    titulo_caso VARCHAR(200) NOT NULL,
    tipo_caso VARCHAR(50) NOT NULL,
    estado_caso  VARCHAR(50),
    fecha_inicio DATE,
    fecha_cierre DATE DEFAULT NULL,
    observaciones_caso TEXT DEFAULT NULL
    );
    CREATE TABLE Expediente (
	id_exp INT PRIMARY KEY AUTO_INCREMENT,
    numero_exp VARCHAR(50) NOT NULL,
    id_caso  INT NOT NULL,
    caratula VARCHAR(200),
    fuero VARCHAR (100),
    jurisdiccion VARCHAR (100),
    fecha_inicio DATE,
    fecha_archivo DATE DEFAULT NULL,
    FOREIGN KEY (id_caso) REFERENCES Caso(id_caso)
    );
    CREATE TABLE Actuacion (
    id_actuacion INT AUTO_INCREMENT PRIMARY KEY,
    id_exp INT,
    fecha DATE,
    descripcion TEXT,
    tipo_act VARCHAR(100),
    FOREIGN KEY (id_exp) REFERENCES Expediente(id_exp)
);
CREATE TABLE cliente_caso (
    id_cliente INT,
    id_caso INT,
    rol_cli VARCHAR(100),
    PRIMARY KEY (id_cliente, id_caso),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_caso) REFERENCES caso(id_caso)
);
CREATE TABLE abogado_caso (
    id_abo INT,
    id_caso INT,
    rol_abo VARCHAR(100),
    PRIMARY KEY (id_abo, id_caso),
    FOREIGN KEY (id_abo) REFERENCES abogado(id_abo),
    FOREIGN KEY (id_caso) REFERENCES caso(id_caso)
);