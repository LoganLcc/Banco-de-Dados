--Leonardo Chaves Costa 201965208AB
--Luiz Miguel Batista Silva 202235020
--Wesley de Almeida Cruz 201765567AC

--Adicionando clientes 
INSERT INTO Cliente (IDCliente, Nome, Sobrenome, CNH, Telefone, Email)
VALUES 
 (1, 'João', 'Silva', '1234567189', '1234156789', 'joao.silva@example.com'),
 (2, 'leo', 'chaves', '123446889', '1234562789', 'leo.chaves@example.com'),
 (3, 'luis', 'miguel', '125556889', '1235456789', 'luis.miguel@example.com'),
 (4, 'Wesley', 'almeida', '1234456789', '1234567789', 'Wesley.bruck@example.com'),
 (5, 'lucas', 'bruck', '1233456789', '1263456789', 'lucas.bruck@example.com'),
 (6, 'Vanessa', 'Barros', '416385927', '651497238', 'Vanessa.Barros@example.com'),
 (7, 'Renato', 'Santos', '376128954', '832957641', 'Renato.Santos@example.com'),
 (8, 'Miguel', 'Cruz', '541367982', '573419268', 'Miguel.Cruz@example.com'),
 (9, 'Larissa', 'Bosco', '641958732', '512763948', 'Larissa.Bosco@example.com'),
 (10, 'Guilherme', 'Silva', '293487651', '527913864', 'Guilherme.Silva@example.com'),
 (11, 'Barbara', 'Sanches', '426591387', '179384526', 'Barbara.Sanches@example.com'),
 (12, 'Bruno', 'Moraes', '157649832', '258931746', 'Bruno.Moraes@example.com'),
 (13, 'Maria', 'Clara', '582746931', '481975623', 'Maria.Clara@example.com'),
 (14, 'Karol', 'Peters', '568349712', '915683427', 'Karol.Peters@example.com'),
 (15, 'Jose', 'Carlos', '269875413', '796541832', 'Jose.Carlos@example.com'),
 (16, 'Izabel', 'Cristina', '769241853', '328751964', 'Izabel.Cristina@example.com'),
 (17, 'Leticia', 'Cardoso', '138393938', '154793628', 'Leticia.Cardoso@example.com');

--Adicionando Veiculo 
INSERT INTO Veiculo (IDVeiculo,Placa, AnoFabricacao, Estado)
VALUES
(1,'ABC-1234', 2023, 'disponivel'),
(2,'DEF-5668', 2022, 'disponivel'),
(3,'GHI-9012', 2021, 'alugado'),
(4,'JKL-3456', 2020, 'alugado'),
(5,'MNO-7890', 2019, 'disponivel'),
(6,'ABC1D23', 2019, 'alugado'),
(7,'DEF-5678', 2021, 'alugado'),
(8,'GHI-9101', 2020, 'disponivel'),
(9,'JKL-2345', 2018, 'alugado'),
(10,'MNO-6789', 2022, 'disponivel'),                  
(11,'JKL8M90', 2019, 'disponivel'),
(12,'GHI5J67', 2022, 'disponivel'),
(13,'DEF2G34', 2016, 'alugado'),
(14,'ABC-5214', 2017, 'disponivel'),
(15,'MNO1P23', 2015, 'alugado');



--Adicionando ModeloVeiculo
INSERT INTO ModeloVeiculo (IDModeloVeiculo,Marca, Modelo, AnoLancamento, CapacidadePassageiros, CapacidadePortaMalas)
VALUES
(1,'Volkswagen', 'Gol', 2023, 5, 300),
(2,'Fiat', 'Uno', 2022, 4, 200),
(3,'Hyundai', 'HB20', 2021, 5, 350),
(4,'Chevrolet', 'Onix', 2020, 5, 250),
(5,'Toyota', 'Corolla', 2019, 5, 450),
(6,'BMW', 'X3', 2003, 4, 300),
(7,'Honda', 'Odyssey', 1994, 4, 200),
(8,'Ford', 'Focus', 2002, 5, 250),
(9,'Tesla ', 'Model3', 2020, 5, 450),
(10,'Honda', 'Civic', 1972, 4, 250),                      
(11,'BMW', 'X5', 2009, 4, 300),
(12,'Honda', 'Pilot', 2016, 4, 150),
(13,'Ford', 'Fiesta', 2012, 5, 250),
(14,'Tesla ', 'Cybertruck', 2021, 5, 450),
(15,'Honda', 'Fit', 2015, 4, 250);


