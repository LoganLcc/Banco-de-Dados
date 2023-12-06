-- Tabelas

--criando clientes
CREATE TABLE Cliente (
    IDCliente INT PRIMARY KEY,
    Nome VARCHAR(255)NOT NULL,
    Sobrenome VARCHAR(255) NOT NULL,
    CNH VARCHAR(20) NOT NULL,
    Telefone VARCHAR(20) NOT NULL,
    Email VARCHAR(255)
);
--Adicionando clientes 
INSERT INTO Cliente (IDCliente, Nome, Sobrenome, CNH, Telefone, Email)
VALUES (1, 'João', 'Silva', '123456789', '123456789', 'joao.silva@example.com'),
VALUES (2, 'leo', 'chaves', '123446889', '123456789', 'leo.chaves@example.com'),
VALUES (3, 'luis', 'miguel', '125556889', '123456789', 'luis.miguel@example.com'),
VALUES (4, 'lucas', 'bruck', '123456789', '123456789', 'lucas.bruck@example.com');

--criando Veiculo
CREATE TABLE Veiculo (
    IDVeiculo INT PRIMARY KEY,
    Placa VARCHAR(20)NOT NULL,
    AnoFabricacao INT NOT NULL,
    Estado VARCHAR(20)
);

--Adicionando Veiculo 
INSERT INTO Veiculo (Placa, AnoFabricacao, Estado)
VALUES
('ABC-1234', 2023, 'disponivel'),
('DEF-5678', 2022, 'disponivel'),
('GHI-9012', 2021, 'alugado'),
('JKL-3456', 2020, 'alugado'),
('MNO-7890', 2019, 'disponivel');


CREATE TABLE ModeloVeiculo (
    IDModeloVeiculo INT PRIMARY KEY,
    Marca VARCHAR(50),
    Modelo VARCHAR(50),
    AnoLancamento INT,
    CapacidadePassageiros INT,
    CapacidadePortaMalas INT
);

--Adicionando ModeloVeiculo
INSERT INTO ModeloVeiculo (Marca, Modelo, AnoLancamento, CapacidadePassageiros, CapacidadePortaMalas)
VALUES
('Volkswagen', 'Gol', 2023, 5, 300),
('Fiat', 'Uno', 2022, 4, 200),
('Hyundai', 'HB20', 2021, 5, 350),
('Chevrolet', 'Onix', 2020, 5, 250),
('Toyota', 'Corolla', 2019, 5, 450);

--cria locação 
CREATE TABLE Locacao (
    IDLocacao INT PRIMARY KEY,
    IDCliente INT,
    IDVeiculo INT,
    DataInicioLocacao DATE,
    DataFimLocacao DATE,
    ValorLocacao DECIMAL(10,2),
    FOREIGN KEY (IDCliente) REFERENCES Cliente(IDCliente) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (IDVeiculo) REFERENCES Veiculo(IDVeiculo) ON UPDATE CASCADE ON DELETE RESTRICT
);
--inseri locação
INSERT INTO Locacao (IDCliente, IDVeiculo, DataInicioLocacao, DataFimLocacao, ValorLocacao)
VALUES
(1, 1, '2023-12-07', '2023-12-14', 1000.00),
(2, 2, '2023-12-08', '2023-12-15', 800.00),
(3, 3, '2023-12-09', '2023-12-16', 700.00),
(4, 4, '2023-12-10', '2023-12-17', 600.00),
(5, 5, '2023-12-11', '2023-12-18', 500.00);

--criando Funcionarios
CREATE TABLE Funcionario (
    IDFuncionario INT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Sobrenome VARCHAR(255)NOT NULL,
    Cargo VARCHAR(50),
    Salario DECIMAL(10,2)CHECK (Salario >= 0)
);
--Adicionando Funcionarios
INSERT INTO Funcionario (Nome, Sobrenome, Cargo, Salario)
VALUES
('João', 'Silva', 'Gerente', 5000.00),
('Maria', 'Souza', 'Vendedor', 2500.00),
('Pedro', 'Santos', 'Analista', 3500.00),
('Ana', 'Lima', 'Secretária', 2000.00),
('Carlos', 'Martins', 'Operador', 1500.00);


-- Relacionamentos
CREATE TABLE Realiza (
    IDRealiza INT PRIMARY KEY,
    IDCliente INT,
    IDLocacao INT,
    DataHoraRealizacao TIMESTAMP,
    FOREIGN KEY (IDCliente) REFERENCES Cliente(IDCliente) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (IDLocacao) REFERENCES Locacao(IDLocacao) ON UPDATE CASCADE ON DELETE RESTRICT
);
--cria realzia
INSERT INTO Realiza (IDLocacao, IDModeloVeiculo, QuilometragemInicial, QuilometragemFinal)
VALUES
(1, 1, 1000, 2000),
(2, 2, 2000, 3000),
(3, 3, 3000, 4000),
(4, 4, 4000, 5000),
(5, 5, 5000, 6000);


CREATE TABLE Envolvido (
    IDEnvolvido INT PRIMARY KEY,
    IDVeiculo INT,
    IDLocacao INT,
    DataHoraEnvolvimento TIMESTAMP,
    FOREIGN KEY (IDVeiculo) REFERENCES Veiculo(IDVeiculo) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (IDLocacao) REFERENCES Locacao(IDLocacao) ON UPDATE CASCADE ON DELETE RESTRICT
);
--cria envonvido 
INSERT INTO Envolvido (IDVeiculo, IDLocacao, DataHoraEnvolvimento)
VALUES
(1, 1, '2023-12-08 10:00:00'),
(2, 2, '2023-12-09 11:00:00'),
(3, 3, '2023-12-10 12:00:00'),
(4, 4, '2023-12-11 13:00:00'),
(5, 5, '2023-12-12 14:00:00');


