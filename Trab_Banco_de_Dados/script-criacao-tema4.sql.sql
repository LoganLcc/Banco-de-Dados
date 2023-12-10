-- Tabelas
--Leonardo Chaves Costa 201965208AB
--Luiz Miguel Batista Silva 202235020
--Wesley de Almeida Cruz 201765567AC

--criando clientes
CREATE TABLE Cliente (
    IDCliente INT PRIMARY KEY UNIQUE,
    Nome VARCHAR(255) NOT NULL ,
    Sobrenome VARCHAR(255) NOT NULL,
    CNH VARCHAR(20) NOT NULL  UNIQUE,
    Telefone VARCHAR(20) NOT NULL UNIQUE,
    Email VARCHAR(255) UNIQUE
);


--criando Veiculo
CREATE TABLE Veiculo (
    IDVeiculo INT PRIMARY KEY UNIQUE,
    Placa VARCHAR(20)NOT NULL UNIQUE,
    AnoFabricacao INT NOT NULL,
    Estado VARCHAR(20)
);
--criando Modelo Veiculo
CREATE TABLE ModeloVeiculo (
    IDModeloVeiculo INT PRIMARY KEY UNIQUE,
    Marca VARCHAR(50) NOT NULL,
    Modelo VARCHAR(50)NOT NULL,
    AnoLancamento INT NOT NULL,
    CapacidadePassageiros INT,
    CapacidadePortaMalas INT
);


--criando locação 
CREATE TABLE Locacao (
    IDLocacao INT PRIMARY KEY UNIQUE,
    IDCliente INT,
    IDVeiculo INT,
    DataInicioLocacao DATE,
    DataFimLocacao DATE,
    ValorLocacao DECIMAL(10,2),
    FOREIGN KEY (IDCliente) REFERENCES Cliente(IDCliente) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (IDVeiculo) REFERENCES Veiculo(IDVeiculo) ON UPDATE CASCADE ON DELETE RESTRICT
);

--criando Funcionarios
CREATE TABLE Funcionario (
    IDFuncionario INT PRIMARY KEY UNIQUE,
    Nome VARCHAR(255) NOT NULL,
    Sobrenome VARCHAR(255)NOT NULL,
    Cargo VARCHAR(50),
    Salario DECIMAL(10,2)CHECK (Salario >= 0)
);

-- Relacionamentos
CREATE TABLE Realiza (
    IDRealiza INT PRIMARY KEY UNIQUE,
    IDCliente INT,
    IDLocacao INT,
    DataHoraRealizacao TIMESTAMP,
    FOREIGN KEY (IDCliente) REFERENCES Cliente(IDCliente) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (IDLocacao) REFERENCES Locacao(IDLocacao) ON UPDATE CASCADE ON DELETE RESTRICT
);


CREATE TABLE Envolvido (
    IDEnvolvido INT PRIMARY KEY UNIQUE,
    IDVeiculo INT,
    IDLocacao INT,
    DataHoraEnvolvimento TIMESTAMP,
    FOREIGN KEY (IDVeiculo) REFERENCES Veiculo(IDVeiculo) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (IDLocacao) REFERENCES Locacao(IDLocacao) ON UPDATE CASCADE ON DELETE RESTRICT
);


CREATE TABLE Atende (
    IDAtende INT PRIMARY KEY UNIQUE,
    IDFuncionario INT,
    IDLocacao INT,
    DataHoraAtendimento TIMESTAMP,
    FOREIGN KEY (IDFuncionario) REFERENCES Funcionario(IDFuncionario) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (IDLocacao) REFERENCES Locacao(IDLocacao) ON UPDATE CASCADE ON DELETE RESTRICT
);


CREATE TABLE TemModelo (
    IDTemModelo INT PRIMARY KEY UNIQUE,
    IDVeiculo INT,
    IDModeloVeiculo INT,
    FOREIGN KEY (IDVeiculo) REFERENCES Veiculo(IDVeiculo) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (IDModeloVeiculo) REFERENCES ModeloVeiculo(IDModeloVeiculo) ON UPDATE CASCADE ON DELETE RESTRICT
);

-- Índices
CREATE INDEX idx_fk_realiza_cliente ON Realiza (IDCliente);
CREATE INDEX idx_fk_realiza_locacao ON Realiza (IDLocacao);
CREATE INDEX idx_fk_envolvido_veiculo ON Envolvido (IDVeiculo);
CREATE INDEX idx_fk_envolvido_locacao ON Envolvido (IDLocacao);
CREATE INDEX idx_fk_atende_funcionario ON Atende (IDFuncionario);
CREATE INDEX idx_fk_atende_locacao ON Atende (IDLocacao);
CREATE INDEX idx_fk_tem_modelo_veiculo ON TemModelo (IDVeiculo);
CREATE INDEX idx_fk_tem_modelo_modelo ON TemModelo (IDModeloVeiculo);

