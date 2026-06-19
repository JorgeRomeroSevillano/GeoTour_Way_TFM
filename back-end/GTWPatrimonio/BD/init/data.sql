-- USE patrimonio_db;
SET NAMES utf8mb4;
-- =========================================
-- INSERT PROVINCIAS ESPAÑA
-- =========================================

INSERT INTO provincia (nombre, comunidad) VALUES
('A Coruña', 'Galicia'),
('Álava', 'País Vasco'),
('Albacete', 'Castilla-La Mancha'),
('Alicante', 'Comunidad Valenciana'),
('Almería', 'Andalucía'),
('Asturias', 'Principado de Asturias'),
('Ávila', 'Castilla y León'),
('Badajoz', 'Extremadura'),
('Barcelona', 'Cataluña'),
('Burgos', 'Castilla y León'),
('Cáceres', 'Extremadura'),
('Cádiz', 'Andalucía'),
('Cantabria', 'Cantabria'),
('Castellón', 'Comunidad Valenciana'),
('Ciudad Real', 'Castilla-La Mancha'),
('Córdoba', 'Andalucía'),
('Cuenca', 'Castilla-La Mancha'),
('Girona', 'Cataluña'),
('Granada', 'Andalucía'),
('Guadalajara', 'Castilla-La Mancha'),
('Guipúzcoa', 'País Vasco'),
('Huelva', 'Andalucía'),
('Huesca', 'Aragón'),
('Illes Balears', 'Islas Baleares'),
('Jaén', 'Andalucía'),
('La Rioja', 'La Rioja'),
('Las Palmas', 'Canarias'),
('León', 'Castilla y León'),
('Lleida', 'Cataluña'),
('Lugo', 'Galicia'),
('Madrid', 'Comunidad de Madrid'),
('Málaga', 'Andalucía'),
('Murcia', 'Región de Murcia'),
('Navarra', 'Navarra'),
('Ourense', 'Galicia'),
('Palencia', 'Castilla y León'),
('Pontevedra', 'Galicia'),
('Salamanca', 'Castilla y León'),
('Santa Cruz de Tenerife', 'Canarias'),
('Segovia', 'Castilla y León'),
('Sevilla', 'Andalucía'),
('Soria', 'Castilla y León'),
('Tarragona', 'Cataluña'),
('Teruel', 'Aragón'),
('Toledo', 'Castilla-La Mancha'),
('Valencia', 'Comunidad Valenciana'),
('Valladolid', 'Castilla y León'),
('Vizcaya', 'País Vasco'),
('Zamora', 'Castilla y León'),
('Zaragoza', 'Aragón'),
('Ceuta', 'Ciudad Autónoma de Ceuta'),
('Melilla', 'Ciudad Autónoma de Melilla');

INSERT INTO clima_provincia_estacional
(estacion, tem_min, tem_max, precipitacion_media, id_provincia)
VALUES
-- =========================
-- A Coruña (1)
-- =========================
('verano', 15.0, 25.0, 30.0, 1),
('primavera', 10.0, 18.0, 60.0, 1),
('otoño', 8.0, 17.0, 120.0, 1),
('invierno', 4.0, 12.0, 140.0, 1),

-- Álava (2)
('verano', 16.0, 30.0, 25.0, 2),
('primavera', 8.0, 18.0, 55.0, 2),
('otoño', 6.0, 16.0, 80.0, 2),
('invierno', 0.0, 10.0, 90.0, 2),

-- Albacete (3)
('verano', 20.0, 38.0, 15.0, 3),
('primavera', 10.0, 22.0, 35.0, 3),
('otoño', 8.0, 18.0, 50.0, 3),
('invierno', 0.0, 12.0, 45.0, 3),

-- Alicante (4)
('verano', 22.0, 35.0, 10.0, 4),
('primavera', 12.0, 22.0, 25.0, 4),
('otoño', 10.0, 20.0, 60.0, 4),
('invierno', 5.0, 16.0, 40.0, 4),

-- Almería (5)
('verano', 23.0, 36.0, 5.0, 5),
('primavera', 14.0, 24.0, 20.0, 5),
('otoño', 12.0, 22.0, 35.0, 5),
('invierno', 6.0, 17.0, 30.0, 5),

-- Asturias (6)
('verano', 16.0, 24.0, 60.0, 6),
('primavera', 10.0, 18.0, 90.0, 6),
('otoño', 8.0, 16.0, 140.0, 6),
('invierno', 3.0, 12.0, 160.0, 6),

-- Ávila (7)
('verano', 14.0, 28.0, 20.0, 7),
('primavera', 6.0, 16.0, 50.0, 7),
('otoño', 4.0, 14.0, 70.0, 7),
('invierno', -2.0, 8.0, 80.0, 7),

-- Badajoz (8)
('verano', 22.0, 40.0, 10.0, 8),
('primavera', 12.0, 24.0, 30.0, 8),
('otoño', 10.0, 20.0, 60.0, 8),
('invierno', 4.0, 15.0, 55.0, 8),

-- Barcelona (9)
('verano', 20.0, 30.0, 40.0, 9),
('primavera', 12.0, 20.0, 60.0, 9),
('otoño', 10.0, 18.0, 90.0, 9),
('invierno', 5.0, 14.0, 70.0, 9),

-- Burgos (10)
('verano', 14.0, 26.0, 25.0, 10),
('primavera', 6.0, 16.0, 55.0, 10),
('otoño', 4.0, 14.0, 80.0, 10),
('invierno', -3.0, 8.0, 95.0, 10),

-- Cáceres (11)
('verano', 21.0, 38.0, 12.0, 11),
('primavera', 12.0, 24.0, 35.0, 11),
('otoño', 10.0, 20.0, 65.0, 11),
('invierno', 3.0, 14.0, 60.0, 11),

-- Cádiz (12)
('verano', 22.0, 32.0, 8.0, 12),
('primavera', 14.0, 22.0, 30.0, 12),
('otoño', 12.0, 20.0, 70.0, 12),
('invierno', 8.0, 16.0, 90.0, 12),

-- Cantabria (13)
('verano', 17.0, 25.0, 70.0, 13),
('primavera', 10.0, 18.0, 100.0, 13),
('otoño', 8.0, 16.0, 150.0, 13),
('invierno', 4.0, 12.0, 170.0, 13),

-- Castellón (14)
('verano', 22.0, 34.0, 15.0, 14),
('primavera', 12.0, 22.0, 40.0, 14),
('otoño', 10.0, 20.0, 65.0, 14),
('invierno', 5.0, 15.0, 50.0, 14),

-- Ciudad Real (15)
('verano', 23.0, 39.0, 10.0, 15),
('primavera', 12.0, 24.0, 30.0, 15),
('otoño', 10.0, 20.0, 55.0, 15),
('invierno', 2.0, 12.0, 50.0, 15),

-- Córdoba (16)
('verano', 24.0, 41.0, 5.0, 16),
('primavera', 14.0, 26.0, 25.0, 16),
('otoño', 12.0, 22.0, 60.0, 16),
('invierno', 6.0, 16.0, 55.0, 16),

-- Cuenca (17)
('verano', 18.0, 34.0, 12.0, 17),
('primavera', 8.0, 20.0, 40.0, 17),
('otoño', 6.0, 16.0, 70.0, 17),
('invierno', -1.0, 10.0, 65.0, 17),

-- Girona (18)
('verano', 21.0, 32.0, 45.0, 18),
('primavera', 12.0, 20.0, 70.0, 18),
('otoño', 10.0, 18.0, 100.0, 18),
('invierno', 4.0, 13.0, 80.0, 18),

-- Granada (19)
('verano', 22.0, 36.0, 15.0, 19),
('primavera', 10.0, 22.0, 35.0, 19),
('otoño', 8.0, 18.0, 60.0, 19),
('invierno', 2.0, 12.0, 55.0, 19),

-- Guadalajara (20)
('verano', 20.0, 35.0, 20.0, 20),
('primavera', 8.0, 18.0, 45.0, 20),
('otoño', 6.0, 16.0, 70.0, 20),
('invierno', -2.0, 10.0, 75.0, 20),

-- Guipúzcoa (21)
('verano', 18.0, 26.0, 65.0, 21),
('primavera', 10.0, 18.0, 95.0, 21),
('otoño', 8.0, 16.0, 140.0, 21),
('invierno', 4.0, 12.0, 150.0, 21),

-- Huelva (22)
('verano', 23.0, 38.0, 8.0, 22),
('primavera', 14.0, 24.0, 25.0, 22),
('otoño', 12.0, 20.0, 65.0, 22),
('invierno', 6.0, 16.0, 60.0, 22),

-- Huesca (23)
('verano', 18.0, 30.0, 20.0, 23),
('primavera', 8.0, 18.0, 50.0, 23),
('otoño', 6.0, 16.0, 80.0, 23),
('invierno', -3.0, 8.0, 90.0, 23),

-- Illes Balears (24)
('verano', 24.0, 33.0, 10.0, 24),
('primavera', 14.0, 22.0, 30.0, 24),
('otoño', 12.0, 20.0, 60.0, 24),
('invierno', 8.0, 16.0, 45.0, 24),

-- Jaén (25)
('verano', 24.0, 40.0, 8.0, 25),
('primavera', 14.0, 26.0, 25.0, 25),
('otoño', 12.0, 22.0, 55.0, 25),
('invierno', 5.0, 15.0, 50.0, 25),

-- La Rioja (26)
('verano', 18.0, 32.0, 20.0, 26),
('primavera', 8.0, 18.0, 45.0, 26),
('otoño', 6.0, 16.0, 75.0, 26),
('invierno', 0.0, 10.0, 85.0, 26),

-- Las Palmas (27)
('verano', 24.0, 30.0, 2.0, 27),
('primavera', 20.0, 26.0, 5.0, 27),
('otoño', 22.0, 28.0, 10.0, 27),
('invierno', 18.0, 24.0, 15.0, 27),

-- León (28)
('verano', 16.0, 28.0, 25.0, 28),
('primavera', 8.0, 18.0, 55.0, 28),
('otoño', 6.0, 16.0, 80.0, 28),
('invierno', -2.0, 8.0, 90.0, 28),

-- Lleida (29)
('verano', 22.0, 36.0, 18.0, 29),
('primavera', 10.0, 20.0, 40.0, 29),
('otoño', 8.0, 18.0, 70.0, 29),
('invierno', 0.0, 10.0, 75.0, 29),

-- Lugo (30)
('verano', 16.0, 24.0, 80.0, 30),
('primavera', 10.0, 18.0, 110.0, 30),
('otoño', 8.0, 16.0, 150.0, 30),
('invierno', 3.0, 12.0, 160.0, 30),

-- Madrid (31)
('verano', 22.0, 38.0, 15.0, 31),
('primavera', 10.0, 22.0, 40.0, 31),
('otoño', 8.0, 18.0, 65.0, 31),
('invierno', 0.0, 10.0, 60.0, 31),

-- Málaga (32)
('verano', 25.0, 38.0, 5.0, 32),
('primavera', 15.0, 25.0, 20.0, 32),
('otoño', 12.0, 22.0, 50.0, 32),
('invierno', 8.0, 18.0, 45.0, 32),

-- Murcia (33)
('verano', 24.0, 40.0, 5.0, 33),
('primavera', 14.0, 26.0, 20.0, 33),
('otoño', 12.0, 22.0, 50.0, 33),
('invierno', 6.0, 16.0, 40.0, 33),

-- Navarra (34)
('verano', 18.0, 30.0, 25.0, 34),
('primavera', 8.0, 18.0, 60.0, 34),
('otoño', 6.0, 16.0, 90.0, 34),
('invierno', 0.0, 10.0, 95.0, 34),

-- Ourense (35)
('verano', 18.0, 28.0, 60.0, 35),
('primavera', 10.0, 18.0, 90.0, 35),
('otoño', 8.0, 16.0, 140.0, 35),
('invierno', 3.0, 12.0, 150.0, 35),

-- Palencia (36)
('verano', 16.0, 28.0, 25.0, 36),
('primavera', 6.0, 16.0, 55.0, 36),
('otoño', 4.0, 14.0, 85.0, 36),
('invierno', -3.0, 8.0, 95.0, 36),

-- Pontevedra (37)
('verano', 18.0, 26.0, 70.0, 37),
('primavera', 10.0, 18.0, 100.0, 37),
('otoño', 8.0, 16.0, 150.0, 37),
('invierno', 4.0, 12.0, 160.0, 37),

-- Salamanca (38)
('verano', 18.0, 32.0, 20.0, 38),
('primavera', 8.0, 18.0, 50.0, 38),
('otoño', 6.0, 16.0, 80.0, 38),
('invierno', -2.0, 8.0, 85.0, 38),

-- Santa Cruz de Tenerife (39)
('verano', 25.0, 30.0, 2.0, 39),
('primavera', 20.0, 26.0, 5.0, 39),
('otoño', 22.0, 28.0, 10.0, 39),
('invierno', 18.0, 24.0, 15.0, 39),

-- Segovia (40)
('verano', 18.0, 32.0, 20.0, 40),
('primavera', 8.0, 18.0, 50.0, 40),
('otoño', 6.0, 16.0, 75.0, 40),
('invierno', -4.0, 8.0, 85.0, 40),

-- Sevilla (41)
('verano', 26.0, 42.0, 5.0, 41),
('primavera', 15.0, 26.0, 25.0, 41),
('otoño', 12.0, 22.0, 60.0, 41),
('invierno', 6.0, 16.0, 55.0, 41),

-- Soria (42)
('verano', 16.0, 30.0, 20.0, 42),
('primavera', 6.0, 16.0, 50.0, 42),
('otoño', 4.0, 14.0, 80.0, 42),
('invierno', -5.0, 6.0, 90.0, 42),

-- Tarragona (43)
('verano', 22.0, 32.0, 35.0, 43),
('primavera', 12.0, 20.0, 60.0, 43),
('otoño', 10.0, 18.0, 85.0, 43),
('invierno', 5.0, 14.0, 70.0, 43),

-- Teruel (44)
('verano', 18.0, 32.0, 18.0, 44),
('primavera', 6.0, 16.0, 45.0, 44),
('otoño', 4.0, 14.0, 70.0, 44),
('invierno', -4.0, 8.0, 80.0, 44),

-- Toledo (45)
('verano', 23.0, 39.0, 12.0, 45),
('primavera', 12.0, 24.0, 35.0, 45),
('otoño', 10.0, 20.0, 60.0, 45),
('invierno', 2.0, 12.0, 55.0, 45),

-- Valencia (46)
('verano', 24.0, 34.0, 10.0, 46),
('primavera', 14.0, 24.0, 30.0, 46),
('otoño', 12.0, 20.0, 65.0, 46),
('invierno', 6.0, 16.0, 50.0, 46),

-- Valladolid (47)
('verano', 18.0, 32.0, 20.0, 47),
('primavera', 8.0, 18.0, 50.0, 47),
('otoño', 6.0, 16.0, 80.0, 47),
('invierno', -2.0, 8.0, 85.0, 47),

-- Vizcaya (48)
('verano', 18.0, 26.0, 70.0, 48),
('primavera', 10.0, 18.0, 100.0, 48),
('otoño', 8.0, 16.0, 140.0, 48),
('invierno', 4.0, 12.0, 150.0, 48),

-- Zamora (49)
('verano', 18.0, 32.0, 20.0, 49),
('primavera', 8.0, 18.0, 55.0, 49),
('otoño', 6.0, 16.0, 85.0, 49),
('invierno', -3.0, 8.0, 90.0, 49),

-- Zaragoza (50)
('verano', 24.0, 40.0, 10.0, 50),
('primavera', 12.0, 24.0, 30.0, 50),
('otoño', 10.0, 20.0, 60.0, 50),
('invierno', 2.0, 12.0, 55.0, 50),

-- Ceuta (51)
('verano', 24.0, 32.0, 8.0, 51),
('primavera', 16.0, 24.0, 25.0, 51),
('otoño', 14.0, 22.0, 60.0, 51),
('invierno', 10.0, 18.0, 70.0, 51),

-- Melilla (52)
('verano', 24.0, 32.0, 8.0, 52),
('primavera', 16.0, 24.0, 25.0, 52),
('otoño', 14.0, 22.0, 60.0, 52),
('invierno', 10.0, 18.0, 70.0, 52);


INSERT INTO gastronomia (nombre, url_imagen, descripcion, id_provincia)
VALUES

-- =========================
-- 1. A Coruña
-- =========================
('Pulpo a la gallega','https://images.pexels.com/photos/36393691/pexels-photo-36393691.jpeg',
'El pulpo a la gallega es uno de los platos más representativos de la gastronomía de Galicia. Se prepara cociendo el pulpo en agua hasta conseguir una textura tierna pero firme, tras lo cual se corta en rodajas y se sirve sobre una base de patata cocida, aliñado con aceite de oliva virgen extra, sal gruesa y pimentón dulce o picante al gusto.',1),

('Empanada gallega','https://images.pexels.com/photos/37327430/pexels-photo-37327430.jpeg',
'La empanada gallega es una preparación tradicional que consiste en una masa de pan horneada rellena de ingredientes variados como atún, carne, pollo o marisco. Su origen está ligado a la cocina rural gallega, ya que permitía conservar y transportar alimentos durante jornadas largas de trabajo.',1),

('Lacón con grelos','https://upload.wikimedia.org/wikipedia/commons/1/16/Cocido_galego._Galicia_%28Spain%29.jpg',
'El lacón con grelos es un plato típico del invierno gallego que combina lacón de cerdo salado, grelos, patatas y chorizo. Es un guiso contundente que forma parte de las celebraciones tradicionales y refleja la cocina de aprovechamiento gallega.',1),

('Tarta de Santiago','https://upload.wikimedia.org/wikipedia/commons/thumb/c/ce/Tarta_de_Santiago-2009.jpg/1280px-Tarta_de_Santiago-2009.jpg',
'La tarta de Santiago es un postre tradicional elaborado principalmente con almendra molida, azúcar y huevo. Su origen se remonta a la Edad Media y está profundamente ligado al Camino de Santiago, donde se convirtió en un símbolo gastronómico de la región.',1),

-- =========================
-- 2. Álava
-- =========================
('Pintxos vascos','https://images.pexels.com/photos/21327989/pexels-photo-21327989.jpeg',
'Los pintxos son pequeñas elaboraciones culinarias típicas del País Vasco que se sirven en bares como acompañamiento de bebidas. Suelen combinar ingredientes sofisticados en pequeñas porciones, destacando por su creatividad y variedad gastronómica.',2),

('Bacalao al pil pil','https://images.pexels.com/photos/31372391/pexels-photo-31372391.jpeg',
'El bacalao al pil pil es un plato tradicional vasco elaborado con bacalao, aceite de oliva y ajo. Su característica principal es la emulsión natural de la gelatina del pescado con el aceite, creando una salsa espesa y brillante.',2),

('Txakoli','https://images.pexels.com/photos/28454104/pexels-photo-28454104.jpeg',
'El txakoli es un vino blanco ligeramente espumoso y de alta acidez, producido principalmente en el País Vasco. Se caracteriza por su frescura y su consumo habitual como acompañamiento de pescados y mariscos.',2),

('Perretxikos','https://upload.wikimedia.org/wikipedia/commons/thumb/1/16/Revuelto_de_perretxikos.jpg/1280px-Revuelto_de_perretxikos.jpg',
'Los perretxikos son setas silvestres muy apreciadas en la cocina vasca por su delicado sabor. Su recolección se realiza en primavera y son considerados un ingrediente de alta gastronomía.',2),

-- =========================
-- 3. Albacete
-- =========================
('Gazpacho manchego','https://upload.wikimedia.org/wikipedia/commons/1/12/Gazpachos_Manchegos_Requena%27s_Style.JPG',
'El gazpacho manchego es un guiso tradicional de Castilla-La Mancha elaborado con carne de caza como conejo o liebre y trozos de torta de pan ácimo desmenuzada. Es un plato contundente muy ligado a la tradición rural.',3),

('Atascaburras','https://upload.wikimedia.org/wikipedia/commons/f/fe/Atascaburras.jpg',
'El atascaburras es una receta tradicional elaborada con patata cocida, bacalao desmigado, ajo y aceite de oliva. Es un plato de invierno muy energético que se servía antiguamente en épocas de frío intenso.',3),

('Migas manchegas','https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Migas.PNG/500px-Migas.PNG',
'Las migas manchegas son un plato tradicional elaborado a base de pan duro desmenuzado y frito con ajo, chorizo y panceta. Es una receta de origen pastoril muy extendida en la zona central de España.',3),

('Queso manchego','https://upload.wikimedia.org/wikipedia/commons/5/59/Manchego.jpg',
'El queso manchego es uno de los productos más conocidos de España, elaborado con leche de oveja manchega. Su curación varía desde semicurado hasta viejo, destacando por su sabor intenso y textura firme.',3),

-- =========================
-- 4. Alicante
-- =========================
('Arroz a banda','https://images.pexels.com/photos/9295693/pexels-photo-9295693.jpeg',
'El arroz a banda es un plato tradicional de la Comunidad Valenciana cocinado con caldo de pescado y marisco. Su origen está ligado a los pescadores, quienes lo elaboraban con el arroz y el caldo sobrante de las capturas.',4),

('Fideuá','https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Fideua_-_xurde.jpg/1280px-Fideua_-_xurde.jpg',
'La fideuá es un plato similar a la paella, pero elaborado con fideos en lugar de arroz. Se cocina habitualmente con mariscos y pescado, y es uno de los platos más representativos de la costa alicantina.',4),

('Turrón de Jijona','https://upload.wikimedia.org/wikipedia/commons/thumb/5/5a/Turr%C3%B3n_de_Jijona_%28Mallorquina%29.jpg/1280px-Turr%C3%B3n_de_Jijona_%28Mallorquina%29.jpg',
'El turrón de Jijona es un dulce tradicional navideño elaborado con almendra molida y miel. Su textura blanda y su intenso sabor lo convierten en uno de los productos más emblemáticos de la repostería española.',4),

('Olleta alicantina','https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/Olla_gitana.jpg/1280px-Olla_gitana.jpg',
'La olleta alicantina es un guiso tradicional de legumbres, arroz, carne y verduras. Es un plato nutritivo y energético muy típico de las zonas de interior de la provincia.',4),

-- =========================
-- 5. Almería
-- =========================
('Gurullos con conejo','https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/Gurullos_02.jpg/1280px-Gurullos_02.jpg',
'Los gurullos con conejo son un plato tradicional elaborado con una pasta casera de harina y agua cocinada junto con carne de conejo, pimiento y especias. Es una receta de origen rural muy arraigada en Almería.',5),

('Ajo colorao','https://images.pexels.com/photos/17764154/pexels-photo-17764154.jpeg',
'El ajo colorao es un guiso típico elaborado con patata, bacalao y pimentón, que le aporta su característico color rojizo. Es un plato sencillo pero muy sabroso de la cocina almeriense.',5),

('Migas almerienses','https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/Migas_de_Almer%C3%ADa_-7.jpg/1920px-Migas_de_Almer%C3%ADa_-7.jpg',
'Las migas almerienses son una variante local del plato tradicional de migas, elaboradas con harina o pan y acompañadas de pescado, carne o verduras según la temporada.',5),

('Ensalada de naranja','https://images.pexels.com/photos/36257889/pexels-photo-36257889.jpeg',
'La ensalada de naranja es una preparación tradicional que combina naranja, bacalao desmigado, aceitunas y aceite de oliva. Es un plato fresco que mezcla sabores dulces y salados.',5),

