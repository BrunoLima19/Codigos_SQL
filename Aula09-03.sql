CREATE TABLE tb_departamento(
cod_departamento            INTEGER,
nm_departamento             VARCHAR(40),
CONSTRAINT pk_tb_depto_cod_depto PRIMARY KEY(cod_departamento)
);

SELECT *
FROM tb_departamento;

INSERT INTO tb_departamento(cod_departamento, nm_departamento)
VALUES
(10, 'Computação'),
(15, 'Medicina'),
(20, 'Administração');

CREATE TABLE tb_curso(
cod_curso            INTEGER,
nm_curso             VARCHAR(40),
CONSTRAINT pk_tb_curso_cod_curso PRIMARY KEY(cod_curso)
);

SELECT *
FROM tb_curso;

INSERT INTO tb_curso(cod_curso, nm_curso)
VALUES
(1, 'Ciências da Computação'),
(2, 'Sistemas de Informação'),
(3, 'Engenharia de Software');

CREATE TABLE tb_aluno(
cod_aluno            INTEGER,
nm_aluno             VARCHAR(40),
cod_curso            INTEGER,
CONSTRAINT pk_tb_aluno_cod_aluno PRIMARY KEY(cod_aluno),
CONSTRAINT fk_tb_aluno_cod_curso FOREIGN KEY(cod_curso)
	REFERENCES tb_curso(cod_curso)
);

SELECT *
FROM tb_aluno;

INSERT INTO tb_aluno(cod_aluno, nm_aluno, cod_curso)
VALUES
(1, 'Alex Sousa', 1),
(2, 'Amanda Estela', 1),
(3, 'Bruno Lima', 2),
(4, 'Bryan Seminate', 3);

SELECT a.nm_aluno "NomeAluno",
       c.nm_curso "Nome do Curso"
FROM tb_aluno a
INNER JOIN tb_curso c ON(a.cod_curso = c.cod_curso);

CREATE TABLE tb_disciplina(
cod_disciplina            INTEGER,
nm_disciplina             VARCHAR(40),
cod_departamento          INTEGER,
creditos                  INTEGER,
CONSTRAINT pk_tb_disc_cod_disc PRIMARY KEY(cod_disciplina),
CONSTRAINT fk_tb_disc_cod_depto FOREIGN KEY(cod_departamento)
	REFERENCES tb_departamento(cod_departamento)
);

SELECT *
FROM tb_disciplina;

INSERT INTO tb_disciplina(cod_disciplina, nm_disciplina, cod_departamento, creditos)
VALUES
(100, 'Banco de Dados I', 10, 80),
(110, 'Banco de Dados II', 10, 80),
(100, 'Programação com BD', 10, 80),
(100, 'Ciência de Dados', 10, 80);

CREATE TABLE tb_disciplina_curso(
cod_curso                 INTEGER,
cod_disciplina            INTEGER,
CONSTRAINT pk_tb_dc_cod_curso_cod_disc PRIMARY KEY(cod_curso, cod_disciplina),
CONSTRAINT fk_tb_dc_cod_curso FOREIGN KEY(cod_curso)
	REFERENCES tb_curso(cod_curso),
CONSTRAINT fk_tb_dc_cod_disc FOREIGN KEY(cod_disciplina)
	REFERENCES tb_disciplina (cod_disciplina)
);