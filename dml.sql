INSERT INTO 
    public.paciente(pac_ci, pac_nombre, pac_apellido)
	VALUES ('4664545', UPPER('diana'), UPPER('romero'));

INSERT INTO
    public.paciente(pac_ci, pac_nombre, pac_apellido)
	VALUES ('3512965', UPPER('ricardo'), UPPER('franco'));

INSERT INTO
    public.paciente(pac_ci, pac_nombre, pac_apellido)
	VALUES ('1000000', UPPER('ana'), UPPER('fleitas'));

INSERT INTO
    public.paciente(pac_ci, pac_nombre, pac_apellido)
	VALUES ('1000001', UPPER('crisstel'), UPPER('ruiz'));

INSERT INTO
    public.paciente(pac_ci, pac_nombre, pac_apellido)
	VALUES ('1000065', UPPER('mario'), UPPER('centurión'));

-- deletes
--DELETE FROM paciente;
--DELETE FROM paciente WHERE nss=4;
--DELETE FROM paciente WHERE nss=(SELECT nss FROM paciente WHERE pac_ci='4664545')

UPDATE paciente SET pac_ci='1000002' WHERE nss=(SELECT nss FROM paciente WHERE pac_ci='1000001');

SELECT
	x.pac_nombre
FROM (SELECT * FROM paciente WHERE pac_apellido ILIKE '%f%') x;