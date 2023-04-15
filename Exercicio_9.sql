CREATE TABLE tb_departamentos(
cod_depto            CHAR(2),
nm_depto             VARCHAR(60),
CONSTRAINT pk_tb_departamento_cod_depto PRIMARY KEY (cod_depto)
);

CREATE TABLE tb_funcionarios(
cod_funcionario        CHAR(2),
nome                   VARCHAR(60),
cod_depto              CHAR(2),
salario                NUMERIC(7, 2),
CONSTRAINT pk_tb_funcionario_cod_funcionario PRIMARY KEY (cod_funcionario),
CONSTRAINT fk_tb_funcionario_cod_depto FOREIGN KEY (cod_depto) REFERENCES tb_departamentos(cod_depto)
);

INSERT INTO tb_departamentos VALUES
('D1', 'Contabilidade'),
('D2', 'Administracao'),
('D3', 'Informatica'),
('D4', 'RH');

SELECT *
FROM tb_departamentos;

INSERT INTO tb_funcionarios
VALUES

('E1', 'Jose',   'D1', 2500.00),
('E2', 'Maria',  'D1', 2800.00),
('E3', 'Jose',   'D2', 3200.00),
('E4', 'Silvia', 'D3', 4650.00),
('E5', 'Joao',   'D1', 2800.00);

SELECT *
FROM tb_funcionarios;

--Questão 01

SELECT nome
FROM tb_funcionarios
WHERE salario < 2600.00;

--Questao 02

SELECT DISTINCT nm_depto
FROM tb_departamentos d
INNER JOIN tb_funcionarios f ON(d.cod_depto = f.cod_depto)
WHERE salario <= 3500.00;

--Questao 03 

SELECT nome
FROM tb_funcionarios
WHERE cod_depto = 'D3';

--Questao 04

SELECT nome
FROM tb_funcionarios f
INNER JOIN tb_departamentos d ON(d.cod_depto = f.cod_depto)
WHERE nm_depto = 'Contabilidade';

--Questao 05

SELECT salario 
FROM tb_funcionarios f
INNER JOIN tb_departamentos d ON(d.cod_depto = f.cod_depto)
WHERE nm_depto = 'Contabilidade';