-- =========================
-- 6. Asturias
-- =========================
('Fabada asturiana','https://upload.wikimedia.org/wikipedia/commons/thumb/7/77/Fabada_en_cazuela_de_barro.jpg/1280px-Fabada_en_cazuela_de_barro.jpg',
'La fabada asturiana es uno de los platos más conocidos de la gastronomía española. Se elabora con fabes asturianas de gran tamaño acompañadas de compango, compuesto habitualmente por chorizo, morcilla y panceta. Es un plato contundente y tradicional muy consumido durante los meses fríos.',6),

('Cachopo','https://images.pexels.com/photos/18275671/pexels-photo-18275671.jpeg',
'El cachopo consiste en dos grandes filetes de ternera rellenos de jamón y queso, empanados y fritos hasta obtener una textura crujiente por fuera y jugosa por dentro. En Asturias se ha convertido en uno de los platos más populares y representativos.',6),

('Arroz con leche asturiano','https://upload.wikimedia.org/wikipedia/commons/b/ba/Arroz_con_leche.png',
'El arroz con leche asturiano es un postre tradicional elaborado con arroz cocido lentamente en leche, azúcar y canela. Destaca por su textura cremosa y por la capa de azúcar caramelizado que suele añadirse en la superficie.',6),

('Sidra asturiana','https://upload.wikimedia.org/wikipedia/commons/thumb/0/03/Botellas_Sidra_de_Asturias_DOP.jpg/1280px-Botellas_Sidra_de_Asturias_DOP.jpg',
'La sidra asturiana es una bebida fermentada elaborada a partir de manzana. Forma parte de la cultura tradicional de Asturias y se sirve mediante el característico escanciado para potenciar su aroma y sabor.',6),

-- =========================
-- 7. Ávila
-- =========================
('Chuletón de Ávila','https://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/Chulet%C3%B3n_de_Sotosalbos_%28Segovia%29_-_untipografico.jpg/1280px-Chulet%C3%B3n_de_Sotosalbos_%28Segovia%29_-_untipografico.jpg',
'El chuletón de Ávila es una pieza de carne de ternera de gran tamaño y excelente calidad, elaborada normalmente a la parrilla o brasa. Su fama se debe a la textura tierna de la carne y al intenso sabor característico del ganado de la región.',7),

('Judiones de La Granja','https://upload.wikimedia.org/wikipedia/commons/thumb/4/42/Judiones_de_la_Granja_098.jpg/1280px-Judiones_de_la_Granja_098.jpg',
'Los judiones de La Granja son unas alubias de gran tamaño cocinadas lentamente junto con chorizo, morcilla y otras carnes. Es un plato tradicional castellano muy apreciado por su sabor y valor energético.',7),

('Yemas de Santa Teresa','https://upload.wikimedia.org/wikipedia/commons/2/2a/Yemasabulenses.jpeg',
'Las yemas de Santa Teresa son pequeños dulces elaborados principalmente con yema de huevo y azúcar. Se caracterizan por su textura suave y su sabor intenso, siendo uno de los productos más conocidos de Ávila.',7),

('Sopa castellana','https://upload.wikimedia.org/wikipedia/commons/thumb/0/00/Sopa_Castellana.jpg/1280px-Sopa_Castellana.jpg',
'La sopa castellana es una receta humilde elaborada con pan, ajo, pimentón y huevo. Tradicionalmente se preparaba como una comida caliente y económica durante los meses de invierno.',7),

-- =========================
-- 8. Badajoz
-- =========================
('Migas extremeñas','https://upload.wikimedia.org/wikipedia/commons/thumb/1/1c/Migas_ruleras.JPG/1280px-Migas_ruleras.JPG',
'Las migas extremeñas son una receta tradicional elaborada con pan duro desmenuzado y cocinado con ajo, panceta, chorizo y pimientos. Su origen está ligado a la cocina pastoril y de aprovechamiento.',8),

('Jamón ibérico de bellota','https://images.pexels.com/photos/37328675/pexels-photo-37328675.jpeg',
'El jamón ibérico de bellota es uno de los productos más prestigiosos de la gastronomía extremeña. Se obtiene de cerdos ibéricos criados en dehesas y alimentados con bellotas durante la montanera, lo que aporta una grasa infiltrada y un sabor intenso muy característico.',8),

('Cordero asado','https://images.pexels.com/photos/29908554/pexels-photo-29908554.jpeg',
'El cordero asado extremeño se cocina lentamente al horno hasta conseguir una carne muy tierna y jugosa. Es un plato habitual en celebraciones familiares y festividades tradicionales.',8),

('Técula mécula','https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/T%C3%A9cula_M%C3%A9cula_%284213483210%29.jpg/1280px-T%C3%A9cula_M%C3%A9cula_%284213483210%29.jpg',
'La técula mécula es un postre tradicional extremeño elaborado con almendra, yema de huevo y azúcar. Su textura suave y su intenso sabor dulce la convierten en un dulce muy apreciado.',8),

-- =========================
-- 9. Barcelona
-- =========================
('Escudella i carn d’olla','https://upload.wikimedia.org/wikipedia/commons/thumb/5/52/Escudella_catalana_plato_de_cuchara_con_carne%2C_verduras_y_pasta.jpg/1280px-Escudella_catalana_plato_de_cuchara_con_carne%2C_verduras_y_pasta.jpg',
'La escudella i carn d’olla es el cocido tradicional catalán, preparado con carne, verduras, legumbres y pasta. Es uno de los platos más antiguos de Cataluña y suele consumirse especialmente en invierno.',9),

('Pa amb tomàquet','https://upload.wikimedia.org/wikipedia/commons/f/f1/Pan_con_Tumaca.jpg',
'El pa amb tomàquet consiste en pan tostado untado con tomate maduro, aceite de oliva y sal. Aunque es una preparación sencilla, constituye uno de los símbolos más representativos de la gastronomía catalana.',9),

('Crema catalana','https://upload.wikimedia.org/wikipedia/commons/thumb/4/49/Food_in_Catalonia_06.jpg/1280px-Food_in_Catalonia_06.jpg',
'La crema catalana es un postre elaborado con leche, yema de huevo y azúcar, cubierto con una fina capa caramelizada. Su textura cremosa y su sabor suave la convierten en uno de los dulces más populares de Cataluña.',9),

('Calçots con salsa romesco','https://upload.wikimedia.org/wikipedia/commons/7/72/Cal%C3%A7ots_i_romesco.jpg',
'Los calçots son cebollas tiernas asadas a la brasa que se acompañan con salsa romesco elaborada con tomate, frutos secos y aceite de oliva. Son protagonistas de las tradicionales calçotadas catalanas.',9),

-- =========================
-- 10. Burgos
-- =========================
('Morcilla de Burgos','https://upload.wikimedia.org/wikipedia/commons/thumb/6/67/Morcilla_de_Burgos_-_2009.jpg/1280px-Morcilla_de_Burgos_-_2009.jpg',
'La morcilla de Burgos es un embutido elaborado con sangre de cerdo, arroz, cebolla y especias. Se puede consumir frita, asada o como ingrediente de numerosos platos tradicionales castellanos.',10),

('Olla podrida','https://upload.wikimedia.org/wikipedia/commons/7/78/Olla_podrida_Covarrubias_-_Santaorosia_Photographic_Colectivity.jpg',
'La olla podrida es un contundente guiso castellano elaborado con alubias rojas y diferentes carnes de cerdo. Su larga cocción permite obtener un caldo muy sabroso y consistente.',10),

('Queso pata de mulo','https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/Queso_pata_de_mulo_05.jpg/1280px-Queso_pata_de_mulo_05.jpg',
'El queso pata de mulo es un producto artesanal de sabor intenso y textura firme, muy apreciado en la región.',10),

('Queso de Burgos','https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Queso_De_Burgos_002.JPG/1280px-Queso_De_Burgos_002.JPG',
'El queso de Burgos es un queso fresco de sabor suave y textura húmeda, elaborado tradicionalmente con leche de oveja o vaca. Se consume tanto solo como acompañado de miel o membrillo.',10),

-- =========================
-- 11. Cáceres
-- =========================
('Torta del Casar','https://upload.wikimedia.org/wikipedia/commons/f/f9/Torta_del_Casar.jpg',
'La torta del Casar es un queso cremoso elaborado con leche de oveja y cuajo vegetal. Se caracteriza por su interior fundente y por su intenso sabor, siendo uno de los productos más reconocidos de Extremadura.',11),

('Migas cacereñas','https://upload.wikimedia.org/wikipedia/commons/thumb/d/d8/Migas%2C_un_plato_t%C3%ADpico_de_la_cocina_espa%C3%B1ola.jpg/500px-Migas%2C_un_plato_t%C3%ADpico_de_la_cocina_espa%C3%B1ola.jpg',
'Las migas cacereñas son una receta tradicional elaborada con pan duro desmenuzado y cocinado con ajo, panceta, chorizo y pimientos. Este plato surgió como una forma de aprovechar el pan sobrante en las zonas rurales.',11),

('Caldereta de cordero','https://images.pexels.com/photos/17872669/pexels-photo-17872669.jpeg',
'La caldereta de cordero es un guiso típico elaborado con carne de cordero cocinada lentamente junto con ajo, cebolla, vino y especias. Tradicionalmente se preparaba por los pastores durante las jornadas de trabajo.',11),

('Gazpacho extremeño','https://upload.wikimedia.org/wikipedia/commons/d/d5/Gazpacho_extreme%C3%B1o.jpg',
'El gazpacho extremeño es una sopa fría elaborada con tomate, ajo, aceite de oliva y verduras frescas. Resulta especialmente refrescante durante los meses de verano.',11),

-- =========================
-- 12. Cádiz
-- =========================
('Pescaíto frito','https://upload.wikimedia.org/wikipedia/commons/thumb/2/29/Frito_gaditano-_2009.jpg/1280px-Frito_gaditano-_2009.jpg',
'El pescaíto frito es uno de los platos más representativos de la costa gaditana. Consiste en pequeños pescados frescos rebozados ligeramente en harina y fritos en aceite de oliva hasta quedar crujientes.',12),

('Tortillitas de camarones','https://upload.wikimedia.org/wikipedia/commons/thumb/d/dc/Tortilla_de_Camarones.jpg/1280px-Tortilla_de_Camarones.jpg',
'Las tortillitas de camarones son finas frituras elaboradas con harina, agua, cebolla y pequeños camarones. Son típicas de la bahía de Cádiz y destacan por su textura crujiente.',12),

('Atún rojo de almadraba','https://images.pexels.com/photos/28594265/pexels-photo-28594265.jpeg',
'El atún rojo de almadraba es uno de los productos más valorados de Cádiz. Su captura tradicional mediante almadraba y la calidad de su carne lo convierten en un auténtico referente gastronómico.',12),

('Bienmesabe gaditano','https://images.pexels.com/photos/9808344/pexels-photo-9808344.jpeg',
'El bienmesabe es una preparación de cazón marinado en especias y vinagre antes de ser rebozado y frito. Es uno de los sabores más típicos de la cocina marinera gaditana.',12),

-- =========================
-- 13. Cantabria
-- =========================
('Cocido montañés','https://upload.wikimedia.org/wikipedia/commons/thumb/f/f7/Highlander_stew.jpg/960px-Highlander_stew.jpg',
'El cocido montañés es un plato tradicional cántabro elaborado con alubias blancas, berza y compango de cerdo. Es una receta contundente muy consumida durante el invierno.',13),

('Rabas','https://images.pexels.com/photos/16888843/pexels-photo-16888843.jpeg',
'Las rabas son tiras de calamar rebozadas y fritas, muy populares como aperitivo en Cantabria. Se suelen acompañar con limón y consumir recién hechas.',13),

('Quesada pasiega','https://upload.wikimedia.org/wikipedia/commons/thumb/3/37/Reinosa_009_Quesadas.jpg/960px-Reinosa_009_Quesadas.jpg',
'La quesada pasiega es un postre tradicional elaborado con leche cuajada, mantequilla, azúcar y harina. Destaca por su textura suave y su sabor ligeramente dulce.',13),

('Sobaos pasiegos','https://upload.wikimedia.org/wikipedia/commons/thumb/d/d0/Sobaos-Pasteleria-2009.jpg/960px-Sobaos-Pasteleria-2009.jpg',
'Los sobaos pasiegos son bizcochos elaborados con mantequilla, harina, azúcar y huevo. Son uno de los productos de repostería más conocidos de Cantabria.',13),

-- =========================
-- 14. Castellón
-- =========================
('Tombet de bou','https://upload.wikimedia.org/wikipedia/commons/a/a6/Tombet6116.JPG',
'El tombet de bou es un plato tradicional de Castellón elaborado con carne de toro guisada lentamente junto a verduras y especias, muy típico en celebraciones y fiestas populares.',14),

('Olla de la Plana','https://upload.wikimedia.org/wikipedia/commons/thumb/8/8c/Plato_de_olleta_de_la_Plana.jpg/1920px-Plato_de_olleta_de_la_Plana.jpg',
'La olla de la Plana es un guiso tradicional de verduras, legumbres y carne típico de Castellón. Es una receta muy ligada a la cocina casera mediterránea.',14),

('Fideuá castellonense','https://upload.wikimedia.org/wikipedia/commons/thumb/8/8e/Fideu%C3%A0_rossej%C3%A0_de_les_Cases_d%27Alcanar_%28Tarragona%29.jpg/1280px-Fideu%C3%A0_rossej%C3%A0_de_les_Cases_d%27Alcanar_%28Tarragona%29.jpg',
'La fideuá castellonense se elabora con fideos finos cocinados en caldo de pescado junto con marisco y pescado fresco.',14),

('Pastissets de boniato','https://upload.wikimedia.org/wikipedia/commons/thumb/6/64/Pastissets_de_moniato.JPG/1280px-Pastissets_de_moniato.JPG',
'Los pastissets de boniato son pequeños dulces rellenos de boniato dulce y aromatizados con anís o canela.',14),

-- =========================
-- 15. Ciudad Real
-- =========================
('Pisto manchego','https://upload.wikimedia.org/wikipedia/commons/thumb/9/93/Pisto.jpg/1280px-Pisto.jpg',
'El pisto manchego es un plato elaborado con tomate, pimiento, calabacín y cebolla cocinados lentamente en aceite de oliva. Se suele acompañar con huevo frito.',15),

('Gachas manchegas','https://upload.wikimedia.org/wikipedia/commons/5/58/Gachas_Manchegas.jpg',
'Las gachas manchegas son una receta tradicional elaborada con harina de almorta, ajo, aceite y pimentón. Era un plato muy consumido por agricultores y pastores.',15),

('Duelos y quebrantos','https://upload.wikimedia.org/wikipedia/commons/1/10/Duelos_y_quebrantos._Chef_Koketo.jpg',
'Los duelos y quebrantos son un plato típico manchego elaborado con huevos revueltos, chorizo y tocino. Su fama se debe en parte a las referencias literarias en Don Quijote.',15),

('Berenjenas de Almagro','https://upload.wikimedia.org/wikipedia/commons/thumb/8/87/Berenjenas-Almagro_%28Pimiento%29.jpg/1280px-Berenjenas-Almagro_%28Pimiento%29.jpg',
'Las berenjenas de Almagro son pequeñas berenjenas encurtidas con especias y vinagre. Constituyen uno de los productos gastronómicos más característicos de Ciudad Real.',15),

-- =========================
-- 16. Córdoba
-- =========================
('Salmorejo cordobés','https://upload.wikimedia.org/wikipedia/commons/e/eb/Salmorejo_cordobes.jpg',
'El salmorejo cordobés es una crema fría elaborada a base de tomate, pan, aceite de oliva, ajo y sal. Su textura es más espesa que el gazpacho y se suele servir acompañado de huevo duro y jamón serrano, siendo uno de los platos más representativos de Andalucía.',16),

('Flamenquín cordobés','https://upload.wikimedia.org/wikipedia/commons/0/08/FLAMNEQUINCALIFALLC.jpg',
'El flamenquín es un plato típico de Córdoba que consiste en tiras de jamón serrano envueltas en filetes de carne, empanadas y fritas hasta conseguir un exterior crujiente y un interior jugoso.',16),

('Rabo de toro','https://upload.wikimedia.org/wikipedia/commons/thumb/4/48/Rabo_de_toro-Estofado_%2801%29.JPG/1280px-Rabo_de_toro-Estofado_%2801%29.JPG',
'El rabo de toro es un guiso tradicional cocinado lentamente con vino, verduras y especias hasta obtener una carne muy tierna y una salsa espesa y sabrosa.',16),

('Ajoblanco','https://upload.wikimedia.org/wikipedia/commons/thumb/d/db/Ajo_blanco.jpg/1280px-Ajo_blanco.jpg',
'El ajoblanco es una sopa fría elaborada con almendras, pan, ajo, aceite de oliva y vinagre. Es uno de los platos más antiguos de la gastronomía andaluza.',16),

-- =========================
-- 17. Cuenca
-- =========================
('Morteruelo','https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/Morteruelo%2C_Cuenca.jpg/1280px-Morteruelo%2C_Cuenca.jpg',
'El morteruelo es una pasta caliente elaborada con carne de caza como liebre, conejo o perdiz, junto con hígado y especias. Es un plato muy energético de origen medieval.',17),

('Zarajos','https://upload.wikimedia.org/wikipedia/commons/thumb/9/93/Casa_Amadeo-2009%28Caracoles%29.jpg/1280px-Casa_Amadeo-2009%28Caracoles%29.jpg',
'Los zarajos son tripas de cordero enrolladas en una rama de vid y asadas a la parrilla, muy típicas de la cocina conquense.',17),

('Ajoarriero','https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Ajoarriero.jpg/1280px-Ajoarriero.jpg',
'El ajoarriero es un plato elaborado con bacalao desmigado, patata cocida, ajo y aceite de oliva, con una textura cremosa.',17),

('Alajú','https://images.pexels.com/photos/17553044/pexels-photo-17553044.jpeg',
'El alajú o alfajor es un dulce tradicional elaborado con miel, nueces y pan rallado, de origen árabe y muy típico de Cuenca.',17),

-- =========================
-- 18. Girona
-- =========================
('Suquet de peix','https://upload.wikimedia.org/wikipedia/commons/b/bd/Suquet_de_peix.jpg',
'El suquet de peix es un guiso marinero catalán elaborado con pescado fresco, patatas y un sofrito de ajo y tomate. Es un plato típico de la costa de Girona.',18),

('Butifarra con mongetes','https://upload.wikimedia.org/wikipedia/commons/thumb/3/39/Butifarra_amb_seques-Camp_Portel.jpg/1280px-Butifarra_amb_seques-Camp_Portel.jpg',
'La butifarra con mongetes es un plato tradicional catalán que combina embutido a la parrilla con judías blancas salteadas.',18),

('Xuixo de Girona','https://upload.wikimedia.org/wikipedia/commons/thumb/0/07/Xuixo.jpg/1280px-Xuixo.jpg',
'El xuixo de Girona es un dulce típico relleno de crema pastelera, frito y recubierto de azúcar. Es uno de los productos más emblemáticos y famosos de la gastronomía de Girona.',18),

('Anchoas de L’Escala','https://images.pexels.com/photos/5595430/pexels-photo-5595430.jpeg',
'Las anchoas de L’Escala son un producto típico de Girona elaborado mediante técnicas tradicionales de salazón.',18),

-- =========================
-- 19. Granada
-- =========================
('Tortilla del Sacromonte','https://upload.wikimedia.org/wikipedia/commons/6/69/Tortilla_de_chorizo_-_demi_%282%29.jpg',
'La tortilla del Sacromonte es una receta tradicional granadina elaborada con sesos o chorizo, criadillas y huevo, de origen histórico y muy ligada al barrio del Sacromonte.',19),

('Piononos de Santa Fe','https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Piononos_de_Santa_F%C3%A9-Madrid.jpg/1280px-Piononos_de_Santa_F%C3%A9-Madrid.jpg',
'Los piononos son pequeños pasteles elaborados con bizcocho enrollado, crema y azúcar tostado en la parte superior.',19),

('Remojón granadino','https://upload.wikimedia.org/wikipedia/commons/thumb/5/5d/Remoj%C3%B3n01.jpg/1280px-Remoj%C3%B3n01.jpg',
'El remojón granadino es una ensalada elaborada con naranja, bacalao, huevo y aceitunas.',19),

('Olla de San Antón','https://upload.wikimedia.org/wikipedia/commons/8/88/Olla_de_San_Ant%C3%B3n.jpg',
'La olla de San Antón es un guiso tradicional de invierno con habas, arroz y carnes de cerdo.',19),

-- =========================
-- 20. Guadalajara
-- =========================
('Cabrito asado','https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Pierna_de_cabrito.jpeg/1920px-Pierna_de_cabrito.jpeg',
'El cabrito asado es un plato tradicional cocinado lentamente en horno hasta obtener una carne tierna y jugosa.',20),

('Migas alcarreñas','https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/Migas_-_Con_uvas_y_chistorra.JPG/1280px-Migas_-_Con_uvas_y_chistorra.JPG',
'Las migas alcarreñas son una variante local elaborada con pan, ajo, chorizo y panceta, que puede acompañarse con uvas.',20),

('Sopa de ajo','https://upload.wikimedia.org/wikipedia/commons/thumb/c/ca/Sopa_de_Ajo_2.jpg/1280px-Sopa_de_Ajo_2.jpg',
'La sopa de ajo es un plato humilde elaborado con pan, ajo, pimentón y huevo.',20),

('Bizcochos borrachos','https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/Borrachos-Alca%C3%B1ices-2011.JPG/1280px-Borrachos-Alca%C3%B1ices-2011.JPG',
'Los bizcochos borrachos son dulces empapados en almíbar o licor, típicos de Guadalajara.',20),

-- =========================
-- 21. Guipúzcoa
-- =========================
('Txuleta a la brasa','https://images.pexels.com/photos/34305983/pexels-photo-34305983.jpeg',
'La txuleta a la brasa es uno de los platos más emblemáticos de la cocina vasca. Se elabora con carne de vacuno de alta calidad cocinada a la parrilla con fuego vivo, lo que potencia su sabor natural y su textura jugosa.',21),

('Merluza a la koskera','https://upload.wikimedia.org/wikipedia/commons/thumb/5/57/Merluza_en_salsa_verde_1.jpg/1280px-Merluza_en_salsa_verde_1.jpg',
'La merluza a la koskera es un plato tradicional elaborado con merluza, espárragos, guisantes y salsa verde a base de ajo, perejil y caldo de pescado.',21),

('Piperrada','https://upload.wikimedia.org/wikipedia/commons/2/23/Pip%C3%A9rade.jpg',
'La piperrada es un sofrito típico del País Vasco elaborado con pimientos, tomate, cebolla y ajo, que se utiliza como acompañamiento de carnes y pescados.',21),

('Goxua','https://upload.wikimedia.org/wikipedia/commons/thumb/8/8e/Goxua.jpg/1280px-Goxua.jpg',
'El goxua es un postre vasco compuesto por nata, bizcocho, crema pastelera y azúcar caramelizado en la superficie.',21),

-- =========================
-- 22. Huelva
-- =========================
('Gambas blancas de Huelva','https://upload.wikimedia.org/wikipedia/commons/thumb/5/5a/Gamba_blanca_01.JPG/1280px-Gamba_blanca_01.JPG',
'Las gambas blancas de Huelva son uno de los mariscos más valorados de España. Se caracterizan por su sabor intenso y su textura delicada, consumiéndose cocidas o a la plancha.',22),