CREATE TABLE Atende (
    IDAtende INT PRIMARY KEY,
    IDFuncionario INT,
    IDLocacao INT,
    DataHoraAtendimento TIMESTAMP,
    FOREIGN KEY (IDFuncionario) REFERENCES Funcionario(IDFuncionario) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (IDLocacao) REFERENCES Locacao(IDLocacao) ON UPDATE CASCADE ON DELETE RESTRICT
);

INSERT INTO Atende (IDFuncionario, IDLocacao, DataHoraAtendimento)
VALUES
(1, 1, '2023-12-07 15:00:00'),
(2, 2, '2023-12-08 16:00:00'),
(3, 3, '2023-12-09 17:00:00'),
(4, 4, '2023-12-10 18:00:00'),
(5, 5, '2023-12-11 19:00:00');


CREATE TABLE TemModelo (
    IDTemModelo INT PRIMARY KEY,
    IDVeiculo INT,
    IDModeloVeiculo INT,
    FOREIGN KEY (IDVeiculo) REFERENCES Veiculo(IDVeiculo) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (IDModeloVeiculo) REFERENCES ModeloVeiculo(IDModeloVeiculo) ON UPDATE CASCADE ON DELETE RESTRICT
);
INSERT INTO TemModelo (IDVeiculo, IDModeloVeiculo)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);


-- Índices
CREATE INDEX idx_fk_realiza_cliente ON Realiza (IDCliente);
CREATE INDEX idx_fk_realiza_locacao ON Realiza (IDLocacao);
CREATE INDEX idx_fk_envolvido_veiculo ON Envolvido (IDVeiculo);
CREATE INDEX idx_fk_envolvido_locacao ON Envolvido (IDLocacao);
CREATE INDEX idx_fk_atende_funcionario ON Atende (IDFuncionario);
CREATE INDEX idx_fk_atende_locacao ON Atende (IDLocacao);
CREATE INDEX idx_fk_tem_modelo_veiculo ON TemModelo (IDVeiculo);
CREATE INDEX idx_fk_tem_modelo_modelo ON TemModelo (IDModeloVeiculo);


-- Consultas INNER JOIN relevantes
/* Query 1: Listar locações com detalhes do cliente e veículo */
SELECT Locacao.*, Cliente.Nome AS NomeCliente, Veiculo.Placa
FROM Locacao
INNER JOIN Cliente ON Locacao.IDCliente = Cliente.IDCliente
INNER JOIN Veiculo ON Locacao.IDVeiculo = Veiculo.IDVeiculo;

/* Query 2: Listar funcionários que atenderam locações */
SELECT Atende.*, Funcionario.Nome AS NomeFuncionario
FROM Atende
INNER JOIN Funcionario ON Atende.IDFuncionario = Funcionario.IDFuncionario;

/* Query 3: Listar locações e seus envolvimentos (veículos envolvidos) */
SELECT Locacao.*, Veiculo.Placa
FROM Locacao
INNER JOIN Envolvido ON Locacao.IDLocacao = Envolvido.IDLocacao
INNER JOIN Veiculo ON Envolvido.IDVeiculo = Veiculo.IDVeiculo;

/* Query 4: Listar clientes que realizaram locações e os detalhes das locações */
SELECT Cliente.*, Locacao.*
FROM Cliente
INNER JOIN Realiza ON Cliente.IDCliente = Realiza.IDCliente
INNER JOIN Locacao ON Realiza.IDLocacao = Locacao.IDLocacao;

/* Query 5: Exemplo de INNER JOIN adicional conforme necessário */
/* Query com LEFT JOIN: Exemplo de listar veículos e seus modelos, mesmo que não tenham um modelo associado */
SELECT Veiculo.*, ModeloVeiculo.Marca, ModeloVeiculo.Modelo
FROM Veiculo
LEFT JOIN TemModelo ON Veiculo.IDVeiculo = TemModelo.IDVeiculo
LEFT JOIN ModeloVeiculo ON TemModelo.IDModeloVeiculo = ModeloVeiculo.IDModeloVeiculo;
/* Query 1: Contar o número de locações realizadas por cada cliente */
SELECT Cliente.Nome, COUNT(Locacao.IDLocacao) AS NumeroLocacoes
FROM Cliente
INNER JOIN Realiza ON Cliente.IDCliente = Realiza.IDCliente
INNER JOIN Locacao ON Realiza.IDLocacao = Locacao.IDLocacao
GROUP BY Cliente.Nome;

/* Query 2: Calcular a média de salário dos funcionários por cargo */
SELECT Cargo, AVG(Salario) AS MediaSalario
FROM Funcionario
GROUP BY Cargo;

/* Query 3: Exemplo de função de agregação adicional conforme necessário */
/* Query 4: Exemplo de função de agregação adicional conforme necessário */
/* Query 4: Contar o número de locações realizadas */
SELECT COUNT(IDLocacao) AS TotalLocacoes
FROM Locacao;

/* Query 5: Calcular o valor total de locações */
SELECT SUM(ValorLocacao) AS ValorTotalLocacoes
FROM Locacao;