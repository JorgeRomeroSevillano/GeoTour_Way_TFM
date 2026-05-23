-- USE patrimonio_db;
SET NAMES utf8mb4;
-- =========================================
-- TABLA PROVINCIA
-- =========================================
CREATE TABLE provincia (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) UNIQUE NOT NULL,
    comunidad VARCHAR(50) NOT NULL
);

-- =========================================
-- TABLA PATRIMONIO
-- =========================================
CREATE TABLE patrimonio (
    id INT AUTO_INCREMENT PRIMARY KEY,

    nombre VARCHAR(200) NOT NULL,

    descripcion TEXT NOT NULL,

    url_imagen VARCHAR(500) NOT NULL,

    tipo ENUM('cultural', 'natural') NOT NULL,

    valoracion DECIMAL(4,2) NOT NULL,

    localidad VARCHAR(100) NOT NULL,

    cod_ine VARCHAR(10) NOT NULL,

    id_provincia INT NOT NULL,

    latitud DECIMAL(9,6) NOT NULL,

    longitud DECIMAL(9,6) NOT NULL,

    CONSTRAINT fk_patrimonio_provincia
        FOREIGN KEY (id_provincia)
        REFERENCES provincia(id)
        ON DELETE CASCADE
);

-- =========================================
-- TABLA GASTRONOMIA
-- =========================================
CREATE TABLE gastronomia (
    id INT AUTO_INCREMENT PRIMARY KEY,

    nombre VARCHAR(100) NOT NULL,

    url_imagen VARCHAR(500) NOT NULL,

    descripcion TEXT NOT NULL,

    id_provincia INT NOT NULL,

    CONSTRAINT fk_gastronomia_provincia
        FOREIGN KEY (id_provincia)
        REFERENCES provincia(id)
        ON DELETE CASCADE
);

-- =========================================
-- TABLA CLIMA_PROVINCIA_ESTACIONAL
-- =========================================
CREATE TABLE clima_provincia_estacional (
    id INT AUTO_INCREMENT PRIMARY KEY,

    estacion ENUM(
        'verano',
        'primavera',
        'otoño',
        'invierno'
    ) NOT NULL,

    tem_min DECIMAL(4,1) NOT NULL,

    tem_max DECIMAL(4,1) NOT NULL,

    precipitacion_media DECIMAL(6,2) NOT NULL,

    id_provincia INT NOT NULL,

    CONSTRAINT fk_clima_provincia
        FOREIGN KEY (id_provincia)
        REFERENCES provincia(id)
        ON DELETE CASCADE
);

-- =========================================
-- TABLA PATRIMONIO_CULTURAL
-- =========================================
CREATE TABLE patrimonio_cultural (
    id INT PRIMARY KEY,

    epoca VARCHAR(50) NOT NULL,

    anio VARCHAR(50) NOT NULL,

    CONSTRAINT fk_cultural_patrimonio
        FOREIGN KEY (id)
        REFERENCES patrimonio(id)
        ON DELETE CASCADE
);

-- =========================================
-- TABLA PATRIMONIO_NATURAL
-- =========================================
CREATE TABLE patrimonio_natural (
    id INT PRIMARY KEY,

    ecosistema VARCHAR(50) NOT NULL,

    extension DECIMAL(10,2) NOT NULL,

    CONSTRAINT fk_natural_patrimonio
        FOREIGN KEY (id)
        REFERENCES patrimonio(id)
        ON DELETE CASCADE
);