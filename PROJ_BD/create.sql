-- ==== Criação das tabelas com os respectivos atributos consoante o modelo relacional feito ====

-- Criacação da tabela avioes
create table avioes(aviao_id NUMBER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1) not null,
    aviao_nome varchar(45) not null,
    aviao_modelo varchar(45) not null,
    aviao_assento number(3) not null,
    aviao_porte varchar(45) not null,
    aviao_mobilidade char(1) not null,
    constraint pk_aviao_id primary key(aviao_id)
);

-- Criacação da tabela localidade
create table localidade(loc_id NUMBER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1) not null,
    loc_nome varchar(20) not null,
    loc_duracao varchar(5) not null,
    loc_distancia varchar(8) not null,
    constraint pk_loc_id primary key(loc_id)
);

-- Criacação da tabela bilhetes
create table bilhetes(bi_id NUMBER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1) not null,
    bi_preco float(10) not null,
    bi_assento varchar(3) not null,
    bi_numVoo varchar(10) not null,
    bi_horario varchar(5) not null,
    bi_gate varchar(5) not null,
    bi_data date,
    bi_ban_id int,
    bi_loc_id int,
    bi_cli_id int,
    constraint pk_bi_id primary key(bi_id)
);

-- Criacação da tabela cartaoBancario
create table cartaoBancario(ban_id NUMBER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1) not null,
    ban_nome varchar(30) not null,
    ban_SWIFT varchar(10) not null,
    ban_IBAN varchar(25) not null,
    ban_num number(18) not null,
    ban_data varchar(7) not null,
    ban_CVC number(3) not null,
    ban_cli_id int,
    constraint pk_ban_id primary key(ban_id)
);

-- Criacação da tabela Clientes
create table clientes(cli_id NUMBER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1) not null,
    cli_nome varchar(45) not null,
    cli_NIF number(9) not null,
    email varchar(45) not null,
    telefone varchar(9) not null,
    cli_dnsc date not null,
    cli_necessidades char(1) not null,
    cli_morada varchar(100) not null,
    num_passaporte varchar(8) not null,
    observacoes varchar(200),
    constraint pk_cli_id primary key(cli_id)
);

-- Criacação da tabela funcionarios
create table funcionarios(fun_id NUMBER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1) not null,
    fun_nome varchar(45) not null,
    fun_cargo varchar(30) not null,
    fun_morada varchar(50) not null,
    fun_nif number(9) not null,
    fun_ss number(11) not null,
    fun_numSeguro varchar(19) not null,
    fun_dnsc date not null,
    fun_contacto number(9) not null,
    fun_salario float(10) not null,
    fun_ban_id int,
    constraint pk_fun_id primary key(fun_id)
);

-- Criação da tabela intermediaria entre os avioes e localidade 
create table aviaoLoc(aviaoloc_id NUMBER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1) not null,
    aviao_id int,
    loc_id int,
    constraint pk_aviao_loc_id primary key (aviaoloc_id),
    constraint fk_aviao_id foreign key (aviao_id) references avioes(aviao_id),
    constraint fk_loc_id foreign key (loc_id) references localidade(loc_id)
);


-- Implementação das chaves estrangeiras
alter table bilhetes add constraint fk_bilhetes_localidade 
            foreign key (bi_loc_id) references localidade(loc_id);

alter table bilhetes add constraint fk_bilhetes_clientes 
            foreign key (bi_cli_id) references clientes(cli_id);
    
alter table bilhetes add constraint fk_bilhetes_cartaoBancario 
            foreign key (bi_ban_id) references cartaoBancario(ban_id);

alter table cartaoBancario add constraint fk_cartaoBancario_clientes 
            foreign key (ban_cli_id) references clientes(cli_id);

alter table funcionarios add constraint fk_funcionarios_cartaoBancario
            foreign key (fun_ban_id) references cartaoBancario(ban_id);


--===== Criação de views ====

-- Criação da view para visualizar o nome dos clientes e a data de nascimento
create view vNome as
select cli_nome "Nome do CLiente", cli_dnsc "Data de nascimento" from clientes;