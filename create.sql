-- Criação das tabelas com os respectivos atributos consoante o modelo relacional feito

-- Criacação da tabela Aviões
create table avioes(aviao_id int not null auto_increment,
    aviao_nome varchar(45) not null,
    aviao_modelo varchar(45) not null,
    aviao_assento int(500) not null,
    aviao_porte varchar(45) not null,
    aviao_mobilidade char(1) not null,
    constraint pk_aviao_id primary key(aviao_id),
);

-- Criacação da tabela Localidades
create table localidade(loc_id int not null auto_increment,
    loc_nome varchar(45) not null,
    loc_duracao varchar(7) not null,
    loc_distancia varchar(20) not null
    constraint pk_loc_id primary key(loc_id)
);

-- Criacação da tabela Bilhetes
create table bilhetes(bi_id int not null auto_increment,
    bi_preco varchar(20) not null,
    bi_assento varchar(8) not null,
    bi_numVoo varchar(10) not null,
    bi_horario varchar(7) not null,
    bi_gate varchar(4) not null,
    bi_data date,
    bi_aviao_id int,
    bi_loc_id int,
    constraint pk_bi_id primary key(bi_id),
    constraint fk_bi_aviao_id foreign key (bi_aviao_id) references bilhetes(bi_id),
    constraint fk_bi_loc_id foreign key (bi_loc_id) references localidade(loc_id)
);

-- Criacação da tabela Clientes
create table clientes(cli_id int not null auto_increment,
    cli_nome varchar(45) not null,
    observacoes varchar(200),
    cli_NIF int(9) not null,
    email varchar(45) not null,
    telefone varchar(9) not null,
    cli_dnsc date not null,
    cli_necessidades char(1) not null,
    cli_morada varchar(100) not null,
    num_passaporte varchar(30) not null,
    cli_bi_id int,
    cli_ban_id int,
    constraint pk_cli_id primary key(cli_id),
    constraint fk_cli_bi_id foreign key (cli_bi_id) references bilhetes(bi_id),
    constraint fk_cli_ban_id foreign key (cli_ban_id) references cartaoBancario(ban_id)
);

-- Criacação da tabela Funcionários
create table funcionarios(fun_id int not null auto_increment,
    fun_salario float(30) not null,
    fun_contacto int(9) not null,
    fun_nome varchar(45) not null,
    fun_morada varchar(50) not null,
    fun_nif int(9) not null,
    fun_dnsc date not null,
    fun_ss int(11) not null,
    fun_numSeguro varchar(25) not null,
    fun_cargo varchar(30) not null,
    fun_ban_id int,
    constraint pk_fun_id primary key(fun_id),
    constraint fk_cli_ban_id foreign key (cli_ban_id) references cartaoBancario(ban_id)
);

-- Criacação da tabela Cartão Bancario
create table cartaoBancario(ban_id int not null auto_increment,
    ban_nome varchar(50) not null,
    ban_SWIFT varchar(10) not null,
    ban_IBAN varchar(27) not null,
    ban_num int(18) not null,
    ban_data date not null,
    ban_CVC int(3) not null,
    constraint pk_ban_id primary key(ban_id)
);


-- Criação da tabela intermediaria entre os Aviões e Localidades 
create table aviaoLoc(
    aviao_id int,
    loc_id int,
    constraint pk_avio_loc_id primary key (aviao_id, loc_id),
    constraint fk_aviao_id foreign key (aviao_id) references avioes(aviao_id),
    constraint fk_loc_id foreign key (loc_id) references localidade(loc_id)
);