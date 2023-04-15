CREATE USER tic2021 IDENTIFIED BY 123456;
GRANT CREATE SESSION TO tic2021;
ALTER USER tic2021 IDENTIFIED BY 123456789;

GRANT
  SELECT,
  INSERT,
  UPDATE,
  DELETE
ON
  TIC_2021.tb_anuncios
TO
  tic2021 WITH GRANT OPTION;