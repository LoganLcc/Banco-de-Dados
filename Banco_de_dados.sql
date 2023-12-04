-- Tabelas
CREATE TABLE Cliente (
    IDCliente INT PRIMARY KEY,
    Nome VARCHAR(255),
    Sobrenome VARCHAR(255),
    CNH VARCHAR(20),
    Telefone VARCHAR(20),
    Email VARCHAR(255)
);

CREATE TABLE Veiculo (
    IDVeiculo INT PRIMARY KEY,
    Placa VARCHAR(20),
    AnoFabricacao INT,
    Estado VARCHAR(20)
);

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

CREATE TABLE Funcionario (
    IDFuncionario INT PRIMARY KEY,
    Nome VARCHAR(255),
    Sobrenome VARCHAR(255),
    Cargo VARCHAR(50),
    Salario DECIMAL(10,2)
);

CREATE TABLE ModeloVeiculo (
    IDModeloVeiculo INT PRIMARY KEY,
    Marca VARCHAR(50),
    Modelo VARCHAR(50),
    AnoLancamento INT,
    CapacidadePassageiros INT,
    CapacidadePortaMalas INT
);

-- Relacionamentos
CREATE TABLE Realiza (
    IDRealiza INT PRIMARY KEY,
    IDCliente INT,
    IDLocacao INT,
    DataHoraRealizacao TIMESTAMP,
    FOREIGN KEY (IDCliente) REFERENCES Cliente(IDCliente) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (IDLocacao) REFERENCES Locacao(IDLocacao) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE Envolvido (
    IDEnvolvido INT PRIMARY KEY,
    IDVeiculo INT,
    IDLocacao INT,
    DataHoraEnvolvimento TIMESTAMP,
    FOREIGN KEY (IDVeiculo) REFERENCES Veiculo(IDVeiculo) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (IDLocacao) REFERENCES Locacao(IDLocacao) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE Atende (
    IDAtende INT PRIMARY KEY,
    IDFuncionario INT,
    IDLocacao INT,
    DataHoraAtendimento TIMESTAMP,
    FOREIGN KEY (IDFuncionario) REFERENCES Funcionario(IDFuncionario) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (IDLocacao) REFERENCES Locacao(IDLocacao) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE TemModelo (
    IDTemModelo INT PRIMARY KEY,
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


INSERT INTO Cliente (IDCliente, Nome, Sobrenome, CNH, Telefone, Email)
VALUES (1, 'João', 'Silva', '123456789', '123456789', 'joao.silva@example.com');

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