('Jamón de Jabugo','https://upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Jabugo_plato_con_jam%C3%B3n_de_Jabugo.JPG/1280px-Jabugo_plato_con_jam%C3%B3n_de_Jabugo.JPG',
'El jamón de Jabugo es un producto ibérico de alta calidad elaborado a partir de cerdos criados en la dehesa y curados de forma tradicional.',22),

('Coquinas al ajillo','https://images.pexels.com/photos/18255860/pexels-photo-18255860.jpeg',
'Las coquinas al ajillo son un plato marinero típico de la costa de Huelva, elaborado con pequeñas almejas salteadas con ajo, aceite y perejil.',22),

('Mojama de atún','https://upload.wikimedia.org/wikipedia/commons/thumb/1/13/Mojama_de_atun.JPG/1280px-Mojama_de_atun.JPG',
'La mojama es un producto elaborado con lomos de atún salados y secados al aire, muy típico del litoral andaluz.',22),

-- =========================
-- 23. Huesca
-- =========================
('Chiretas','https://upload.wikimedia.org/wikipedia/commons/c/cc/Chiretas.jpg',
'Las chiretas son un plato tradicional del Pirineo aragonés elaborado con intestinos de cordero rellenos de arroz, carne y especias.',23),

('Ternasco de Aragón','https://upload.wikimedia.org/wikipedia/commons/thumb/e/e3/Bocadillo_de_ternasco%2C_alioli_y_pimiento_verde.jpeg/1280px-Bocadillo_de_ternasco%2C_alioli_y_pimiento_verde.jpeg',
'El ternasco de Aragón es un cordero joven asado o a la parrilla, considerado uno de los productos más representativos de la región.',23),

('Trenza de Almudévar','https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Trenza_%28La_Rosita%29.jpg/1280px-Trenza_%28La_Rosita%29.jpg',
'La trenza de Almudévar es un dulce elaborado con masa hojaldrada, frutos secos y azúcar glaseado.',23),

('Migas aragonesas','https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/Gastronom%C3%ADa_tradicional%2C_%22Migas_aragonesas%22_%28Arag%C3%B3n%2C_Espa%C3%B1a%29.jpg/1280px-Gastronom%C3%ADa_tradicional%2C_%22Migas_aragonesas%22_%28Arag%C3%B3n%2C_Espa%C3%B1a%29.jpg',
'Las migas aragonesas son un plato tradicional elaborado con pan, ajo, aceite y acompañamientos como chorizo o uvas.',23),

-- =========================
-- 24. Illes Balears
-- =========================
('Ensaimada','https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/Ensa%C3%AFmada_trenada.jpg/1280px-Ensa%C3%AFmada_trenada.jpg',
'La ensaimada es un dulce típico de Mallorca elaborado con masa fermentada, manteca de cerdo y azúcar en espiral.',24),

('Sobrassada','https://upload.wikimedia.org/wikipedia/commons/thumb/f/f7/Sobrassada.jpg/1280px-Sobrassada.jpg',
'La sobrasada es un embutido curado elaborado con carne de cerdo, pimentón y especias, de textura untable.',24),

('Tumbet','https://upload.wikimedia.org/wikipedia/commons/thumb/5/58/Tombet.jpg/1280px-Tombet.jpg',
'El tumbet es un plato de verduras al horno elaborado con berenjena, patata, pimiento y tomate.',24),

('Caldereta de langosta','https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Caldereta_llagosta.jpg/1280px-Caldereta_llagosta.jpg',
'La caldereta de langosta es un guiso marinero típico de Menorca elaborado con langosta fresca y caldo concentrado.',24),

-- =========================
-- 25. Jaén
-- =========================
('Andrajos','https://upload.wikimedia.org/wikipedia/commons/thumb/0/01/Andrajos_%283633922072%29.jpg/1280px-Andrajos_%283633922072%29.jpg',
'Los andrajos son un guiso tradicional de Jaén elaborado con tortas de harina troceadas, conejo o liebre y verduras. Es uno de los platos más representativos de la gastronomía jienense.',25),

('Pipirrana','https://upload.wikimedia.org/wikipedia/commons/thumb/b/b1/Dicey_gazpacho.jpg/1280px-Dicey_gazpacho.jpg',
'La pipirrana es una ensalada tradicional elaborada con tomate, pimiento, pepino, cebolla y atún.',25),

('Ajopringue','https://upload.wikimedia.org/wikipedia/commons/thumb/e/e6/Ajopringue.jpg/1280px-Ajopringue.jpg',
'El ajopringue es un plato tradicional de Jaén elaborado con hígado de cerdo, pan, ajo, especias y aceite de oliva, típico de la cocina más antigua y rural de la provincia.',25),

('Ochíos','https://upload.wikimedia.org/wikipedia/commons/3/31/OchiosConMorcilla.JPG',
'Los ochíos son pequeños panes tradicionales aromatizados con pimentón o anís, típicos de Jaén.',25),

-- =========================
-- 26. La Rioja
-- =========================
('Patatas a la riojana','https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/Patatas_a_la_riojana.jpg/1280px-Patatas_a_la_riojana.jpg',
'Las patatas a la riojana son un guiso tradicional elaborado con patatas, chorizo, pimiento choricero y ajo. Es un plato contundente muy típico de la cocina de invierno en La Rioja.',26),

('Caparrones','https://upload.wikimedia.org/wikipedia/commons/0/03/Caparrones89.JPG',
'Los caparrones son alubias rojas pequeñas cocinadas lentamente con chorizo y panceta. Son uno de los platos más representativos de la gastronomía riojana.',26),

('Vino tinto riojano','https://upload.wikimedia.org/wikipedia/commons/c/c0/Red_Wine_Glass.jpg',
'El vino tinto riojano es uno de los productos más emblemáticos de La Rioja, elaborado principalmente con uvas tempranillo y reconocido internacionalmente por su calidad y tradición vinícola.',26),

('Fardelejos','https://upload.wikimedia.org/wikipedia/commons/thumb/0/07/Fardelejos_%28242572869%29.jpg/1280px-Fardelejos_%28242572869%29.jpg',
'Los fardelejos son dulces tradicionales elaborados con masa rellena de almendra y azúcar, de origen árabe y muy típicos de la zona de Arnedo.',26),

-- =========================
-- 27. Las Palmas
-- =========================
('Papas arrugadas con mojo','https://upload.wikimedia.org/wikipedia/commons/8/87/Papasarrugadas.jpg',
'Las papas arrugadas son un plato típico canario elaborado con patatas cocidas en agua con mucha sal, servidas con mojo picón o mojo verde.',27),

('Sancocho canario','https://upload.wikimedia.org/wikipedia/commons/thumb/c/c0/Sancocho_canario.JPG/1280px-Sancocho_canario.JPG',
'El sancocho canario es un guiso de pescado salado acompañado de papas, batata y mojo.',27),

('Gofio escaldado','https://upload.wikimedia.org/wikipedia/commons/f/fa/Gofioescaldado.jpg',
'El gofio escaldado es una preparación tradicional elaborada con harina de cereales tostados mezclada con caldo caliente.',27),

('Bienmesabe canario','https://images.pexels.com/photos/14242068/pexels-photo-14242068.jpeg',
'El bienmesabe canario es un postre elaborado con almendra, miel, huevo y azúcar.',27),

-- =========================
-- 28. León
-- =========================
('Cecina de León','https://upload.wikimedia.org/wikipedia/commons/7/7f/Cecina.jpg',
'La cecina de León es carne de vacuno curada y ahumada, de sabor intenso y textura firme, considerada uno de los productos más prestigiosos de Castilla y León.',28),

('Botillo del Bierzo','https://upload.wikimedia.org/wikipedia/commons/thumb/9/9b/Botillos_frescos-2011.JPG/1280px-Botillos_frescos-2011.JPG',
'El botillo es un embutido elaborado con diferentes partes del cerdo adobadas y cocidas, típico del Bierzo.',28),

('Sopa de trucha','https://images.pexels.com/photos/37387553/pexels-photo-37387553.jpeg',
'La sopa de trucha es un plato tradicional elaborado con trucha, pan y caldo, muy típico de zonas de montaña.',28),

('Mantecadas de Astorga','https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Mantecadas_de_Astorga.jpg/1280px-Mantecadas_de_Astorga.jpg',
'Las mantecadas de Astorga son pequeños bizcochos elaborados con manteca, harina y azúcar.',28),

-- =========================
-- 29. Lleida
-- =========================
('Caracoles a la llauna','https://upload.wikimedia.org/wikipedia/commons/b/b7/Caracoles_llauna.jpg',
'Los caracoles a la llauna son caracoles cocinados a la brasa sobre una bandeja metálica con sal y alioli.',29),

('Olla aranesa','https://upload.wikimedia.org/wikipedia/commons/thumb/0/00/Olla_aranesa.jpg/1280px-Olla_aranesa.jpg',
'La olla aranesa es un guiso típico del Valle de Arán elaborado con carnes, verduras y legumbres.',29),

('Coca de recapte','https://upload.wikimedia.org/wikipedia/commons/4/48/Coca_de_recapte_1.jpg',
'La coca de recapte es una especie de masa horneada cubierta con verduras asadas y pescado o embutidos.',29),

('Panellets','https://upload.wikimedia.org/wikipedia/commons/thumb/f/f0/Panellets_%28surtido%29.jpg/500px-Panellets_%28surtido%29.jpg',
'Los panellets son pequeños dulces elaborados con almendra, azúcar y piñones, típicos de la festividad de Todos los Santos.',29),

-- =========================
-- 30. Lugo
-- =========================
('Caldo gallego','https://upload.wikimedia.org/wikipedia/commons/8/8b/Caldo_galego%2C_Galiza.jpg',
'El caldo gallego es una sopa tradicional elaborada con grelos, patatas, alubias y carne de cerdo.',30),

('Empanada de zorza','https://upload.wikimedia.org/wikipedia/commons/e/ef/Empanada.jpg',
'La empanada de zorza es una variante gallega rellena de carne de cerdo adobada.',30),

('Androlla','https://upload.wikimedia.org/wikipedia/commons/5/5a/Andouille.jpg',
'La androlla es un embutido tradicional gallego elaborado con carne de cerdo adobada.',30),

('Filloas','https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Filloas_rellenas_de_compota_de_manzana.jpg/1280px-Filloas_rellenas_de_compota_de_manzana.jpg',
'Las filloas son una especie de crepes finos típicos de Galicia que pueden ser dulces o salados.',30),

-- =========================
-- 31. Madrid
-- =========================
('Cocido madrileño','https://upload.wikimedia.org/wikipedia/commons/thumb/3/39/CocidoMadrile%C3%B1o.jpg/1280px-CocidoMadrile%C3%B1o.jpg',
'El cocido madrileño es uno de los platos más representativos de la cocina de la capital. Se elabora en tres vuelcos con garbanzos, verduras, carne de cerdo, pollo y embutidos, dando lugar a un caldo muy sabroso y nutritivo.',31),

('Bocadillo de calamares','https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/BocadilloCalamaresAtocha.JPG/1280px-BocadilloCalamaresAtocha.JPG',
'El bocadillo de calamares es un clásico de Madrid, especialmente en la Plaza Mayor. Consiste en calamares rebozados y fritos servidos dentro de un pan crujiente.',31),

('Callos a la madrileña','https://upload.wikimedia.org/wikipedia/commons/c/cd/Callos_cociendose.jpg',
'Los callos a la madrileña son un guiso elaborado con tripas de vacuno, chorizo y morcilla, cocinados lentamente con pimentón y especias.',31),

('Churros con chocolate','https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Chocolate_con_churros_de_lazo.jpg/1280px-Chocolate_con_churros_de_lazo.jpg',
'Los churros con chocolate son uno de los desayunos más populares de Madrid, consistentes en masa frita acompañada de chocolate caliente espeso.',31),

-- =========================
-- 32. Málaga
-- =========================
('Espetos de sardinas','https://upload.wikimedia.org/wikipedia/commons/thumb/9/93/Sardines_03_beach_Torre_del_Mar.JPG/1280px-Sardines_03_beach_Torre_del_Mar.JPG',
'Los espetos de sardinas son sardinas ensartadas en cañas y asadas a la brasa sobre la arena, típicas de la costa malagueña.',32),

('Gazpachuelo','https://upload.wikimedia.org/wikipedia/commons/thumb/8/8b/Gazpachuelo_-_M%C3%A1laga.JPG/1280px-Gazpachuelo_-_M%C3%A1laga.JPG',
'El gazpachuelo es una sopa caliente elaborada con caldo de pescado, mayonesa y patata, típica de Málaga.',32),

('Porra antequerana','https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Porra_antequerana.jpg/960px-Porra_antequerana.jpg',
'La porra antequerana es una variante espesa del gazpacho elaborada con tomate, pan, aceite y ajo.',32),

('Boquerones fritos','https://upload.wikimedia.org/wikipedia/commons/thumb/2/24/Boquerones_Fritos.jpg/1920px-Boquerones_Fritos.jpg',
'Los boquerones fritos son un plato típico malagueño elaborado con anchoas rebozadas y fritas en aceite de oliva.',32),

-- =========================
-- 33. Murcia
-- =========================
('Zarangollo','https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Zarangollo_estilo_Hell%C3%ADn.jpg/1280px-Zarangollo_estilo_Hell%C3%ADn.jpg',
'El zarangollo es un revuelto tradicional murciano elaborado con calabacín, cebolla y huevo.',33),

('Caldero del Mar Menor','https://upload.wikimedia.org/wikipedia/commons/a/a8/Arroz_caldero_con_Mujol.jpg',
'El caldero es un arroz meloso cocinado con pescado de roca y caldo intenso, típico del Mar Menor.',33),

('Michirones','https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Michirones-2011.JPG/1280px-Michirones-2011.JPG',
'Los michirones son un guiso de habas secas con chorizo, jamón y especias.',33),

('Pastel de carne murciano','https://upload.wikimedia.org/wikipedia/commons/thumb/5/5f/Pastel_de_carne_de_Murcia-2011.JPG/1280px-Pastel_de_carne_de_Murcia-2011.JPG',
'El pastel de carne murciano es una empanada rellena de carne, huevo duro y chorizo.',33),

-- =========================
-- 34. Navarra
-- =========================
('Pimientos del piquillo','https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Pimientos_del_piquillo_rellenos.jpg/960px-Pimientos_del_piquillo_rellenos.jpg',
'Los pimientos del piquillo son pimientos rojos asados y pelados, con un sabor dulce característico.',34),

('Cordero al chilindrón','https://upload.wikimedia.org/wikipedia/commons/0/01/Txilidron.jpg',
'El cordero al chilindrón es un guiso con tomate, pimiento y carne de cordero.',34),

('Pacharán','https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/Botella_del_Consejo_Regulador_de_Pachar%C3%A1n_Navarro.jpg/960px-Botella_del_Consejo_Regulador_de_Pachar%C3%A1n_Navarro.jpg',
'El pacharán es un licor tradicional elaborado con endrinas maceradas en anís.',34),

('Cuajada','https://upload.wikimedia.org/wikipedia/commons/1/18/Cuajada_cropped_-_juantigues.jpg',
'La cuajada es un postre lácteo tradicional elaborado con leche de oveja cuajada.',34),

-- =========================
-- 35. Ourense
-- =========================
('Castañas asadas','https://images.pexels.com/photos/36172668/pexels-photo-36172668.jpeg',
'Las castañas asadas son un producto muy tradicional de Ourense, especialmente en otoño, cuando se celebra el magosto, una fiesta típica gallega.',35),

('Carne ó caldeiro','https://upload.wikimedia.org/wikipedia/commons/thumb/4/48/Carnecaldeiro.jpg/1920px-Carnecaldeiro.jpg',
'La carne ó caldeiro es un plato tradicional gallego muy típico de Ourense, elaborado con carne de ternera cocida, patatas y aceite de oliva con pimentón, sencillo pero muy sabroso.',35),

('Orella de cerdo','https://upload.wikimedia.org/wikipedia/commons/thumb/1/16/Oreja_guisada.JPG/1280px-Oreja_guisada.JPG',
'La orella de cerdo es un plato tradicional gallego muy típico de Ourense, preparado con oreja de cerdo cocida y aderezada con pimentón, aceite de oliva y sal gruesa.',35),

('Bica de Trives','https://upload.wikimedia.org/wikipedia/commons/d/d6/Bica_Mantecada_Dona_Barona.jpg',
'La bica de Trives es un bizcocho tradicional gallego elaborado con manteca y azúcar.',35),

-- =========================
-- 36. Palencia
-- =========================
('Cangrejos de río a la palentina','https://upload.wikimedia.org/wikipedia/commons/8/88/Cocina_Palentina_Cangrejos_Herrera_de_Pisuerga_001.jpg',
'Los cangrejos de río a la palentina son un plato tradicional elaborado con cangrejos cocinados en salsa de tomate, ajo y especias, muy típico de las zonas ribereñas de Palencia.',36),

('Torreznos','https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/Patatas_revolconas_-_Guio.jpg/1280px-Patatas_revolconas_-_Guio.jpg',
'Los torreznos son tiras de panceta de cerdo fritas hasta quedar crujientes por fuera y jugosas por dentro, un aperitivo muy popular en la gastronomía palentina.',36),

('Menestra de verduras','https://upload.wikimedia.org/wikipedia/commons/thumb/7/75/Menestra_ascension.jpg/1280px-Menestra_ascension.jpg',
'La menestra de verduras es un plato elaborado con verduras de temporada como espárragos, guisantes y alcachofas, cocinadas suavemente.',36),

('Patatas a la importancia','https://upload.wikimedia.org/wikipedia/commons/thumb/c/c7/CocinaPalentina-Patatas_a_la_importancia_001.JPG/1280px-CocinaPalentina-Patatas_a_la_importancia_001.JPG',
'Las patatas a la importancia son un plato tradicional castellano muy típico en Palencia, elaborado con patatas rebozadas y guisadas en salsa con ajo y azafrán.',36),


-- =========================
-- 37. Pontevedra
-- =========================
('Mejillones al vapor','https://upload.wikimedia.org/wikipedia/commons/thumb/6/63/Mejillones_cocidos_al_vapor.jpg/1920px-Mejillones_cocidos_al_vapor.jpg',
'Los mejillones al vapor son uno de los productos más representativos de la Ría de Arousa. Se cocinan simplemente al vapor para conservar su sabor natural.',37),

('Zamburiñas a la plancha','https://images.pexels.com/photos/19052070/pexels-photo-19052070.jpeg',
'Las zamburiñas a la plancha son un marisco típico gallego cocinado con ajo, perejil y aceite de oliva.',37),

('Ostra de Arcade','https://images.pexels.com/photos/29143180/pexels-photo-29143180.jpeg',
'Las ostras de Arcade son conocidas por su calidad y sabor marino intenso, siendo un producto muy valorado en Galicia.',37),

('Albariño','https://upload.wikimedia.org/wikipedia/commons/d/d8/Copa_Granbazan_albari%C3%B1o.jpg',
'El albariño es un vino blanco gallego de alta calidad, fresco y aromático, ideal para mariscos.',37),

-- =========================
-- 38. Salamanca
-- =========================
('Hornazo','https://upload.wikimedia.org/wikipedia/commons/thumb/5/55/Hornazo_%28Salamaca%29-Cerca01.JPG/1280px-Hornazo_%28Salamaca%29-Cerca01.JPG',
'El hornazo es una empanada tradicional rellena de embutidos como chorizo, jamón y lomo, muy típica de Salamanca.',38),

('Chanfaina','https://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/Navas_del_Madro%C3%B1o_Plato_de_chanfaina.jpg/1280px-Navas_del_Madro%C3%B1o_Plato_de_chanfaina.jpg',
'La chanfaina es un guiso elaborado con arroz, sangre y vísceras de cordero, de origen tradicional rural.',38),

('Jamón de Guijuelo','https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Jam%C3%B3n_de_Guijuelo_004.JPG/1920px-Jam%C3%B3n_de_Guijuelo_004.JPG',
'El jamón de Guijuelo es uno de los jamones ibéricos más prestigiosos de España, curado en condiciones climáticas ideales.',38),

('Lentejas de La Armuña','https://upload.wikimedia.org/wikipedia/commons/2/26/Lentejas.jpg',
'Las lentejas de La Armuña son una variedad de legumbre muy apreciada por su textura fina y sabor suave.',38),

-- =========================
-- 39. Santa Cruz de Tenerife
-- =========================
('Conejo en salmorejo','https://upload.wikimedia.org/wikipedia/commons/b/b8/Conejo_en_salmorejo_y_Lasa%C3%B1a%2C_restaurace_Estrellas%2C_Gu%C3%ADa_de_Isora%2C_provincie_Santa_Cruz_de_Tenerife_02_%28cropped%29.jpg',
'El conejo en salmorejo es uno de los platos más tradicionales de Tenerife, elaborado con conejo marinado en ajo, pimentón, vino y especias, y posteriormente cocinado lentamente.',39),

('Ropa vieja canaria','https://upload.wikimedia.org/wikipedia/commons/thumb/4/45/Ropa_vieja_plato_cubano_por_excelencia_2.jpg/1280px-Ropa_vieja_plato_cubano_por_excelencia_2.jpg',
'La ropa vieja es un guiso elaborado con carne desmenuzada, garbanzos y verduras.',39),

('Mojo picón','https://upload.wikimedia.org/wikipedia/commons/7/78/Mojo_picon_%28cropped%29.jpg',
'El mojo picón es una salsa canaria elaborada con pimiento, ajo, comino y aceite de oliva.',39),

('Queso majorero','https://upload.wikimedia.org/wikipedia/commons/1/14/Queso_Majorero_en_el_Club_del_Queso_de_Mumum%C3%ADo_de_Diciembre_2011.jpg',
'El queso majorero es un queso canario con denominación de origen elaborado en Fuerteventura con leche de cabra majorera, de sabor intenso y textura firme.',39),

-- =========================
-- 40. Segovia
-- =========================
('Cochinillo asado','https://upload.wikimedia.org/wikipedia/commons/a/ad/Cochinillo_de_Segovia.jpg',
'El cochinillo asado es uno de los platos más famosos de Segovia. Se cocina lentamente en horno de leña hasta obtener una piel crujiente y carne muy tierna.',40),

('Chorizo de Cantimpalos','https://upload.wikimedia.org/wikipedia/commons/thumb/9/90/Chorizos_de_Cantimpalos.jpg/1280px-Chorizos_de_Cantimpalos.jpg',
'El chorizo de Cantimpalos es un embutido tradicional de Segovia, muy famoso en toda España por su sabor intenso y su elaboración artesanal con pimentón y carne de cerdo.',40),

('Trucha a la segoviana','https://upload.wikimedia.org/wikipedia/commons/8/8a/Trucha_con_jam%C3%B3n_de_mi_abuela%2C_al_horno_y_con_verduras.jpg',
'La trucha a la segoviana es un plato típico elaborado con trucha del río Eresma, cocinada con jamón serrano y frita o al horno.',40),

('Ponche segoviano','https://upload.wikimedia.org/wikipedia/commons/thumb/c/cd/Ponchesegovia.jpg/1280px-Ponchesegovia.jpg',
'El ponche segoviano es un postre elaborado con bizcocho, crema pastelera y mazapán.',40),