--inseri locação
INSERT INTO Locacao (IDLocacao,IDCliente, IDVeiculo, DataInicioLocacao, DataFimLocacao, ValorLocacao)
VALUES
(1,1, 1, '2023-12-07', '2023-12-14', 1000.00),
(2,2, 2, '2023-12-08', '2023-12-15', 800.00),
(3,3, 3, '2023-12-09', '2023-12-16', 700.00),
(4,4, 4, '2023-12-10', '2023-12-17', 600.00),
(5,5, 5, '2023-12-11', '2023-12-18', 500.00),
(6,6, 15, '2023-11-04', '2023-11-14', 750.00),
(7,6, 12, '2023-11-05', '2023-11-15', 850.00),
(8,6, 13, '2023-11-06', '2023-11-16', 900.00),
(9,9, 14, '2023-12-10', '2023-12-17', 650.00),
(10,10, 11, '2023-12-11', '2023-12-18', 950.00),
(11,11, 6, '2023-12-07', '2023-12-14', 650.00),
(12,11, 9, '2023-12-08', '2023-12-15', 1000.00),
(13,13, 10, '2023-12-09', '2023-12-16', 500.00),
(14,14, 8, '2023-09-10', '2023-10-10', 750.00),
(15,15, 8, '2023-11-10', '2023-12-10', 750.00);



--Adicionando Funcionarios
INSERT INTO Funcionario (IDFuncionario,Nome, Sobrenome, Cargo, Salario)
VALUES
(1,'João', 'Silva', 'Gerente', 5000.00),
(2,'Maria', 'Souza', 'Vendedor', 2500.00),
(3,'Pedro', 'Santos', 'Analista', 3500.00),
(4,'Ana', 'Lima', 'Secretária', 2000.00),
(5,'Carlos', 'Martins', 'Operador', 1500.00),
(6,'Marcos', 'Paulo', 'Vendedor', 2500.00),
(7,'Anderson', 'Santos', 'Faxineiro', 1200.00),
(8,'Ana', 'Silva', 'Secretária', 2000.00),
(9,'Amanda', 'Santos', 'Secretária', 2000.00),
(10,'Diego', 'Pereira', 'Manobrista', 1250.00);


--cria realzia
INSERT INTO Realiza (IDRealiza,IDCliente, IDLocacao, DataHoraRealizacao)
VALUES
(1,1, 1, '2023-12-01 12:00:00'),
(2,2, 2,'2023-12-04 9:00:00'),
(3,3, 3, '2023-12-07 14:00:00'),
(4,4, 4, '2023-12-23 17:00:00'),
(5,5, 5, '2023-12-08 18:00:00'),
(6,6,6,'2023-11-04 12:00:00' ),
(7,6,7,'2023-11-05 12:00:00' ),
(8,6,8,'2023-11-06 12:00:00' ),
(9,9,9,'2023-12-10 12:00:00' ),
(10,10,10,'2023-12-11 12:00:00' ),
(11,11,11,'2023-12-07 12:00:00' ),
(12,11,12, '2023-12-08 12:00:00'),
(13,13,13,'2023-12-09 12:00:00'),
(14,14,14,'2023-09-10 12:00:00'),
(15,15,15,'2023-11-10 12:00:00');


--cria envonvido 
INSERT INTO Envolvido (IDEnvolvido,IDVeiculo, IDLocacao, DataHoraEnvolvimento)
VALUES
(1,1, 1, '2023-12-01 12:00:00'),
(2,2, 2, '2023-12-04 9:00:00'),
(3,3, 3, '2023-12-07 14:00:00'),
(4,4, 4, '2023-12-23 17:00:00'),
(5,5, 5, '2023-12-08 18:00:00'),
(6,15,6,'2023-12-04 12:00:00' ),
(7,12,7,'2023-12-05 12:00:00' ),
(8,13,8,'2023-12-06 12:00:00' ),
(9,14,9,'2023-12-10 12:00:00' ),
(10,11,10,'2023-12-11 12:00:00' ),
(11,6,11,'2023-12-07 12:00:00' ),
(12,9,12, '2023-12-08 12:00:00'),
(13,10,13,'2023-12-09 12:00:00'),
(14,8,14,'2023-09-10 12:00:00'),
(15,8,15, '2023-11-10 12:00:00');


INSERT INTO Atende (IDAtende,IDFuncionario, IDLocacao, DataHoraAtendimento)
VALUES
(1,2, 1,'2023-12-01 12:00:00'),
(2,2, 2, '2023-12-04 9:00:00'),
(3,6, 3, '2023-12-07 14:00:00'),
(4,6, 4, '2023-12-23 17:00:00'),
(5,2, 5, '2023-12-08 18:00:00'),
(6,6, 6,'2023-11-04 12:00:00'),
(7,6, 7,'2023-11-05 12:00:00'),
(8,6, 8,'2023-11-06 12:00:00'),
(9,2, 9,'2023-12-10 12:00:00'),
(10,2, 10,'2023-12-11 12:00:00'),
(11,6, 11,'2023-12-07 12:00:00'),
(12,6, 12, '2023-12-08 12:00:00'),
(13,2, 13,'2023-12-09 12:00:00'),
(14,2, 14,'2023-09-10 12:00:00'),
(15,6, 15,'2023-11-10 12:00:00');


INSERT INTO TemModelo (IDTemModelo,IDVeiculo, IDModeloVeiculo)
VALUES
(1,1, 1),
(2,2, 2),
(3,3, 3),
(4,4, 4),
(5,5, 5),
(6,6, 10),
(7,7, 10),
(8,8, 7),
(9,9, 8),
(10,10, 7),
(11,11, 15),
(12,12, 6),
(13,13, 9),
(14,14, 13),
(15,15, 14);

