CREATE TABLE tb_empregados(
rg              VARCHAR(11),
nome            VARCHAR(60),
idade           INTEGER,
CONSTRAINT pk_tb_empregados_rg PRIMARY KEY (rg)
);

-- Sufixo
   -- pk: PRIMARY KEY
   -- fk: FOREING KEY
   -- nn: NOT NULL
   -- uq: UNIQUE
   -- ck: CHECK
   
CREATE TABLE tb_pedido(
nr_pedido       INTEGER,
ds_pedido       VARCHAR(60),
dt_pedido       TIMESTAMP,
CONSTRAINT pk_tb_pedidos_nr_pedido PRIMARY KEY(nr_pedido)
);

CREATE TABLE tb_itens(
nr_pedido       INTEGER,
nr_item         INTEGER,
nm_produto      VARCHAR(60),
quantidade      INTEGER,
CONSTRAINT pk_tb_itens_pedido_item PRIMARY KEY(nr_pedido, nr_item),
CONSTRAINT fk_tb_itens_item FOREIGN KEY(nr_pedido) REFERENCES tb_pedido(nr_pedido)
);

DROP TABLE tb_empregados;

CREATE TABLE tb_empregados(
rg              VARCHAR(11),
nm_empregado    VARCHAR(60),
idade           INTEGER,
plano_saude     VARCHAR(60),
rua             VARCHAR(60),
nr              VARCHAR(5),
cidade          VARCHAR(60),
CONSTRAINT pk_tb_empregados_rg PRIMARY KEY(rg)
);

CREATE TABLE tb_telefones(
rg              VARCHAR(11),
numero          VARCHAR(15),
CONSTRAINT pk_tb_telefones_rg_nr PRIMARY KEY(rg, numero),
CONSTRAINT fk_tb_telefones_rg FOREIGN KEY(rg) REFERENCES tb_empregados(rg)
);

CREATE TABLE tb_servidores(
cpf             VARCHAR(11),
nm_servidor     VARCHAR(60),
CONSTRAINT pk_tb_servidores_cpf PRIMARY KEY(cpf)
);

CREATE TABLE tb_funcionarios(
cpf             VARCHAR(11),
ds_funcao       VARCHAR(60),
CONSTRAINT pk_tb_func_cpf PRIMARY KEY(cpf),
CONSTRAINT fk_tb_func_cpf FOREIGN KEY(cpf) REFERENCES tb_servidores(cpf)
);

CREATE TABLE tb_professores(
cpf             VARCHAR(11),
titulacao       VARCHAR(30),
categoria       VARCHAR(30),
CONSTRAINT pk_tb_professores_cpf PRIMARY KEY(cpf),
CONSTRAINT fk_tb_professores_cpf FOREIGN KEY(cpf) REFERENCES tb_servidores(cpf)
);

CREATE TABLE tb_pessoas(
codigo          INTEGER,
nm_pessoa       VARCHAR(60),
CONSTRAINT pk_tb_pessoas_codigo PRIMARY KEY(codigo)
);

CREATE TABLE tb_chn(
numero          INTEGER,
dt_expedicao    DATE,
validade        DATE,
categoria       VARCHAR(3),
codigo          INTEGER CONSTRAINT uq_tb_cnh_codigo UNIQUE,
dt_retirada     DATE,
CONSTRAINT pk_tb_cnh_nr PRIMARY KEY(numero),
CONSTRAINT fk_tb_cnh_codigo FOREIGN KEY(codigo) REFERENCES tb_pessoas(codigo)
);

INSERT INTO tb_pessoas(codigo, nm_pessoa)
VALUES
(1, 'Alex Sanabio'),
(2, 'Andre Malheiro Rufino');
 
SELECT *
FROM tb_pessoas;

INSERT INTO tb_chn(numero, dt_expedicao, validade, categoria, codigo, dt_retirada)
VALUES
(100, '05/03/2021', '05/03/2026', 'B', 1, '19/03/2021');

SELECT *
FROM tb_chn;

CREATE TABLE tb_homens(
rg              VARCHAR(11),
nm_homem        VARCHAR(60),
CONSTRAINT pk_tb_homens_rg PRIMARY KEY(rg)
);

CREATE TABLE tb_mulheres(
rg              VARCHAR(11),
nm_mulher       VARCHAR(60),
CONSTRAINT pk_tb_mulheres_rg PRIMARY KEY(rg)
);

CREATE TABLE tb_casamentos(
rg_homem        VARCHAR(11),
rg_mulher       VARCHAR(11),
dt_casamento    DATE,
CONSTRAINT pk_tb_casamentos_rgh PRIMARY KEY(rg_homem),
CONSTRAINT fk_tb_casamentos_rgm FOREIGN KEY(rg_mulher) REFERENCES tb_mulheres(rg),
CONSTRAINT uq_tb_casamentos_rgm UNIQUE(rg_mulher)
);