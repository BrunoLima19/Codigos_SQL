CREATE TABLE tb_departamento(
SiglaDepto           VARCHAR,
NomeDepto            VARCHAR(40),
CONSTRAINT pk_tb_depto_SiglaDepto PRIMARY KEY(SiglaDepto)
);

SELECT *
FROM tb_departamento;

CREATE TABLE tb_setor(
SiglaSetor      VARCHAR,
SiglaDepto      VARCHAR,
NomeSetor       VARCHAR(40),
CONSTRAINT pk_tb_setor_SiglaSetor PRIMARY KEY(SiglaSetor),
CONSTRAINT fk_tb_setor_SiglaDepto FOREIGN KEY(SiglaDepto) REFERENCES tb_departamento(SiglaDepto)
);

CREATE TABLE tb_bem_movel(
CodBem          INTEGER,
SiglaSetor      VARCHAR,
DescricaoBem    VARCHAR(60),
DataCompraBem   DATE,
ValorCompraBem  NUMERIC(7,2),
CONSTRAINT pk_tb_bem_movel_CodBem PRIMARY KEY(CodBem),
CONSTRAINT fk_tb_bem_movel_SiglaSetor FOREIGN KEY(SiglaSetor) REFERENCES tb_Setor(SiglaSetor)
);

CREATE TABLE tb_tipo_dano(
IdTipo          INTEGER,
DescrTipo       VARCHAR(60),
CONSTRAINT pk_tb_tipo_dano_IdTipo PRIMARY KEY(IdTipo)
);

CREATE TABLE tb_ocorrencia(
NroOcorrencia       INTEGER,
IdTipo              INTEGER,
CodBem              INTEGER,
SiglaSetor          VARCHAR,
DataOcorrencia      DATE,
CONSTRAINT pk_tb_ocorrencia_NroOcorrencia PRIMARY KEY(NroOcorrencia),
CONSTRAINT fk_tb_ocorrencia_IdTipo FOREIGN KEY(IdTipo) REFERENCES tb_tipo_dano(IdTipo),
CONSTRAINT fk_tb_ocorrencia_CodBem FOREIGN KEY(CodBem) REFERENCES tb_bem_movel(CodBem),
CONSTRAINT fk_tb_ocorrencia_SiglaSetor FOREIGN KEY(SiglaSetor) REFERENCES tb_setor(SiglaSetor)
);