-- =========================
-- 41. Sevilla
-- =========================
('Torrijas','https://upload.wikimedia.org/wikipedia/commons/9/93/Torrija_con_az%C3%BAcar.jpg',
'Las torrijas son un postre tradicional muy consumido en Semana Santa en España, elaboradas con pan empapado en leche o vino, rebozado en huevo y frito, con azúcar y canela.',41),

('Espinacas con garbanzos','https://upload.wikimedia.org/wikipedia/commons/thumb/2/25/Potaje_de_vigilia.jpg/960px-Potaje_de_vigilia.jpg',
'Las espinacas con garbanzos son un plato tradicional sevillano de origen andalusí, muy consumido en tapas y caracterizado por su mezcla de especias como el comino y el pimentón.',41),

('Solomillo al whisky','https://upload.wikimedia.org/wikipedia/commons/thumb/d/d5/Solomillo_al_whisky.JPG/1920px-Solomillo_al_whisky.JPG',
'El solomillo al whisky es una tapa muy popular en Sevilla, elaborada con solomillo de cerdo en salsa de ajo, whisky y limón.',41),

('Montadito de pringá','https://upload.wikimedia.org/wikipedia/commons/thumb/5/58/Pring%C3%A1-01.jpg/1280px-Pring%C3%A1-01.jpg',
'El montadito de pringá es un pequeño bocadillo relleno de carne desmenuzada del cocido, muy típico de bares sevillanos.',41),

-- =========================
-- 42. Soria
-- =========================
('Torreznos de Soria','https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Torreznos_%28Apilamiento%29.jpg/1280px-Torreznos_%28Apilamiento%29.jpg',
'Los torreznos de Soria son tiras de panceta frita hasta conseguir una textura crujiente por fuera y jugosa por dentro. Son uno de los aperitivos más emblemáticos de la provincia.',42),

('Trufa negra de Soria','https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Tuber_melanosporum_-_trufa_negra%2C_%C3%81greda%2C_Espa%C3%B1a.jpg/1280px-Tuber_melanosporum_-_trufa_negra%2C_%C3%81greda%2C_Espa%C3%B1a.jpg',
'La trufa negra de Soria es un producto gourmet muy apreciado internacionalmente, recolectado en los bosques de la provincia y utilizado en alta cocina por su aroma intenso.',42),

('Migas pastoriles','https://upload.wikimedia.org/wikipedia/commons/thumb/d/d8/Migas%2C_un_plato_t%C3%ADpico_de_la_cocina_espa%C3%B1ola.jpg/1280px-Migas%2C_un_plato_t%C3%ADpico_de_la_cocina_espa%C3%B1ola.jpg',
'Las migas pastoriles son un plato tradicional elaborado con pan duro, ajo, chorizo y panceta, típico de la cocina de pastores.',42),

('Paciencias de Almazán','https://upload.wikimedia.org/wikipedia/commons/thumb/9/9c/Paciencias_de_Almaz%C3%A1n.jpg/1280px-Paciencias_de_Almaz%C3%A1n.jpg',
'Las paciencias de Almazán son unos dulces tradicionales de Soria elaborados con huevo, azúcar y harina, conocidos por su textura ligera y crujiente.',42),

-- =========================
-- 43. Tarragona
-- =========================
('Xató','https://upload.wikimedia.org/wikipedia/commons/c/ca/Plat_de_xat%C3%B3.jpg',
'El xató es una ensalada tradicional típica de Tarragona elaborada con escarola, bacalao, atún, anchoas y salsa xató a base de frutos secos y ñora.',43),

('Menjar blanc','https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Menjablanc.jpg/500px-Menjablanc.jpg',
'El menjar blanc es un postre tradicional de Tarragona elaborado con leche de almendra, azúcar y almidón, de textura suave y sabor delicado.',43),

('Arrossejat','https://upload.wikimedia.org/wikipedia/commons/thumb/0/0e/Arrossejat.JPG/1280px-Arrossejat.JPG',
'El arrossejat es un arroz seco típico marinero de Tarragona, cocinado con caldo de pescado y marisco.',43),

('Romescada','https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Romesco_de_Tarragona_%28pulpo%29.jpg/1920px-Romesco_de_Tarragona_%28pulpo%29.jpg',
'La romescada es un guiso de pescado o marisco con salsa romesco, típico de la costa tarraconense.',43),

-- =========================
-- 44. Teruel
-- =========================
('Jamón de Teruel','https://upload.wikimedia.org/wikipedia/commons/thumb/2/2d/Jm%C3%B3n_de_Teruel_%28Espa%C3%B1a%29.JPG/1920px-Jm%C3%B3n_de_Teruel_%28Espa%C3%B1a%29.JPG',
'El jamón de Teruel es un jamón curado de alta calidad con denominación de origen, caracterizado por su sabor suave y equilibrado.',44),

('Bollos de sartén','https://upload.wikimedia.org/wikipedia/commons/thumb/8/8f/Fritulis.jpg/960px-Fritulis.jpg',
'Los bollos de sartén son un dulce tradicional de Teruel elaborado con masa frita, típico de fiestas y celebraciones populares.',44),

('Ajoaceite de Teruel','https://upload.wikimedia.org/wikipedia/commons/thumb/0/00/Ajos-2010.jpg/1280px-Ajos-2010.jpg',
'El ajoaceite es una salsa tradicional de Teruel similar al alioli, elaborada con ajo y aceite de oliva, muy utilizada para acompañar carnes y platos típicos.',44),

('Queso de Tronchón','https://upload.wikimedia.org/wikipedia/commons/thumb/2/22/Wikicheese_-_Troncho_de_Mayo_-_20160520_-_004.jpg/1280px-Wikicheese_-_Troncho_de_Mayo_-_20160520_-_004.jpg',
'El queso de Tronchón es un queso artesanal de Teruel, elaborado tradicionalmente con leche de oveja o cabra, de sabor intenso y textura firme.',44),

-- =========================
-- 45. Toledo
-- =========================
('Carcamusas','https://upload.wikimedia.org/wikipedia/commons/thumb/7/7f/Carcamusas%EF%BC%8CToledo%E5%82%B3%E7%B5%B1%E8%8F%9C%EF%BC%8C%E8%BE%A3%E9%86%AC%E7%87%89%E7%89%9B%E8%82%89_%2810077288014%29.jpg/1920px-Carcamusas%EF%BC%8CToledo%E5%82%B3%E7%B5%B1%E8%8F%9C%EF%BC%8C%E8%BE%A3%E9%86%AC%E7%87%89%E7%89%9B%E8%82%89_%2810077288014%29.jpg',
'Las carcamusas son un guiso tradicional de carne de cerdo con tomate y guisantes, típico de la ciudad de Toledo.',45),

('Mazapán de Toledo','https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Mazap%C3%A1n-Casa_Mira-2009.jpg/1280px-Mazap%C3%A1n-Casa_Mira-2009.jpg',
'El mazapán de Toledo es un dulce elaborado con almendra y azúcar, de origen medieval y gran tradición conventual.',45),

('Perdiz estofada','https://upload.wikimedia.org/wikipedia/commons/c/ce/Perdiz_-_juantiagues.jpg',
'La perdiz estofada es un plato de caza cocinado lentamente con verduras, vino y especias.',45),

('Migas del pastor','https://upload.wikimedia.org/wikipedia/commons/d/db/Migas_de_pastor.jpg',
'Las migas del pastor son un plato tradicional elaborado con pan, ajo, chorizo y panceta.',45),

-- =========================
-- 46. Valencia
-- =========================
('Paella valenciana','https://images.pexels.com/photos/24906297/pexels-photo-24906297.jpeg',
'La paella valenciana es el plato más emblemático de la Comunidad Valenciana, elaborado con arroz, pollo, conejo, judía verde y garrofón cocinado en paellera tradicional.',46),

('Esgarraet','https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/Esgarraet_-_Malvarosa.JPG/1280px-Esgarraet_-_Malvarosa.JPG',
'El esgarraet es una ensalada típica valenciana elaborada con pimiento rojo asado, bacalao desalado, ajo y aceite de oliva.',46),

('Horchata de chufa','https://upload.wikimedia.org/wikipedia/commons/thumb/a/aa/Orxata_amb_fartons_a_Castello.jpg/1280px-Orxata_amb_fartons_a_Castello.jpg',
'La horchata de chufa es una bebida vegetal dulce y refrescante elaborada con chufas.',46),

('Arroz al horno','https://upload.wikimedia.org/wikipedia/commons/thumb/f/fc/Arroz_al_horno.JPG/1280px-Arroz_al_horno.JPG',
'El arroz al horno es un plato tradicional valenciano cocinado con garbanzos, costillas, morcilla y tomate en cazuela.',46),

-- =========================
-- 47. Valladolid
-- =========================
('Lentejas de Tierra de Campos','https://upload.wikimedia.org/wikipedia/commons/2/21/Lentejas_estilo_de_la_abuela.jpg',
'Las lentejas de Tierra de Campos son un plato tradicional de Valladolid elaborado con lentejas de alta calidad cocinadas con chorizo, verduras y especias.',47),

('Lechazo asado','https://upload.wikimedia.org/wikipedia/commons/3/31/Plato_de_lechazo%2C_Valladolid.jpg',
'El lechazo asado es uno de los platos más emblemáticos de Castilla y León. Se cocina lentamente en horno de leña utilizando únicamente agua y sal para resaltar el sabor natural de la carne.',47),

('Yogur artesanal de oveja','https://images.pexels.com/photos/10809260/pexels-photo-10809260.jpeg',
'El yogur artesanal de oveja es un producto lácteo típico de Valladolid, elaborado con leche de oveja y de textura cremosa y sabor suave.',47),

('Tostón','https://upload.wikimedia.org/wikipedia/commons/thumb/0/07/Cochinillo_asado-Madrid.jpg/1280px-Cochinillo_asado-Madrid.jpg',
'El tostón es cochinillo asado hasta obtener una piel crujiente y carne jugosa, muy típico de celebraciones y restaurantes tradicionales.',47),

-- =========================
-- 48. Vizcaya
-- =========================
('Gilda','https://upload.wikimedia.org/wikipedia/commons/thumb/c/c7/Gildas_en_Donostia.jpg/1280px-Gildas_en_Donostia.jpg',
'La gilda es un pintxo clásico vasco elaborado con aceituna, anchoa y guindilla en un pincho, considerado uno de los más icónicos de los bares de Bilbao.',48),

('Porrusalda','https://upload.wikimedia.org/wikipedia/commons/1/19/Porrusalda.jpg',
'La porrusalda es una sopa tradicional vasca, muy típica de Vizcaya, elaborada con puerros, patatas y zanahorias, de sabor suave y reconfortante.',48),

('Marmitako','https://upload.wikimedia.org/wikipedia/commons/1/1b/Marmitako.JPG',
'El marmitako es un guiso marinero elaborado con bonito del norte, patatas, pimientos y cebolla, típico de pescadores vascos.',48),

('Txangurro a la donostiarra','https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Centollo_Castro_Urdiales.jpg/1280px-Centollo_Castro_Urdiales.jpg',
'El txangurro a la donostiarra es una preparación de centollo relleno con su carne, verduras y salsa gratinada al horno.',48),

-- =========================
-- 49. Zamora
-- =========================
('Queso zamorano','https://upload.wikimedia.org/wikipedia/commons/thumb/7/72/Queso_de_Oveja._La_Antigua_de_Fuentesa%C3%BAco._%2818200506649%29.jpg/1280px-Queso_de_Oveja._La_Antigua_de_Fuentesa%C3%BAco._%2818200506649%29.jpg',
'El queso zamorano es un queso con denominación de origen elaborado con leche de oveja. Destaca por su sabor intenso, ligeramente picante en curaciones largas y su textura firme y compacta.',49),

('Alubias de Sanabria','https://images.pexels.com/photos/19870148/pexels-photo-19870148.jpeg',
'Las alubias de Sanabria son una legumbre de gran calidad cocinada en guisos tradicionales con chorizo, panceta y verduras, muy representativas de la cocina zamorana.',49),

('Arroz a la zamorana','https://upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Arroz_Zamorano-2011.jpg/1280px-Arroz_Zamorano-2011.jpg',
'El arroz a la zamorana es un plato contundente elaborado con arroz, carnes de cerdo, chorizo y pimentón, típico de celebraciones y cocina tradicional.',49),

('Dos y pingada','https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Dos_y_pingada02.jpg/960px-Dos_y_pingada02.jpg',
'Los dos y pingada es un plato tradicional de Semana Santa compuesto por huevos fritos con jamón, muy típico de la gastronomía popular de Zamora.',49),

-- =========================
-- 50. Zaragoza
-- =========================
('Longaniza de Aragón','https://upload.wikimedia.org/wikipedia/commons/thumb/f/f7/Longaniza_de_Arag%C3%B3n.jpg/1280px-Longaniza_de_Arag%C3%B3n.jpg',
'La longaniza de Aragón es un embutido tradicional elaborado con carne de cerdo y especias, muy típico en parrilladas y fiestas populares.',50),

('Pollo al chilindrón','https://upload.wikimedia.org/wikipedia/commons/thumb/e/ee/Chilindr%C3%B3n_-_Pollo.jpg/1280px-Chilindr%C3%B3n_-_Pollo.jpg',
'El pollo al chilindrón es un guiso tradicional aragonés elaborado con pollo, tomate, pimiento rojo y jamón serrano.',50),

('Borraja con patatas','https://upload.wikimedia.org/wikipedia/commons/c/cc/Borage-aragonese_style600.JPG',
'La borraja con patatas es un plato vegetal típico de Aragón cocido con aceite de oliva.',50),

('Frutas de Aragón','https://upload.wikimedia.org/wikipedia/commons/thumb/c/c8/Frutas_de_Arag%C3%B3n_tradicionales.jpg/1920px-Frutas_de_Arag%C3%B3n_tradicionales.jpg',
'Las frutas de Aragón son frutas confitadas cubiertas de chocolate, muy típicas como dulce regional.',50),

-- =========================
-- 51. Ceuta
-- =========================
('Cuscús ceutí','https://upload.wikimedia.org/wikipedia/commons/thumb/0/0c/Moroccan_cuscus%2C_from_Casablanca%2C_September_2018.jpg/960px-Moroccan_cuscus%2C_from_Casablanca%2C_September_2018.jpg',
'El cuscús ceutí es un plato con fuerte influencia magrebí, elaborado con sémola de trigo, verduras y carne especiada. Refleja la mezcla cultural de la ciudad de Ceuta, donde conviven tradiciones culinarias andaluzas y norteafricanas.',51),

('Pinchos morunos','https://images.pexels.com/photos/8104900/pexels-photo-8104900.jpeg',
'Los pinchos morunos son brochetas de carne marinada con especias como comino, pimentón y cilantro, muy populares en Ceuta debido a su cercanía cultural con Marruecos.',51),

('Pastela ceutí','https://upload.wikimedia.org/wikipedia/commons/e/ed/Bisteeya.jpg',
'La pastela es un pastel salado-dulce de origen magrebí elaborado con masa fina rellena de carne especiada, huevo y almendras, espolvoreado con azúcar y canela.',51),

('Briouats','https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/Briouat_%28cropped%29.jpg/1280px-Briouat_%28cropped%29.jpg',
'Los briouats son pequeños triángulos de masa filo rellenos de carne o queso, fritos hasta quedar crujientes, típicos de la influencia culinaria norteafricana en Ceuta.',51),

-- =========================
-- 52. Melilla
-- =========================
('Cuscús melillense','https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Couscous-1.jpg/1280px-Couscous-1.jpg',
'El cuscús melillense es un plato tradicional que combina sémola de trigo con verduras, carne y especias, reflejando la fusión cultural entre la cocina mediterránea y magrebí.',52),

('Pinchos de cordero','https://upload.wikimedia.org/wikipedia/commons/e/ee/Barbecue.jpg',
'Los pinchos de cordero son brochetas de carne marinada con especias aromáticas, muy típicas en celebraciones y reuniones familiares en Melilla.',52),

('Harira','https://upload.wikimedia.org/wikipedia/commons/c/ce/Harira.png',
'La harira es una sopa espesa elaborada con legumbres, tomate, carne y especias, muy consumida en la gastronomía de influencia norteafricana.',52),

('Samsa','https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Uyghur_samsa.jpg/1280px-Uyghur_samsa.jpg',
'La samsa es un dulce en forma de triángulo relleno de almendra y miel, muy popular en la repostería de influencia árabe en Melilla.',52);



INSERT INTO patrimonio 
(nombre, descripcion, url_imagen, tipo, valoracion, localidad, cod_ine, id_provincia, latitud, longitud)
VALUES

('Parque Nacional de Doñana',
'Doñana es uno de los espacios naturales más importantes de Europa, formado por marismas, dunas móviles, bosques y playas. Es un enclave clave para aves migratorias entre África y Europa. Su biodiversidad es excepcional, albergando especies en peligro como el lince ibérico, además de ecosistemas únicos protegidos por su gran valor ecológico.',
'https://images.pexels.com/photos/14666848/pexels-photo-14666848.jpeg', 'natural', 8.90, 'Almonte', '21005', 22, 36.9839, -6.4172),

('Parque Nacional de los Picos de Europa',
'Este macizo montañoso del norte de España destaca por sus imponentes picos, profundos desfiladeros y verdes valles. Es un refugio de fauna salvaje como el oso pardo y el lobo ibérico. Su relieve kárstico crea paisajes espectaculares, con rutas de senderismo y pueblos tradicionales que conservan la cultura rural de la zona.',
'https://images.pexels.com/photos/34169559/pexels-photo-34169559.jpeg', 'natural', 9.95, 'Cangas de Onís', '33012', 6, 43.1932, -4.8465),

('Parque Nacional del Teide',
'El Teide, en Tenerife, es un parque volcánico dominado por el pico más alto de España. Su paisaje lunar, formado por coladas de lava y cráteres, es único en el mundo. Alberga especies endémicas adaptadas a condiciones extremas y es uno de los mejores lugares del planeta para la observación astronómica por la claridad de su cielo.',
'https://images.pexels.com/photos/35062322/pexels-photo-35062322.jpeg', 'natural', 9.95, 'La Orotava', '38026', 39, 28.2721, -16.6424),

('Parque Nacional de Timanfaya',
'Timanfaya ofrece un paisaje volcánico activo en Lanzarote, donde aún se registran temperaturas elevadas bajo la superficie. Sus campos de lava solidificada, conos volcánicos y ausencia de vegetación crean un entorno casi extraterrestre. Es un lugar protegido donde la activity geotérmica se muestra al visitante de forma controlada.',
'https://images.pexels.com/photos/36955230/pexels-photo-36955230.jpeg', 'natural', 7.85, 'Yaiza', '35034', 27, 29.0041, -13.7845),

('Parque Nacional de la Sierra de Guadarrama',
'Este parque entre Madrid y Segovia combina montañas, bosques de pino y fauna diversa. Es un espacio natural muy visitado para senderismo, escalada y esquí. Alberga ecosistemas de alta montaña y especies protegidas, además de lagunas glaciares que aportan gran valor paisajístico y ecológico a la zona central de la península.',
'https://images.pexels.com/photos/21820625/pexels-photo-21820625.jpeg', 'natural', 7.80, 'Real Sitio de San Ildefonso', '40181', 40, 40.8524, -3.9482),

('Parque Nacional de Ordesa y Monte Perdido',
'Ubicado en los Pirineos aragoneses, este parque destaca por sus valles glaciares, cascadas y paredes verticales impresionantes. Monte Perdido es uno de los macizos calcáreos más altos de Europa. Su biodiversidad incluye especies alpinas y bosques bien conservados, siendo uno de los paisajes más espectaculares del país.',
'https://images.pexels.com/photos/27729399/pexels-photo-27729399.jpeg', 'natural', 9.95, 'Fanlo', '22107', 23, 42.6715, -0.0526),

('Parque Nacional de Aigüestortes i Estany de Sant Maurici',
'Este parque en el Pirineo catalán está formado por más de 200 lagos, ríos de montaña y bosques alpinos. Sus paisajes glaciares crean valles estrechos y picos escarpados. Es un refugio para especies como el quebrantahuesos y cuenta con una gran riqueza ecológica y paisajística ideal para el senderismo.',
'https://images.pexels.com/photos/13314730/pexels-photo-13314730.jpeg', 'natural', 8.90, 'Espot', '25082', 29, 42.5750, 1.0000),

('Parque Nacional de Monfragüe',
'Monfragüe es uno de los mejores lugares de Europa para la observación de aves rapaces. Sus dehesas y roquedos albergan especies como el buitre negro y el águila imperial ibérica. El río Tajo atraviesa el parque creando paisajes de gran valor ecológico y un ecosistema mediterráneo bien conservado.',
'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/Mirador_del_Salto_del_Gitano_y_Rio_Tajo.jpg/1920px-Mirador_del_Salto_del_Gitano_y_Rio_Tajo.jpg', 'natural', 7.85, 'Torrejón el Rubio', '10190', 11, 39.8050, -6.0130),

('Parque Nacional de las Tablas de Daimiel',
'Este humedal único en Castilla-La Mancha combina aguas superficiales y subterráneas, creando un ecosistema de gran valor para aves acuáticas. Es un refugio clave para especies migratorias y está amenazado por la sobreexplotación hídrica. Su importancia ecológica lo convierte en uno de los espacios protegidos más relevantes del país.',
'https://images.pexels.com/photos/14557873/pexels-photo-14557873.jpeg', 'natural', 8.70, 'Daimiel', '13039', 15, 39.1411, -3.6931),

('Parque Natural de la Sierra de Cazorla, Segura y Las Villas',
'Es el mayor espacio protegido de España, con extensos bosques, ríos y montañas. Alberga especies como el ciervo, el jabalí y el buitre leonado. Sus paisajes incluyen cascadas, cañones y embalses, siendo un destino muy importante para el turismo rural y la observación de fauna en Andalucía.',
'https://images.pexels.com/photos/37415920/pexels-photo-37415920.jpeg', 'natural', 8.90, 'Cazorla', '23028', 25, 38.0772, -2.8594),

('Parque Natural Cabo de Gata-Níjar',
'Este parque costero destaca por su origen volcánico, playas vírgenes y acantilados abruptos. Su clima semiárido genera paisajes únicos en Europa. Es hábitat de especies marinas y terrestres adaptadas a condiciones extremas. Sus pueblos blancos y su biodiversidad lo convierten en un destino natural y turístico muy especial.',
'https://images.pexels.com/photos/6434803/pexels-photo-6434803.jpeg', 'natural', 7.85, 'Níjar', '04066', 5, 36.7219, -2.1912),

('Parque Natural de la Albufera',
'La Albufera es un lago costero rodeado de arrozales, dunas y bosques mediterráneos. Es fundamental para la producción de arroz y la gastronomía valenciana. También es un refugio de aves acuáticas y un ecosistema en equilibrio entre actividad humana y naturaleza, muy valorado por su biodiversidad.',
'https://images.pexels.com/photos/33821490/pexels-photo-33821490.jpeg', 'natural', 9.60, 'Valencia', '46250', 46, 39.3450, -0.3150),

('Parque Natural de las Islas Atlánticas de Galicia',
'Este parque incluye archipiélagos como Cíes, Ons y Sálvora, caracterizados por aguas cristalinas, playas vírgenes y gran biodiversidad marina. Es un espacio protegido clave para aves marinas y ecosistemas costeros. Su belleza paisajística lo convierte en uno de los destinos naturales más importantes de Galicia.',
'https://images.pexels.com/photos/584928/pexels-photo-584928.jpeg', 'natural', 9.80, 'Vigo', '36057', 37, 42.2270, -8.8970),

