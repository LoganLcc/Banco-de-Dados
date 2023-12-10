--Leonardo Chaves Costa 201965208AB
--Luiz Miguel Batista Silva 202235020
--Wesley de Almeida Cruz 201765567AC

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
Query 3: Lista todas as locações realizadas de um determinado veículo.
 Essa query retorna todas as locações realizadas de um determinado veículo. 
 Essa query é útil para obter informações(historico) sobre as locações realizadas de um modelo de veículo específico.
*/
SELECT
  Locacao.*,
  Cliente.Nome AS NomeCliente,
  Veiculo.Placa
FROM Locacao
INNER JOIN Cliente ON Locacao.IDCliente = Cliente.IDCliente
INNER JOIN Veiculo ON Locacao.IDVeiculo = Veiculo.IDVeiculo
WHERE Veiculo.placa = 'ABC-1234';


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
Essa query é útil para obter informações sobre as locações realizadas por um funcionário.
*/
SELECT
  Atende.IDFuncionario,
  COUNT(*) AS TotalLocacoes
FROM Locacao
INNER JOIN Atende ON Locacao.IDLocacao = Atende.IDLocacao
GROUP BY Atende.IDFuncionario
ORDER BY Atende.IDFuncionario;
