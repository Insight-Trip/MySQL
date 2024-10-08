CREATE DATABASE InsightTrip;

USE InsightTrip;

CREATE TABLE Funcionario (
    idFuncionario INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(45),
    CPF CHAR(14),
    Email VARCHAR(256),
    Senha VARCHAR(45),
    Telefone VARCHAR(11),
    fkAdministrador INT,
    CONSTRAINT fkFuncionario FOREIGN KEY (fkAdministrador) 
        REFERENCES Funcionario(idFuncionario)
);

CREATE TABLE Agencia (
    idAgencia INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(45),
    CNPJ CHAR(18),
    Endereco VARCHAR(45),
    CEP CHAR(10),
    fkAdministrador INT,
    CONSTRAINT fkAdministradorAgencia FOREIGN KEY (fkAdministrador) 
        REFERENCES Funcionario(idFuncionario)
);

CREATE TABLE Estado (
    idEstado INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(45),
    Regiao VARCHAR(45),
    CodigoIBGE CHAR(2)
);

CREATE TABLE Criminalidade (
    idCriminalidade INT PRIMARY KEY AUTO_INCREMENT,
    DataHora DATETIME,
    QtdVitimas INT, 
    MunicipiosPerigosos VARCHAR(45),
    fkEstado INT,
    CONSTRAINT fkEstadoCriminalidade FOREIGN KEY (fkEstado) 
        REFERENCES Estado(idEstado)
);

CREATE TABLE Eventos (
    idEventos INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(45),
    Descricao VARCHAR(45)
);

CREATE TABLE EstadoHasEvento (
    idEventoEstado INT PRIMARY KEY AUTO_INCREMENT,
    dtEventoInicio DATE,
    dtEventoTermino DATE,
    fkEstado INT,
    CONSTRAINT fkEstadoEventos FOREIGN KEY (fkEstado) 
        REFERENCES Estado(idEstado),
    fkEventos INT,
    CONSTRAINT fkEventosEstado FOREIGN KEY (fkEventos) 
        REFERENCES Eventos(idEventos)
);

CREATE TABLE Aeroporto (
    idAeroporto INT PRIMARY KEY AUTO_INCREMENT,
    NomeAeroporto VARCHAR(75),
    SiglaAeroporto VARCHAR(10),
    Continente VARCHAR(45),
    fkEstado INT,
    CONSTRAINT fkEstadoAeroportos FOREIGN KEY (fkEstado) 
        REFERENCES Estado(idEstado)
);

-- Tabela associativa entre Agência e Aeroporto
CREATE TABLE AgenciaHasAeroporto (
    fkAgencia INT,
    fkAeroporto INT,
    PRIMARY KEY (fkAgencia, fkAeroporto),
    CONSTRAINT fkAgenciaAeroporto FOREIGN KEY (fkAgencia) 
        REFERENCES Agencia(idAgencia),
    CONSTRAINT fkAeroportoAgencia FOREIGN KEY (fkAeroporto) 
        REFERENCES Aeroporto(idAeroporto)
);

CREATE TABLE Passagem (
    idPassagem INT PRIMARY KEY AUTO_INCREMENT,
    NomePassagem VARCHAR(75),
    Natureza VARCHAR(10),
    Origem VARCHAR(75),
    Destino VARCHAR(75),
    dtViagem DATE,
    fkAgencia INT,
    CONSTRAINT fkAgenciaPassagem FOREIGN KEY (fkAgencia) 
        REFERENCES Agencia(idAgencia)
);

CREATE TABLE Passageiros (
    idPassageiros INT PRIMARY KEY AUTO_INCREMENT,
    QtdPagos INT,
    QtdGratis INT,
    DataHora DATETIME,
    fkPassagem INT,
    CONSTRAINT fkPassagemPassageiros FOREIGN KEY (fkPassagem) 
        REFERENCES Passagem(idPassagem)
);
