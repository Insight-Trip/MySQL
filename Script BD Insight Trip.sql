CREATE DATABASE InsightTrip;
USE InsightTrip;

create user 'API'@'%' identified by 'webDataViz0API';
grant insert, select, update on InsightTrip.* to 'API'@'localhost';

CREATE TABLE Funcionario (
    idFuncionario INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(45),
    CPF CHAR(14),
    Email VARCHAR(256),
    Senha VARCHAR(45),
    Telefone VARCHAR(14),
    Setor VARCHAR(45),
    fkAdministrador INT,
    CONSTRAINT fkFuncionario FOREIGN KEY (fkAdministrador) 
        REFERENCES Funcionario(idFuncionario)
);

CREATE TABLE Agencia (
    idAgencia INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(45),
    CNPJ CHAR(14), 
    Endereco VARCHAR(45),
    CEP VARCHAR(8), 
    fkAdministrador INT,
    CONSTRAINT fkAdministradorAgencia FOREIGN KEY (fkAdministrador) 
        REFERENCES Funcionario(idFuncionario)
);

CREATE TABLE Pais (
    idPais INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(45),
    Continente VARCHAR(45)
);

CREATE TABLE UF ( 
    CodigoIBGE INT PRIMARY KEY,
    Nome VARCHAR(45),
    Regiao VARCHAR(45)
);

CREATE TABLE Criminalidade (
    idCriminalidade INT PRIMARY KEY AUTO_INCREMENT,
    DataHora DATETIME,
    QtdVitimas INT, 
    MunicipiosPerigosos VARCHAR(45),
    fkEstado INT,
    CONSTRAINT fkEstadoCriminalidade FOREIGN KEY (fkEstado) 
        REFERENCES UF(CodigoIBGE) 
);

CREATE TABLE Eventos (
    idEventos INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(45),
    Descricao VARCHAR(45)
);

CREATE TABLE EstadoHasEventos (
    idEventoEstado INT PRIMARY KEY AUTO_INCREMENT,
    dtEventoInicio DATE,
    dtEventoTermino DATE,
    fkEstado INT,
    CONSTRAINT fkEstadoEventos FOREIGN KEY (fkEstado) 
        REFERENCES UF(CodigoIBGE),
    fkEventos INT,
    CONSTRAINT fkEventosEstado FOREIGN KEY (fkEventos) 
        REFERENCES Eventos(idEventos)
);

CREATE TABLE Aeroporto (
    idAeroporto INT PRIMARY KEY AUTO_INCREMENT,
    NomeAeroporto VARCHAR(75),
    fkEstado INT,
    fkPais INT,
    CONSTRAINT fkEstadoAeroportos FOREIGN KEY (fkEstado) 
        REFERENCES UF(CodigoIBGE),
	CONSTRAINT fkPaisAeroportos FOREIGN KEY (fkPais) 
        REFERENCES Pais(idPais)
);

CREATE TABLE Viagem (
    idPassagem INT PRIMARY KEY AUTO_INCREMENT,
    dtViagem DATE,
    fkAeroportoOrigem INT, 
    fkAeroportoDestino INT,
    QtdPassageirosPagos INT,
    QtdPassageirosGratis INT,
    CONSTRAINT fkAeroportoOrigem FOREIGN KEY (fkAeroportoOrigem) 
        REFERENCES Aeroporto(idAeroporto),
    CONSTRAINT fkAeroportoDestino FOREIGN KEY (fkAeroportoDestino) 
        REFERENCES Aeroporto(idAeroporto)
);