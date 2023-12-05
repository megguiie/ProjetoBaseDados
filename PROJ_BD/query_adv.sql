-- ==== Querys avançadas ==== 


-- Visualização do funcionario com o maior salário e o menor salário
select fun_nome "Funcionário", fun_salario "Salário" 
from funcionarios
where fun_salario in (
    select max(fun_salario) 
    from funcionarios
) or fun_salario in (
    select min(fun_salario) 
    from funcionarios
);

-- Visualização do destino com mais distância e mais tempo de viagem
select b.bi_numVoo "Número do voo", l.loc_nome from bilhetes b
right join localidade l
on b.bi_id = l.loc_id
where loc_distancia in (
    select max(loc_distancia)
    from localidade
);

-- Visualização de quem está associado ao mesmo banco
select c.cli_nome "Nome do Cliente", b.ban_nome "Nome do Banco" from clientes c
inner join cartaoBancario b
on c.cli_id = b.ban_id
where ban_nome = 'Banco Santander Totta';

-- Visualização do bilhete dos clientes que começam por 'A'
select cli_nome "Nome do Cliente", bi_numVoo "Número do Voo" from clientes c 
inner join bilhetes b
on c.cli_id = b.bi_id
where c.cli_nome like 'A%';

-- Visualização da quantidade de clientes que estão associados ao mesmo avião
select distinct a.aviao_nome "Nome do avião", count(c.cli_id) "Clientes" from clientes c
inner join bilhetes b
on c.cli_id = b.bi_id 
inner join aviaoloc al
on b.bi_id = al.aviao_id
inner join avioes a
on al.aviao_id = a.aviao_id
group by a.aviao_nome
order by aviao_nome asc;