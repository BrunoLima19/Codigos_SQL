DROP TABLE tb_empregados CASCADE;

CREATE TABLE tb_departamentos(
cod_depto 			INTEGER,
nm_depto 			VARCHAR(60),
CONSTRAINT pk_tb_depto_cod_depto PRIMARY KEY(cod_depto)	
);

CREATE TABLE tb_empregados(
cpf					VARCHAR(11),
nm_empregado		VARCHAR(60),
cod_depto			INTEGER CONSTRAINT nn_tb_empregados_cod_depto NOT NULL,
dt_lotacao			DATE,
CONSTRAINT pk_tb_empregados_cpf PRIMARY KEY(cpf),
CONSTRAINT fk_tb_empregados_cod_depto FOREIGN KEY(cod_depto)
	 REFERENCES tb_departamentos(cod_depto)
);

SELECT *
FROM tb_departamentos;

INSERT INTO tb_departamentos(cod_depto, nm_depto)
VALUES
(1, 'Computação'),
(2, 'Administração'),
(3, 'Engenharia Civil');

SELECT *
FROM tb_empregados;

INSERT INTO tb_empregados(cpf, nm_empregado, cod_depto, dt_lotacao)
VALUES
('11223344', 'Alex Sanabio', 1, '23/03/2021');

DROP TABLE tb_pessoas CASCADE;

CREATE TABLE tb_pessoas(
rg				VARCHAR(11),
nm_pessoa		VARCHAR(60),
CONSTRAINT pk_tb_pessoas_rg PRIMARY KEY(rg)	
);

CREATE TABLE tb_automoveis(
chassi 			VARCHAR(17),
modelo			VARCHAR(30),
ano				INTEGER,
CONSTRAINT pk_tb_automoveis_chassi PRIMARY KEY(chassi)	
);
DROP TABLE  tb_posses CASCADE;

CREATE TABLE tb_posses(
rg				VARCHAR(11),
chassi			VARCHAR(17),
dt_compra		DATE,
CONSTRAINT pk_tb_posses_chassi PRIMARY KEY(chassi),
CONSTRAINT fk_tb_posses_rg FOREIGN KEY(rg) REFERENCES tb_pessoas(rg),
CONSTRAINT fk_tb_posses_chassi FOREIGN KEY(chassi)
	   REFERENCES tb_automoveis(chassi)
);

CREATE TABLE tb_posses(
rg			VARCHAR(11),
chassi		VARCHAR(17),
dt_compra	DATE,
CONSTRAINT pk_tb_posses_chassi PRIMARY KEY(chassi),
CONSTRAINT fk_tb_posses_rg FOREIGN KEY(rg) REFERENCES tb_pessoas(rg),
CONSTRAINT fk_tb_posses_chassi FOREIGN KEY(chassi)
		REFERENCES tb_automoveis(chassi)
);

SELECT *
FROM tb_pessoas;

DROP TABLE tb_empregados CASCADE;

CREATE TABLE tb_empregados(
rg				VARCHAR(11),
nm_empregado	VARCHAR(60),
CONSTRAINT pk_tb_empregados_rg PRIMARY KEY(rg)	
);

CREATE TABLE tb_projetos(
codigo			INTEGER,
nm_projeto		VARCHAR(60),
CONSTRAINT pk_tb_projetos_codigo PRIMARY KEY(codigo)	
);

CREATE TABLE tb_participacao(
rg				VARCHAR(11),
codigo			INTEGER,
dt_inicio		DATE,
CONSTRAINT pk_tb_particip_rg_cod PRIMARY KEY(rg, codigo),
CONSTRAINT fk_tb_particip_rg FOREIGN KEY(rg)
	REFERENCES tb_empregados(rg),
CONSTRAINT fk_tb_particip_cod FOREIGN KEY(codigo)
	REFERENCES tb_projetos(codigo)
);

DROP TABLE tb_clientes CASCADE;

CREATE TABLE tb_clientes(
rg              VARCHAR(11),
nm_cliente      VARCHAR(60),
CONSTRAINT pk_tb_clientes_rg PRIMARY KEY(rg)
);

CREATE TABLE tb_contas(
nr_conta        INTEGER,
ds_conta        VARCHAR(30),
CONSTRAINT pk_tb_contas_rg PRIMARY KEY(nr_conta)
);

CREATE TABLE tb_correntistas(
rg              VARCHAR(11),
nr_conta        INTEGER,
CONSTRAINT pk_tb_correntistas_rg_nr_conta PRIMARY KEY(rg, nr_conta),
CONSTRAINT fk_tb_correntistas_rg FOREIGN KEY(rg) REFERENCES tb_clientes(rg),
CONSTRAINT fk_tb_correntistas_nr_conta FOREIGN KEY(nr_conta) REFERENCES tb_contas(nr_conta)
);

