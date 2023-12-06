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
VALUES (1, 'João', 'Silva', '123456789', '123456789', 'joao.silva@example.com');
INSERT INTO Cliente (IDCliente, Nome, Sobrenome, CNH, Telefone, Email)
VALUES (2, 'leo', 'chaves', '123446889', '123456789', 'leo.chaves@example.com');
INSERT INTO Cliente (IDCliente, Nome, Sobrenome, CNH, Telefone, Email)
VALUES (3, 'luis', 'miguel', '125556889', '123456789', 'luis.miguel@example.com');
INSERT INTO Cliente (IDCliente, Nome, Sobrenome, CNH, Telefone, Email)
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

/*
Query 1: Lista todas as locações, incluindo os dados do cliente e do veículo envolvido.
Essa query retorna todos os dados das locações, incluindo os dados do cliente e do veículo envolvido.
Essa query é útil para obter uma visão geral das locações realizadas.
*/
SELECT
  Locacao.*,
  Cliente.Nome AS NomeCliente,
  Veiculo.Placa
FROM Locacao
INNER JOIN Cliente ON Locacao.IDCliente = Cliente.IDCliente
INNER JOIN Veiculo ON Locacao.IDVeiculo = Veiculo.IDVeiculo;

/*
Query 2: Lista todas as locações realizadas por um determinado cliente.
 Essa query retorna todas as locações realizadas por um determinado cliente.
 Essa query é útil para obter informações sobre as locações realizadas por um cliente específico.
*/
SELECT
  Locacao.*,
  Cliente.Nome AS NomeCliente,
  Veiculo.Placa
FROM Locacao
INNER JOIN Cliente ON Locacao.IDCliente = Cliente.IDCliente
INNER JOIN Veiculo ON Locacao.IDVeiculo = Veiculo.IDVeiculo
WHERE Cliente.IDCliente = 1;

/*
Query 3: Lista todas as locações realizadas de um determinado modelo de veículo.
 Essa query retorna todas as locações realizadas de um determinado modelo de veículo. 
 Essa query é útil para obter informações sobre as locações realizadas de um modelo de veículo específico.
*/
SELECT
  Locacao.*,
  Cliente.Nome AS NomeCliente,
  Veiculo.Placa
FROM Locacao
INNER JOIN Cliente ON Locacao.IDCliente = Cliente.IDCliente
INNER JOIN Veiculo ON Locacao.IDVeiculo = Veiculo.IDVeiculo
WHERE Veiculo.Modelo = 'Gol';

/*
Query 4: Lista todas as locações realizadas em um determinado período de tempo.
Essa query retorna todas as locações realizadas em um determinado período de tempo. 
Essa query é útil para obter informações sobre as locações realizadas em um período específico.
*/
SELECT
  Locacao.*,
  Cliente.Nome AS NomeCliente,
  Veiculo.Placa
FROM Locacao
INNER JOIN Cliente ON Locacao.IDCliente = Cliente.IDCliente
INNER JOIN Veiculo ON Locacao.IDVeiculo = Veiculo.IDVeiculo
WHERE DataInicioLocacao BETWEEN '2023-12-01' AND '2023-12-31';

/*
Query 5: Lista todas as locações realizadas por um determinado funcionário.
Essa query retorna todas as locações realizadas por um determinado funcionário. 
Essa query é útil para obter informações sobre as locações realizadas por um funcionário específico.
*/
SELECT
  Locacao.*,
  Cliente.Nome AS NomeCliente,
  Veiculo.Placa
FROM Locacao
INNER JOIN Cliente ON Locacao.IDCliente = Cliente.IDCliente
INNER JOIN Veiculo ON Locacao.IDVeiculo = Veiculo.IDVeiculo
INNER JOIN Atende ON Locacao.IDLocacao = Atende.IDLocacao
WHERE Atende.IDFuncionario = 1;

/*
Left join
Query 1: Lista todas as locações, mesmo que não tenham um veículo associado.
Isso pode ser útil para obter informações sobre locações que foram canceladas, 
ou que o veículo foi devolvido sem ser registrado no sistema
*/
SELECT
  Locacao.*,
  Cliente.Nome AS NomeCliente
FROM Locacao
LEFT JOIN Cliente ON Locacao.IDCliente = Cliente.IDCliente
LEFT JOIN Veiculo ON Locacao.IDVeiculo = Veiculo.IDVeiculo;

/*
Gere cinco queries, utilizando funções de agregação (COUNT, SUM, MIN, MAX,
AVG,....),
Query 1: Conta o número total de locações.
Essa query é útil para obter uma visão geral do volume de locações realizadas.
*/
SELECT COUNT(*) AS TotalLocacoes
FROM Locacao;

/*
Query 2: Calcula o valor total das locações.
Essa query é útil para obter uma visão geral do faturamento do negócio
*/
SELECT SUM(ValorLocacao) AS ValorTotalLocacoes
FROM Locacao;

/*
Query 3: Essa query retorna o valor total das locações realizadas por cada modelo de veículo.
Essa query é útil para obter informações sobre o faturamento do negócio por modelo de veícul
*/
SELECT Veiculo.Modelo AS Modelo,
SUM(ValorLocacao) AS ValorTotalLocacoes
FROM Locacao
INNER JOIN Veiculo ON Locacao.IDVeiculo = Veiculo.IDVeiculo
GROUP BY Veiculo.Modelo;

/*
Query 4: Mostra a data de fim da última locação.
Essa query pode ser útil para obter informações sobre o último dia de atividades do negócio.
*/
SELECT MAX(DataFimLocacao) AS DataFimLocacao;

/*
Query 5: Mostra a média do tempo de duração das locações.
Essa query pode ser útil para obter informações sobre a duração média das locações realizadas.
*/
SELECT AVG(TIMESTAMPDIFF(MINUTE, DataInicioLocacao, DataFimLocacao)) AS MediaTempoLocacao
FROM Locacao;

/*select*/
SELECT * from Veiculo;