('Parque Natural de la Sierra de Grazalema',
'Este parque destaca por ser una de las zonas más lluviosas de la península, lo que permite el desarrollo de bosques de pinsapo únicos. Sus formaciones kársticas, cuevas y gargantas crean paisajes espectaculares. Es un espacio ideal para senderismo y observación de fauna en un entorno natural privilegiado.',
'https://images.pexels.com/photos/34340943/pexels-photo-34340943.jpeg', 'natural', 8.75, 'Grazalema', '11019', 12, 36.7570, -5.3660),

('Parque Natural de la Breña y Marismas del Barbate',
'Este parque combina acantilados costeros, pinares y marismas, creando un ecosistema diverso en la costa gaditana. Es importante para aves migratorias y especies marinas. Sus senderos ofrecen vistas al Atlántico y permiten disfrutar de un entorno natural poco alterado por la actividad humana.',
'https://upload.wikimedia.org/wikipedia/commons/thumb/7/77/BrennaBarbate-.jpg/960px-BrennaBarbate-.jpg', 'natural', 9.50, 'Barbate', '11007', 12, 36.1980, -5.9000),

('Parque Natural de Somiedo',
'Somiedo es un espacio montañoso asturiano con lagos glaciares, bosques y pastos de alta montaña. Es uno de los últimos refugios del oso pardo cantábrico. Sus paisajes tradicionales y su baja densidad de población lo convierten en un entorno natural de gran valor ecológico y cultural.',
'https://upload.wikimedia.org/wikipedia/commons/f/f4/Somiedo.jpg', 'natural', 8.85, 'Somiedo', '33068', 6, 43.0950, -6.2500),

('Parque Natural de Urkiola',
'Urkiola es un parque vasco de relieve montañoso, bosques densos y praderas verdes. Es un lugar importante para la cultura local y la mitología vasca. Sus rutas de senderismo permiten descubrir una naturaleza bien conservada con vistas espectaculares y abundante biodiversidad.',
'https://images.pexels.com/photos/18122952/pexels-photo-18122952.jpeg', 'natural', 9.70, 'Abadiño', '48001', 48, 43.0720, -2.6430),

('Selva de Irati',
'La Selva de Irati es uno de los bosques de hayas y abetos mejor conservados de Europa. Su densidad forestal y su ambiente húmedo crean un paisaje mágico, especialmente en otoño. Es hogar de fauna diversa y un destino ideal para senderismo y naturaleza en estado puro en Navarra.',
'https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/SelvaIrati4533.jpg/1280px-SelvaIrati4533.jpg', 'natural', 8.90, 'Ochagavía', '31185', 34, 42.9970, -1.0500),

('Parque Natural de la Sierra de Gredos',
'Este sistema montañoso destaca por sus lagunas glaciares, picos rocosos y biodiversidad. Es un espacio clave para la cabra montés y aves rapaces. Sus paisajes cambian con la altitud, ofreciendo rutas de montaña y zonas de gran interés geológico y ecológico en el centro de España.',
'https://images.pexels.com/photos/21820624/pexels-photo-21820624.jpeg', 'natural', 8.85, 'El Hornillo', '05100', 7, 40.2810, -5.2520),

('Parque Natural de la Serranía de Cuenca',
'La Serranía de Cuenca presenta formaciones kársticas, bosques y ríos que crean paisajes singulares como la Ciudad Encantada. Es un espacio natural ideal para el senderismo y la observación geológica, con gran riqueza en flora y fauna mediterránea y continental.',
'https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/Tagus_river_gorge%2C_Guadalajara_%28Spain%29.jpg/1280px-Tagus_river_gorge%2C_Guadalajara_%28Spain%29.jpg', 'natural', 9.75, 'Cuenca', '16078', 17, 40.0700, -2.1400),

('Desierto de Tabernas',
'El Desierto de Tabernas es el único desierto semiárido de Europa, con paisajes de badlands, ramblas secas y formaciones erosionadas por el viento y la lluvia. Ha sido escenario de numerosos rodajes cinematográficos. Su ecosistema es muy particular, con especies adaptadas a condiciones extremas de aridez y fuertes contrastes térmicos.',
'https://images.pexels.com/photos/9903979/pexels-photo-9903979.jpeg', 'natural', 8.70, 'Tabernas', '04088', 5, 37.0810, -2.3510),

('Dunas de Maspalomas',
'Las Dunas de Maspalomas son un espacio natural único en Gran Canaria, famoso por su gran campo de dunas de arena orgánica, su charca y su palmeral. Este ecosistema desértico junto al océano Atlántico es una Reserva Natural Especial de gran valor geológico y paisajístico, siendo uno de los principales iconos de las Islas Canarias.',
'https://images.pexels.com/photos/346108/pexels-photo-346108.jpeg', 'natural', 9.90, 'Maspalomas', '35019', 27, 27.7458, -15.5786),

('Parque Natural de las Nieves',
'El Parque Natural de las Nieves, situado en la isla de La Palma, alberga una de las mejores representaciones de laurisilva de Canarias, destacando la zona de Los Tilos. Su terreno abrupto incluye profundos barrancos y una gran biodiversidad con numerosos endemismos, además de jugar un papel clave en la recarga de los acuíferos de la isla.',
'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Forest_Los_Tilos_La_Palma.jpg/960px-Forest_Los_Tilos_La_Palma.jpg', 'natural', 8.80, 'San Andrés y Sauces', '38033', 39, 28.7914, -17.8039),

('Parque Natural de la Zona Volcánica de la Garrotxa',
'Este parque en Girona destaca por su gran concentración de volcanes inactivos y coladas de lava que han dado lugar a suelos fértiles y bosques frondosos. Los conos volcánicos están bien conservados y el paisaje combina naturaleza volcánica con vegetación mediterránea y atlántica en un entorno único en la península.',
'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c0/Volc%C3%A0_de_Santa_Margarida.jpg/1280px-Volc%C3%A0_de_Santa_Margarida.jpg', 'natural', 8.80, 'Olot', '17114', 18, 42.1412, 2.5475),

('Lagos de Covadonga',
'Los Lagos de Covadonga, situados en el Parque Nacional de los Picos de Europa, son uno de los paisajes naturales más emblemáticos de Asturias. Los lagos Enol y Ercina están rodeados de montañas, pastos y rutas de senderismo de gran belleza. La zona combina valor ecológico, tradición ganadera y un fuerte atractivo turístico vinculado también al cercano Santuario de Covadonga.',
'https://images.pexels.com/photos/35201721/pexels-photo-35201721.jpeg', 'natural', 9.95, 'Cangas de Onís', '33012', 6, 43.2740, -4.9860),



('Alcazaba de Almería',
'La Alcazaba de Almería es una fortaleza andalusí construida en el siglo X que domina la ciudad desde lo alto. Su estructura defensiva incluye murallas, torres y jardines interiores. Es uno de los conjuntos defensivos musulmanes más importantes de la península, con vistas estratégicas al mar Mediterráneo.',
'https://images.pexels.com/photos/34090985/pexels-photo-34090985.jpeg', 'cultural', 9.70, 'Almería', '04013', 5, 36.8407, -2.4708),

('Conjunto histórico de Níjar',
'El casco histórico de Níjar destaca por su arquitectura tradicional de casas blancas, calles estrechas y fuerte herencia andalusí. Conserva elementos artesanales como la cerámica y el esparto. Su entorno combina cultura rural y paisaje semiárido, siendo un ejemplo de pueblo blanco típico del sureste español.',
'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ef/Calle_de_la_Villa_de_N%C3%ADjar.jpg/960px-Calle_de_la_Villa_de_N%C3%ADjar.jpg', 'cultural', 9.40, 'Níjar', '04066', 5, 36.9650, -2.2050),

('Teatro Romano de Cádiz',
'El Teatro Romano de Cádiz es uno de los más antiguos de Hispania. Sus restos arqueológicos muestran la importancia de Gades en época romana. Parte del teatro está excavado bajo edificios modernos, lo que lo convierte en un ejemplo único de convivencia entre arqueología y ciudad contemporánea.',
'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8d/Teatro_Romano_de_C%C3%A1diz_-_Grader%C3%ADo.JPG/960px-Teatro_Romano_de_C%C3%A1diz_-_Grader%C3%ADo.JPG', 'cultural', 8.80, 'Cádiz', '11012', 12, 36.5283, -6.2936),

('Catedral de Cádiz',
'La Catedral de Cádiz, conocida como la "Santa Cruz sobre el Mar", combina estilos barroco y neoclásico. Su cúpula dorada es visible desde gran parte de la ciudad. Construida durante más de un siglo, refleja la prosperidad comercial de Cádiz en el siglo XVIII gracias al comercio con América.',
'https://images.pexels.com/photos/17057606/pexels-photo-17057606.jpeg', 'cultural', 7.60, 'Cádiz', '11012', 12, 36.5292, -6.2951),

('Conjunto histórico de Jerez de la Frontera',
'Jerez de la Frontera destaca por su casco histórico, su tradición vinícola y su herencia ecuestre. Sus calles combinan arquitectura señorial con influencias árabes. Es famoso por sus bodegas de vino, el flamenco y la cría del caballo andaluz, siendo un importante referente cultural de Andalucía.',
'https://images.pexels.com/photos/34255929/pexels-photo-34255929.jpeg', 'cultural', 7.50, 'Jerez de la Frontera', '11020', 12, 36.6860, -6.1370),

('Mezquita-Catedral de Córdoba',
'La Mezquita-Catedral de Córdoba es uno de los monumentos más importantes del mundo islámico y cristiano. Su bosque de columnas y arcos bicolores es único. Fue transformada en catedral tras la reconquista, conservando su estructura original. Representa la convivencia de culturas a lo largo de la historia.',
'https://images.pexels.com/photos/31779465/pexels-photo-31779465.jpeg', 'cultural', 10.00, 'Córdoba', '14021', 16, 37.8790, -4.7790),

('Medina Azahara',
'Medina Azahara fue una ciudad palatina construida en el siglo X por el califato de Córdoba. Hoy en ruinas, muestra la grandeza del poder islámico en la península. Sus restos incluyen palacios, mezquitas y jardines, siendo un importante yacimiento arqueológico declarado Patrimonio de la Humanidad.',
'https://upload.wikimedia.org/wikipedia/commons/7/79/Puerta_del_primer_ministro.JPG', 'cultural', 8.80, 'Córdoba', '14021', 16, 37.8858, -4.8678),

('Judería de Córdoba',
'La judería de Córdoba es un barrio histórico de origen medieval con calles estrechas, patios y sinagogas. Representa la convivencia de culturas cristiana, judía y musulmana en la ciudad. Es uno de los conjuntos urbanos mejor conservados de la época medieval en España.',
'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ab/Sinagoga_de_C%C3%B3rdoba_%28Espa%C3%B1a%29.jpg/1280px-Sinagoga_de_C%C3%B3rdoba_%28Espa%C3%B1a%29.jpg', 'cultural', 9.70, 'Córdoba', '14021', 16, 37.8798, -4.7833),

('Alhambra y Generalife',
'La Alhambra es un conjunto palaciego nazarí de gran belleza arquitectónica. Sus palacios, patios y jardines reflejan el esplendor del arte islámico en España. El Generalife, residencia de verano, complementa el conjunto con jardines y fuentes. Es uno de los monumentos más visitados del mundo.',
'https://images.pexels.com/photos/33524255/pexels-photo-33524255.jpeg', 'cultural', 10.00, 'Granada', '18087', 19, 37.1760, -3.5880),

('Albaicín',
'El Albaicín es un antiguo barrio árabe de Granada con calles estrechas, miradores y casas blancas. Conserva la esencia de la ciudad medieval islámica. Desde sus miradores se obtienen vistas únicas de la Alhambra. Es un lugar lleno de historia, cultura y tradición andalusí.',
'https://images.pexels.com/photos/35566807/pexels-photo-35566807.jpeg', 'cultural', 8.80, 'Granada', '18087', 19, 37.1820, -3.5950),

('Catedral de Granada',
'La Catedral de Granada es una obra maestra del Renacimiento español. Su construcción comenzó en el siglo XVI sobre la antigua mezquita mayor. Destaca por su fachada monumental y su interior luminoso, siendo un símbolo del poder cristiano tras la reconquista de la ciudad. En su interior descansan los restos de los Reyes Católicos',
'https://images.pexels.com/photos/15202401/pexels-photo-15202401.jpeg', 'cultural', 9.70, 'Granada', '18087', 19, 37.1761, -3.5995),

('Monasterio de La Rábida',
'El Monasterio de La Rábida está ligado al descubrimiento de América, ya que aquí Cristóbal Colón encontró apoyo para su viaje. Su arquitectura combina estilos gótico y mudéjar. Es un lugar histórico de gran relevancia en la historia de la exploración y expansión española.',
'https://upload.wikimedia.org/wikipedia/commons/9/99/Rabida1.jpg', 'cultural', 9.60, 'Palos de la Frontera', '21055', 22, 37.2076, -6.9257),

('Lugares colombinos de Palos de la Frontera',
'Este conjunto histórico incluye lugares relacionados con el viaje de Colón a América, como el puerto de partida de las carabelas. Es un enclave fundamental en la historia de los descubrimientos, con gran valor cultural y simbólico para la navegación y la historia mundial.',
'https://upload.wikimedia.org/wikipedia/commons/4/48/LaNi%C3%B1a.jpg', 'cultural', 9.70, 'Palos de la Frontera', '21055', 22, 37.2114, -6.9281),

('Catedral de Jaén',
'La Catedral de Jaén es una de las principales obras del Renacimiento andaluz. Su diseño influyó en otras catedrales de América. Destaca por su fachada monumental y su interior armonioso, siendo un referente arquitectónico y religioso de la ciudad.',
'https://images.pexels.com/photos/35340130/pexels-photo-35340130.jpeg', 'cultural', 8.60, 'Jaén', '23050', 25, 37.7649, -3.7904),

('Úbeda y Baeza',
'Úbeda y Baeza son dos ciudades renacentistas declaradas Patrimonio de la Humanidad. Conservan palacios, iglesias y plazas de gran valor histórico. Su conjunto arquitectónico refleja la importancia del Renacimiento en Andalucía y su influencia en la arquitectura urbana española.',
'https://images.pexels.com/photos/35282549/pexels-photo-35282549.jpeg', 'cultural', 7.90, 'Úbeda', '23092', 25, 38.0100, -3.3700),

('Alcazaba de Málaga',
'La Alcazaba de Málaga es una fortaleza palaciega de origen musulmán situada en una colina estratégica. Sus murallas, jardines y patios reflejan la arquitectura defensiva andalusí. Está conectada con el Castillo de Gibralfaro, formando un importante conjunto histórico de la ciudad.',
'https://images.pexels.com/photos/26754747/pexels-photo-26754747.jpeg', 'cultural', 8.70, 'Málaga', '29067', 32, 36.7209, -4.4162),

('Teatro Romano de Málaga',
'El Teatro Romano de Málaga es un importante vestigio de la época imperial romana. Situado a los pies de la Alcazaba, muestra la importancia de la ciudad en la antigüedad. Sus restos han sido restaurados y forman parte del patrimonio arqueológico urbano.',
'https://images.pexels.com/photos/35183585/pexels-photo-35183585.jpeg', 'cultural', 9.60, 'Málaga', '29067', 32, 36.7212, -4.4170),

('Centro histórico de Ronda',
'El centro histórico de Ronda se encuentra sobre un impresionante tajo que divide la ciudad. Sus calles empedradas, puentes y edificios históricos reflejan siglos de historia. Es uno de los pueblos más emblemáticos de Andalucía por su ubicación y su riqueza cultural.',
'https://images.pexels.com/photos/17589484/pexels-photo-17589484.jpeg', 'cultural', 8.80, 'Ronda', '29084', 32, 36.7420, -5.1660),

('Catedral de Sevilla',
'La Catedral de Sevilla es el mayor templo gótico del mundo y uno de los monumentos más importantes de España. Colindate con el Archivo de Indias, destaca por su enorme nave central, retablos dorados y la Giralda, antiguo alminar almohade convertido en campanario. Es Patrimonio de la Humanidad, sitio de reposo de los restos de Cristóbal Colón y símbolo del esplendor histórico de la ciudad.',
'https://images.pexels.com/photos/34266016/pexels-photo-34266016.jpeg', 'cultural', 10.00, 'Sevilla', '41091', 41, 37.3851, -5.9930),

('Real Alcázar de Sevilla',
'El Real Alcázar de Sevilla es un palacio real en uso, con origen en la época islámica y ampliaciones posteriores cristianas. Su arquitectura mudéjar, patios decorados y jardines lo convierten en uno de los conjuntos palaciegos más bellos de Europa. Ha sido escenario de numerosas producciones históricas.',
'https://images.pexels.com/photos/36481634/pexels-photo-36481634.jpeg', 'cultural', 10.00, 'Sevilla', '41091', 41, 37.3836, -5.9910),

('Plaza de España',
'La Plaza de España de Sevilla es un conjunto monumental construido para la Exposición Iberoamericana de 1929. Combina estilos renacentista y regionalista, con un gran edificio semicircular, canales navegables y puentes decorativos. Representa la arquitectura monumental del siglo XX en España.',
'https://images.pexels.com/photos/27379390/pexels-photo-27379390.jpeg', 'cultural', 9.90, 'Sevilla', '41091', 41, 37.3773, -5.9869),

('Ciudadela de Jaca',
'La Ciudadela de Jaca, también conocida como Castillo de San Pedro, es una fortaleza pentagonal del siglo XVI construida por orden de Felipe II. Destaca por su excelente estado de conservación, sus fosos y baluartes defensivos, así como por albergar un museo de miniaturas militares. Es uno de los ejemplos más importantes de arquitectura militar renacentista en España.',
'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Ciudadela_Jaca_Vista_Aerea.JPG/1280px-Ciudadela_Jaca_Vista_Aerea.JPG', 'cultural', 7.60, 'Jaca', '22130', 23, 42.5725, -0.5523),

('Monasterio Viejo de San Juan de la Peña',
'El Monasterio Viejo de San Juan de la Peña está parcialmente excavado bajo una roca en los Pirineos. Es un conjunto medieval de gran importancia histórica, ligado a la Corona de Aragón. Su arquitectura románica y su entorno natural lo convierten en un lugar único y lleno de simbolismo religioso.',
'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Claustro_de_San_Juan_de_la_Pe%C3%B1a_10.jpg/1280px-Claustro_de_San_Juan_de_la_Pe%C3%B1a_10.jpg', 'cultural', 8.80, 'Santa Cilia', '22208', 23, 42.5078, -0.6727),

('Arquitectura mudéjar de Teruel',
'El mudéjar de Teruel es un conjunto de torres, iglesias y techos decorados con cerámica y ladrillo. Representa la fusión entre arte cristiano e islámico en la Edad Media. Es Patrimonio de la Humanidad y uno de los mejores ejemplos de este estilo arquitectónico en España.',
'https://images.pexels.com/photos/32200040/pexels-photo-32200040.jpeg', 'cultural', 8.70, 'Teruel', '44216', 44, 40.3441, -1.1092),

('Plaza del Torico',
'La Plaza del Torico es el centro histórico de Teruel. Su pequeño monumento del toro es símbolo de la ciudad. Rodeada de edificios modernistas, es un punto de encuentro social y cultural. Refleja la evolución urbana y la identidad local de Teruel.',
'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d6/Plaza_del_torico_Teruel.jpg/1920px-Plaza_del_torico_Teruel.jpg', 'cultural', 7.40, 'Teruel', '44216', 44, 40.3427, -1.1071),

('Basílica del Pilar',
'La Basílica del Pilar en Zaragoza es uno de los templos barrocos más importantes de España. Según la tradición, la Virgen María se apareció aquí al apóstol Santiago. Su gran conjunto arquitectónico junto al Ebro la convierte en un símbolo religioso y cultural de Aragón.',
'https://images.pexels.com/photos/36914150/pexels-photo-36914150.jpeg', 'cultural', 9.90, 'Zaragoza', '50297', 50, 41.6568, -0.8783),

('La Seo del Salvador',
'La Seo del Salvador es una catedral con mezcla de estilos románico, gótico, mudéjar y barroco. Situada en Zaragoza, refleja la evolución histórica de la ciudad. Su riqueza artística y su valor arquitectónico la convierten en uno de los templos más importantes de Aragón.',
'https://upload.wikimedia.org/wikipedia/commons/thumb/4/45/La_Seo-Zaragoza_-_P1410404.jpg/960px-La_Seo-Zaragoza_-_P1410404.jpg', 'cultural', 8.70, 'Zaragoza', '50297', 50, 41.6545, -0.8758),

('Palacio de la Aljafería',
'El Palacio de la Aljafería es una fortaleza islámica del siglo XI que posteriormente fue residencia de reyes cristianos. Su arquitectura combina elementos defensivos y decorativos islámicos. Hoy alberga las Cortes de Aragón y es uno de los mejores palacios andalusíes conservados fuera de Andalucía.',
'https://images.pexels.com/photos/37265676/pexels-photo-37265676.jpeg', 'cultural', 7.90, 'Zaragoza', '50297', 50, 41.6560, -0.8969),

('Santa María del Naranco y San Miguel de Lillo',
'Estos monumentos prerrománicos situados en Oviedo son ejemplos únicos del arte asturiano del siglo IX. Santa María del Naranco fue originalmente un palacio real, mientras que San Miguel de Lillo es una iglesia. Ambos destacan por su valor histórico y arquitectónico en la Europa altomedieval.',
'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e4/Santa_Mar%C3%ADa_del_Naranco_2021.jpg/1280px-Santa_Mar%C3%ADa_del_Naranco_2021.jpg', 'cultural', 7.80, 'Oviedo', '33044', 6, 43.3791, -5.8659),

('Catedral de Oviedo',
'La Catedral de Oviedo es un templo gótico construido sobre estructuras prerrománicas. Destaca su torre, su cámara santa y su importancia en el Camino de Santiago. Es uno de los principales símbolos religiosos y culturales del Principado de Asturias.',
'https://images.pexels.com/photos/29569253/pexels-photo-29569253.jpeg', 'cultural', 7.70, 'Oviedo', '33044', 6, 43.3624, -5.8437),

('Santuario y basílica de Covadonga',
'El Santuario de Covadonga está ubicado en un entorno natural de gran belleza en los Picos de Europa. Es un lugar clave en la historia de la Reconquista, donde se inició el Reino de Asturias. Su basílica y la Santa Cueva, en donde reposan los restos de don Pelayo atraen a miles de visitantes cada año.',
'https://images.pexels.com/photos/13841017/pexels-photo-13841017.jpeg', 'cultural', 9.90, 'Cangas de Onís', '33012', 6, 43.3082, -5.0544),

('Catedral de Palma de Mallorca',
'La Catedral de Palma, conocida como La Seu, es un imponente templo gótico situado frente al mar. Su gran rosetón y su altura la convierten en una de las catedrales más espectaculares del Mediterráneo. Ha sido reformada por artistas como Gaudí.',
'https://images.pexels.com/photos/19765749/pexels-photo-19765749.jpeg', 'cultural', 8.90, 'Palma', '07040', 24, 39.5674, 2.6481),

