
--Leonardo Chaves Costa 201965208AB
--Luiz Miguel Batista Silva 202235020
--Wesley de Almeida Cruz 201765567AC

/*
Left join
Query 1: Lista todas as locações, mesmo que não tenham um veículo associado.
Isso pode ser útil para obter informações sobre locações que foram canceladas, 
ou que o veículo foi devolvido sem ser registrado no sistema
*/

SELECT
Cliente.Nome AS NomeCliente,
COUNT(*) AS Total_Locacoes
FROM Locacao
LEFT JOIN Cliente ON Locacao.IDCliente = Cliente.IDCliente
GROUP BY Cliente.Nome;
