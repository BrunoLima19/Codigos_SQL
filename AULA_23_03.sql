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

CREATE TABLE tb_posses(
rg				VARCHAR(11),
chassi			VARCHAR(17),
dt_compra		DATE,
CONSTRAINT pk_tb_posses_chassi PRIMARY KEY(chassi),
CONSTRAINT fk_tb_posses_rg FOREIGN KEY(rg) REFERENCES tb_pessoas(rg),
CONSTRAINT fk_tb_posses_chassi FOREIGN KEY(chassi)
	   REFERENCES tb_automoveis(chassi)
);

DROP TABLE  tb_posses CASCADE;

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

DROP TABLE tb_empregados CASCADE;

CREATE TABLE tb_empregados(
rg              VARCHAR(11),
nm_empregados   VARCHAR(60),
idade           INTEGER,
rg_gerente      VARCHAR(11),
CONSTRAINT pk_tb_empregados_rg PRIMARY KEY(rg),
CONSTRAINT fk_tb_empregados_rg_gerente FOREIGN KEY(rg_gerente) REFERENCES tb_empregados(rg)
);

SELECT *
FROM tb_empregados;

INSERT INTO tb_empregados(rg, nm_empregados, idade, rg_gerente)
VALUES
('1', 'Alex Sanábio', 20, NULL),
('2', 'Alex Sousa', 19, '1'),
('3', 'Andre Malheiro Rufino', 20, '2'),
('4', 'Amanda Estela', 20, '1'),
('5', 'Bruno Lima', 21, '4');

SELECT g.nm_empregados || 'Gerencia o(a)'  || e.nm_empregados "Quem é gerente de quem?"
FROM tb_empregados g
INNER JOIN tb_empregados e ON(e.rg_gerente = g.rg);

CREATE TABLE tb_clientes(
rg_cliente			VARCHAR(11),
nm_cliente			VARCHAR(60),
CONSTRAINT pk_tb_clientes_rg_cliente PRIMARY KEY(rg_cliente)
);

CREATE TABLE tb_bibliotecarias(
rg_bibliotecaria	VARCHAR(11),
nm_bobliotacaria	VARCHAR(60),
CONSTRAINT pk_tb_bobliotecarias_rg_biblio PRIMARY KEY(rg_bibliotecaria)
);

CREATE TABLE tb_livros(
codigo				INTEGER,
titulo				VARCHAR(60),
rg_cliente			VARCHAR(60),
dt_devolucao		DATE,
rg_bibliotecaria	VARCHAR(11),
CONSTRAINT pk_tb_livros_codigo PRIMARY KEY(codigo),
CONSTRAINT fk_tb_livros_rg_cliente FOREIGN KEY(rg_cliente)
	REFERENCES tb_clientes(rg_cliente),
CONSTRAINT fk_tb_livros_rg_bibliotecaria FOREIGN KEY (rg_bibliotecaria)
	REFERENCES tb_bibliotecarias(rg_bibliotecaria)
);