('Casco histórico de Palma',
'El casco histórico de Palma combina arquitectura medieval, patios señoriales y calles estrechas. Refleja la historia de la ciudad desde la época islámica hasta la actualidad. Es un espacio lleno de vida cultural, comercio y patrimonio arquitectónico.',
'https://images.pexels.com/photos/33189503/pexels-photo-33189503.jpeg', 'cultural', 9.70, 'Palma', '07040', 24, 39.5695, 2.6502),

('Dalt Vila',
'Dalt Vila es el casco antiguo amurallado de Ibiza, declarado Patrimonio de la Humanidad. Sus murallas renacentistas y calles empedradas ofrecen vistas al mar Mediterráneo. Es un conjunto histórico que refleja la importancia estratégica de la isla a lo largo de la historia.',
'https://images.pexels.com/photos/29042003/pexels-photo-29042003.jpeg', 'cultural', 8.80, 'Ibiza', '07026', 24, 38.907, 1.4361),

('San Cristóbal de La Laguna',
'San Cristóbal de La Laguna es una ciudad canaria declarada Patrimonio de la Humanidad por su trazado urbano sin murallas, que sirvió de modelo para ciudades coloniales en América. Sus calles rectas, casas coloridas y patrimonio religioso destacan su valor histórico.',
'https://images.pexels.com/photos/6726445/pexels-photo-6726445.jpeg', 'cultural', 8.80, 'San Cristóbal de La Laguna', '38023', 39, 28.4874, -16.315),

('Basílica de Candelaria',
'La Basílica de Candelaria es un importante centro religioso en Tenerife dedicado a la patrona de Canarias. Su arquitectura moderna y su ubicación junto al mar la convierten en un lugar de peregrinación y gran importancia cultural para el archipiélago.',
'https://images.pexels.com/photos/34779460/pexels-photo-34779460.jpeg', 'cultural', 7.60, 'Candelaria', '38011', 39, 28.3512, -16.3695),

('Catedral de Santa Ana',
'La Catedral de Santa Ana en Las Palmas es el principal templo de Gran Canaria. Su construcción se prolongó durante siglos, lo que explica su mezcla de estilos gótico, renacentista y neoclásico. Es un símbolo religioso y arquitectónico de la ciudad.',
'https://images.pexels.com/photos/23547696/pexels-photo-23547696.jpeg', 'cultural', 7.70, 'Las Palmas de Gran Canaria', '35016', 28, 28.1009, -15.4146),

('Vegueta',
'Vegueta es el barrio histórico de Las Palmas de Gran Canaria. Conserva calles empedradas, casas coloniales y edificios históricos como la Casa de Colón. Es el núcleo fundacional de la ciudad y un importante centro cultural y turístico.',
'https://images.pexels.com/photos/31935468/pexels-photo-31935468.jpeg', 'cultural', 7.70, 'Las Palmas de Gran Canaria', '35016', 28, 28.1005, -15.4138),

('Cueva de Altamira',
'La Cueva de Altamira es uno de los conjuntos de arte rupestre más importantes del mundo. Sus pinturas paleolíticas, especialmente los bisontes, tienen más de 14.000 años de antigüedad. Aunque la cueva original está restringida, su valor histórico y artístico es incalculable, siendo Patrimonio de la Humanidad.',
'https://upload.wikimedia.org/wikipedia/commons/2/23/12_Vista_general_del_techo_de_pol%C3%ADcromos.jpg', 'cultural', 10.00, 'Santillana del Mar', '39076', 13, 43.3776, -4.1197),

('Santillana del Mar',
'Santillana del Mar es un conjunto histórico medieval perfectamente conservado en Cantabria. Sus calles empedradas, casonas señoriales y arquitectura románica la convierten en uno de los pueblos más bellos de España. Destaca su ambiente medieval y su gran valor patrimonial.',
'https://upload.wikimedia.org/wikipedia/commons/thumb/7/78/Santillana_del_Mar_-_Colegiata_de_Santa_Juliana%2C_exterior_02.jpg/1280px-Santillana_del_Mar_-_Colegiata_de_Santa_Juliana%2C_exterior_02.jpg', 'cultural', 7.70, 'Santillana del Mar', '39076', 13, 43.3880, -4.1090),

('Palacio de la Magdalena',
'El Palacio de la Magdalena en Santander fue residencia estival de la familia real española. Su arquitectura mezcla estilos inglés y montañés, situado en una península con vistas al mar Cantábrico. Hoy es un importante centro cultural y universitario.',
'https://images.pexels.com/photos/16212265/pexels-photo-16212265.jpeg', 'cultural', 7.60, 'Santander', '39075', 13, 43.4693, -3.7656),

('Catedral de Toledo',
'La Catedral de Toledo es una de las obras maestras del gótico español. Su interior alberga importantes obras de arte y una impresionante sacristía. Es símbolo del poder religioso de la ciudad, que fue capital de España durante siglos y centro de convivencia de culturas.',
'https://images.pexels.com/photos/37389628/pexels-photo-37389628.jpeg', 'cultural', 10.00, 'Toledo', '45168', 45, 39.8569, -4.0244),

('Alcázar de Toledo',
'El Alcázar de Toledo es una fortaleza situada en lo alto de la ciudad con gran importancia histórica y militar. Ha sido reconstruido tras diversos conflictos. Actualmente alberga el Museo del Ejército y es uno de los símbolos más representativos de la ciudad.',
'https://images.pexels.com/photos/20416952/pexels-photo-20416952.jpeg', 'cultural', 8.80, 'Toledo', '45168', 45, 39.8581, -4.0206),

('Sinagoga del Tránsito',
'La Sinagoga del Tránsito es un importante ejemplo del arte sefardí medieval. Su interior destaca por la rica decoración mudéjar con inscripciones hebreas. Es un testimonio de la convivencia de culturas en la Toledo medieval.',
'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e3/Sinagoga_del_Tr%C3%A1nsito_-_Sala_Oraci%C3%B3n.jpg/1280px-Sinagoga_del_Tr%C3%A1nsito_-_Sala_Oraci%C3%B3n.jpg', 'cultural', 8.70, 'Toledo', '45168', 45, 39.8558, -4.0293),

('Casas Colgadas de Cuenca',
'Las Casas Colgadas son el símbolo más famoso de Cuenca. Construidas sobre la hoz del río Huécar, parecen suspendidas en el vacío. Su arquitectura medieval y su ubicación extrema las convierten en una imagen icónica del patrimonio español.',
'https://images.pexels.com/photos/36258303/pexels-photo-36258303.jpeg', 'cultural', 9.80, 'Cuenca', '16078', 17, 40.0779, -2.1285),

('Catedral de Cuenca',
'La Catedral de Cuenca es uno de los primeros ejemplos del gótico en España. Su fachada fue reformada tras su derrumbe parcial, dando lugar a un estilo único. Su interior combina diferentes épocas y estilos arquitectónicos.',
'https://images.pexels.com/photos/33292985/pexels-photo-33292985.jpeg', 'cultural', 7.70, 'Cuenca', '16078', 17, 40.0786, -2.1293),

('Castillo de Calatrava la Nueva',
'El Castillo de Calatrava la Nueva es una fortaleza medieval situada en lo alto de un cerro. Fue sede de la Orden de Calatrava y un importante enclave militar durante la Reconquista. Su ubicación estratégica lo convierte en un conjunto impresionante.',
'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ef/Exterior_del_castillo_de_Calatrava--7.jpg/1280px-Exterior_del_castillo_de_Calatrava--7.jpg', 'cultural', 8.60, 'Aldea del Rey', '13009', 15, 38.6663, -3.8451),

('Palacio del Infantado',
'El Palacio del Infantado en Guadalajara es uno de los mejores ejemplos del estilo gótico-isabelino en España. Su fachada decorada y patios interiores lo convierten en una obra arquitectónica destacada del Renacimiento castellano.',
'https://upload.wikimedia.org/wikipedia/commons/thumb/7/75/Palacio_del_Infantado.jpg/1280px-Palacio_del_Infantado.jpg', 'cultural', 7.70, 'Guadalajara', '19130', 20, 40.6358, -3.1686),

('Catedral de San Juan Bautista',
'La Catedral de Albacete, dedicada a San Juan Bautista, combina estilos neogótico y neorrománico. Es el principal templo religioso de la ciudad y un referente arquitectónico de su desarrollo urbano moderno.',
'https://images.pexels.com/photos/14768057/pexels-photo-14768057.jpeg', 'cultural', 7.50, 'Albacete', '02003', 3, 38.9958, -1.8562),

('Muralla de Ávila',
'La Muralla de Ávila es uno de los recintos amurallados medievales mejor conservados del mundo. Rodeada completamente el casco histórico de la ciudad y cuenta con numerosas torres y puertas defensivas. Es Patrimonio de la Humanidad.',
'https://images.pexels.com/photos/29346989/pexels-photo-29346989.jpeg', 'cultural',10.00, 'Ávila', '05019', 7, 40.6574, -4.7072),

('Catedral de Ávila',
'La Catedral de Ávila es considerada la primera catedral gótica de España. Integrada en la muralla, tiene un carácter defensivo único. Su estructura combina función religiosa y militar en un mismo edificio.',
'https://images.pexels.com/photos/35651436/pexels-photo-35651436.jpeg', 'cultural', 8.70, 'Ávila', '05019', 7, 40.6558, -4.6970),

('Catedral de Burgos',
'La Catedral de Burgos es una de las joyas del gótico europeo. Su impresionante fachada, torres y capillas interiores la convierten en un referente arquitectónico. Es Patrimonio de la Humanidad y símbolo de la ciudad.',
'https://images.pexels.com/photos/19925021/pexels-photo-19925021.jpeg', 'cultural', 10.00, 'Burgos', '09059', 10, 42.3408, -3.7042),

('Cartuja de Miraflores',
'La Cartuja de Miraflores es un monasterio gótico situado en Burgos. Destaca por su retablo y los sepulcros reales de gran calidad artística. Es un ejemplo destacado del arte religioso del siglo XV.',
'https://upload.wikimedia.org/wikipedia/commons/thumb/6/68/Cartuja_de_Miraflores.JPG/1280px-Cartuja_de_Miraflores.JPG', 'cultural', 7.70, 'Burgos', '09059', 10, 42.3381, -3.6558),

('Catedral de León',
'La Catedral de León es conocida por sus impresionantes vidrieras góticas que llenan el interior de luz colorida. Es uno de los mejores ejemplos del gótico clásico en España y un referente del arte medieval europeo.',
'https://images.pexels.com/photos/35238332/pexels-photo-35238332.jpeg', 'cultural', 10.00, 'León', '24089', 28, 42.5995, -5.5665),

('Basílica de San Isidoro',
'La Basílica de San Isidoro es un conjunto románico de gran importancia en León. Destaca su Panteón de los Reyes, conocido como la "Capilla Sixtina del Románico" por sus frescos medievales.',
'https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/20060626-Le%C3%B3n_San_Isidoro.jpg/1280px-20060626-Le%C3%B3n_San_Isidoro.jpg', 'cultural', 9.80, 'León', '24089', 28, 42.6006, -5.5707),

('Universidad de Salamanca',
'La Universidad de Salamanca es una de las más antiguas de Europa, fundada en el siglo XIII. Su fachada plateresca es una obra maestra del Renacimiento español. Es un símbolo del conocimiento y la educación en España.',
'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e5/University_of_Salamanca_Fray_Luis_de_Leon_edited.jpg/1280px-University_of_Salamanca_Fray_Luis_de_Leon_edited.jpg', 'cultural', 10.00, 'Salamanca', '37274', 38, 40.9616, -5.6666),

('Plaza Mayor de Salamanca',
'La Plaza Mayor de Salamanca es uno de los espacios barrocos más bellos de España. Es el centro social de la ciudad y está rodeada de soportales y edificios históricos decorados con medallones.',
'https://images.pexels.com/photos/33687518/pexels-photo-33687518.jpeg', 'cultural', 9.90, 'Salamanca', '37274', 38, 40.965, -5.6641),

('Acueducto de Segovia',
'El Acueducto de Segovia es una de las obras de ingeniería romana mejor conservadas del mundo. Sus arcos transportaban agua a la ciudad sin necesidad de mortero en su construcción. Es símbolo de Segovia.',
'https://images.pexels.com/photos/30327851/pexels-photo-30327851.jpeg', 'cultural', 10.00, 'Segovia', '40194', 40, 40.9479, -4.1182),

('Alcázar de Segovia',
'El Alcázar de Segovia es uno de los castillos más emblemáticos de España, situado sobre un promontorio rocoso entre los ríos Eresma y Clamores. Su silueta inspiró castillos de cuento. Ha sido fortaleza, palacio real y prisión, destacando su arquitectura medieval y su mezcla de estilos a lo largo de los siglos.',
'https://images.pexels.com/photos/10157041/pexels-photo-10157041.jpeg', 'cultural', 10.00, 'Segovia', '40194', 40, 40.9526, -4.1327),

('Iglesia de San Pablo',
'La Iglesia de San Pablo en Valladolid es un magnífico ejemplo del gótico isabelino español. Su fachada es una de las más ornamentadas del país, con abundante decoración escultórica. Ha sido escenario de importantes eventos históricos relacionados con la monarquía española.',
'https://images.pexels.com/photos/16794937/pexels-photo-16794937.jpeg', 'cultural', 7.70, 'Valladolid', '47186', 47, 41.6572, -4.7246),

('Museo Nacional de Escultura',
'El Museo Nacional de Escultura de Valladolid alberga una de las colecciones más importantes de escultura policromada española. Sus obras abarcan desde la Edad Media hasta el Barroco, destacando piezas de gran realismo y valor artístico.',
'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Colegio_de_San_Gregorio_en_Valladolid.jpg/960px-Colegio_de_San_Gregorio_en_Valladolid.jpg', 'cultural', 7.80, 'Valladolid', '47186', 47, 41.6574, -4.7235),

('Catedral de Zamora',
'La Catedral de Zamora es un destacado ejemplo del románico español con elementos bizantinos en su cúpula. Su estructura sobria y robusta refleja la arquitectura religiosa del siglo XII. Es uno de los principales monumentos de la ciudad.',
'https://images.pexels.com/photos/33669085/pexels-photo-33669085.jpeg', 'cultural', 8.70, 'Zamora', '49275', 49, 41.4991, -5.7548),

('Casco histórico de Zamora',
'El casco histórico de Zamora conserva numerosas iglesias románicas, murallas y calles medievales. Es uno de los conjuntos urbanos mejor preservados de España, reflejando la importancia estratégica de la ciudad durante la Edad Media.',
'https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Zamora_-_Castillo_05.jpg/1280px-Zamora_-_Castillo_05.jpg', 'cultural', 7.60, 'Zamora', '49275', 49, 41.4997, -5.7555),

('Sagrada Familia',
'La Sagrada Familia de Barcelona es la obra maestra inacabada de Antoni Gaudí. Su arquitectura combina formas naturales, simbolismo religioso y técnicas innovadoras. Es uno de los monumentos más visitados del mundo y Patrimonio de la Humanidad.',
'https://images.pexels.com/photos/35971292/pexels-photo-35971292.jpeg', 'cultural', 10.00, 'Barcelona', '08019', 9, 41.4036, 2.1744),

('Parque Güell',
'El Parque Güell es una de las creaciones más emblemáticas de Gaudí. Combina arquitectura y naturaleza con formas orgánicas, mosaicos coloridos y estructuras imaginativas. Es Patrimonio de la Humanidad y símbolo del modernismo catalán.',
'https://images.pexels.com/photos/35792769/pexels-photo-35792769.jpeg', 'cultural', 9.90, 'Barcelona', '08019', 9, 41.4145, 2.1527),

('Barrio Gótico',
'El Barrio Gótico de Barcelona es el núcleo histórico de la ciudad, con calles estrechas, plazas medievales y edificios históricos. Conserva restos romanos y estructuras góticas que reflejan la evolución de la ciudad a lo largo de los siglos.',
'https://images.pexels.com/photos/16428962/pexels-photo-16428962.jpeg', 'cultural', 8.80, 'Barcelona', '08019', 9, 41.3825, 2.1769),

('Barrio judío de Girona',
'El Call Jueu de Girona es uno de los barrios judíos mejor conservados de Europa. Sus calles estrechas y empedradas reflejan la vida de la comunidad sefardí medieval. Es un importante testimonio histórico de la convivencia cultural.',
'https://images.pexels.com/photos/28937232/pexels-photo-28937232.jpeg', 'cultural', 7.70, 'Girona', '17079', 18, 41.9870, 2.8250),

('Catedral de Girona',
'La Catedral de Girona destaca por su impresionante nave gótica, la más ancha del mundo en su estilo. Su escalinata monumental domina la ciudad. Combina estilos románico, gótico y barroco en un mismo edificio histórico.',
'https://images.pexels.com/photos/36639285/pexels-photo-36639285.jpeg', 'cultural', 9.90, 'Girona', '17079', 18, 41.9872, 2.8262),

('Anfiteatro romano de Tarragona',
'El anfiteatro romano de Tarragona está situado junto al mar y fue utilizado para espectáculos en la época imperial. Sus restos muestran la importancia de Tarraco como capital de la Hispania romana. Es Patrimonio de la Humanidad.',
'https://images.pexels.com/photos/6113162/pexels-photo-6113162.jpeg', 'cultural', 8.80, 'Tarragona', '43148', 43, 41.1145, 1.2588),

('Acueducto de les Ferreres',
'El Acueducto de les Ferreres, conocido como Puente del Diablo, es una obra de ingeniería romana que abastecía de agua a Tarragona. Sus arcos perfectamente conservados lo convierten en un ejemplo destacado de la ingeniería antigua.',
'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1f/Les_Ferreres_Aqueduct%2C_built_in_the_1st_century_AD_to_supply_water_to_the_ancient_city_of_Tarraco%2C_Spain_-_52635720275.jpg/3840px-Les_Ferreres_Aqueduct%2C_built_in_the_1st_century_AD_to_supply_water_to_the_ancient_city_of_Tarraco%2C_Spain_-_52635720275.jpg', 'cultural', 7.70, 'Tarragona', '43148', 43, 41.1462, 1.2437),

('Muralla romana de Tarragona',
'La muralla romana de Tarragona es una de las estructuras defensivas más antiguas de Hispania. Parte de sus tramos originales aún se conservan, mostrando la importancia estratégica de la ciudad en la época romana.',
'https://upload.wikimedia.org/wikipedia/commons/thumb/d/de/Muralles_romanes_%28Tarragona%29_-_4.jpg/1920px-Muralles_romanes_%28Tarragona%29_-_4.jpg', 'cultural', 8.60, 'Tarragona', '43148', 43, 41.1189, 1.2551),

('Seu Vella de Lleida',
'La Seu Vella es la antigua catedral de Lleida, situada en lo alto de una colina. Su arquitectura mezcla estilos románico y gótico. Fue convertida en fortaleza militar en épocas posteriores, lo que añade valor histórico al conjunto.',
'https://images.pexels.com/photos/20703912/pexels-photo-20703912.jpeg', 'cultural', 8.80, 'Lleida', '25120', 29, 41.6181, 0.6272),

('Ciudad de las Artes y las Ciencias',
'Este complejo arquitectónico en Valencia combina ciencia, arte y tecnología. Diseñado por Santiago Calatrava, incluye museos, acuario y espacios culturales futuristas. Es uno de los iconos modernos más importantes de España.',
'https://images.pexels.com/photos/33560408/pexels-photo-33560408.jpeg', 'cultural', 10.00, 'Valencia', '46250', 46, 39.4549, -0.3502),

('Lonja de la Seda',
'La Lonja de la Seda de Valencia es un edificio gótico civil declarado Patrimonio de la Humanidad. Su Sala de Contratación y columnas helicoidales reflejan la riqueza comercial de la ciudad durante el siglo XV.',
'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9f/Fachada_de_la_Lonja_de_la_Seda_en_Valencia.jpg/1280px-Fachada_de_la_Lonja_de_la_Seda_en_Valencia.jpg', 'cultural', 9.90, 'Valencia', '46250', 46, 39.4746, -0.3783),

('Catedral de Valencia',
'La Catedral de Valencia combina estilos gótico, románico y barroco. Según la tradición, alberga el Santo Grial. Su torre del Miguelete es uno de los símbolos más reconocibles de la ciudad.',
'https://images.pexels.com/photos/30052216/pexels-photo-30052216.jpeg', 'cultural', 8.80, 'Valencia', '46250', 46, 39.4752, -0.3752),

('Torres de Serranos',
'Las Torres de Serranos son una de las antiguas puertas medievales de la ciudad de Valencia. Formaban parte de la muralla defensiva y hoy son uno de los principales símbolos históricos de la ciudad.',
'https://images.pexels.com/photos/14577102/pexels-photo-14577102.jpeg', 'cultural', 8.70, 'Valencia', '46250', 46, 39.4792, -0.3759),

('Torres de Quart',
'Las Torres de Quart son otra de las puertas medievales de Valencia. Presentan marcas de impactos de cañonazos de guerras históricas. Son un importante ejemplo de arquitectura militar gótica.',
'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9d/Torres_de_Cuart%2C_Valencia%2C_Espa%C3%B1a%2C_2014-06-30%2C_DD_89.JPG/960px-Torres_de_Cuart%2C_Valencia%2C_Espa%C3%B1a%2C_2014-06-30%2C_DD_89.JPG', 'cultural', 4.60, 'Valencia', '46250', 46, 39.4758, -0.3839),

('Castillo de Sagunto',
'El Castillo de Sagunto es una fortaleza de origen romano y medieval situada en una colina estratégica. Sus largas murallas ofrecen vistas panorámicas y reflejan la importancia histórica de la ciudad.',
'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Castillo_de_Sagunto%2C_Valencia%2C_Espa%C3%B1a%2C_2015-01-03%2C_DD_09-11_HDR.JPG/1920px-Castillo_de_Sagunto%2C_Valencia%2C_Espa%C3%B1a%2C_2015-01-03%2C_DD_09-11_HDR.JPG', 'cultural', 8.80, 'Sagunto', '46220', 46, 39.6757, -0.2768),

('Castillo de Santa Bárbara',
'El Castillo de Santa Bárbara en Alicante se alza sobre el monte Benacantil dominando toda la ciudad y el mar Mediterráneo. Su origen se remonta a época islámica y ha sido ampliado en distintas etapas históricas. Ofrece vistas panorámicas excepcionales y es uno de los símbolos más importantes del patrimonio alicantino.',
'https://images.pexels.com/photos/37564573/pexels-photo-37564573.jpeg', 'cultural', 8.80, 'Alicante', '03014', 4, 38.3491, -0.4777),

('Casco histórico de Alicante',
'El casco histórico de Alicante, conocido como El Barrio, destaca por sus calles estrechas, casas tradicionales y ambiente mediterráneo. Es una zona con gran vida social, bares y patrimonio religioso, reflejando la evolución urbana de la ciudad desde su origen hasta la actualidad.',
'https://images.pexels.com/photos/13127598/pexels-photo-13127598.jpeg', 'cultural', 7.50, 'Alicante', '03014', 4, 38.3452, -0.4830),

('Morella',
'Morella es una localidad medieval amurallada situada en Castellón. Su castillo en lo alto de la montaña domina el paisaje. Conserva calles empedradas, edificios históricos y una fuerte identidad cultural. Es uno de los pueblos más bonitos y representativos de la Comunidad Valenciana.',
'https://upload.wikimedia.org/wikipedia/commons/thumb/5/58/Morella_Panorama.jpg/1280px-Morella_Panorama.jpg', 'cultural', 8.80, 'Morella', '12080', 14, 40.6190, -0.0980),