CREATE TABLE tb_cartoes_magneticos(
nr_cartao            INTEGER,
dt_expedicao         DATE,
rg                   VARCHAR(11),
nr_conta             INTEGER,
CONSTRAINT pk_tb_cm_nr_cartao PRIMARY KEY(nr_cartao),
CONSTRAINT fk_tb_cm_rg FOREIGN KEY(rg) REFERENCES tb_clientes(rg),
CONSTRAINT fk_tb_cm_mr_conta FOREIGN KEY(nr_conta) REFERENCES tb_contas(nr_conta)
);

CREATE TABLE tb_instituicoes(
sigla               CHAR(3),
nm_instituição      VARCHAR(60),
CONSTRAINT pk_tb_instituicoes_sigla_ PRIMARY KEY(sigla)
);

DROP TABLE tb_projetos CASCADE;

CREATE TABLE tb_projetos(
nr_projeto      INTEGER,
ds_projeto      VARCHAR(40),
CONSTRAINT pk_tb_projetos_nr_projeto PRIMARY KEY(nr_projeto)
);

CREATE TABLE tb_pesquisadores(
rg                  VARCHAR(11),
nm_pesquisador      VARCHAR(60),
CONSTRAINT pk_tb_pesquisadores_rg PRIMARY KEY(rg)
);

CREATE TABLE tb_pesquisas(
sigla           CHAR(3),
nr_projeto      INTEGER,
rg              VARCHAR(11),
dt_inicio       DATE,
CONSTRAINT pk_tb_pesquisas_sigla_nr_rg PRIMARY KEY(sigla, nr_projeto, rg),
CONSTRAINT fk_tb_pesquisas_sigla FOREIGN KEY(sigla) REFERENCES tb_instituicoes(sigla),
CONSTRAINT fk_tb_pesquisas_nr_projeto FOREIGN KEY(nr_projeto) REFERENCES tb_projetos(nr_projeto),
CONSTRAINT fk_tb_pesquisas_rg_ FOREIGN KEY(rg) REFERENCES tb_pesquisadores(rg)														
);

CREATE TABLE tb_produtos(
cod_produto     INTEGER,
ds_produto      VARCHAR(60),
CONSTRAINT pk_tb_produtos_cod_produto PRIMARY KEY(cod_produto)
);

CREATE TABLE tb_cidades(
cod_cidade     INTEGER,
ds_cidade      VARCHAR(60),
CONSTRAINT pk_tb_cidades_cod_cidade PRIMARY KEY(cod_cidade)
);

CREATE TABLE tb_distribuidores(
rg                   VARCHAR(11),
nm_distribuidor      VARCHAR(60),
CONSTRAINT pk_tb_dist_rg PRIMARY KEY(rg)
);

CREATE TABLE tb_distribuicao(
cod_produto         INTEGER,
cod_cidade          INTEGER,
rg                  VARCHAR(11),
CONSTRAINT pk_tb_distrib_produto_cidade PRIMARY KEY(cod_produto, cod_cidade),
CONSTRAINT fk_tb_distrib_cod_produto FOREIGN KEY(cod_produto)
	REFERENCES tb_produtos(cod_produto),
CONSTRAINT fk_tb_distrib_cod_cidade FOREIGN KEY(cod_cidade)
	REFERENCES tb_cidades(cod_cidade),
CONSTRAINT fk_tb_distrib_rg FOREIGN KEY(rg)
	REFERENCES tb_distribuidores(rg)
);

CREATE TABLE tb_bairros(
cod_bairro          INTEGER,
nm_bairro           VARCHAR(60),
CONSTRAINT pk_tb_bairros_cod_bairro PRIMARY KEY(cod_bairro)
);

CREATE TABLE tb_carteiros(
rg              VARCHAR(11),
nm_carteiro     VARCHAR(60),
CONSTRAINT pk_tb_carteiros_rg PRIMARY KEY(rg)
);

CREATE TABLE tb_correspondencias(
cod_carta            INTEGER,
peso                 FLOAT,
cod_bairro           INTEGER,
rg                   VARCHAR(11),
CONSTRAINT pk_tb_correspondencias_cod_carta PRIMARY KEY(cod_carta),
CONSTRAINT fk_tb_correspondencias_cod_bairro FOREIGN KEY(cod_bairro) REFERENCES tb_bairros(cod_bairro),
CONSTRAINT fk_tb_correspondencias_rg FOREIGN KEY(rg) REFERENCES tb_carteiros(rg)
);