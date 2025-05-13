CREATE TABLE paciente(
    nss SERIAL PRIMARY KEY
    , pac_ci VARCHAR(15) NOT NULL
    , pac_nombre VARCHAR(60) NOT NULL
    , pac_apellido VARCHAR(60) NOT NULL
);

CREATE TABLE tarjetas(
    tar_cod SERIAL PRIMARY KEY
    , tar_entrada TIME NOT NULL
    , tar_salida TIME NOT NULL
    , nss INTEGER NOT NULL
    , FOREIGN KEY(nss) REFERENCES paciente(nss)
    ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE planta(
    pla_nro SERIAL PRIMARY KEY
    , pla_descri VARCHAR(60) UNIQUE NOT NULL
);

CREATE TABLE cama(
    cam_nro INTEGER
    , pla_nro INTEGER
    , cam_descri VARCHAR(60) NOT NULL
    , PRIMARY KEY(cam_nro, pla_nro)
    , FOREIGN KEY(pla_nro) REFERENCES planta(pla_nro) ON UPDATE CASCADE ON DELETE RESTRICT
);

-- A esta tabla le falta una FK
-- Podes usar este para arreglar
-- ALTER TABLE paciente_cama ADD FOREIGN KEY(nss) REFERENCES paciente(nss) ON UPDATE CASCADE ON DELETE RESTRICT;
CREATE TABLE paciente_cama(
    cam_nro INTEGER
    , pla_nro INTEGER
    , nss INTEGER
    , fecha_cama DATE NOT NULL DEFAULT CURRENT_DATE
    , PRIMARY KEY(cam_nro, pla_nro, nss)
    , FOREIGN KEY(cam_nro, pla_nro) REFERENCES cama(cam_nro, pla_nro) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE medico(
    med_cod INTEGER PRIMARY KEY
    , med_nombre VARCHAR(60) NOT NULL
    , med_apellido VARCHAR(60) NOT NULL
);

CREATE TABLE diagnostico(
    dia_cod SERIAL PRIMARY KEY
    , dia_descri VARCHAR(60) UNIQUE NOT NULL
);

CREATE TABLE paciente_medico(
    med_cod INTEGER
    , nss INTEGER
    , fecha_atencion DATE
    , hora_atencion TIME
    , PRIMARY KEY(med_cod, nss)
    , FOREIGN KEY(med_cod) REFERENCES medico(med_cod) ON UPDATE CASCADE ON DELETE RESTRICT
    , FOREIGN KEY(nss) REFERENCES paciente(nss) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE med_pac_diagnostico(
    dia_cod INTEGER
    , med_cod INTEGER
    , nss INTEGER
    , fecha_diag DATE
    , PRIMARY KEY(dia_cod, med_cod, nss)
    , FOREIGN KEY(dia_cod) REFERENCES diagnostico(dia_cod) ON UPDATE CASCADE ON DELETE RESTRICT
    , FOREIGN KEY(med_cod) REFERENCES medico(med_cod) ON UPDATE CASCADE ON DELETE RESTRICT
    , FOREIGN KEY(nss) REFERENCES paciente(nss) ON UPDATE CASCADE ON DELETE RESTRICT
);