('Ciudad vieja de Cáceres',
'La ciudad vieja de Cáceres es uno de los conjuntos medievales mejor conservados de Europa. Sus calles empedradas, palacios, torres y murallas reflejan la convivencia de estilos románico, gótico, islámico y renacentista. Es Patrimonio de la Humanidad.',
'https://images.pexels.com/photos/5215420/pexels-photo-5215420.jpeg', 'cultural', 10.00, 'Cáceres', '10037', 11, 39.4744, -6.3703),

('Alcazaba de Badajoz',
'La Alcazaba de Badajoz es una de las fortificaciones musulmanas más grandes de Europa. Construida en el siglo IX, domina la ciudad desde una posición estratégica. Sus murallas y torres reflejan la importancia militar de la región en la Edad Media.',
'https://images.pexels.com/photos/35750896/pexels-photo-35750896.jpeg', 'cultural', 7.70, 'Badajoz', '06015', 8, 38.8837, -6.9686),

('Teatro Romano de Mérida',
'El Teatro Romano de Mérida es uno de los conjuntos arqueológicos mejor conservados de Hispania. Construido en el siglo I a.C., sigue siendo utilizado para representaciones teatrales. Es Patrimonio de la Humanidad y símbolo del legado romano en España.',
'https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/Ancient_Roman_theatre_in_M%C3%A9rida_2023.jpg/1920px-Ancient_Roman_theatre_in_M%C3%A9rida_2023.jpg', 'cultural', 10.00, 'Mérida', '06083', 8, 38.9152, -6.3385),

('Anfiteatro Romano de Mérida',
'El anfiteatro romano de Mérida era utilizado para espectáculos de gladiadores y eventos públicos. Forma parte del conjunto arqueológico de Emerita Augusta y refleja la importancia de la ciudad en la época romana como capital de la provincia Lusitania.',
'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e2/VR_Merida_02-Amphitheatre.jpg/1280px-VR_Merida_02-Amphitheatre.jpg', 'cultural', 9.90, 'Mérida', '06083', 8, 38.9162, -6.3380),

('Puente Romano de Mérida',
'El Puente Romano de Mérida cruza el río Guadiana y es uno de los puentes antiguos más largos de la península. Construido en época romana, ha sido restaurado a lo largo de los siglos y sigue en uso, demostrando la durabilidad de la ingeniería romana.',
'https://images.pexels.com/photos/35883154/pexels-photo-35883154.jpeg', 'cultural', 8.80, 'Mérida', '06083', 8, 38.9135, -6.3504),

('Acueducto de los Milagros',
'El Acueducto de los Milagros en Mérida es una impresionante obra de ingeniería romana que abastecía de agua a la ciudad. Sus restos de arcos de ladrillo y piedra destacan por su altura y conservación parcial.',
'https://images.pexels.com/photos/36122743/pexels-photo-36122743.jpeg', 'cultural', 7.70, 'Mérida', '06083', 8, 38.9242, -6.3478),

('Arco de Trajano',
'El Arco de Trajano en Mérida es un arco monumental de época romana que probablemente formaba parte del acceso al foro provincial. Su estructura de granito refleja la importancia de la ciudad en la administración imperial romana.',
'https://images.pexels.com/photos/35750908/pexels-photo-35750908.jpeg', 'cultural', 7.60, 'Mérida', '06083', 8, 38.9177, -6.3463),

('Templo de Diana',
'El Templo de Diana en Mérida es un edificio religioso romano sorprendentemente bien conservado. A pesar de su nombre, estaba dedicado al culto imperial. Su estructura se integra en el casco urbano moderno de la ciudad.',
'https://images.pexels.com/photos/11142974/pexels-photo-11142974.jpeg', 'cultural', 8.80, 'Mérida', '06083', 8, 38.9163, -6.3442),

('Circo Romano de Mérida',
'El Circo Romano de Mérida era utilizado para carreras de carros y espectáculos públicos. Es uno de los circos mejor conservados de la Hispania romana, con capacidad para miles de espectadores.',
'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b9/VR_Merida_03-Circo_Romano.jpg/1280px-VR_Merida_03-Circo_Romano.jpg', 'cultural', 7.70, 'Mérida', '06083', 8, 38.9200, -6.3322),

('Alcazaba de Mérida',
'La Alcazaba de Mérida es una fortificación musulmana construida en el siglo IX sobre restos romanos. Su función era controlar el puente romano y el acceso a la ciudad. Es la alcazaba más antigua de la península ibérica.',
'https://upload.wikimedia.org/wikipedia/commons/thumb/a/af/Alcazaba_M%C3%A9rida_6639.jpg/1920px-Alcazaba_M%C3%A9rida_6639.jpg', 'cultural', 7.70, 'Mérida', '06083', 8, 38.9148, -6.3468),

('Conjunto histórico de Medellín',
'Medellín es un yacimiento arqueológico con restos romanos y medievales situado en Extremadura. Es conocido por ser el lugar de nacimiento de Hernán Cortés. Conserva un importante teatro romano y estructuras defensivas.',
'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Teatro_romano_y_castillo_de_Medell%C3%ADn.jpg/1920px-Teatro_romano_y_castillo_de_Medell%C3%ADn.jpg', 'cultural', 7.60, 'Medellín', '06080', 8, 38.9654, -5.9573),

('Conjunto histórico de Jerez de los Caballeros',
'Jerez de los Caballeros es una localidad histórica de Extremadura con origen templario. Destaca por sus torres barrocas, iglesias y murallas. Su conjunto urbano refleja la importancia militar y religiosa en la Edad Media.',
'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/Jerez_de_los_Caballeros_panoramica.jpg/1920px-Jerez_de_los_Caballeros_panoramica.jpg', 'cultural', 8.70, 'Jerez de los Caballeros', '06070', 8, 38.3190, -6.7720),

('Torre de Hércules',
'La Torre de Hércules en A Coruña es el faro romano en funcionamiento más antiguo del mundo. Construido en el siglo I, guía la navegación atlántica desde hace casi dos mil años. Es Patrimonio de la Humanidad.',
'https://images.pexels.com/photos/34546836/pexels-photo-34546836.jpeg', 'cultural', 10.00, 'A Coruña', '15030', 1, 43.3859, -8.4065),

('Catedral de Santiago de Compostela',
'La Catedral de Santiago de Compostela es el destino final del Camino de Santiago. Alberga el sepulcro del apóstol Santiago y es uno de los principales centros de peregrinación del cristianismo.',
'https://images.pexels.com/photos/11690250/pexels-photo-11690250.jpeg', 'cultural', 10.00, 'Santiago de Compostela', '15078', 1, 42.8806, -8.5446),

('Muralla romana de Lugo',
'La muralla romana de Lugo es la única del mundo que conserva intacto su perímetro completo. Rodea el casco histórico de la ciudad y es Patrimonio de la Humanidad por su excepcional estado de conservación.',
'https://upload.wikimedia.org/wikipedia/commons/thumb/3/38/Muralla.Lugo.Galicia.jpg/960px-Muralla.Lugo.Galicia.jpg', 'cultural', 9.90, 'Lugo', '27028', 30, 43.0088, -7.5590),

('Catedral de Ourense',
'La Catedral de Ourense es un templo románico-gótico con elements barrocos añadidos posteriormente. Destaca su Pórtico del Paraíso y su importancia religiosa en la historia de Galicia.',
'https://images.pexels.com/photos/27552167/pexels-photo-27552167.jpeg', 'cultural', 7.70, 'Ourense', '32054', 35, 42.3364, -7.8631),

('Casco histórico de Pontevedra',
'El casco histórico de Pontevedra es uno de los mejor conservados de Galicia. Sus plazas, calles peatonales y edificios históricos crean un entorno urbano de gran valor patrimonial y cultural.',
'https://images.pexels.com/photos/32645978/pexels-photo-32645978.jpeg', 'cultural', 8.80, 'Pontevedra', '36038', 37, 42.4320, -8.6440),

('Combarro',
'Combarro es un pequeño pueblo marinero gallego famoso por sus hórreos junto al mar y sus estrechas calles empedradas. Conserva una arquitectura tradicional muy bien preservada, vinculada a la vida pesquera y agrícola. Su conjunto histórico ofrece una imagen única del patrimonio popular gallego y de la relación histórica entre la población y la costa atlántica.',
'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/11082012-_DSC0263.jpg/1280px-11082012-_DSC0263.jpg', 'cultural', 7.80, 'Poio', '36041', 37, 42.4336, -8.7052),

('Palacio Real de Madrid',
'El Palacio Real de Madrid es la residencia oficial de la monarquía española para actos institucionales. Construido en el siglo XVIII sobre el antiguo Alcázar, destaca por sus salones decorados, colecciones artísticas y grandes dimensiones. Es uno de los palacios reales más grandes de Europa occidental y símbolo histórico del poder de la Corona española. Frente a él se encuentra la Catedral de la Almudena, que combina estilos neogótico y neoclásico, y es el templo principal de la ciudad.',
'https://images.pexels.com/photos/37222799/pexels-photo-37222799.jpeg', 'cultural', 10.00, 'Madrid', '28079', 31, 40.418, -3.7143),

('Museo del Prado',
'El Museo del Prado alberga una de las colecciones de pintura europea más importantes del mundo. Sus salas reúnen obras maestras de artistas como Velázquez, Goya, El Bosco o Rubens. Fundado en el siglo XIX, es una referencia internacional para la historia del arte y uno de los museos más visitados de España.',
'https://images.pexels.com/photos/32380245/pexels-photo-32380245.jpeg', 'cultural', 10.00, 'Madrid', '28079', 31, 40.4138, -3.6921),

('Plaza Mayor de Madrid',
'La Plaza Mayor de Madrid es uno de los espacios urbanos más emblemáticos de la capital española. Rodeada de edificios porticados y presidida por la estatua de Felipe III, ha sido escenario de mercados, celebraciones y actos públicos desde el siglo XVII. Actualmente es un importante centro turístico y cultural.',
'https://images.pexels.com/photos/16121408/pexels-photo-16121408.jpeg', 'cultural', 8.80, 'Madrid', '28079', 31, 40.4154, -3.7074),

('Monasterio de San Lorenzo de El Escorial',
'El Monasterio de San Lorenzo de El Escorial fue construido en el siglo XVI por orden de Felipe II. Combina funciones de monasterio, palacio, biblioteca y panteón real. Su arquitectura renacentista refleja el poder de la monarquía española y su importancia política y religiosa durante el Siglo de Oro.',
'https://images.pexels.com/photos/5005160/pexels-photo-5005160.jpeg', 'cultural', 10.00, 'San Lorenzo de El Escorial', '28131', 31, 40.5891, -4.1477),

('Valle de Cuelgamuros',
'El Valle de Cuelgamuros, anteriormente conocido como Valle de los Caídos, es un conjunto monumental construido tras la Guerra Civil española. Destaca por su gran basílica excavada en la roca y una enorme cruz visible desde gran distancia. Es un lugar de relevancia histórica, política y patrimonial en la memoria contemporánea de España.',
'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/SPA-2014-San_Lorenzo_de_El_Escorial-Valley_of_the_Fallen_%28Valle_de_los_Ca%C3%ADdos%29.jpg/1280px-SPA-2014-San_Lorenzo_de_El_Escorial-Valley_of_the_Fallen_%28Valle_de_los_Ca%C3%ADdos%29.jpg', 'cultural', 7.20, 'San Lorenzo de El Escorial', '28131', 31, 40.6416, -4.1542),

('Catedral de Murcia',
'La Catedral de Murcia combina estilos gótico, renacentista y barroco debido a las diferentes etapas de construcción. Su fachada principal barroca es una de las más destacadas de España. La torre campanario domina el centro histórico y simboliza la importancia religiosa y cultural de la ciudad.',
'https://images.pexels.com/photos/13336102/pexels-photo-13336102.jpeg', 'cultural', 7.80, 'Murcia', '30030', 33, 37.9839, -1.1287),

('Teatro Romano de Cartagena',
'El Teatro Romano de Cartagena fue construido en el siglo I a.C. y descubierto parcialmente bajo edificios modernos. Su recuperación arqueológica ha permitido restaurar uno de los teatros romanos más importantes de Hispania. Refleja la relevancia de Carthago Nova durante el Imperio romano.',
'https://images.pexels.com/photos/29721382/pexels-photo-29721382.jpeg', 'cultural', 9.90, 'Cartagena', '30016', 33, 37.5993, -0.9844),

('Castillo de Lorca',
'El Castillo de Lorca es una gran fortaleza medieval situada sobre una colina estratégica. Sus murallas y torres reflejan la importancia defensiva de la ciudad durante siglos, especialmente en la frontera entre territorios cristianos y musulmanes. Actualmente es uno de los principales referentes históricos de Murcia.',
'https://images.pexels.com/photos/37440581/pexels-photo-37440581.jpeg', 'cultural', 7.70, 'Lorca', '30024', 33, 37.6775, -1.7066),

('Catedral de Pamplona',
'La Catedral de Pamplona combina elementos góticos y neoclásicos. Su claustro medieval es considerado uno de los más bellos de Europa. Ha sido escenario de coronaciones y actos históricos vinculados al antiguo Reino de Navarra, manteniendo gran relevancia cultural y religiosa.',
'https://images.pexels.com/photos/17836654/pexels-photo-17836654.jpeg', 'cultural', 8.70, 'Pamplona', '31201', 34, 42.8193, -1.6409),

('Castillo de Olite',
'El Castillo de Olite fue residencia de los reyes de Navarra durante la Edad Media. Su aspecto palaciego, con torres, patios y jardines, lo convierte en uno de los castillos más espectaculares de España. Refleja el esplendor de la corte navarra medieval.',
'https://images.pexels.com/photos/32470387/pexels-photo-32470387.jpeg', 'cultural', 9.90, 'Olite', '31191', 34, 42.4815, -1.6508),

('Roncesvalles',
'Roncesvalles es un enclave histórico y religioso situado en los Pirineos navarros, famoso por su relación con el Camino de Santiago y la batalla medieval de Roncesvalles. Su colegiata y entorno montañoso lo convierten en un lugar de gran valor espiritual y cultural.',
'https://images.pexels.com/photos/34161421/pexels-photo-34161421.jpeg', 'cultural', 9.70, 'Orreaga/Roncesvalles', '31211', 34, 43.0092, -1.3197),

('Catedral de Santa María',
'La Catedral de Santa María de Vitoria-Gasteiz destaca por su arquitectura gótica y por el proceso de restauración abierto al público que inspiró a escritores como Ken Follett. Su estructura monumental refleja la importancia histórica de la capital alavesa.',
'https://images.pexels.com/photos/32496959/pexels-photo-32496959.jpeg', 'cultural', 7.70, 'Vitoria-Gasteiz', '01059', 2, 42.8508, -2.6722),

('Parte Vieja de San Sebastián',
'La Parte Vieja de San Sebastián es el núcleo histórico de la ciudad, conocido por sus calles estrechas, plazas tradiciones y gran oferta gastronómica. Conserva edificios históricos y un ambiente urbano muy característico junto a la bahía de La Concha.',
'https://images.pexels.com/photos/28400311/pexels-photo-28400311.jpeg', 'cultural', 9.90, 'Donostia/San Sebastián', '20069', 21, 43.3236, -1.9849),

('Museo San Telmo',
'El Museo San Telmo de San Sebastián está dedicado a la sociedad y cultura vasca. Ubicado en un antiguo convento dominico, combina patrimonio histórico y arquitectura contemporánea. Sus colecciones muestran la evolución cultural del País Vasco a lo largo de los siglos.',
'https://upload.wikimedia.org/wikipedia/commons/3/36/San_Sebastian_-_San_Telmo_07.jpg', 'cultural', 7.60, 'Donostia/San Sebastián', '20069', 21, 43.3250, -1.9846),

('Puente de Bizkaia',
'El Puente de Bizkaia, también conocido como Puente Colgante, une las localidades de Portugalete y Getxo sobre la ría de Bilbao. Inaugurado en 1893, fue el primer puente transbordador metálico del mundo y sigue en funcionamiento como ejemplo destacado de ingeniería industrial.',
'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5f/Puente_de_Vizcaya%2C_detalle_--_2021_--_Portugalete%2C_Espa%C3%B1a.jpg/1920px-Puente_de_Vizcaya%2C_detalle_--_2021_--_Portugalete%2C_Espa%C3%B1a.jpg', 'cultural', 8.80, 'Portugalete', '48078', 48, 43.3232, -3.0172),

('Casco Viejo de Bilbao',
'El Casco Viejo de Bilbao conserva el trazado medieval original de la ciudad. Sus conocidas “Siete Calles” reúnen comercios, plazas y edificios históricos que muestran la evolución urbana y comercial de Bilbao desde la Edad Media hasta la actualidad.',
'https://upload.wikimedia.org/wikipedia/commons/1/1f/Casco_viejo.jpg', 'cultural', 8.70, 'Bilbao', '48020', 48, 43.2580, -2.9230),

('Monasterios de San Millán de la Cogolla',
'Los monasterios de Suso y Yuso, en San Millán de la Cogolla, son considerados la cuna del castellano por las Glosas Emilianenses. Su importancia histórica, religiosa y lingüística los convierte en un lugar fundamental para la cultura española.',
'https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Monasterio_de_San_Mill%C3%A1n_de_Yuso._Plaza_de_entrada.jpg/1920px-Monasterio_de_San_Mill%C3%A1n_de_Yuso._Plaza_de_entrada.jpg', 'cultural', 9.90, 'San Millán de la Cogolla', '26130', 26, 42.3257, -2.8651),

('Casco histórico de Logroño',
'El casco histórico de Logroño combina patrimonio medieval, tradición jacobea y cultura gastronómica. La Calle Laurel y las plazas históricas son parte esencial de la vida urbana. Su relación con el Camino de Santiago le otorga gran relevancia cultural.',
'https://images.pexels.com/photos/11021204/pexels-photo-11021204.jpeg', 'cultural', 7.60, 'Logroño', '26089', 26, 42.4660, -2.4450),

('Murallas Reales de Ceuta',
'Las Murallas Reales de Ceuta son un complejo defensivo construido para proteger la ciudad frente a ataques marítimos. Incluyen fosos navegables, baluartes y fortificaciones de distintas épocas. Reflejan la importancia estratégica de Ceuta entre Europa y África.',
'https://images.pexels.com/photos/31758954/pexels-photo-31758954.jpeg', 'cultural', 7.70, 'Ceuta', '51001', 51, 35.8887, -5.3175),

('Melilla la Vieja',
'Melilla la Vieja es el recinto histórico fortificado de la ciudad autónoma de Melilla. Sus murallas, baluartes y edificios militares reflejan siglos de importancia estratégica en el Mediterráneo. Conserva un importante patrimonio defensivo renacentista y ofrece vistas privilegiadas sobre la costa africana y el mar.',
'https://upload.wikimedia.org/wikipedia/commons/d/da/Frente_de_Tr%C3%A1pana%2C_Melilla%2C_Vista_%283528911560%29.jpg', 'cultural', 8.70, 'Melilla', '52001', 52, 35.2938, -2.9334),

('Puente de Alcántara',
'El Puente de Alcántara es una obra maestra de la ingeniería romana construida sobre el río Tajo en el siglo II. Destaca por su monumentalidad y excelente estado de conservación. Su estructura de piedra ha resistido guerras y reconstrucciones, convirtiéndose en uno de los puentes romanos más impresionantes de España.',
'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d5/Bridge_Alcantara.JPG/1280px-Bridge_Alcantara.JPG', 'cultural', 9.90, 'Alcántara', '10008', 11, 39.7222, -6.8924),

('El Burgo de Osma',
'El Burgo de Osma es una villa histórica soriana con importante patrimonio medieval y renacentista. Destacan su catedral, plazas porticadas y murallas. La localidad conserva un ambiente tradicional castellano y un trazado urbano que refleja su relevancia histórica como sede episcopal.',
'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a2/Ayun_burgo_lou.jpg/1280px-Ayun_burgo_lou.jpg', 'cultural', 8.60, 'Burgo de Osma-Ciudad de Osma', '42043', 42, 41.5855, -3.0713),

('Albarracín',
'Albarracín es una de las villas medievales más espectaculares de España, situada entre montañas y rodeada por murallas. Sus calles estrechas, casas rojizas y fortalezas reflejan la influencia musulmana y cristiana. El conjunto urbano conserva una estética medieval prácticamente intacta.',
'https://images.pexels.com/photos/19244399/pexels-photo-19244399.jpeg', 'cultural', 9.90, 'Albarracín', '44009', 44, 40.4074, -1.4429),

('Villa romana de La Olmeda',
'La Villa romana de La Olmeda es uno de los yacimientos arqueológicos romanos más importantes de España. Destaca por sus mosaicos excepcionalmente conservados y las estructuras de una gran residencia rural romana. Refleja el nivel de riqueza y sofisticación de la Hispania romana tardía.',
'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8c/Ancient_Roman_Mosaics_Villa_Romana_La_Olmeda_000_Pedrosa_De_La_Vega_-_Salda%C3%B1a_%28Palencia%29.JPG/1280px-Ancient_Roman_Mosaics_Villa_Romana_La_Olmeda_000_Pedrosa_De_La_Vega_-_Salda%C3%B1a_%28Palencia%29.JPG', 'cultural', 8.80, 'Pedrosa de la Vega', '34126', 36, 42.4814, -4.7371),

('Monasterio de San Miguel de los Reyes',
'El Monasterio de San Miguel de los Reyes en Valencia es un importante conjunto renacentista construido sobre un antiguo monasterio medieval. Su arquitectura monumental y sus claustros reflejan la influencia del Renacimiento italiano en España. Actualmente alberga la Biblioteca Valenciana.',
'https://upload.wikimedia.org/wikipedia/commons/thumb/5/52/Valencia_-_Monasterio_de_San_Miguel_de_los_Reyes_05_2017-05-01.jpg/1280px-Valencia_-_Monasterio_de_San_Miguel_de_los_Reyes_05_2017-05-01.jpg', 'cultural', 7.60, 'Valencia', '46250', 46, 39.4994, -0.3692),

('Museo Guggenheim Bilbao',
'El Museo Guggenheim Bilbao es uno de los edificios contemporáneos más influyentes del mundo. Diseñado por Frank Gehry, destaca por sus formas curvas revestidas de titanio. Ha transformado la imagen de Bilbao y se ha convertido en símbolo internacional de renovación urbana y cultural.',
'https://images.pexels.com/photos/10473377/pexels-photo-10473377.jpeg', 'cultural', 10.00, 'Bilbao', '48020', 48, 43.2687, -2.934),

('Puente Romano de Córdoba',
'El Puente Romano de Córdoba cruza el río Guadalquivir y conecta el casco histórico con la Torre de la Calahorra. Construido originalmente en época romana y reformado en distintas etapas, es uno de los símbolos más representativos de la ciudad y de su legado histórico.',
'https://upload.wikimedia.org/wikipedia/commons/thumb/0/01/Puente_Romano_Cordoba.jpg/1280px-Puente_Romano_Cordoba.jpg', 'cultural', 8.80, 'Córdoba', '14021', 16, 37.8769, -4.7781),

