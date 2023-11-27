-- Query Simples

-- Ver todos os clientes que têm necessidades especiais (observações)
select cli_nome "Cliente", observacoes from clientes
where observacoes is not null;

-- Atualizar a morada de um funcionario 
update funcionarios
set fun_morada = 'R Doutor Pires Miguens 12'
where fun_id = 28; 

-- Atualizar telefone de um cliente
update clientes
set telefone = 932801757
where cli_id = 49; 

-- Apagar um cliente
delete from funcionario
where fun_id = 30;

-- Mostrar os assentos ocupados sem repetir
select distinct bi_assento as "Assento"
from bilhetes;

-- Inserir mais um cliente
insert into clientes (cli_nome, cli_NIF, email, telefone, cli_dnsc, cli_necessidades, cli_morada, num_passaporte)
values('Zoé Elise Cesário Furtado', 140592863, 'zoeelise@gmail.com', 995525024, TO_DATE('1994-02-1', 'YYYY-MM-DD'), 'n', 'R Luís Camões 56', 'LA125124');

-- Consultas com as
select loc_nome as "Nome", loc_duracao as "Duração", loc_distancia as "Distância"
from localidade;

-- Ordenar pelo maior salario até o menor
select fun_nome "Nome do funcionário", fun_salario "Salário" from funcionarios
order by fun_salario desc;