--Leonardo Chaves Costa 201965208AB
--Luiz Miguel Batista Silva 202235020
--Wesley de Almeida Cruz 201765567AC


/*
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

SELECT    
MV.Marca,     
MV.Modelo,  
SUM(L.ValorLocacao) AS ValorTotalLocacoes 
FROM    
Locacao AS L INNER JOIN   
Veiculo AS V ON L.IDVeiculo = V.IDVeiculo 
INNER JOIN   
TemModelo AS TM ON V.IDVeiculo = TM.IDVeiculo 
INNER JOIN   
ModeloVeiculo AS MV ON TM.IDModeloVeiculo = MV.IDModeloVeiculo
GROUP BY  
MV.IDModeloVeiculo, MV.Marca, MV.Modelo;

/*
Query 4: Mostra a data de fim da última locação.
Essa query pode ser útil para obter informações sobre o último dia de atividades do negócio.
*/
SELECT MAX(DataFimLocacao) AS DataFimLocacao
FROM Locacao;

/*
Query 5: Mostra a média do tempo de duração das locações.
Essa query pode ser útil para obter informações sobre a duração média das locações realizadas.
*/
SELECT
    TO_CHAR(ROUND(EXTRACT(EPOCH FROM media_interval) / 86400, 2), 'FM99999999999990.00') || ' dias' AS MediaTempoLocacaoFormatada
FROM (
    SELECT
        AVG(DataFimLocacao::timestamp - DataInicioLocacao::timestamp) media_interval
    FROM
        Locacao
) subquery;