('Setas de Sevilla',
'Las Setas de Sevilla, oficialmente Metropol Parasol, son una gran estructura contemporánea de madera situada en la Plaza de la Encarnación. Su diseño moderno contrasta con el entorno histórico y alberga espacios culturales, mercado y miradores panorámicos sobre la ciudad.',
'https://images.pexels.com/photos/34150765/pexels-photo-34150765.jpeg', 'cultural', 7.60, 'Sevilla', '41091', 41, 37.3932, -5.9918),

('El Rocío',
'El Rocío es una aldea de Huelva conocida internacionalmente por su famosa romería y su santuario dedicado a la Virgen del Rocío. Sus calles de arena y arquitectura tradicional crean un entorno singular vinculado a la cultura andaluza, las tradiciones religiosas y la proximidad al entorno natural de Doñana.',
'https://images.pexels.com/photos/16778545/pexels-photo-16778545.jpeg', 'cultural', 9.80, 'Almonte', '21005', 22, 37.1322, -6.4851),

('El Capricho de Gaudí',
'El Capricho es un edificio modernista proyectado por Antoni Gaudí y construido a finales del siglo XIX en los jardines del palacio de Sobrellano. Destaca por su colorida fachada revestida de cerámicas con motivos de girasoles y su torre cilíndrica. Es una de las pocas obras del arquitecto catalán fuera de Cataluña y un emblema del patrimonio arquitectónico cántabro.',
'https://images.pexels.com/photos/8898900/pexels-photo-8898900.jpeg', 'cultural', 9.90, 'Comillas', '39024', 13, 43.3836, -4.2928),

('San Vicente de la Barquera',
'San Vicente de la Barquera es una histórica villa marinera situada en la costa occidental de Cantabria. Su conjunto monumental incluye el Castillo del Rey, la Iglesia de Santa María de los Ángeles y sus famosos puentes sobre la ría. Ofrece una estampa única que combina patrimonio medieval, tradición pesquera y el entorno natural del Parque Natural de Oyambre.',
'https://images.pexels.com/photos/13639394/pexels-photo-13639394.jpeg', 'cultural', 8.70, 'San Vicente de la Barquera', '39080', 13, 43.3844, -4.3992),

('Monasterio de San Juan de los Reyes',
'El Monasterio de San Juan de los Reyes en Toledo es una de las obras cumbres del estilo gótico isabelino. Construido bajo el patrocinio de los Reyes Católicos a finales del siglo XV para conmemorar la batalla de Toro, destaca por su imponente iglesia y su claustro de dos plantas, decorado con una rica iconografía que mezcla motivos góticos, mudéjares y renacentistas.',
'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/Iglesia_del_monasterio_de_San_Juan_de_los_Reyes%2C_Toledo%2C_Espa%C3%B1a.jpg/1280px-Iglesia_del_monasterio_de_San_Juan_de_los_Reyes%2C_Toledo%2C_Espa%C3%B1a.jpg', 'cultural', 8.90, 'Toledo', '45168', 45, 39.8578, -4.0316),

('Torreón de las Puertas de Tierra',
'El Torreón de las Puertas de Tierra es el elemento central y más elevado del histórico reducto defensivo que separaba el casco antiguo de Cádiz de la zona moderna. Construido en cantería, el torreón actual sirvió en el siglo XIX como la torre óptica número 1 de la Línea de Telegrafía Óptica de Andalucía, combinando su origen militar barroco con funciones de comunicación.',
'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ae/Puerta_de_Tierra%2C_C%C3%A1diz%2C_Espa%C3%B1a%2C_2015-12-08%2C_DD_01.JPG/1920px-Puerta_de_Tierra%2C_C%C3%A1diz%2C_Espa%C3%B1a%2C_2015-12-08%2C_DD_01.JPG', 'cultural', 7.70, 'Cádiz', '11012', 12, 36.5260, -6.2885),

('Puerta Nueva de Bisagra',
'La Puerta Nueva de Bisagra es el acceso más emblemático e imponente al casco histórico de Toledo. De origen musulmán, fue reconstruida casi por completo en el siglo XVI bajo los reinados de Carlos V y Felipe II. Su fachada exterior destaca por un monumental arco de triunfo flanqueado por dos grandes torreones circulares y coronado por el escudo imperial de la ciudad.',
'https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/Toledo_Puerta_Bisagra_1.jpg/960px-Toledo_Puerta_Bisagra_1.jpg', 'cultural', 8.80, 'Toledo', '45168', 45, 39.8626, -4.0251),

('Torre del Oro',
'La Torre del Oro es una torre albarrana situada en el margen izquierdo del río Guadalquivir. Su primera estructura fue construida en el siglo XIII por orden almohade con fines defensivos para cerrar el paso al puerto. Posteriormente se añadieron sus cuerpos superiores y hoy en día alberga el Museo Marítimo de Sevilla, siendo uno de los grandes iconos de la ciudad.',
'https://images.pexels.com/photos/30666335/pexels-photo-30666335.jpeg', 'cultural', 8.90, 'Sevilla', '41091', 41, 37.3824, -5.9965),

('Catedral de Salamanca',
'La Catedral de Salamanca es un conjunto monumental formado por la Catedral Vieja románica y la Catedral Nueva gótica y barroca. Destaca por su impresionante arquitectura, su cúpula conocida como la Torre del Gallo y la famosa fachada plateresca. Es uno de los principales símbolos históricos y religiosos de Salamanca.',
'https://upload.wikimedia.org/wikipedia/commons/d/da/WLM14ES_-_Catedral_Nueva_de_Salamanca._-_julianrdc_edited.jpg', 'cultural', 9.80, 'Salamanca', '37274', 38, 40.9604, -5.6660),

('Puente romano de Salamanca',
'El Puente Romano de Salamanca, o Puente Mayor del Tormes, es un monumento del siglo I d.C. que formaba parte de la Vía de la Plata. Cuenta con 26 arcos en total, de los cuales los 15 primeros (en la margen derecha) conservan la estructura romana original.',
'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a7/Lado_romano_del_Puente_-_Salamanca.JPG/1280px-Lado_romano_del_Puente_-_Salamanca.JPG', 'cultural', 8.80, 'Salamanca', '37274', 38, 40.9576, -5.6702),

('Murallas romanas de Carmona',
'Las murallas romanas de Carmona son uno de los sistemas defensivos romanos mejor conservados de España. Construidas entre los siglos I a.C. y I d.C. junto con el anfiteatro (también visitable hoy en día), protegían la antigua ciudad de Carmo y todavía conservan importantes puertas monumentales como la Puerta de Sevilla o la Puerta de Cordoba.',
'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7c/Alcazar_puerta_sevilla_2.JPG/1280px-Alcazar_puerta_sevilla_2.JPG', 'cultural', 8.70, 'Carmona', '41024', 41, 37.4712, -5.6414),

('Puente del Diablo de Martorell',
'El Puente del Diablo de Martorell es un puente de origen romano construido alrededor del siglo I a.C. como parte de la Vía Augusta. Aunque fue reconstruido en época medieval con un arco ojival, aún conserva elementos originales romanos como el arco triunfal y los estribos.',
'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/Pont_rom%C3%A0_%28Martorell_i_Castellbisbal%29_-_21.jpg/1280px-Pont_rom%C3%A0_%28Martorell_i_Castellbisbal%29_-_21.jpg', 'cultural', 8.90, 'Martorell', '08114', 9, 41.4750, 1.9378),

('Ampurias',
'Ampurias, conocida en la antigüedad como Emporiae, es un importante yacimiento arqueológico grecorromano situado en la Costa Brava. Fue una colonia griega y posteriormente romana, conservando restos de foros, mosaicos, villas y murallas.',
'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5f/Paleochristian_Basilica_-_Emp%C3%BAries_-_2005-03-27.JPG/1280px-Paleochristian_Basilica_-_Emp%C3%BAries_-_2005-03-27.JPG', 'cultural', 9.20, 'L´Escala', '17062', 18, 42.1341, 3.1191),

('Castro de Santa Trega',
'El Castro de Santa Trega es uno de los poblados celtas más importantes y mejor conservados de Galicia. Situado en el monte Santa Trega, ofrece impresionantes vistas al estuario del Miño y al océano Atlántico. Sus viviendas circulares de piedra reflejan la vida de los antiguos pueblos castreños del noroeste peninsular.',
'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f6/Castro_de_Santa_Trega%2C_2011%2C_A_Guarda.jpg/1280px-Castro_de_Santa_Trega%2C_2011%2C_A_Guarda.jpg', 'cultural', 8.90, 'A Guarda', '36023', 37, 41.8926, -8.8697),

('Catedral de Málaga',
'La Catedral de Málaga, conocida popularmente como "La Manquita", es uno de los grandes ejemplos del Renacimiento andaluz. Su construcción comenzó en el siglo XVI sobre el solar de una antigua mezquita y destaca por su imponente fachada y su única torre terminada.',
'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e1/M%C3%A1laga_Catedral_inconclusa.jpg/1280px-M%C3%A1laga_Catedral_inconclusa.jpg', 'cultural', 8.70, 'Málaga', '29067', 32, 36.7202, -4.4194),

('Templo de Debod',
'El Templo de Debod es un antiguo templo egipcio ubicado en Madrid. Fue donado por Egipto a España en agradecimiento por la ayuda prestada en el rescate de los templos de Nubia. Es uno de los lugares más visitados de la ciudad, especialmente al atardecer.',
'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a6/Templo_de_Debod_in_Madrid.jpg/1280px-Templo_de_Debod_in_Madrid.jpg', 'cultural', 8.60, 'Madrid', '28079', 31, 40.4242, -3.7168),

('Puerta del Sol',
'La Puerta del Sol es una de las plazas más famosas y concurridas de Madrid. Es el punto kilométrico cero de las carreteras radiales españolas y escenario tradicional de las celebraciones de Nochevieja con las campanadas.',
'https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/Estatua_ecuestre_de_Carlos_III_-_03.jpg/1280px-Estatua_ecuestre_de_Carlos_III_-_03.jpg', 'cultural', 8.50, 'Madrid', '28079', 31, 40.4166, -3.7038),

('Puerta de Alcalá',
'La Puerta de Alcalá es uno de los monumentos más representativos de Madrid. Construida en el siglo XVIII por orden de Carlos III, servía como puerta de entrada a la ciudad y destaca por su estilo neoclásico.',
'https://upload.wikimedia.org/wikipedia/commons/thumb/0/06/Puerta_de_Alcal%C3%A1_2025.jpg/1280px-Puerta_de_Alcal%C3%A1_2025.jpg', 'cultural', 8.70, 'Madrid', '28079', 31, 40.4200, -3.6886),

('Parque del Retiro',
'El Parque del Retiro es el pulmón verde más famoso de Madrid. Este histórico parque alberga jardines, estanques, esculturas y edificios emblemáticos como el Palacio de Cristal, siendo un lugar ideal para pasear y disfrutar de actividades culturales.',
'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ab/Le_parc_du_Retiro_%28Madrid%29_%284684143195%29.jpg/1280px-Le_parc_du_Retiro_%28Madrid%29_%284684143195%29.jpg', 'cultural', 9.10, 'Madrid', '28079', 31, 40.4173, -3.6831),

('Castillo de Bellver',
'El Castillo de Bellver es una fortaleza gótica situada sobre una colina en Palma de Mallorca. Construido en el siglo XIV, es uno de los pocos castillos de planta circular de Europa y ofrece vistas panorámicas de la bahía de Palma.',
'https://upload.wikimedia.org/wikipedia/commons/8/83/Castillo_de_Bellver.jpg', 'cultural', 8.80, 'Palma', '07040', 24, 39.5638, 2.6193),

('Catedral de la Almudena',
'La Catedral de Santa María la Real de la Almudena es el principal templo católico de Madrid. Situada frente al Palacio Real, combina elementos neoclásicos, neogóticos y neorrománicos debido a su larga construcción entre los siglos XIX y XX. Su cúpula, su cripta y su relación con la historia contemporánea de la capital la convierten en uno de los monumentos religiosos más reconocibles de la ciudad.',
'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Almudena_2022_-_overview.jpg/1280px-Almudena_2022_-_overview.jpg', 'cultural', 8.60, 'Madrid', '28079', 31, 40.4156, -3.7145),

('Monasterio de Montserrat',
'El Monasterio de Montserrat es uno de los grandes centros espirituales y culturales de Cataluña. Situado en la montaña de Montserrat, alberga la venerada imagen de la Virgen de Montserrat y una comunidad benedictina con siglos de historia. Su entorno rocoso, su patrimonio artístico y su importancia religiosa lo convierten en un lugar emblemático del paisaje catalán.',
'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Montserrat_Natural_Park_4.jpg/1280px-Montserrat_Natural_Park_4.jpg', 'cultural', 9.20, 'Monistrol de Montserrat', '08127', 9, 41.5933, 1.8372),

('Real Monasterio de Santa María de Guadalupe',
'El Real Monasterio de Santa María de Guadalupe es uno de los conjuntos religiosos y artísticos más importantes de España. Su arquitectura combina estilos gótico, mudéjar, renacentista, barroco y neoclásico. Declarado Patrimonio de la Humanidad, conserva destacadas obras de arte y mantiene una estrecha vinculación con la historia de los Reyes Católicos y el descubrimiento de América.',
'https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Fachada_del_Real_Monasterio_de_Ntra._Sra._de_Guadalupe%2C_C%C3%A1ceres.jpg/1920px-Fachada_del_Real_Monasterio_de_Ntra._Sra._de_Guadalupe%2C_C%C3%A1ceres.jpg', 'cultural', 9.50, 'Guadalupe', '10087', 11, 39.4526, -5.3274);

INSERT INTO patrimonio_natural (id, ecosistema, extension)
VALUES
(1, 'Marismas', 543.00),
(2, 'Alta montaña', 646.00),
(3, 'Volcánico', 190.00),
(4, 'Volcánico', 51.00),
(5, 'Montaña', 339.00),
(6, 'Alta montaña', 156.00),
(7, 'Alta montaña', 141.00),
(8, 'Dehesa mediterránea', 183.00),
(9, 'Humedal', 30.00),
(10, 'Montaña mediterránea', 2140.00),
(11, 'Volcánico costero', 460.00),
(12, 'Lago costero', 211.00),
(13, 'Costero-marino', 84.00),
(14, 'Karst mediterráneo', 517.00),
(15, 'Costero', 51.00),
(16, 'Alta montaña', 291.00),
(17, 'Montaña', 59.00),
(18, 'Bosque atlántico', 172.00),
(19, 'Alta montaña', 863.00),
(20, 'Karst', 730.00),
(21, 'Semiárido', 280.00),
(22, 'Dunas', 4.00),
(23, 'Laurisilva', 51.00),
(24, 'Volcánico insular', 120.00),
(25, 'Alta montaña', 15.00);

INSERT INTO patrimonio_cultural (id, epoca, anio)
VALUES
(26, 'Andalusí', 'Siglo X'),
(27, 'Tradicional andalusí', 'Siglo XVI'),
(28, 'Romano', 'Siglo I'),
(29, 'Barroco-neoclásico', 'Siglo XVIII'),
(30, 'Renacentista-barroco', 'Siglo XVI'),
(31, 'Islámico-medieval', 'Siglo VIII'),
(32, 'Andalusí', 'Siglo X'),
(33, 'Medieval', 'Siglo XIV'),
(34, 'Nazarí (andalusí)', 'Siglo XIII'),
(35, 'Andalusí-medieval', 'Siglo XIII'),
(36, 'Renacentista', 'Siglo XVI'),
(37, 'Gótico-mudéjar', 'Siglo XV'),
(38, 'Renacentista', 'Siglo XV'),
(39, 'Renacentista', 'Siglo XVI'),
(40, 'Renacentista', 'Siglo XVI'),
(41, 'Andalusí', 'Siglo XI'),
(42, 'Romano', 'Siglo I'),
(43, 'Medieval', 'Siglo XV'),
(44, 'Gótico', 'Siglo XV'),
(45, 'Islámico-medieval', 'Siglo XI'),
(46, 'Regionalista contemporáneo', 'Siglo XX'),
(47, 'Plateresco', 'Siglo XVI'),
(48, 'Románico', 'Siglo XI'),
(49, 'Mudéjar', 'Siglo XIII'),
(50, 'Modernista', 'Siglo XIX'),
(51, 'Barroco', 'Siglo XVII'),
(52, 'Gótico-mudéjar', 'Siglo XIV'),
(53, 'Islámico', 'Siglo XI'),
(54, 'Prerrománico asturiano', 'Siglo IX'),
(55, 'Gótico', 'Siglo XIII'),
(56, 'Neorrománico', 'Siglo XIX'),
(57, 'Gótico', 'Siglo XIV'),
(58, 'Medieval', 'Siglo XIII'),
(59, 'Renacentista', 'Siglo XVI'),
(60, 'Renacentista colonial', 'Siglo XVI'),
(61, 'Contemporáneo religioso', 'Siglo XX'),
(62, 'Gótico-renacentista', 'Siglo XVI'),
(63, 'Colonial', 'Siglo XV'),
(64, 'Prehistórico (arte rupestre)', 'Paleolítico'),
(65, 'Medieval', 'Siglo XII'),
(66, 'Eclecticismo', 'Siglo XX'),
(67, 'Gótico', 'Siglo XIII'),
(68, 'Medieval', 'Siglo XI'),
(69, 'Mudéjar', 'Siglo XIV'),
(70, 'Medieval', 'Siglo XIII'),
(71, 'Gótico', 'Siglo XII'),
(72, 'Militar medieval', 'Siglo XII'),
(73, 'Gótico-isabelino', 'Siglo XV'),
(74, 'Neogótico', 'Siglo XX'),
(75, 'Románico', 'Siglo XI'),
(76, 'Gótico', 'Siglo XIII'),
(77, 'Gótico', 'Siglo XIII'),
(78, 'Gótico', 'Siglo XV'),
(79, 'Gótico', 'Siglo XIII'),
(80, 'Románico', 'Siglo XI'),
(81, 'Plateresco renacentista', 'Siglo XVI'),
(82, 'Barroco', 'Siglo XVIII'),
(83, 'Romano', 'Siglo I a.C.'),
(84, 'Medieval', 'Siglo XII-XV'),
(85, 'Gótico-isabelino', 'Siglo XV'),
(86, 'Gótico-isabelino', 'Siglo XV'),
(87, 'Románico', 'Siglo XII'),
(88, 'Medieval', 'Siglo XI-XV'),
(89, 'Modernismo', 'Siglo XIX-XX'),
(90, 'Modernismo', 'Siglo XX'),
(91, 'Gótico-medieval', 'Siglo XIII-XV'),
(92, 'Medieval sefardí', 'Siglo XII-XV'),
(93, 'Gótico', 'Siglo XI-XVIII'),
(94, 'Romano', 'Siglo I'),
(95, 'Romano', 'Siglo I'),
(96, 'Romano', 'Siglo II a.C.'),
(97, 'Románico-gótico', 'Siglo XIII'),
(98, 'Contemporáneo', 'Siglo XXI'),
(99, 'Gótico civil', 'Siglo XV'),
(100, 'Gótico', 'Siglo XIII-XV'),
(101, 'Gótico', 'Siglo XIV'),
(102, 'Gótico', 'Siglo XIV-XV'),
(103, 'Romano-medieval', 'Siglo II a.C. / Siglo XIII'),
(104, 'Islámico-medieval', 'Siglo X'),
(105, 'Medieval', 'Siglo XIII-XV'),
(106, 'Medieval', 'Siglo XIII'),
(107, 'Medieval', 'Siglo XIII-XV'),
(108, 'Islámico', 'Siglo IX'),
(109, 'Romano', 'Siglo I a.C.'),
(110, 'Romano', 'Siglo I a.C.'),
(111, 'Romano', 'Siglo I'),
(112, 'Romano', 'Siglo I'),
(113, 'Romano', 'Siglo I-II'),
(114, 'Romano', 'Siglo I'),
(115, 'Romano', 'Siglo I'),
(116, 'Romano', 'Siglo I'),
(117, 'Románico', 'Siglo XI'),
(118, 'Romano', 'Siglo III-IV'),
(119, 'Románico-gótico', 'Siglo XII'),
(120, 'Medieval', 'Siglo XII-XV'),
(121, 'Vernáculo marinero', 'Siglo XVII-XVIII'),
(122, 'Ecléctico', 'Siglo XX'),
(123, 'Gótico', 'Siglo XIII'),
(124, 'Medieval-renacentista', 'Siglo XVI'),
(125, 'Mudéjar', 'Siglo XIV'),
(126, 'Gótico civil', 'Siglo XV'),
(127, 'Gótico', 'Siglo XIII'),
(128, 'Militar medieval', 'Siglo XII-XIII'),
(129, 'Gótico-isabelino', 'Siglo XV'),
(130, 'Neogótico', 'Siglo XX'),
(131, 'Románico militar', 'Siglo XI'),
(132, 'Gótico', 'Siglo XII'),
(133, 'Gótico', 'Siglo XIII'),
(134, 'Gótico', 'Siglo XV'),
(135, 'Gótico', 'Siglo XIII'),
(136, 'Románico', 'Siglo XI'),
(137, 'Plateresco', 'Siglo XVI'),
(138, 'Barroco', 'Siglo XVIII'),
(139, 'Romano', 'Siglo I'),
(140, 'Medieval', 'Siglo XII-XV'),
(141, 'Gótico-isabelino', 'Siglo XV'),
(142, 'Barroco', 'Siglo XVI-XVIII'),
(143, 'Románico', 'Siglo XII'),
(144, 'Medieval', 'Siglo XI-XV'),
(145, 'Modernismo', 'Siglo XIX-XX'),
(146, 'Modernismo', 'Siglo XX'),
(147, 'Gótico-medieval', 'Siglo XIII-XV'),
(148, 'Medieval sefardí', 'Siglo XII-XV'),
(149, 'Gótico', 'Siglo XIV'),
(150, 'Romano', 'Siglo II'),
(151, 'Contemporáneo', 'Siglo XX-XXI'),
(152, 'Romano', 'Siglo I'),
(153, 'Contemporáneo', 'Siglo XXI'),
(154, 'Tradición religiosa popular', 'Siglo XVII'),
(155, 'Modernismo', 'Siglo XIX'),
(156, 'Gótico isabelino', 'Siglo XV'),
(157, 'Barroco / Neoclásico', 'Siglo XVIII'),
(158, 'Renacentista', 'Siglo XVI'),
(159, 'Almohade / Mudéjar', 'Siglo XIII'),
(160, 'Gótico-renacentista', 'Siglo XVI'),
(161, 'Romano', 'Siglo I'),
(162, 'Romano', 'Siglo I'),
(163, 'Romano-medieval', 'Siglo I a.C. / Siglo XIII'),
(164, 'Grecorromano', 'Siglo VI-II a.C.'),
(165, 'Castreña celta', 'Siglo I a.C.'),
(166, 'Renacentista', 'Siglo XVI'),
(167, 'Egipcio', 'Siglo II a.C.'),
(168, 'Urbano histórico', 'Siglo XV'),
(169, 'Neoclásico', 'Siglo XVIII'),
(170, 'Paisajismo histórico', 'Siglo XVII'),
(171, 'Gótico mallorquín', 'Siglo XIV'),
(172, 'Neogótico-neorrománico', 'Siglo XIX-XX'),
(173, 'Románico-gótico', 'Siglo XI-XVI'),
(174, 'Gótico-mudéjar', 'Siglo XIII-XVIII');
