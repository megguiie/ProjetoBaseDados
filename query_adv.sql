-- Querys avançadas 


-- Funcionario com o maior salario e o menor
select fun_nome "Funcionário", fun_salario "Salário" 
from funcionarios
where fun_salario in (
    select max(fun_salario) 
    from funcionarios
) or fun_salario in (
    select min(fun_salario) 
    from funcionarios
);

-- O destino com mais distancia e mais tempo
select b.bi_numVoo "Número do voo", l.loc_nome from bilhetes b
inner join localidade l
on b.bi_id = l.loc_id
where loc_distancia in (
    select max(loc_distancia)
    from localidade
);

-- Quem esta associado ao mesmo banco
select c.cli_nome "Nome do Cliente", b.ban_nome "Nome do Banco" from clientes c
inner join cartaoBancario b
on c.cli_id = b.ban_id
where ban_nome = 'Banco Santander Totta';


-- O bilhete dos clientes que começam por 'A'




-- Faz uma query que escreve a quantidade de clientes que existem na base de dados 
-- com a seguinte formatação "Existem (numero) de clientes." 