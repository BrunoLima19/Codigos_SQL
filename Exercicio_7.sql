CREATE TABLE tb_funcao (
id_funcao          VARCHAR(10),
ds_funcao          VARCHAR(35),
base_salario       NUMERIC,
teto_salario       NUMERIC,
CONSTRAINT pk_tb_produto_id_funcao PRIMARY KEY (id_funcao)
);

CREATE TABLE tb_pais (
id_pais         CHAR(2),
nm_pais         VARCHAR(40),
CONSTRAINT pk_tb_pais_id_pais PRIMARY KEY (id_pais)
);

CREATE TABLE tb_localizacao (
id_localizacao        INTEGER,
id_pais               CHAR(2),
endereco              VARCHAR(40),
cep                   VARCHAR(12),
cidade                VARCHAR(30),
estado                VARCHAR(25),
CONSTRAINT pk_tb_localizacao_id_localizacao PRIMARY KEY (id_localizacao),
CONSTRAINT fk_tb_localizacao_id_pais FOREIGN KEY (id_pais) REFERENCES tb_pais(id_pais)
);

CREATE TABLE tb_departamento(
id_departamento           INTEGER,
id_localizacao            INTEGER,
nm_departamento           VARCHAR(30),
CONSTRAINT pk_tb_departamento_id_departamento PRIMARY KEY (id_departamento),
CONSTRAINT fk_tb_departamento_id_localizacao FOREIGN KEY (id_localizacao) REFERENCES tb_localizacao(id_localizacao)
);

CREATE TABLE tb_gerente(
id_gerente          INTEGER,
CONSTRAINT pk_tb_gerente_id_gerente PRIMARY KEY (id_gerente)
);

CREATE TABLE tb_empregado (
id_empregado        INTEGER,
id_gerente          INTEGER,
id_departamento     INTEGER,
id_funcao           VARCHAR(10),
nome                VARCHAR(20),
sobrenome           VARCHAR(25),
email               VARCHAR(25),
telefone            VARCHAR(20),
data_admissao       DATE,
porcentual_comissao NUMERIC,
salario             NUMERIC,
CONSTRAINT pk_tb_empregado_id_empregado PRIMARY KEY (id_empregado),
CONSTRAINT fk_tb_empregado_id_gerente FOREIGN KEY (id_gerente) REFERENCES tb_gerente(id_gerente),
CONSTRAINT fk_tb_empregado_id_departamento FOREIGN KEY (id_departamento) REFERENCES tb_departamento(id_departamento),
CONSTRAINT fk_tb_empregado_id_funcao FOREIGN KEY (id_funcao) REFERENCES tb_funcao(id_funcao)
);

INSERT INTO tb_gerente
VALUES
(200);

INSERT INTO tb_empregado
VALUES
(100, 300, 400, 'Bruno', 'Lima', 'lima14032001@gmail.com', '991176975', 12/06/2018, 20, 2000);

SELECT*
FROM tb_empregado;


