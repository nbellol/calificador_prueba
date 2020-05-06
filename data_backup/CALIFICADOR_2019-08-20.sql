# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.6.24-log)
# Database: CALIFICADOR
# Generation Time: 2019-08-20 13:05:59 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table auth_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;



# Dump of table auth_group_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;



# Dump of table auth_permission
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
	(1,'Can add log entry',1,'add_logentry'),
	(2,'Can change log entry',1,'change_logentry'),
	(3,'Can delete log entry',1,'delete_logentry'),
	(4,'Can view log entry',1,'view_logentry'),
	(5,'Can add permission',2,'add_permission'),
	(6,'Can change permission',2,'change_permission'),
	(7,'Can delete permission',2,'delete_permission'),
	(8,'Can view permission',2,'view_permission'),
	(9,'Can add group',3,'add_group'),
	(10,'Can change group',3,'change_group'),
	(11,'Can delete group',3,'delete_group'),
	(12,'Can view group',3,'view_group'),
	(13,'Can add user',4,'add_user'),
	(14,'Can change user',4,'change_user'),
	(15,'Can delete user',4,'delete_user'),
	(16,'Can view user',4,'view_user'),
	(17,'Can add content type',5,'add_contenttype'),
	(18,'Can change content type',5,'change_contenttype'),
	(19,'Can delete content type',5,'delete_contenttype'),
	(20,'Can view content type',5,'view_contenttype'),
	(21,'Can add session',6,'add_session'),
	(22,'Can change session',6,'change_session'),
	(23,'Can delete session',6,'delete_session'),
	(24,'Can view session',6,'view_session'),
	(25,'Can add curso',7,'add_curso'),
	(26,'Can change curso',7,'change_curso'),
	(27,'Can delete curso',7,'delete_curso'),
	(28,'Can view curso',7,'view_curso'),
	(29,'Can add curso semestre',8,'add_cursosemestre'),
	(30,'Can change curso semestre',8,'change_cursosemestre'),
	(31,'Can delete curso semestre',8,'delete_cursosemestre'),
	(32,'Can view curso semestre',8,'view_cursosemestre'),
	(33,'Can add envio',9,'add_envio'),
	(34,'Can change envio',9,'change_envio'),
	(35,'Can delete envio',9,'delete_envio'),
	(36,'Can view envio',9,'view_envio'),
	(37,'Can add problema',10,'add_problema'),
	(38,'Can change problema',10,'change_problema'),
	(39,'Can delete problema',10,'delete_problema'),
	(40,'Can view problema',10,'view_problema'),
	(41,'Can add prueba',11,'add_prueba'),
	(42,'Can change prueba',11,'change_prueba'),
	(43,'Can delete prueba',11,'delete_prueba'),
	(44,'Can view prueba',11,'view_prueba'),
	(45,'Can add usuario',12,'add_usuario'),
	(46,'Can change usuario',12,'change_usuario'),
	(47,'Can delete usuario',12,'delete_usuario'),
	(48,'Can view usuario',12,'view_usuario'),
	(49,'Can add seccion',13,'add_seccion'),
	(50,'Can change seccion',13,'change_seccion'),
	(51,'Can delete seccion',13,'delete_seccion'),
	(52,'Can view seccion',13,'view_seccion'),
	(53,'Can add resultado prueba',14,'add_resultadoprueba'),
	(54,'Can change resultado prueba',14,'change_resultadoprueba'),
	(55,'Can delete resultado prueba',14,'delete_resultadoprueba'),
	(56,'Can view resultado prueba',14,'view_resultadoprueba'),
	(57,'Can add pregunta',15,'add_pregunta'),
	(58,'Can change pregunta',15,'change_pregunta'),
	(59,'Can delete pregunta',15,'delete_pregunta'),
	(60,'Can view pregunta',15,'view_pregunta'),
	(61,'Can add comentario problema',16,'add_comentarioproblema'),
	(62,'Can change comentario problema',16,'change_comentarioproblema'),
	(63,'Can delete comentario problema',16,'delete_comentarioproblema'),
	(64,'Can view comentario problema',16,'view_comentarioproblema'),
	(65,'Can add comentario pregunta',17,'add_comentariopregunta'),
	(66,'Can change comentario pregunta',17,'change_comentariopregunta'),
	(67,'Can delete comentario pregunta',17,'delete_comentariopregunta'),
	(68,'Can view comentario pregunta',17,'view_comentariopregunta'),
	(69,'Can add blog post',18,'add_blogpost'),
	(70,'Can change blog post',18,'change_blogpost'),
	(71,'Can delete blog post',18,'delete_blogpost'),
	(72,'Can view blog post',18,'view_blogpost'),
	(73,'Can add profesor',19,'add_profesor'),
	(74,'Can change profesor',19,'change_profesor'),
	(75,'Can delete profesor',19,'delete_profesor'),
	(76,'Can view profesor',19,'view_profesor'),
	(77,'Can add monitor',20,'add_monitor'),
	(78,'Can change monitor',20,'change_monitor'),
	(79,'Can delete monitor',20,'delete_monitor'),
	(80,'Can view monitor',20,'view_monitor'),
	(81,'Can add estudiante',21,'add_estudiante'),
	(82,'Can change estudiante',21,'change_estudiante'),
	(83,'Can delete estudiante',21,'delete_estudiante'),
	(84,'Can view estudiante',21,'view_estudiante'),
	(85,'Can add resultado estudiante',22,'add_resultadoestudiante'),
	(86,'Can change resultado estudiante',22,'change_resultadoestudiante'),
	(87,'Can delete resultado estudiante',22,'delete_resultadoestudiante'),
	(88,'Can view resultado estudiante',22,'view_resultadoestudiante'),
	(89,'Can add tag',23,'add_tag'),
	(90,'Can change tag',23,'change_tag'),
	(91,'Can delete tag',23,'delete_tag'),
	(92,'Can view tag',23,'view_tag'),
	(93,'Can add argumento',24,'add_argumento'),
	(94,'Can change argumento',24,'change_argumento'),
	(95,'Can delete argumento',24,'delete_argumento'),
	(96,'Can view argumento',24,'view_argumento'),
	(97,'Can add resultado problema',25,'add_resultadoproblema'),
	(98,'Can change resultado problema',25,'change_resultadoproblema'),
	(99,'Can delete resultado problema',25,'delete_resultadoproblema'),
	(100,'Can view resultado problema',25,'view_resultadoproblema'),
	(101,'Can add notificacion',26,'add_notificacion'),
	(102,'Can change notificacion',26,'change_notificacion'),
	(103,'Can delete notificacion',26,'delete_notificacion'),
	(104,'Can view notificacion',26,'view_notificacion'),
	(105,'Can add medalla',27,'add_medalla'),
	(106,'Can change medalla',27,'change_medalla'),
	(107,'Can delete medalla',27,'delete_medalla'),
	(108,'Can view medalla',27,'view_medalla'),
	(109,'Can add logro',28,'add_logro'),
	(110,'Can change logro',28,'change_logro'),
	(111,'Can delete logro',28,'delete_logro'),
	(112,'Can view logro',28,'view_logro'),
	(113,'Can add prueba io',29,'add_pruebaio'),
	(114,'Can change prueba io',29,'change_pruebaio'),
	(115,'Can delete prueba io',29,'delete_pruebaio'),
	(116,'Can view prueba io',29,'view_pruebaio'),
	(117,'Can add prueba script',30,'add_pruebascript'),
	(118,'Can change prueba script',30,'change_pruebascript'),
	(119,'Can delete prueba script',30,'delete_pruebascript'),
	(120,'Can view prueba script',30,'view_pruebascript'),
	(121,'Can add worker',31,'add_worker'),
	(122,'Can change worker',31,'change_worker'),
	(123,'Can delete worker',31,'delete_worker'),
	(124,'Can view worker',31,'view_worker'),
	(125,'Can add revision',32,'add_revision'),
	(126,'Can change revision',32,'change_revision'),
	(127,'Can delete revision',32,'delete_revision'),
	(128,'Can view revision',32,'view_revision'),
	(129,'Can add resultado tarea',33,'add_resultadotarea'),
	(130,'Can change resultado tarea',33,'change_resultadotarea'),
	(131,'Can delete resultado tarea',33,'delete_resultadotarea'),
	(132,'Can view resultado tarea',33,'view_resultadotarea'),
	(133,'Can add tarea',34,'add_tarea'),
	(134,'Can change tarea',34,'change_tarea'),
	(135,'Can delete tarea',34,'delete_tarea'),
	(136,'Can view tarea',34,'view_tarea'),
	(137,'Can add recurso',35,'add_recurso'),
	(138,'Can change recurso',35,'change_recurso'),
	(139,'Can delete recurso',35,'delete_recurso'),
	(140,'Can view recurso',35,'view_recurso'),
	(141,'Can add consulta recurso',36,'add_consultarecurso'),
	(142,'Can change consulta recurso',36,'change_consultarecurso'),
	(143,'Can delete consulta recurso',36,'delete_consultarecurso'),
	(144,'Can view consulta recurso',36,'view_consultarecurso'),
	(145,'Can add registro',37,'add_registro'),
	(146,'Can change registro',37,'change_registro'),
	(147,'Can delete registro',37,'delete_registro'),
	(148,'Can view registro',37,'view_registro');

/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table auth_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`)
VALUES
	(1,'pbkdf2_sha256$150000$ytQ7kwtmbFpa$9Z4625kL7rc0dRwPTSeiT6/toV90vZNodUczZySS89A=','2019-07-19 18:46:34.205813',1,'giove','','','',1,1,'2019-05-22 14:41:03.643000'),
	(2,'pbkdf2_sha256$150000$AE396SOsvIzL$1JQqRCJuZwABquuXlw8LiWIHvUJnFDDJpqk3l59/H0U=','2019-08-10 19:27:43.607287',1,'mario','','','',1,1,'2019-08-02 19:31:09.188931');

/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table auth_user_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;



# Dump of table auth_user_user_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;



# Dump of table dashboard_argumento
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dashboard_argumento`;

CREATE TABLE `dashboard_argumento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `tipo` varchar(30) NOT NULL,
  `descripcion` varchar(300) NOT NULL,
  `problema_id` int(11) DEFAULT NULL,
  `posicion` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_argumento_problema_id_91b7d9ea_fk_dashboard` (`problema_id`),
  CONSTRAINT `dashboard_argumento_problema_id_91b7d9ea_fk_dashboard` FOREIGN KEY (`problema_id`) REFERENCES `dashboard_problema` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

LOCK TABLES `dashboard_argumento` WRITE;
/*!40000 ALTER TABLE `dashboard_argumento` DISABLE KEYS */;

INSERT INTO `dashboard_argumento` (`id`, `nombre`, `tipo`, `descripcion`, `problema_id`, `posicion`)
VALUES
	(1,'input1','str','Cadena de caracteres para el primer input',2,1),
	(2,'input2','str','Características del segundo input',2,1),
	(3,'input3','int','Tercer input: este es un entero',2,1),
	(4,'lista_elementos','list','Lista de elementos en la que se quiere hacer una búsqueda',3,2),
	(5,'elemento_buscado','int','Elemento que se quiere buscar en la lista',3,1),
	(6,'entrada','str','La cadena en la que se quieren buscar caracteres duplicados',5,1),
	(7,'t1','float','Latitud del primer punto en la Tierra',NULL,1),
	(8,'g1','float','Longitud del primero punto en la Tierra',NULL,2),
	(9,'t2','float','Latitud del segundo punto en la Tierra',NULL,3),
	(10,'g2','float','Longitud del segundo punto en la Tierra',NULL,4),
	(11,'t1','float','Latitud del primer punto en la Tierra',17,1),
	(12,'g1','float','Longitud del primero punto en la Tierra',17,2),
	(13,'t2','float','Latitud del segundo punto en la Tierra',17,3),
	(14,'g2','float','Longitud del segundo punto en la Tierra',17,4),
	(15,'largo','float','Largo de la habitación',NULL,1),
	(16,'ancho','float','Ancho de la habitación',NULL,2),
	(17,'largo','float','Largo de la habitación',19,1),
	(18,'ancho','float','Ancho de la habitación',19,2),
	(19,'millas_por_galon','float','Eficiencia de combustible en millas por galón',20,1),
	(20,'cambio','int','Valor a retornar al comprador',21,1),
	(21,'costo_factura','int','Costo de la factura del restaurante, sin impuestos ni propina',NULL,1),
	(22,'costo_factura','int','Costo de la factura del restaurante, sin impuestos ni propina',23,1),
	(23,'presion','float','Presión del gas, en Pascales',NULL,1),
	(24,'volumen','float','Volumen del gas, en litros',NULL,2),
	(25,'temp_celsius','float','Temperatura del gas, en grados centígrados o Celsius',NULL,3),
	(26,'cambio','int','Valor a retornar al comprador',NULL,1),
	(27,'presion','float','Presión del gas, en Pascales',26,1),
	(28,'volumen','float','Volumen del gas, en litros',26,2),
	(29,'temp_celsius','float','Temperatura del gas, en grados centígrados o Celsius',26,3),
	(30,'n','int','Número entero hasta el cual se quiere calcular la suma, desde 1',NULL,1),
	(31,'altura','float','Altura desde la cual cae el objeto',28,1),
	(32,'n','int','Número entero hasta el cual se quiere calcular la suma, desde 1',29,1),
	(33,'masa_agua','float','Masa de agua a hervir',30,1),
	(34,'a','int','El primer entero del conjunto de datos',31,1),
	(35,'b','int','El segundo entero del conjunto de datos',31,2),
	(36,'c','int','El tercer entero del conjunto de datos',31,3),
	(37,'kms_recorridos','float','Kilómetros recorridos en el viaje',32,1),
	(38,'num_lados','int','Número de lados del polígono',33,1),
	(39,'longitud','float','Longitud de uno de los lados del polígono',33,2),
	(40,'hora_salida','int','Hora de salida del vuelo (valor entre 0 y 23)',34,1),
	(41,'minuto_salida','int','Minuto de salida del vuelo (valor entre 0 y 59)',34,2),
	(42,'segundo_salida','int','Segundo de salida del vuelo (valor entre 0 y 59)',34,3),
	(43,'duracion_horas','int','Número de horas que dura el vuelo',34,4),
	(44,'duracion_minutos','int','Número de minutos (adicionales al número de horas) que dura el vuelo',34,5),
	(45,'duracion_segundos','int','Número de segundos (adicionales al número de horas y minutos) que dura el vuelo',34,6),
	(46,'pies','int','Número de pies que componen la altura de la persona',35,1),
	(47,'pulgadas','int','Número de pulgadas que componen la altura de la persona',35,2),
	(48,'a','int','El primero de los enteros a ordenar',36,1),
	(49,'b','int','El segundo de los enteros a ordenar',36,2),
	(50,'c','int','El tercero de los enteros a ordenar',36,3),
	(51,'hora','int','Hora marcada en el reloj (Valor entre 1 y 12)',37,1),
	(52,'minutos','int','Minutos marcados en el reloj (Valor entre 0 y 59)',37,2),
	(53,'cant_pequenias','int','Cantidad de botellas pequeñas entregadas',38,1),
	(54,'cant_grandes','int','Cantidad de botellas grandes entregadas',38,2),
	(55,'frescos','int','Cantidad de panes frescos comprados',39,1),
	(56,'viejos','int','Cantidad de panes del día anterior comprados',39,2),
	(57,'radio','float','Radio de la base del cilindro',40,1),
	(58,'altura','float','Altura del cilindro',40,2),
	(59,'s1','float','Longitud de uno de los lados del triángulo',41,1),
	(60,'s2','float','Longitud de uno de los lados del triángulo',41,2),
	(61,'s3','float','Longitud de uno de los lados del triángulo',41,3),
	(62,'dia_nacio','int','Dia de nacimiento de la persona',42,1),
	(63,'mes_nacio','int','Mes de nacimiento de la persona',42,2),
	(64,'anio_nacio','int','Año de nacimiento de la persona',42,3),
	(65,'dia_actual','int','Dia de la fecha actual',42,4),
	(66,'mes_actual','int','Mes de la fecha actual',42,5),
	(67,'anio_actual','int','Año de la fecha actual',42,6),
	(68,'dias','int','Número de dias del periodo de tiempo',43,1),
	(69,'horas','int','Número de horas del periodo de tiempo',43,2),
	(70,'mins','int','Número de minutos del periodo de tiempo',43,3),
	(71,'seg','int','Número de segundos del periodo de tiempo',43,4),
	(72,'peso_lb','float','Peso en libras de la persona',44,1),
	(73,'altura_inch','float','Altura en pulgadas de la persona',44,2),
	(74,'centenas','str','Caracter que denota las centenas del número a formar',45,1),
	(75,'decenas','str','Caracter que denota las decenas del número a formar',45,2),
	(76,'unidades','str','Caracter que denota las unidades del número a formar',45,3),
	(77,'nombre','str','Nombre a incluir en el saludo',46,1),
	(78,'veces','int','Cantidad de veces a repetir las letras',46,2),
	(79,'cadena','str','El texto a centrar',47,1),
	(80,'ancho_terminal','int','El ancho de la terminal, en número de caracteres máximo por línea',47,2),
	(81,'velocidad','int','Velocidad de descarga de la red, en Mbps',48,1),
	(82,'tamanio_archivo','int','Tamaño del archivo a descargar, en GB',48,2),
	(83,'x1','int','Coordenada en X del primer punto',49,1),
	(84,'y1','int','Coordenada en Y del primer punto',49,2),
	(85,'x2','int','Coordenada en X del segundo punto',49,3),
	(86,'y2','int','Coordenada en Y del segundo punto',49,4),
	(87,'entrada','list','La lista de números que se desea buscar',NULL,1),
	(88,'entrada','list','La lista de números que se desea buscar',NULL,1),
	(89,'entrada','list','La lista',NULL,1),
	(90,'entrada','list','Lista en la cuál se debe buscar el número',NULL,1),
	(91,'buscado','int','Número entero a buscar',NULL,2),
	(92,'numero','int','Entero que se busca ver si es primo',NULL,1),
	(93,'entrada','list','La lista de números que se desea buscar',55,1),
	(94,'entrada','list','La lista',56,1),
	(95,'entrada','list','Lista en la cuál se debe buscar el número',57,1),
	(96,'buscado','int','Número entero a buscar',57,2),
	(97,'cadena','str','La cadena en la que se quiere saber cuál es la letra más común',58,1),
	(98,'numero','int','Entero que se busca ver si es primo',59,1);

/*!40000 ALTER TABLE `dashboard_argumento` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dashboard_comentariopregunta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dashboard_comentariopregunta`;

CREATE TABLE `dashboard_comentariopregunta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contenido` longtext,
  `autor_id` int(11) DEFAULT NULL,
  `pregunta_id` int(11) DEFAULT NULL,
  `timestamp` datetime(6) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_comentario_autor_id_7311b0a7_fk_dashboard` (`autor_id`),
  KEY `dashboard_comentario_pregunta_id_5b3e44c1_fk_dashboard` (`pregunta_id`),
  CONSTRAINT `dashboard_comentario_autor_id_7311b0a7_fk_dashboard` FOREIGN KEY (`autor_id`) REFERENCES `dashboard_usuario` (`id`),
  CONSTRAINT `dashboard_comentario_pregunta_id_5b3e44c1_fk_dashboard` FOREIGN KEY (`pregunta_id`) REFERENCES `dashboard_pregunta` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

LOCK TABLES `dashboard_comentariopregunta` WRITE;
/*!40000 ALTER TABLE `dashboard_comentariopregunta` DISABLE KEYS */;

INSERT INTO `dashboard_comentariopregunta` (`id`, `contenido`, `autor_id`, `pregunta_id`, `timestamp`, `titulo`)
VALUES
	(1,'Primer comentario',1,1,'2019-05-31 19:31:33.637000','Resumen de la respuesta a la pregunta 1'),
	(2,'Segundo comentario',1,1,'2019-05-31 19:31:33.637000','Resumen pregunta'),
	(3,'Tercer comentario brillante',1,2,'2019-05-31 19:31:33.637000','Resumen pregunta'),
	(4,'Aaaaa',NULL,20,'2019-05-31 20:00:44.620000','Respuesta a preguntaaaaa'),
	(5,'Asdasdasd',NULL,20,'2019-05-31 20:00:58.876000','Respuesta a preguntassss'),
	(6,'Este es el contenido de la tercera respuesta',1,20,'2019-06-02 02:17:54.860000','Tercera respuesta'),
	(7,'Contenido de prueba ....',1,20,'2019-06-02 04:00:12.425000','Sexta pregunta'),
	(8,'Contenido de la ultima prueba',1,20,'2019-06-02 04:10:43.882000','Una nueva respuesta a la pregunta ...'),
	(9,'Contenido',1,20,'2019-06-02 04:11:57.781000','Las respuestas funcionan ...'),
	(10,'<i>prueba</i> .... <h1>mario</h1>',1,21,'2019-06-03 23:59:33.860000','Respuesta a pregunta'),
	(11,'\'; drop table dashboard_preguntas;',1,21,'2019-06-03 23:59:58.917000','Respuesta a pregunta'),
	(12,'Ssss',1,22,'2019-06-07 02:45:45.278000','Respuesta a pregunta'),
	(13,'Ddd',1,22,'2019-06-07 02:45:54.528000','Respuesta a pregunta'),
	(14,'Una respuesta a la pregunta completa ....',1,24,'2019-06-07 03:15:58.005000','Respuesta a la pregunta completa'),
	(15,'Contenido de la respuesta ....',1,24,'2019-06-07 03:17:05.268000','Otra respuesta a la pregunta completa'),
	(16,'En el enunciado del problema no hay restricciones sobre el tamaño de la lista. esto significa que la lista podría estar vacía, tener 1 elemento o tener muchos elementos.',2,25,'2019-06-07 18:14:23.611000','No hay restricciones'),
	(17,'Contenido de la respuesta .... editada',1,1,'2019-06-09 16:20:10.033000','Respuesta a una pregunta ....'),
	(18,'sssd',1,1,'2019-06-09 16:25:15.069000','Resumen pregunta'),
	(19,'sssssddd asdasd',1,1,'2019-06-09 16:25:52.815000','Resumen preguntasss dddfdf'),
	(20,'nueva dsddsd',1,1,'2019-06-09 16:27:41.704000','Resumen pregunta dasda'),
	(21,'asdasdasd edite el contenido',1,2,'2019-06-09 16:30:38.215000','nueva repuesta'),
	(22,'Contenido',1,23,'2019-06-09 16:32:31.217000','Una nueva respuesta a la pregunta ...'),
	(23,'No hay restricción sobre los tipos...',1,27,'2019-06-10 20:19:41.205000','Cualquiera!'),
	(24,'Tienen que ser enteros!',1,27,'2019-06-10 20:20:13.907000','Mentiras!!!'),
	(25,'Acá va mi respuesta ....',NULL,23,'2019-06-15 00:16:51.937000','Respuesta de monitor1'),
	(26,'Me respondo ...',9,29,'2019-06-15 00:57:52.824000','Me respondo ...'),
	(27,'Contenido de la super respuesta',8,29,'2019-06-15 01:17:14.208000','Respuesta del super profesor....'),
	(28,'Respuesta adicional ...',8,29,'2019-06-15 01:21:43.584000','Respuesta adicional ...'),
	(29,'Respuesta adicional ...',8,29,'2019-06-15 01:22:41.829000','Respuesta adicional ...'),
	(30,'Respuesta adicional ...',8,29,'2019-06-15 01:23:10.548000','Respuesta adicional ...'),
	(31,'Respondiéndole a la monitora....',8,30,'2019-06-15 01:30:17.974000','Respondiéndole a la monitora....'),
	(32,'Dddd',9,29,'2019-06-15 15:14:24.031000','Respuesta a pregunta'),
	(33,'Asdasdads',9,29,'2019-06-15 15:16:46.421000','Respuesta a preguntaddd'),
	(34,'Asdasdads',9,29,'2019-06-15 15:18:20.123000','Respuesta a preguntaddd'),
	(35,'Asdasdads',9,29,'2019-06-15 15:18:39.589000','Respuesta a preguntaddd'),
	(36,'Asdasdads',9,29,'2019-06-15 15:19:46.952000','Respuesta a preguntaddd'),
	(37,'Asdasdads',9,29,'2019-06-15 15:20:05.956000','Respuesta a preguntaddd'),
	(38,'Asdasdads',9,29,'2019-06-15 15:20:45.474000','Respuesta a preguntaddd'),
	(39,'Me respondo a mí mismo para poder tener notificaciones ...',9,29,'2019-06-15 16:19:53.618000','Respuesta a pregunta'),
	(40,'... ojalá haya una notificación!',9,31,'2019-06-26 11:10:01.120945','Respondiendo la pregunta'),
	(41,'Wow!',8,34,'2019-06-26 11:16:28.038688','Tremenda pregunta!');

/*!40000 ALTER TABLE `dashboard_comentariopregunta` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dashboard_comentarioproblema
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dashboard_comentarioproblema`;

CREATE TABLE `dashboard_comentarioproblema` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contenido` longtext,
  `autor_id` int(11) DEFAULT NULL,
  `problema_id` int(11) DEFAULT NULL,
  `timestamp` datetime(6) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_comentario_autor_id_53c898fc_fk_dashboard` (`autor_id`),
  KEY `dashboard_comentario_problema_id_f14d1415_fk_dashboard` (`problema_id`),
  CONSTRAINT `dashboard_comentario_autor_id_53c898fc_fk_dashboard` FOREIGN KEY (`autor_id`) REFERENCES `dashboard_usuario` (`id`),
  CONSTRAINT `dashboard_comentario_problema_id_f14d1415_fk_dashboard` FOREIGN KEY (`problema_id`) REFERENCES `dashboard_problema` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;



# Dump of table dashboard_consultarecurso
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dashboard_consultarecurso`;

CREATE TABLE `dashboard_consultarecurso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` datetime(6) NOT NULL,
  `problema_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_consultare_problema_id_2c2ac2b7_fk_dashboard` (`problema_id`),
  KEY `dashboard_consultare_usuario_id_0c3046eb_fk_dashboard` (`usuario_id`),
  CONSTRAINT `dashboard_consultare_problema_id_2c2ac2b7_fk_dashboard` FOREIGN KEY (`problema_id`) REFERENCES `dashboard_recurso` (`id`),
  CONSTRAINT `dashboard_consultare_usuario_id_0c3046eb_fk_dashboard` FOREIGN KEY (`usuario_id`) REFERENCES `dashboard_usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;



# Dump of table dashboard_curso
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dashboard_curso`;

CREATE TABLE `dashboard_curso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_curso` varchar(120) NOT NULL,
  `codigo_curso` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_curso` (`nombre_curso`),
  UNIQUE KEY `codigo_curso` (`codigo_curso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

LOCK TABLES `dashboard_curso` WRITE;
/*!40000 ALTER TABLE `dashboard_curso` DISABLE KEYS */;

INSERT INTO `dashboard_curso` (`id`, `nombre_curso`, `codigo_curso`)
VALUES
	(1,'Introducción a la Programación','DEPT-1234');

/*!40000 ALTER TABLE `dashboard_curso` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dashboard_cursosemestre
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dashboard_cursosemestre`;

CREATE TABLE `dashboard_cursosemestre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_semestre` varchar(120) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_semestre` (`nombre_semestre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

LOCK TABLES `dashboard_cursosemestre` WRITE;
/*!40000 ALTER TABLE `dashboard_cursosemestre` DISABLE KEYS */;

INSERT INTO `dashboard_cursosemestre` (`id`, `nombre_semestre`)
VALUES
	(1,'201920');

/*!40000 ALTER TABLE `dashboard_cursosemestre` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dashboard_envio
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dashboard_envio`;

CREATE TABLE `dashboard_envio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` int(11) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `avance` double NOT NULL,
  `estudiante_id` int(11) DEFAULT NULL,
  `problema_id` int(11) DEFAULT NULL,
  `resultado_estudiante_id` int(11) DEFAULT NULL,
  `estado` varchar(2) NOT NULL,
  `contenido` longtext NOT NULL,
  `revision_worker_id` int(11) DEFAULT NULL,
  `slug` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_envio_estudiante_id_83b5a71e_fk_dashboard` (`estudiante_id`),
  KEY `dashboard_envio_problema_id_cea74f6f_fk_dashboard_problema_id` (`problema_id`),
  KEY `dashboard_envio_resultado_estudiante_d6473d94_fk_dashboard` (`resultado_estudiante_id`),
  KEY `dashboard_envio_revision_worker_id_c4b3af13_fk_dashboard` (`revision_worker_id`),
  KEY `dashboard_envio_slug_8041b66b` (`slug`),
  CONSTRAINT `dashboard_envio_estudiante_id_83b5a71e_fk_dashboard` FOREIGN KEY (`estudiante_id`) REFERENCES `dashboard_estudiante` (`usuario_ptr_id`),
  CONSTRAINT `dashboard_envio_problema_id_cea74f6f_fk_dashboard_problema_id` FOREIGN KEY (`problema_id`) REFERENCES `dashboard_problema` (`id`),
  CONSTRAINT `dashboard_envio_resultado_estudiante_d6473d94_fk_dashboard` FOREIGN KEY (`resultado_estudiante_id`) REFERENCES `dashboard_resultadoestudiante` (`id`),
  CONSTRAINT `dashboard_envio_revision_worker_id_c4b3af13_fk_dashboard` FOREIGN KEY (`revision_worker_id`) REFERENCES `dashboard_revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

LOCK TABLES `dashboard_envio` WRITE;
/*!40000 ALTER TABLE `dashboard_envio` DISABLE KEYS */;

INSERT INTO `dashboard_envio` (`id`, `numero`, `timestamp`, `avance`, `estudiante_id`, `problema_id`, `resultado_estudiante_id`, `estado`, `contenido`, `revision_worker_id`, `slug`)
VALUES
	(1,1,'2019-06-02 21:06:48.720000',0,1,1,1,'ER','',NULL,'e1'),
	(2,2,'2019-06-02 21:08:21.550000',20,1,1,1,'ER','',NULL,'e2'),
	(3,3,'2019-06-02 21:08:34.610000',100,1,1,1,'OK','',NULL,'e3'),
	(4,3,'2019-06-07 16:51:34.081000',50,1,3,3,'ER','def contar_apariciones(lista_elementos:list, elemento_buscado:int)->int:\r\n    \"\"\" Contar apariciones en lista\r\n    Argumentos:\r\n      lista_elementos (list): Lista de elementos en la que se quiere hacer una búsqueda\r\n      elemento_buscado (int): Elemento que se quiere buscar en la lista\r\n    Retorno:\r\n      int: La cantidad de veces que aparece el valor buscado en la lista.\r\n    \"\"\"\r\n    if (elemento_buscado in lista_elementos) or len(lista_elementos)<1:\r\n        return 1\r\n    else:\r\n        return 0',NULL,'e4'),
	(9,1,'2019-06-15 00:58:39.329000',0,9,1,5,'NU','def primero()->str:\r\n    \"\"\" Primer problema\r\n    Argumentos:\r\n    Retorno:\r\n      str: \r\n    \"\"\"\r\n    return \"Hello, World!\"',NULL,'primerprob1'),
	(10,1,'2019-06-15 16:37:36.494000',0,9,2,6,'NU','def segunda_funcion(input1:str, input2:str, input3:int)->str:\r\n    \"\"\" Segundo problema\r\n    Argumentos:\r\n      input1 (str): Cadena de caracteres para el primer input\r\n      input2 (str): Características del segundo input\r\n      input3 (int): Tercer input: este es un entero\r\n    Retorno:\r\n      str: El resultado de aplicar la función, convertido a una cadena de caracteres\r\n    \"\"\"\r\n    return 1+1',NULL,'segundoprob1wwe'),
	(11,1,'2019-06-15 16:37:59.296000',0,9,2,6,'NU','def segunda_funcion(input1:str, input2:str, input3:int)->str:\r\n    \"\"\" Segundo problema\r\n    Argumentos:\r\n      input1 (str): Cadena de caracteres para el primer input\r\n      input2 (str): Características del segundo input\r\n      input3 (int): Tercer input: este es un entero\r\n    Retorno:\r\n      str: El resultado de aplicar la función, convertido a una cadena de caracteres\r\n    \"\"\"\r\n    return 1+1',NULL,'segundoprob1sss'),
	(13,2,'2019-06-17 16:36:04.104000',0,1,3,3,'NU','def contar_apariciones(elemento_buscado:int, lista_elementos:list)->int:\r\n    \"\"\" Contar apariciones en lista\r\n    Argumentos:\r\n      elemento_buscado (int): Elemento que se quiere buscar en la lista\r\n      lista_elementos (list): Lista de elementos en la que se quiere hacer una búsqueda\r\n    Retorno:\r\n      int: La cantidad de veces que aparece el valor buscado en la lista.\r\n    \"\"\"\r\n    return elemento_buscado.index(1)',NULL,'contaraps2'),
	(14,1,'2019-06-17 19:50:40.265000',0,1,3,3,'NU','def contar_apariciones(elemento_buscado:int, lista_elementos:list)->int:\r\n    \"\"\" Contar apariciones en lista\r\n    Argumentos:\r\n      elemento_buscado (int): Elemento que se quiere buscar en la lista\r\n      lista_elementos (list): Lista de elementos en la que se quiere hacer una búsqueda\r\n    Retorno:\r\n      int: La cantidad de veces que aparece el valor buscado en la lista.\r\n    \"\"\"\r\n    pass',NULL,'contaraps3'),
	(15,2,'2019-06-26 23:28:26.015746',100,9,1,5,'OK','def primero()->str:\r\n    \"\"\" Primer problema\r\n    Parámetros:\r\n    Retorno:\r\n      str: \r\n    \"\"\"\r\n    return 1',NULL,'primerprob2'),
	(16,4,'2019-06-28 17:44:33.707070',0,1,3,3,'NU','def contar_apariciones(elemento_buscado: int, lista_elementos: list)->int:\r\n    \"\"\" Contar apariciones en lista\r\n    Parámetros:\r\n      elemento_buscado (int): Elemento que se quiere buscar en la lista\r\n      lista_elementos (list): Lista de elementos en la que se quiere hacer una búsqueda\r\n    Retorno:\r\n      int: La cantidad de veces que aparece el valor buscado en la lista.\r\n    \"\"\"\r\n    pass',NULL,'c713d880bef1421e'),
	(17,3,'2019-08-04 14:58:08.828978',0,9,2,6,'NU','def segunda_funcion(input1: str, input2: str, input3: int)->str:\r\n    \"\"\" Segundo problema del banco\r\n    Parámetros:\r\n      input1 (str): Cadena de caracteres para el primer input\r\n      input2 (str): Características del segundo input\r\n      input3 (int): Tercer input: este es un entero\r\n    Retorno:\r\n      str: El resultado de aplicar la función, convertido a una cadena de caracteres\r\n    \"\"\"\r\n    return input1 + input2 + input3',NULL,'45fd35100c5f4f18'),
	(18,1,'2019-08-20 04:26:32.991152',0,9,19,11,'NU','def area_habitacion(largo: float, ancho: float)->float:\r\n    \"\"\" Área de una habitación\r\n    Parámetros:\r\n      largo (float): Largo de la habitación\r\n      ancho (float): Ancho de la habitación\r\n    Retorno:\r\n      float: Número (float) que representa el área de la habitación\r\n    \"\"\"\r\n    return ancho * largo',NULL,'c618f633cab64310');

/*!40000 ALTER TABLE `dashboard_envio` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dashboard_estudiante
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dashboard_estudiante`;

CREATE TABLE `dashboard_estudiante` (
  `usuario_ptr_id` int(11) NOT NULL,
  `seccion_id` int(11) DEFAULT NULL,
  `preguntas_sin_respuesta` tinyint(1) NOT NULL,
  `pulso_actividad` varchar(100) DEFAULT NULL,
  `pulso_puntos` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`usuario_ptr_id`),
  KEY `dashboard_estudiante_seccion_id_4cf73e1d_fk_dashboard_seccion_id` (`seccion_id`),
  CONSTRAINT `dashboard_estudiante_seccion_id_4cf73e1d_fk_dashboard_seccion_id` FOREIGN KEY (`seccion_id`) REFERENCES `dashboard_seccion` (`id`),
  CONSTRAINT `dashboard_estudiante_usuario_ptr_id_a2ae9e9f_fk_dashboard` FOREIGN KEY (`usuario_ptr_id`) REFERENCES `dashboard_usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

LOCK TABLES `dashboard_estudiante` WRITE;
/*!40000 ALTER TABLE `dashboard_estudiante` DISABLE KEYS */;

INSERT INTO `dashboard_estudiante` (`usuario_ptr_id`, `seccion_id`, `preguntas_sin_respuesta`, `pulso_actividad`, `pulso_puntos`)
VALUES
	(1,1,0,'pulso/actividad_9ZBCuPO.png','pulso/puntos_cDDxU0P.png'),
	(9,1,0,'pulso/actividad.png','pulso/puntos.png'),
	(117,16,0,'',''),
	(119,16,0,'',''),
	(120,16,0,'',''),
	(121,16,0,'',''),
	(122,16,0,'',''),
	(123,16,0,'',''),
	(124,16,0,'',''),
	(125,16,0,'',''),
	(126,16,0,'',''),
	(127,16,0,'',''),
	(128,16,0,'',''),
	(129,16,0,'',''),
	(130,16,0,'',''),
	(131,16,0,'',''),
	(132,16,0,'',''),
	(133,16,0,'',''),
	(134,16,0,'',''),
	(135,16,0,'',''),
	(136,16,0,'',''),
	(137,16,0,'',''),
	(138,16,0,'',''),
	(139,16,0,'',''),
	(140,16,0,'',''),
	(141,16,0,'',''),
	(169,27,0,'',''),
	(170,27,0,'',''),
	(171,27,0,'',''),
	(172,27,0,'',''),
	(173,27,0,'',''),
	(174,27,0,'',''),
	(175,27,0,'',''),
	(176,27,0,'',''),
	(177,27,0,'',''),
	(178,27,0,'',''),
	(179,27,0,'',''),
	(180,27,0,'',''),
	(181,27,0,'',''),
	(182,27,0,'',''),
	(183,27,0,'',''),
	(184,27,0,'',''),
	(185,27,0,'',''),
	(186,27,0,'',''),
	(187,27,0,'',''),
	(188,27,0,'',''),
	(189,27,0,'',''),
	(190,27,0,'',''),
	(191,27,0,'',''),
	(192,27,0,'','');

/*!40000 ALTER TABLE `dashboard_estudiante` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dashboard_logro
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dashboard_logro`;

CREATE TABLE `dashboard_logro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` datetime(6) NOT NULL,
  `medalla_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_logro_medalla_id_84625971_fk_dashboard_medalla_id` (`medalla_id`),
  KEY `dashboard_logro_usuario_id_20aeea69_fk_dashboard_usuario_id` (`usuario_id`),
  CONSTRAINT `dashboard_logro_medalla_id_84625971_fk_dashboard_medalla_id` FOREIGN KEY (`medalla_id`) REFERENCES `dashboard_medalla` (`id`),
  CONSTRAINT `dashboard_logro_usuario_id_20aeea69_fk_dashboard_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `dashboard_usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

LOCK TABLES `dashboard_logro` WRITE;
/*!40000 ALTER TABLE `dashboard_logro` DISABLE KEYS */;

INSERT INTO `dashboard_logro` (`id`, `timestamp`, `medalla_id`, `usuario_id`)
VALUES
	(1,'2019-06-09 23:30:00.165000',1,1),
	(2,'2019-06-10 03:59:27.245000',4,1),
	(3,'2019-06-10 03:59:32.336000',5,1);

/*!40000 ALTER TABLE `dashboard_logro` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dashboard_medalla
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dashboard_medalla`;

CREATE TABLE `dashboard_medalla` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(300) NOT NULL,
  `nivel` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

LOCK TABLES `dashboard_medalla` WRITE;
/*!40000 ALTER TABLE `dashboard_medalla` DISABLE KEYS */;

INSERT INTO `dashboard_medalla` (`id`, `nombre`, `descripcion`, `nivel`, `cantidad`)
VALUES
	(1,'Gran Ayudante','Ha respondido 5 preguntas de otros usuarios',1,0),
	(2,'Ayudante dedicado','Ha respondido 10 preguntas de otros usuarios',2,0),
	(3,'Ayudante Increíble','Ha respondido 30 preguntas de otros usuarios',3,0),
	(4,'Autobiógrafo','Ha completado su perfil',2,0),
	(5,'Narciso','Ha cambiado su imagen de perfil al menos 3 veces',3,1);

/*!40000 ALTER TABLE `dashboard_medalla` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dashboard_monitor
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dashboard_monitor`;

CREATE TABLE `dashboard_monitor` (
  `usuario_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`usuario_ptr_id`),
  CONSTRAINT `dashboard_monitor_usuario_ptr_id_bd2cc354_fk_dashboard` FOREIGN KEY (`usuario_ptr_id`) REFERENCES `dashboard_usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

LOCK TABLES `dashboard_monitor` WRITE;
/*!40000 ALTER TABLE `dashboard_monitor` DISABLE KEYS */;

INSERT INTO `dashboard_monitor` (`usuario_ptr_id`)
VALUES
	(10);

/*!40000 ALTER TABLE `dashboard_monitor` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dashboard_monitor_secciones
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dashboard_monitor_secciones`;

CREATE TABLE `dashboard_monitor_secciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `monitor_id` int(11) NOT NULL,
  `seccion_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dashboard_monitor_secciones_monitor_id_seccion_id_0d2ea667_uniq` (`monitor_id`,`seccion_id`),
  KEY `dashboard_monitor_se_seccion_id_08e22cf0_fk_dashboard` (`seccion_id`),
  CONSTRAINT `dashboard_monitor_se_monitor_id_bb211438_fk_dashboard` FOREIGN KEY (`monitor_id`) REFERENCES `dashboard_monitor` (`usuario_ptr_id`),
  CONSTRAINT `dashboard_monitor_se_seccion_id_08e22cf0_fk_dashboard` FOREIGN KEY (`seccion_id`) REFERENCES `dashboard_seccion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;



# Dump of table dashboard_notificacion
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dashboard_notificacion`;

CREATE TABLE `dashboard_notificacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(2) NOT NULL,
  `contenido` longtext,
  `leida` tinyint(1) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `link` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_notificaci_usuario_id_e4418005_fk_dashboard` (`usuario_id`),
  CONSTRAINT `dashboard_notificaci_usuario_id_e4418005_fk_dashboard` FOREIGN KEY (`usuario_id`) REFERENCES `dashboard_usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

LOCK TABLES `dashboard_notificacion` WRITE;
/*!40000 ALTER TABLE `dashboard_notificacion` DISABLE KEYS */;

INSERT INTO `dashboard_notificacion` (`id`, `tipo`, `contenido`, `leida`, `timestamp`, `usuario_id`, `link`)
VALUES
	(1,'RE','La pregunta en el problema \"Contar apariciones en lista\" fue respondida',1,'2019-06-08 02:07:53.855000',1,NULL),
	(2,'WD','Hey!',1,'2019-06-09 21:03:32.161000',1,NULL),
	(3,'EE','Se recibió el envío 5',1,'2019-06-13 21:54:34.314000',1,NULL),
	(4,'EE','Se recibió el envío 3',1,'2019-06-14 15:50:33.188000',1,NULL),
	(5,'EE','Se recibió el envío 3',1,'2019-06-14 15:50:53.662000',1,NULL),
	(6,'EE','Se recibió el envío 1',1,'2019-06-15 00:58:39.332000',9,NULL),
	(7,'RE','Se recibió una respuesta para la pregunta \'Mi primera pregunta ....\'',1,'2019-06-15 01:23:10.551000',9,NULL),
	(8,'RE','Se recibió una respuesta para la pregunta \'La primera de roberta ...\'',0,'2019-06-15 01:30:17.978000',10,NULL),
	(9,'EE','Se recibió el envío 1',1,'2019-06-15 01:33:20.500000',9,NULL),
	(10,'EE','Se recibió el envío 1',1,'2019-06-15 01:35:19.596000',9,NULL),
	(11,'RE','Se recibió una respuesta para la pregunta \'Mi primera pregunta ....\'',1,'2019-06-15 15:14:24.035000',9,NULL),
	(12,'RE','Se recibió una respuesta para la pregunta \'Mi primera pregunta ....\'',1,'2019-06-15 15:20:45.504000',9,'/problemas/primerprob/#pregunta29'),
	(13,'RE','Se recibió una respuesta para la pregunta \'Mi primera pregunta ....\'',1,'2019-06-15 16:19:53.628000',9,'/problemas/primerprob/#pregunta29'),
	(14,'EE','Se recibió el envío 1',1,'2019-06-15 16:37:59.332000',9,'/envios/segundoprob1/'),
	(15,'EE','Se recibió el envío 1',1,'2019-06-15 16:39:42.948000',9,'/envios/segundoprob1sss/'),
	(16,'EE','Se recibió el envío 1',1,'2019-06-15 16:39:47.616000',9,'/envios/segundoprob1wwe/'),
	(17,'EE','Se recibió el envío 2',0,'2019-06-16 21:15:52.988000',1,'/envios/contaraps2/'),
	(18,'EE','Se recibió el envío 2',0,'2019-06-17 16:36:04.108000',1,'/envios/contaraps2/'),
	(19,'EE','Se recibió el envío 3',0,'2019-06-17 19:50:40.268000',1,'/envios/contaraps3/'),
	(20,'RE','Se recibió una respuesta para la pregunta \'Esta es la primera pregunta sobre este problema\'',1,'2019-06-26 11:10:01.126781',8,'/problemas/duplicate/#pregunta31'),
	(21,'PP','Se recibió una pregunta para el problema \'Encontrar caracteres duplicados\'',1,'2019-06-26 11:10:58.453548',8,'/problemas/duplicate/#pregunta32'),
	(22,'PP','Se recibió una pregunta para el problema \'Encontrar caracteres duplicados\'',1,'2019-06-26 11:12:02.680987',8,'/problemas/duplicate/#pregunta33'),
	(23,'PP','Se recibió una pregunta para el problema \'Encontrar caracteres duplicados\'',1,'2019-06-26 11:13:43.199583',8,'/problemas/duplicate/#pregunta34'),
	(24,'PP','Se recibió una pregunta para el problema \'Encontrar caracteres duplicados\'',1,'2019-06-26 11:14:13.306087',8,'/problemas/duplicate/#pregunta35'),
	(25,'PE','El estudiante est1 -- DEPT-1234 - 201920: 1 (sección 1) dejó una pregunta para el problema \'Encontrar caracteres duplicados\'',1,'2019-06-26 11:14:13.316067',8,'/problemas/duplicate/#pregunta35'),
	(26,'RE','Se recibió una respuesta para la pregunta \'Nuevo intento de notificación\'',1,'2019-06-26 11:16:28.044944',9,'/problemas/duplicate/#pregunta34'),
	(27,'TD','La tarea 3 ya está disponible',0,'2019-06-26 11:28:17.868373',1,'/tareas/3/'),
	(28,'TD','La tarea 3 ya está disponible',1,'2019-06-26 11:28:17.869833',9,'/tareas/3/'),
	(29,'TD','La tarea 3 ya está disponible',0,'2019-06-26 11:28:48.103695',1,'/tareas/4/'),
	(30,'TD','La tarea 3 ya está disponible',1,'2019-06-26 11:28:48.105059',9,'/tareas/4/'),
	(31,'TD','La tarea 4 ya está disponible',0,'2019-06-26 11:28:56.860389',1,'/tareas/5/'),
	(32,'TD','La tarea 4 ya está disponible',1,'2019-06-26 11:28:56.861071',9,'/tareas/5/'),
	(33,'TD','La tarea 4 ya está disponible.',0,'2019-06-26 11:34:19.247997',1,'/tareas/5/'),
	(34,'TD','La tarea 4 ya está disponible.',1,'2019-06-26 11:34:19.249655',9,'/tareas/5/'),
	(35,'TD','La tarea 3 ya está disponible.',0,'2019-06-26 11:37:22.458730',1,'/tareas/5/'),
	(36,'TD','La tarea 3 ya está disponible.',1,'2019-06-26 11:37:22.461223',9,'/tareas/5/'),
	(37,'PP','Se recibió una pregunta para el problema \'Nuevo problema\'',0,'2019-06-26 22:14:02.163202',8,'/problemas/nuevopr/#pregunta36'),
	(38,'PE','El estudiante Weymar Contreras (sección 1) dejó una pregunta para el problema \'Nuevo problema\'',0,'2019-06-26 22:14:02.174421',8,'/problemas/nuevopr/#pregunta36'),
	(39,'EE','Se recibió el envío 1',1,'2019-06-26 23:14:18.939858',9,'/envios/primerprob1/'),
	(40,'EE','Se recibió el envío 1',1,'2019-06-26 23:14:52.184920',9,'/envios/primerprob1/'),
	(41,'EE','Se recibió el envío 1',1,'2019-06-26 23:25:27.845410',9,'/envios/primerprob1/'),
	(42,'EE','Se recibió el envío 1',1,'2019-06-26 23:27:26.606797',9,'/envios/primerprob1/'),
	(43,'EE','Se recibió el envío 2',1,'2019-06-26 23:28:26.022871',9,'/envios/primerprob2/'),
	(44,'EE','Se recibió el envío 2',1,'2019-06-26 23:28:47.630187',9,'/envios/primerprob2/'),
	(45,'EE','Se recibió el envío 2',1,'2019-06-26 23:29:26.390856',9,'/envios/primerprob2/'),
	(46,'EE','Se recibió el envío 2',1,'2019-06-26 23:30:55.746896',9,'/envios/primerprob2/'),
	(47,'EE','Se recibió el envío 2',1,'2019-06-27 00:23:28.204919',9,'/envios/primerprob2/'),
	(48,'EE','Se recibió el envío 2',1,'2019-06-27 00:24:13.510946',9,'/envios/primerprob2/'),
	(49,'EE','Se recibió el envío 2',1,'2019-06-27 00:24:58.167418',9,'/envios/primerprob2/'),
	(50,'ER','Se revisó el intento 2 del problema Primer problema',1,'2019-06-27 00:24:58.169350',9,'/envios/primerprob2/'),
	(51,'EE','Se recibió el envío 1',0,'2019-06-27 01:31:33.400028',1,'/envios/contaraps3/'),
	(52,'ER','Se revisó el intento #1 del problema \'Contar apariciones en lista\'',0,'2019-06-27 01:31:33.400757',1,'/envios/contaraps3/'),
	(53,'EE','Se recibió el envío 3',0,'2019-06-27 01:31:41.929983',1,'/envios/e4/'),
	(54,'ER','Se revisó el intento #3 del problema \'Contar apariciones en lista\'',0,'2019-06-27 01:31:41.931995',1,'/envios/e4/'),
	(55,'EE','Se recibió el envío 2',1,'2019-06-27 02:08:01.312040',9,'/envios/primerprob2/'),
	(56,'ER','Se revisó el intento #2 del problema \'Primer problema\'',1,'2019-06-27 02:08:01.314238',9,'/envios/primerprob2/'),
	(57,'EE','Se recibió el envío 4',0,'2019-06-28 17:44:33.713338',1,'/envios/c713d880bef1421e/'),
	(58,'EE','Se recibió el envío 2',1,'2019-07-17 16:04:09.605517',9,'/envios/primerprob2/'),
	(59,'ER','Se revisó el intento #2 del problema \'Primer problema\'',1,'2019-07-17 16:04:09.609804',9,'/envios/primerprob2/'),
	(60,'EE','Se recibió el envío 2',1,'2019-08-02 16:25:36.124892',9,'/envios/primerprob2/'),
	(61,'ER','Se revisó el intento #2 del problema \'Primer problema\'',1,'2019-08-02 16:25:36.130133',9,'/envios/primerprob2/'),
	(62,'EE','Se recibió el envío 3',1,'2019-08-04 14:58:08.830562',9,'/envios/45fd35100c5f4f18/'),
	(63,'PP','Se recibió una pregunta para el problema \'Encontrar caracteres duplicados\'',0,'2019-08-15 14:03:51.240053',8,'/problemas/duplicate/#pregunta37'),
	(64,'EE','Se recibió el envío 1',1,'2019-08-20 04:26:32.995616',9,'/envios/c618f633cab64310/');

/*!40000 ALTER TABLE `dashboard_notificacion` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dashboard_pregunta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dashboard_pregunta`;

CREATE TABLE `dashboard_pregunta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contenido` longtext,
  `resuelta` tinyint(1) NOT NULL,
  `autor_id` int(11) DEFAULT NULL,
  `problema_id` int(11) DEFAULT NULL,
  `timestamp` datetime(6) NOT NULL,
  `tipo` varchar(40) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_pregunta_autor_id_5ccb7c35_fk_dashboard_usuario_id` (`autor_id`),
  KEY `dashboard_pregunta_problema_id_2c2436f5_fk_dashboard_problema_id` (`problema_id`),
  CONSTRAINT `dashboard_pregunta_autor_id_5ccb7c35_fk_dashboard_usuario_id` FOREIGN KEY (`autor_id`) REFERENCES `dashboard_usuario` (`id`),
  CONSTRAINT `dashboard_pregunta_problema_id_2c2436f5_fk_dashboard_problema_id` FOREIGN KEY (`problema_id`) REFERENCES `dashboard_problema` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

LOCK TABLES `dashboard_pregunta` WRITE;
/*!40000 ALTER TABLE `dashboard_pregunta` DISABLE KEYS */;

INSERT INTO `dashboard_pregunta` (`id`, `contenido`, `resuelta`, `autor_id`, `problema_id`, `timestamp`, `tipo`, `titulo`)
VALUES
	(1,'Primera pregunta sobre el problema 1',0,1,1,'2019-05-31 19:31:33.688000','Aclaracion','Resumen pregunta'),
	(2,'Segunda pregunta sobre el problema 1',1,1,1,'2019-05-31 19:31:33.688000','Aclaracion','Resumen pregunta'),
	(3,'Aas',0,NULL,NULL,'2019-05-31 19:31:33.688000','Aclaracion','Resumen pregunta'),
	(4,'Pregunta creada con la forma ....',0,NULL,NULL,'2019-05-31 19:31:33.688000','Aclaracion','Resumen pregunta'),
	(5,'Siguiente pregunta desde forma!',0,NULL,1,'2019-05-31 19:31:33.688000','Aclaracion','Resumen pregunta'),
	(6,'123',0,NULL,1,'2019-05-31 19:31:33.688000','Aclaracion','Resumen pregunta'),
	(7,'D',0,NULL,1,'2019-05-31 19:31:33.688000','Aclaracion','Resumen pregunta'),
	(8,'D',0,NULL,1,'2019-05-31 19:31:33.688000','Aclaracion','Resumen pregunta'),
	(10,'Dsd',0,NULL,1,'2019-05-31 19:31:33.688000','Aclaracion','Resumen pregunta'),
	(11,'Contenido de la pregunta fundamental sobre el problema',0,1,2,'2019-05-31 19:31:33.688000','Aclaracion','Otra pregunta fundamental!'),
	(20,'... sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur?',0,1,2,'2019-05-31 19:51:04.704000','Aclaracion','Una pregunta muy importante sobre el problema'),
	(21,'Contenido de la nueva pregunta',0,1,2,'2019-06-02 04:26:21.287000','error','Nueva pregunta ...'),
	(22,'Contenido de la pregunta',0,1,1,'2019-06-03 15:40:50.667000','Ayuda','Ejemplo de pregunta con tiempo'),
	(23,'Asdasdasd',0,1,1,'2019-06-07 02:46:03.637000','Error','Erwsdasfdasd'),
	(24,'Contenido de la pregunta completa',0,1,2,'2019-06-07 03:13:37.328000','Bug','Pregunta completa'),
	(25,'¿la lista puede estar vacía?',0,1,3,'2019-06-07 18:08:22.824000','Aclaracion','Tamaño de la lista'),
	(26,'Un poco de caos!',0,1,3,'2019-06-09 21:38:41.448000','Aclaracion','<h1 style=\"color: #ff0000\">titulooooo</h1>'),
	(27,'Cuales son los tipos posibles?',0,1,3,'2019-06-10 20:19:23.163000','Error','Nueva pregunta sobre el problema: tipos?'),
	(28,'Esta es mi primera pregunta!',0,NULL,1,'2019-06-15 00:17:48.299000','Ayuda','Mi primera pregunta ....'),
	(29,'Mi contenido',0,9,1,'2019-06-15 00:57:41.911000','Aclaracion','Mi primera pregunta ....'),
	(30,'Primera pregunta ...',0,10,1,'2019-06-15 01:28:45.689000','Aclaracion','La primera de roberta ...'),
	(31,'Esta es la primera pregunta sobre este problema .... y este es el contenido',0,8,5,'2019-06-25 22:14:39.576108','Aclaracion','Esta es la primera pregunta sobre este problema'),
	(32,'Generando notificaciones ...',0,9,5,'2019-06-26 11:10:58.444558','Aclaracion','Voy a hacer una pregunta y ver qué notificaciones se generan ...'),
	(33,'...',0,9,5,'2019-06-26 11:12:02.671473','Aclaracion','Nuevo intento de notificación'),
	(34,'...',0,9,5,'2019-06-26 11:13:43.172284','Aclaracion','Nuevo intento de notificación'),
	(35,'...',0,9,5,'2019-06-26 11:14:13.275027','Aclaracion','Nuevo intento de notificación'),
	(36,'Sss',0,1,4,'2019-06-26 22:14:02.153436','Aclaracion','Resumen de la pregunta'),
	(37,'?',0,11,5,'2019-08-15 14:03:51.236073','Aclaracion','Aaaa');

/*!40000 ALTER TABLE `dashboard_pregunta` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dashboard_problema
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dashboard_problema`;

CREATE TABLE `dashboard_problema` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(120) NOT NULL,
  `curso_id` int(11) DEFAULT NULL,
  `autor_id` int(11) DEFAULT NULL,
  `descripcion` longtext,
  `dificultad` int(11) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `funcion` varchar(120) NOT NULL,
  `retorno_tipo` varchar(120) NOT NULL,
  `retorno_descripcion` longtext,
  `publico` tinyint(1) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `nivel` int(11) NOT NULL,
  `ultima_modificacion` datetime(6) NOT NULL,
  `es_reto` tinyint(1) NOT NULL,
  `nivel_reto` varchar(1) NOT NULL,
  `solucion_referencia` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dashboard_problema_slug_358bce9f_uniq` (`slug`),
  KEY `dashboard_problema_curso_id_91521338_fk_dashboard_curso_id` (`curso_id`),
  KEY `dashboard_problema_autor_id_8ac34609_fk_dashboard_usuario_id` (`autor_id`),
  CONSTRAINT `dashboard_problema_autor_id_8ac34609_fk_dashboard_usuario_id` FOREIGN KEY (`autor_id`) REFERENCES `dashboard_usuario` (`id`),
  CONSTRAINT `dashboard_problema_curso_id_91521338_fk_dashboard_curso_id` FOREIGN KEY (`curso_id`) REFERENCES `dashboard_curso` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

LOCK TABLES `dashboard_problema` WRITE;
/*!40000 ALTER TABLE `dashboard_problema` DISABLE KEYS */;

INSERT INTO `dashboard_problema` (`id`, `titulo`, `curso_id`, `autor_id`, `descripcion`, `dificultad`, `estado`, `funcion`, `retorno_tipo`, `retorno_descripcion`, `publico`, `slug`, `nivel`, `ultima_modificacion`, `es_reto`, `nivel_reto`, `solucion_referencia`)
VALUES
	(1,'Primer problema',1,8,'Descripción del primer problema creado',34,'Creado','primero','str','',1,'primerprob',1,'2019-06-22 17:20:48.412930',0,'M',''),
	(2,'Segundo problema del banco',1,8,'Esta es la descripción del segundo problema ... enjoy!\r\n\r\nThe standard Lorem Ipsum passage, used since the 1500s\r\n\r\n\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"\r\nSection 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\r\n\r\n\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"',20,'Nuevo','segunda_funcion','str','El resultado de aplicar la función, convertido a una cadena de caracteres',1,'segundoprob',1,'2019-06-22 17:20:48.412930',0,'B',''),
	(3,'Contar apariciones en lista',1,8,'Se quiere contar la cantidad de veces que aparece un determinado valor (\'elemento_buscado\') en una lista (\'lista_elementos\'). \r\nLos elementos de la lista y el valor buscado son de tipo int y se pueden comparar usando \'==\'.',10,'Nuevo','contar_apariciones','int','La cantidad de veces que aparece el valor buscado en la lista.',1,'contaraps',1,'2019-06-22 17:20:48.412930',0,'M','def contar_apariciones(elemento_buscado: int, lista_elementos: list)->int:\r\n    \"\"\" Contar apariciones en lista\r\n    Parámetros:\r\n      elemento_buscado (int): Elemento que se quiere buscar en la lista\r\n      lista_elementos (list): Lista de elementos en la que se quiere hacer una búsqueda\r\n    Retorno:\r\n      int: La cantidad de veces que aparece el valor buscado en la lista.\r\n    \"\"\"\r\n    return lista_elementos.count(elemento_buscado)'),
	(4,'Nuevo problema',1,2,'Este es un nuevo problema **sin terminar**.\r\nPor lo pronto debería estar escondido (sólo visible para profesores y coordinadores).',10,'Nuevo','prueba','str','Retorna un valor',0,'nuevopr',2,'2019-06-22 17:43:21.196603',0,'B',''),
	(5,'Encontrar caracteres duplicados',1,8,'En este ejercicio se quieren encontrar todos los caracteres duplicados en una cadena (str). \r\n\r\nUsted debe construir una función que reciba una cadena de caracteres (\'entrada\') y que retorne una lista con todos los caracteres que aparezcan más de una vez en la cadena recibida por parámetro. \r\n\r\nLa lista retornada debe estar ordenada lexicográficamente.\r\n\r\nSi no hay ningún caracter repetido, la lista retornada debe ser una lista vacía.',10,'NUEVO','caracteres_duplicados','list','Una lista ordenada con los caracteres que aparecían más de una vez en la cadena.',1,'duplicate',3,'2019-06-23 04:28:18.074680',0,'N',''),
	(17,'Distancia entre dos puntos en la Tierra',1,2,'La superficie de la Tierra es curva, y la distancia entre grados de longitud varía con la latitud. Como consecuencia, encontrar la distancia entre dos puntos en la superficie terrestre es más complicado que simplemente usar el teorema de Pitágoras. Siendo (t1, g1) y (t2, g2) la latitud y longitud de dos puntos en la superficie de la Tierra, la distancia entre estos puntos, en kilómetros, es: Distancia = 6371.01 * arccos(sin(t1) * sin(t2) + cos(t1) * cos(t2) * cos(g1 - g2)). Cree una función que reciba la latitud y longitud de dos puntos en la superficie de la Tierra y retorne la distancia entre estos, en kilómetros. El valor de retorno debe estar aproximado a dos cifras decimales. Recuerde que las funciones trigonométricas del módulo math esperan parámetros en radianes, de modo que es necesario convertir latitud y longitud de grados a radianes (la función radians(…) de math puede serle de utilidad).',2,'NU','calcular_distancia_tierra','float','Distancia entre dos puntos en la Tierra',1,'1f97c014c7b74a12',1,'2019-08-14 01:59:47.305001',1,'A','import math\r\ndef calcular_distancia_tierra(t1: float, g1: float, t2: float, g2: float)->float:\r\n    \"\"\" Distancia entre dos puntos en la Tierra\r\n    Parámetros:\r\n      t1 (float): Latitud del primer punto en la Tierra\r\n      g1 (float): Longitud del primero punto en la Tierra\r\n      t2 (float): Latitud del segundo punto en la Tierra\r\n      g2 (float): Longitud del segundo punto en la Tierra\r\n    Retorno:\r\n      float: Distancia entre dos puntos en la Tierra\r\n    \"\"\"\r\n    t1_rad = math.radians(t1)\r\n    g1_rad = math.radians(g1)\r\n    t2_rad = math.radians(t2)\r\n    g2_rad = math.radians(g2)\r\n    dist = 6371.01 * math.acos(math.sin(t1_rad) * math.sin(t2_rad) + math.cos(t1_rad) * math.cos(t2_rad) * math.cos(g1_rad - g2_rad))\r\n    return round(dist, 2)'),
	(19,'Área de una habitación',1,2,'Escriba una función que solicite al usuario el largo y ancho (en metros) de una habitación rectangular. Tras haberse ingresado los valores, el programa debe calcular y retornar el área del lugar. Tanto el ancho como el largo son números flotantes, y la respuesta debe tener solamente dos decimales.',1,'NU','area_habitacion','float','Número (float) que representa el área de la habitación',1,'3640d287bc414b36',1,'2019-08-14 02:07:33.757793',1,'B','def area_habitacion(largo: float, ancho: float)->float:\r\n    \"\"\" Área de una habitación\r\n    Parámetros:\r\n      largo (float): Largo de la habitación\r\n      ancho (float): Ancho de la habitación\r\n    Retorno:\r\n      float: Número (float) que representa el área de la habitación\r\n    \"\"\"\r\n    area = largo*ancho\r\n    return round(area,2)'),
	(20,'Eficiencia de combustible',1,2,'En los Estados Unidos, la eficiencia de un combustible para vehículos se expresa en millas por galón (MPG). En Canadá, la eficiencia se expresa en litros por cada 100 kilómetros (L/100km). Cree una función que permita convertir una eficiencia en MPG a L/100km. Recuerde que una milla equivale a 1.6 kms, y un galón equivale a 3.78 litros. El valor de retorno debe estar redondeado a dos decimales.',2,'NU','convertir_eficiencia_combustible','float','Eficiencia de combustible en litros por 100 km',1,'1c1cf20cdee94952',1,'2019-08-14 02:09:09.214765',1,'M','def convertir_eficiencia_combustible(millas_por_galon: float)->float:\r\n    \"\"\" Eficiencia de combustible\r\n    Parámetros:\r\n      millas_por_galon (float): Eficiencia de combustible en millas por galón\r\n    Retorno:\r\n      float: Eficiencia de combustible en litros por 100 km\r\n    \"\"\"\r\n    gal_per_mile = 1/millas_por_galon\r\n    liter_per_mile = gal_per_mile * 3.78\r\n    lt_per_hundred_km = liter_per_mile * (100/1.6)\r\n    return round(lt_per_hundred_km,2)'),
	(21,'Cambio a retornar',1,2,'Considere el software que se ejecuta en una máquina expendedora. Una de las tareas que debe realizar es determinar cuánto cambio retornar al cliente luego de que paga. Escriba una función que recibe la cantidad de dinero (en pesos) a dar como cambio al cliente, y retorna un mensaje con la cantidad de monedas de cada denominación que deben ser entregadas, teniendo en cuenta que el cambio se debe otorgar con la menor cantidad de monedas posible. La máquina cuenta con monedas de 500, 200, 100 y 50 pesos. El mensaje retornado DEBE seguir el siguiente formato: “A,B,C,D” (¡sin espacios intermedios!) donde A, B, C y D son la cantidad de monedas de 500, 200, 100 y 50 respectivamente.',3,'NU','calcular_cambio','str','Cadena de caracteres que indica cuántas monedas de cada denominación se deben retornar',1,'d217cbf681e14f42',1,'2019-08-14 02:10:20.785801',1,'A','def calcular_cambio(cambio: int)->str:\r\n    \"\"\" Cambio a retornar\r\n    Parámetros:\r\n      cambio (int): Valor a retornar al comprador\r\n    Retorno:\r\n      str: Cadena de caracteres que indica cuántas monedas de cada denominación se deben retornar\r\n    \"\"\"\r\n    monedas_500 = cambio//500\r\n    cambio = cambio % 500\r\n    monedas_200 = cambio//200\r\n    cambio = cambio % 200\r\n    monedas_100 = cambio//100\r\n    cambio = cambio % 100\r\n    monedas_50 = cambio//50\r\n  \r\n    return str(monedas_500)+\',\'+str(monedas_200)+\',\'+str(monedas_100)+\',\'+str(monedas_50)'),
	(23,'IVA y propina',1,143,'Cree una función que reciba el costo en pesos de una cuenta de restaurante, y luego calcule el impuesto IVA asociado y la propina para el mesero. La tasa del IVA corresponde al 19%, y la propina en el restaurante es del 10% del valor de la factura (sin impuestos). Debe retornar una cadena que muestre el IVA, propina y total de la siguiente manera: \"X,Y,Z\", donde X es el IVA, Y la propina y Z el total. No olvide aproximar los números al entero más cercano.',1,'NU','calcular_iva_propina_total_factura','str','Cadena con el iva, propina y total de la factura, separados por coma',1,'886c2146468d4e6c',1,'2019-08-14 02:35:09.844516',1,'B','def calcular_iva_propina_total_factura(costo_factura: int)->str:\r\n    \"\"\" IVA y propina\r\n    Parámetros:\r\n      costo_factura (int): Costo de la factura del restaurante, sin impuestos ni propina\r\n    Retorno:\r\n      str: Cadena con el iva, propina y total de la factura, separados por coma\r\n    \"\"\"\r\n    iva = costo_factura * 0.19\r\n    propina = costo_factura * 0.1\r\n    total = iva + propina + costo_factura\r\n    rta = str(round(iva))+\",\"+str(round(propina))+\",\"+str(round(total)) \r\n    return rta'),
	(26,'Ley de los gases ideales',1,143,'La ley de los gases ideales es una aproximación matemática del comportamiento de los gases frente a cambios de presión, volumen y temperatura. Usualmente se describe como: PV = nRT, donde P es la presión en pascales, V el volumen en metros cúbicos, n la cantidad de sustancia en moles, R la constante de gases ideales (cuyo valor es 8.314 J/mol K), y T es la temperatura en Kelvin. Cree una función que calcula la cantidad de gas en moles cuando se recibe la presión (en pascales), volumen (en litros) y temperatura (en grados centígrados). Recuerde que para convertir de grados centígrados a Kelvin, se suma 273.15 al valor en grados centígrados, y para convertir de litros a metros cúbicos, se divide el número de litros en 1000. El valor de retorno debe estar redondeado a dos cifras decimales.',3,'NU','calcular_moles','float','Número de moles del gas',1,'e72dc596f0eb4b46',1,'2019-08-14 02:37:35.093276',1,'A','def calcular_moles(presion: float, volumen: float, temp_celsius: float)->float:\r\n    \"\"\" Ley de los gases ideales\r\n    Parámetros:\r\n      presion (float): Presión del gas, en Pascales\r\n      volumen (float): Volumen del gas, en litros\r\n      temp_celsius (float): Temperatura del gas, en grados centígrados o Celsius\r\n    Retorno:\r\n      float: Número de moles del gas\r\n    \"\"\"\r\n    temp_kelvin = temp_celsius + 273.15\r\n    vol_m3 = volumen / 1000\r\n    moles = (presion * vol_m3) / (8.314 * temp_kelvin)\r\n    return round(moles,2)'),
	(28,'Caída libre',1,143,'Cree una función que determine la velocidad, en m/s, a la que viaja un objeto cuando toca el suelo, en caída libre. La función recibe la altura a la que se encontraba el objeto al soltarse, en metros. Como es caída libre, la velocidad inicial del objeto es de 0 m/s. Asuma que la aceleración debido a la gravedad es de 9.8 m/s2. Puede usar la fórmula vf = √( ((v0)^2) + 2*a*d) para calcular la velocidad final, donde v0 es la velocidad inicial, a es la aceleración y d la distancia al suelo. El valor retornado debe estar redondeado a dos decimales. Ayuda: El módulo math puede serle de utilidad para la raíz cuadrada.',2,'NU','vel_en_caida_libre','float','Velocidad del objeto al tocar el suelo tras la caída libre',1,'c67a774684cd4558',1,'2019-08-14 03:16:49.876945',1,'M','import math\r\n\r\ndef vel_en_caida_libre(altura: float)->float:\r\n    \"\"\" Caída libre\r\n    Parámetros:\r\n      altura (float): Altura desde la cual cae el objeto\r\n    Retorno:\r\n      float: Velocidad del objeto al tocar el suelo tras la caída libre\r\n    \"\"\"\r\n    velocidad = math.sqrt(2 * 9.8 * altura)\r\n    return round(velocidad,2)'),
	(29,'Suma de los primeros N enteros positivos',1,143,'Escriba una función que reciba un número positivo n y luego retorne la suma de todos los enteros positivos desde 1 hasta n. Dicha suma puede calcularla usando la fórmula: suma = n (n+1) / 2',1,'NU','suma_n_enteros_positivos','int','Suma de los primeros N enteros positivos',1,'30b5a62d89e642e8',1,'2019-08-14 03:20:20.609282',1,'B','def suma_n_enteros_positivos(n: int)->int:\r\n    \"\"\" Suma de los primeros N enteros positivos\r\n    Parámetros:\r\n      n (int): Número entero hasta el cual se quiere calcular la suma, desde 1\r\n    Retorno:\r\n      int: Suma de los primeros N enteros positivos\r\n    \"\"\"\r\n    suma = (n * (n+1))/2\r\n    return suma'),
	(30,'costo_hervir_agua',1,143,'La cantidad de energía requerida para aumentar la temperatura de un gramo de un material en un grado Celsius es la capacidad calorífica específica del material, C. La cantidad total de energía, en Joules, requerida para incrementar la temperatura de m gramos de un material en ΔT grados Celsius se puede calcular usando la fórmula: q = m C ∆T. Cree una función que, dada una masa de agua en gramos, calcule el costo de hervir agua que se encuentra a 20°C, para una taza de café. La capacidad calorífica específica del agua es de 4.186 J/g°C. Como la electricidad se cobra normalmente usando como unidad kilowatt-hora en vez de Joules, recuerde que un watt-hora equivale a 3600 Joules, y un kilowatt equivale a 1000 watt. En este caso, asuma que la electricidad cuesta 0.089 dólares por kilowatt-hora. El valor de retorno debe estar redondeado a cuatro decimales.',2,'NU','costo_hervir_agua','float','Valor en dólares de hervir la masa de agua dada como parámetro',1,'34458b02cca34969',1,'2019-08-14 03:20:48.366202',1,'M','def costo_hervir_agua(masa_agua: float)->float:\r\n    \"\"\" costo_hervir_agua\r\n    Parámetros:\r\n      masa_agua (float): Masa de agua a hervir\r\n    Retorno:\r\n      float: Valor en dólares de hervir la masa de agua dada como parámetro\r\n    \"\"\"\r\n    delta_temp = 100 - 20\r\n    energia_en_J = masa_agua * 4.186 * delta_temp\r\n    energia_en_Wh = energia_en_J/3600\r\n    energia_en_kWh = energia_en_Wh/1000\r\n    costo = energia_en_kWh * 0.089\r\n    return round(costo,4)'),
	(31,'Mediana',1,143,'Cuando tenemos una muestra de n datos, si n es impar la mediana se define como el valor que ocupa la posición central, es decir, la posición (n+1)/2, una vez los datos han sido ordenados. Cree una función que recibe tres enteros como parámetros, y retorna la mediana de estos datos. Las funciones max y min pueden serle de utilidad',3,'NU','calcular_mediana','int','La mediana de los 3 enteros',1,'8cf6d8cf8e70427f',1,'2019-08-14 03:23:17.682742',1,'A','def calcular_mediana(a: int, b: int, c: int)->int:\r\n    \"\"\" Mediana\r\n    Parámetros:\r\n      a (int): El primer entero del conjunto de datos\r\n      b (int): El segundo entero del conjunto de datos\r\n      c (int): El tercer entero del conjunto de datos\r\n    Retorno:\r\n      int: La mediana de los 3 enteros\r\n    \"\"\"\r\n    menor=min(a,b,c)\r\n    mayor=max(a,b,c)\r\n    medio = a + b + c - mayor - menor\r\n    return medio'),
	(32,'Tarifa de un taxi',1,143,'En una cierta ciudad, la tarifa de un taxi consiste en una tarifa base de $4000 pesos, más $82 pesos por cada 100 metros recorridos. Escriba una función que reciba como parámetro la distancia recorrida en kilómetros y retorne la tarifa total del viaje. No olvide redondear el valor de retorno al entero más cercano.',1,'NU','calcular_tarifa_taxi','int','Tarifa a cobrar por el recorrido en taxi',1,'936ad2c7fd2e4ee7',1,'2019-08-14 03:25:19.084643',1,'B','def calcular_tarifa_taxi(kms_recorridos: float)->int:\r\n    \"\"\" Tarifa de un taxi\r\n    Parámetros:\r\n      kms_recorridos (float): Kilómetros recorridos en el viaje\r\n    Retorno:\r\n      int: Tarifa a cobrar por el recorrido en taxi\r\n    \"\"\"\r\n    metros = kms_recorridos*1000\r\n    tarifa = 4000 + ((metros/100)*82)\r\n    return round(tarifa)'),
	(33,'Área de un polígono regular',1,143,'Un polígono es regular si todos sus lados son de la misma longitud, y los ángulos entre todos los lados adyacentes son iguales. El área de un polígono regular puede ser calculada usando la siguiente fórmula, donde s es la longitud de un lado y n el número de lados: area = (n * s^2) / (4 * tan(PI/n)). Cree una función que reciba como parámetros s y n, y retorne el área del polígono regular. El área debe estar redondeada a dos decimales.',2,'NU','area_poligono_regular','float','Área del polígono regular',1,'2c4597a4ddbe4612',1,'2019-08-14 03:29:27.688683',1,'M','import math\r\n\r\ndef area_poligono_regular(num_lados: int, longitud: float)->float:\r\n    \"\"\" Área de un polígono regular\r\n    Parámetros:\r\n      num_lados (int): Número de lados del polígono\r\n      longitud (float): Longitud de uno de los lados del polígono\r\n    Retorno:\r\n      float: Área del polígono regular\r\n    \"\"\"\r\n    area = (num_lados * (longitud**2)) / (4 * math.tan(math.pi/num_lados))\r\n    return round(area, 2)'),
	(34,'Hora de llegada de vuelo',1,143,'Una agencia de viajes necesita informar a sus clientes la hora de llegada de sus vuelos. Se conoce la hora de partida del vuelo (en horas, minutos y segundos) y la duración del vuelo (en horas, minutos y segundos). Cree una función que retorne la hora de llegada del vuelo en una cadena con el formato “HH:mm:ss” donde HH es la hora, mm los minutos y ss los segundos de la hora de llegada del vuelo. La hora está dada en formato de 24 horas (su valor se encuentra entre 0 y 23).',3,'NU','calcular_horario_llegada','str','Cadena que indica la hora de llegada del vuelo a su destino',1,'e42646a8a5994731',1,'2019-08-14 03:31:20.382228',1,'A','def calcular_horario_llegada(hora_salida: int, minuto_salida: int, segundo_salida: int, duracion_horas: int, duracion_minutos: int, duracion_segundos: int)->str:\r\n    \"\"\" Hora de llegada de vuelo\r\n    Parámetros:\r\n      hora_salida (int): Hora de salida del vuelo (valor entre 0 y 23)\r\n      minuto_salida (int): Minuto de salida del vuelo (valor entre 0 y 59)\r\n      segundo_salida (int): Segundo de salida del vuelo (valor entre 0 y 59)\r\n      duracion_horas (int): Número de horas que dura el vuelo\r\n      duracion_minutos (int): Número de minutos (adicionales al número de horas) que dura el vuelo\r\n      duracion_segundos (int): Número de segundos (adicionales al número de horas y minutos) que dura el vuelo\r\n    Retorno:\r\n      str: Cadena que indica la hora de llegada del vuelo a su destino\r\n    \"\"\"\r\n    horas_extra = (minuto_salida+duracion_minutos+((segundo_salida+duracion_segundos) // 60)) // 60\r\n\r\n    hora_llegada = (hora_salida+duracion_horas+horas_extra)%24\r\n\r\n    minutos_extra = (segundo_salida+duracion_segundos)//60\r\n    minuto_llegada = (minuto_salida+duracion_minutos+minutos_extra) % 60\r\n  \r\n    segundo_llegada = (segundo_salida+duracion_segundos) % 60\r\n\r\n    return str(hora_llegada)+\':\'+str(minuto_llegada)+\':\'+str(segundo_llegada)'),
	(35,'Altura de una persona',1,143,'En muchos países, la altura de una persona se mide en pies y pulgadas. Cree una función que reciba como parámetro el número de pies y el número de pulgadas que componen la altura de una persona, y retorne la altura en metros (con dos decimales). Recuerde que 1 pie corresponde a 12 pulgadas, y que 1 pulgada corresponde a 2,54 centímetros.',1,'NU','altura_en_mts','float','Altura en metros de la persona',1,'51c6798e07d8492a',1,'2019-08-14 03:31:30.210013',1,'B','def altura_en_mts(pies: int, pulgadas: int)->float:\r\n    \"\"\" Altura de una persona\r\n    Parámetros:\r\n      pies (int): Número de pies que componen la altura de la persona\r\n      pulgadas (int): Número de pulgadas que componen la altura de la persona\r\n    Retorno:\r\n      float: Altura en metros de la persona\r\n    \"\"\"\r\n    ft_to_inch = pies * 12\r\n    altura_en_inch = ft_to_inch+pulgadas\r\n    cms = altura_en_inch * 2.54\r\n    metros = cms/100\r\n    return round(metros,2)'),
	(36,'Ordenar 3 enteros',1,143,'Cree una función que recibe 3 enteros y retorna una cadena con los números ordenados, de esta forma: “mayor, intermedio, menor”. (Ayuda: Puede hacer uso de las funciones max y min)',2,'NU','ordenar_enteros','str','Cadena de caracteres con los enteros ordenados de  mayor a menor, separados por coma',1,'13b225b8d2cb4af1',1,'2019-08-14 03:31:41.985139',1,'M','def ordenar_enteros(a: int, b: int, c: int)->str:\r\n    \"\"\" Ordenar 3 enteros\r\n    Parámetros:\r\n      a (int): El primero de los enteros a ordenar\r\n      b (int): El segundo de los enteros a ordenar\r\n      c (int): El tercero de los enteros a ordenar\r\n    Retorno:\r\n      str: Cadena de caracteres con los enteros ordenados de  mayor a menor, separados por coma\r\n    \"\"\"\r\n    menor=min(a,b,c)\r\n    mayor=max(a,b,c)\r\n    medio = a + b + c - mayor - menor\r\n    return str(mayor)+\",\"+str(medio)+\",\"+str(menor)'),
	(37,'Ángulo entre agujas del reloj',1,143,'Cree una función que calcule el ángulo formado entre las agujas de un reloj (entre horario y minutero), dada una hora y minutos. La hora siempre tendrá un valor entre 1 y 12, y los minutos un valor entre 0 y 59. Recuerde que el minutero salta de minuto a minuto, mientras el horario se va desplazando de forma continua a medida que avanzan los minutos de una hora. El valor de retorno debe tener un único decimal.',3,'NU','angulo_entre_agujas_reloj','float','El ángulo entre las agujas del reloj según la hora y minuto dados como parámetro',1,'a7317345804d4e9e',1,'2019-08-14 04:28:44.530941',1,'A','def angulo_entre_agujas_reloj(hora: int, minutos: int)->float:\r\n    \"\"\" Ángulo entre agujas del reloj\r\n    Parámetros:\r\n      hora (int): Hora marcada en el reloj (Valor entre 1 y 12)\r\n      minutos (int): Minutos marcados en el reloj (Valor entre 0 y 59)\r\n    Retorno:\r\n      float: El ángulo entre las agujas del reloj según la hora y minuto dados como parámetro\r\n    \"\"\"\r\n    angulo_entre_horas = 30\r\n    angulo_entre_mins = 6\r\n\r\n	# Calculo los angulos respecto al 12\r\n    angulo_minutero = angulo_entre_mins * minutos\r\n    angulo_fraccion_hora = (minutos/60)*angulo_entre_horas\r\n    angulo_horario = (angulo_entre_horas * hora) + angulo_fraccion_hora\r\n\r\n    rta = abs(angulo_horario - angulo_minutero)\r\n    return round(rta,1)'),
	(38,'Reciclaje de botellas plásticas',1,143,'Un depósito que recibe botellas plásticas para reciclaje paga $0.10 USD por cada botella de máximo 500 ml, y $0.25 USD por cada botella de litro y medio o más que se lleve para reciclar. Cree una función que reciba la cantidad de botellas de 500 ml o menos, y la cantidad de botellas de litro y medio o más a reciclar, y retorne el dinero a pagar a quien llevó las botellas. El resultado debe tener dos decimales.',1,'NU','calcular_pago_botellas','float','Cantidad de dinero a pagar por las botellas plásticas para reciclaje',1,'4211b3030c9146b9',1,'2019-08-14 04:28:55.460937',1,'B','def calcular_pago_botellas(cant_pequenias: int, cant_grandes: int)->float:\r\n    \"\"\" Reciclaje de botellas plásticas\r\n    Parámetros:\r\n      cant_pequenias (int): Cantidad de botellas pequeñas entregadas\r\n      cant_grandes (int): Cantidad de botellas grandes entregadas\r\n    Retorno:\r\n      float: Cantidad de dinero a pagar por las botellas plásticas para reciclaje\r\n    \"\"\"\r\n    pago = 0.10*cant_pequenias + 0.25*cant_grandes\r\n    return round(pago,2)'),
	(39,'Pan del día anterior',1,143,'Una panadería vende la unidad de pan a $450. El pan del día anterior se vende con un 60% de descuento. Cree una función que reciba la cantidad de panes del día anterior y la cantidad de panes frescos comprados por un cliente, y retorne el valor total de la compra.',2,'NU','calcular_total_pan_comprado','int','Valor total a pagar por el pan comprado',1,'09f17e7a82a9414c',1,'2019-08-14 04:29:06.028668',1,'M','def calcular_total_pan_comprado(frescos: int, viejos: int)->int:\r\n    \"\"\" Pan del día anterior\r\n    Parámetros:\r\n      frescos (int): Cantidad de panes frescos comprados\r\n      viejos (int): Cantidad de panes del día anterior comprados\r\n    Retorno:\r\n      int: Valor total a pagar por el pan comprado\r\n    \"\"\"\r\n    valor_frescos = frescos * 450\r\n    valor_viejos = (viejos * 450) * 0.4\r\n    total = valor_frescos + valor_viejos\r\n    return total'),
	(40,'Volumen de un cilindro',1,143,'El volumen de un cilindro se puede calcular multiplicando el área de su base circular por su altura. Cree una función que reciba el radio de la base y la altura del cilindro, y calcule su volumen. Retorne el resultado redondeado a un solo decimal.',1,'NU','volumen_cilindro','float','El volumen del cilindro',1,'14ad990060014ebb',1,'2019-08-14 04:51:49.461390',1,'B','import math\r\n\r\ndef volumen_cilindro(radio: float, altura: float)->float:\r\n    \"\"\" Volumen de un cilindro\r\n    Parámetros:\r\n      radio (float): Radio de la base del cilindro\r\n      altura (float): Altura del cilindro\r\n    Retorno:\r\n      float: El volumen del cilindro\r\n    \"\"\"\r\n    area_circulo = math.pi * (radio**2)\r\n    vol = area_circulo * altura\r\n    return round(vol,1)'),
	(41,'Área de un triángulo',1,143,'El área de un triángulo puede ser calculada cuando se conoce la longitud de sus lados. Teniendo en cuenta que s1, s2 y s3 son las longitudes de los lados del triángulo, y tomando s = (s1+s2+s3)/2, el área puede ser calculada de la siguiente manera: Area = √( s * (s-s1) * (s-s2) * (s-s3) ). Cree una función que recibe la medida de los lados del triángulo y retorna el área del mismo, redondeada a una cifra decimal. El módulo math puede serle de ayuda para calcular la raíz cuadrada.',2,'NU','area_triangulo','float','El área del triángulo',1,'4a3c93c8aacc461b',1,'2019-08-14 04:51:58.004707',1,'M','import math\r\n\r\ndef area_triangulo(s1: float, s2: float, s3: float)->float:\r\n    \"\"\" Área de un triángulo\r\n    Parámetros:\r\n      s1 (float): Longitud de uno de los lados del triángulo\r\n      s2 (float): Longitud de uno de los lados del triángulo\r\n      s3 (float): Longitud de uno de los lados del triángulo\r\n    Retorno:\r\n      float: El área del triángulo\r\n    \"\"\"\r\n    s = (s1+s2+s3)/2\r\n    area = math.sqrt(s*(s-s1)*(s-s2)*(s-s3))\r\n    return round(area,1)'),
	(42,'Edad de una persona',1,143,'Cree una función que calcule la edad de una persona a partir de su fecha de nacimiento y la fecha actual. Ambas fechas se dan en años, meses y días, y la edad debe retornarse de la misma manera, en una cadena de la forma “aa,MM,dd”. Suponga que todos los meses son de 30 días. Por ejemplo, si Julieta Pérez nació el 20 de Noviembre de 1986, y la fecha actual fuese el 16 de Octubre de 1987, la función retornaría que la edad de Julieta es “0,10,26”, es decir, 0 años, 10 meses y 26 días.',3,'NU','calcular_edad','str','Cadena en que se indica la edad de la persona en años, meses y días',1,'62540a8f4d8f442b',1,'2019-08-14 04:52:06.060522',1,'A','def calcular_edad(dia_nacio: int, mes_nacio: int, anio_nacio: int, dia_actual: int, mes_actual: int, anio_actual: int)->str:\r\n    \"\"\" Edad de una persona\r\n    Parámetros:\r\n      dia_nacio (int): Dia de nacimiento de la persona\r\n      mes_nacio (int): Mes de nacimiento de la persona\r\n      anio_nacio (int): Año de nacimiento de la persona\r\n      dia_actual (int): Dia de la fecha actual\r\n      mes_actual (int): Mes de la fecha actual\r\n      anio_actual (int): Año de la fecha actual\r\n    Retorno:\r\n      str: Cadena en que se indica la edad de la persona en años, meses y días\r\n    \"\"\"\r\n    fecha_nacio_en_dias = (anio_nacio*12*30) + (mes_nacio*30) + dia_nacio\r\n    fecha_actual_en_dias = (anio_actual*12*30) + (mes_actual*30) + dia_actual\r\n    edad_en_dias = fecha_actual_en_dias - fecha_nacio_en_dias\r\n    anios = edad_en_dias // (12*30)\r\n    edad_en_dias -= anios*12*30\r\n    meses = edad_en_dias // 30\r\n    edad_en_dias -= meses*30\r\n    dias = edad_en_dias\r\n    return str(anios)+\",\"+str(meses)+\",\"+str(dias)'),
	(43,'Unidades de tiempo a segundos',1,143,'Cree una función que reciba una duración de un periodo de tiempo en términos de días, horas, minutos y segundos (es decir, debe recibir 4 parámetros) y retorne el total de segundos equivalente a esta duración.',1,'NU','tiempo_a_segundos','int','Número de segundos al que equivale el periodo de tiempo dado como parámetro',1,'0037a61baef64024',1,'2019-08-14 04:54:41.865457',1,'B','def tiempo_a_segundos(dias: int, horas: int, mins: int, seg: int)->int:\r\n    \"\"\" Unidades de tiempo a segundos\r\n    Parámetros:\r\n      dias (int): Número de dias del periodo de tiempo\r\n      horas (int): Número de horas del periodo de tiempo\r\n      mins (int): Número de minutos del periodo de tiempo\r\n      seg (int): Número de segundos del periodo de tiempo\r\n    Retorno:\r\n      int: Número de segundos al que equivale el periodo de tiempo dado como parámetro\r\n    \"\"\"\r\n    mins_to_s = mins*60\r\n    horas_to_s = horas*(60**2)\r\n    dias_to_s = dias*24*(60**2)\r\n    total = mins_to_s+horas_to_s+dias_to_s+seg\r\n    return total'),
	(44,'Índice de masa corporal',1,143,'Cree una función que pueda calcular el índice de masa corporal (BMI) de una persona. La fórmula para calcular el BMI es la siguiente: BMI = peso/altura2, donde peso está en kilogramos y la altura en metros. Tenga en cuenta que el peso y altura que reciban su función van a estar dados en libras y pulgadas respectivamente, ya que su programa será usado en los Estados Unidos. Recuerde que 1 libra corresponde a 0.45 kg, y que 1 pulgada corresponde a 0.025 metros. El valor de retorno debe estar redondeado a dos decimales.',2,'NU','calcular_BMI','float','Índice de masa corporal de la persona',1,'34e1b23127a34cb7',1,'2019-08-14 04:54:51.279782',1,'M','def calcular_BMI(peso_lb: float, altura_inch: float)->float:\r\n    \"\"\" Índice de masa corporal\r\n    Parámetros:\r\n      peso_lb (float): Peso en libras de la persona\r\n      altura_inch (float): Altura en pulgadas de la persona\r\n    Retorno:\r\n      float: Índice de masa corporal de la persona\r\n    \"\"\"\r\n    peso_kg = peso_lb * 0.45\r\n    altura_m = altura_inch * 0.025\r\n    bmi = peso_kg/(altura_m**2)\r\n    return round(bmi,2)'),
	(45,'Caracteres a entero',1,143,'Cree una función que reciba tres caracteres, que representan centenas, decenas y unidades respectivamente, y retorne el número entero que forman dichos dígitos. Por ejemplo, si se recibe ‘9’, ‘1’, ‘4’ se debe retornar 914.',3,'NU','caracteres_a_entero','int','Número entero formado por los caracteres recibidos como parámetro',1,'98dc7225a0e148d2',1,'2019-08-14 04:55:02.811040',1,'A','def caracteres_a_entero(centenas:str, decenas:str, unidades:str) -> int:\r\n    resultado = 0\r\n    resultado += int(centenas) * 100\r\n    resultado += int(decenas) * 10\r\n    resultado += int(unidades)\r\n    return resultado'),
	(46,'Saludo prolongado',1,143,'Cree una función que reciba un nombre y un entero, y retorne la cadena \'Hola\' seguida del nombre recibido por parámetro, pero con la letra \'o\' repetida tantas veces como indique el entero recibido, así como la letra \'a\' la mitad de las veces que la \'o\' (si la mitad no es exacta, se debe tomar la parte entera). Por ejemplo, si se reciben como parámetros \'Egan\' y 5, la cadena a retornar será \'Hooooolaa Egan\'',1,'NU','saludar_repetidas_veces','str','Cadena con el saludo con letras repetidas',1,'52d98bf6a17a4cb0',1,'2019-08-14 05:19:32.829908',1,'B','def saludar_repetidas_veces(nombre: str, veces: int)->str:\r\n    \"\"\" Saludo prolongado\r\n    Parámetros:\r\n      nombre (str): Nombre a incluir en el saludo\r\n      veces (int): Cantidad de veces a repetir las letras\r\n    Retorno:\r\n      str: Cadena con el saludo con letras repetidas\r\n    \"\"\"\r\n    saludo = \'H\'+(\'o\'*veces)+\'l\'+(\'a\'*int(veces/2))+\' \'+nombre\r\n    return saludo'),
	(47,'Centrar texto en la terminal',1,143,'Escriba una función que reciba como parámetros una cadena de caracteres y un entero que representa el ancho en caracteres de la terminal. La función debe retornar un nuevo string que consiste en el string original pero con la cantidad correcta de espacios al inicio, de forma que la cadena quede centrada en una ventana de terminal del ancho que fue dado como parámetro cuando esta se imprima. La función len(…) puede ayudarle a calcular la longitud del string que se da como parámetro.',2,'NU','centrar_texto','str','El texto dado como parámetro, con el número de espacios necesarios al inicio para verse centrado en la terminal',1,'214d24829187497a',1,'2019-08-14 05:19:42.331657',1,'M','def centrar_texto(cadena: str, ancho_terminal: int)->str:\r\n    \"\"\" Centrar texto en la terminal\r\n    Parámetros:\r\n      cadena (str): El texto a centrar\r\n      ancho_terminal (int): El ancho de la terminal, en número de caracteres máximo por línea\r\n    Retorno:\r\n      str: El texto dado como parámetro, con el número de espacios necesarios al inicio para verse centrado en la terminal\r\n    \"\"\"\r\n    espacios = (ancho_terminal - len(cadena)) // 2\r\n    resultado = \" \"*espacios + cadena\r\n    return resultado'),
	(48,'Tiempo de descarga',1,143,'Haga una función que pida al usuario su velocidad de Internet (en Mbps, es decir, Megabits por segundo), y el tamaño de un archivo a descargar (en GB, es decir, Gigabytes), y retorne el tiempo en minutos estimado (redondee al entero más cercano) para realizar la descarga de dicho archivo sobre esa red. Para esto, tenga en cuenta que el tiempo lo puede calcular como t = tamaño archivo/velocidad descarga. El tamaño y velocidad deben estar en unidades homogéneas (por ejemplo, MB y MB/s, o GB y GB/s, de tal forma que se puedan operar). Nota: Recuerde que un MB (Megabyte) equivale a 8 Mb (Megabits), y que un GB equivale a 1000 MB.',1,'NU','calcular_tiempo_descarga','int','Tiempo estimado en minutos que toma la descarga del archivo',1,'db2d6e96c27a4754',1,'2019-08-14 05:19:51.928169',1,'B','def calcular_tiempo_descarga(velocidad: int, tamanio_archivo: int)->int:\r\n    \"\"\" Tiempo de descarga\r\n    Parámetros:\r\n      velocidad (int): Velocidad de descarga de la red, en Mbps\r\n      tamanio_archivo (int): Tamaño del archivo a descargar, en GB\r\n    Retorno:\r\n      int: Tiempo estimado en minutos que toma la descarga del archivo\r\n    \"\"\"\r\n    tam_en_Mb = tamanio_archivo * 1000 * 8\r\n    tiempo_en_s = tam_en_Mb/velocidad\r\n    tiempo_mins = tiempo_en_s/60\r\n    return round(tiempo_mins)'),
	(49,'Distancia Manhattan',1,143,'La distancia Manhattan es una medida que alude al diseño de las calles de Manhattan, donde la distancia entre dos puntos no está dada por la línea recta que une los dos puntos, ya que es muy probable que dicha recta atraviese varios inmuebles por los que no es posible transitar, sino que se calcula como la longitud de cualquier camino que una los dos puntos mediante segmentos horizontales y verticales. Más formalmente, se dice que la distancia Manhattan entre dos puntos es la suma de las diferencias absolutas de sus coordenadas, lo que quiere decir que entre dos puntos (x1, y1) y (x2, y2) la distancia se calcula como |x1-x2| + |y1-y2|. Cree una función que reciba como parámetro cuatro enteros, que indican las coordenadas de dos puntos en un plano, y calcule la distancia Manhattan entre estos',2,'NU','calcular_distancia_manhattan','int','Distancia manhattan entre las dos coordenadas dadas como parámetro',1,'0ead280194924999',1,'2019-08-14 05:20:01.187766',1,'M','def calcular_distancia_manhattan(x1: int, y1: int, x2: int, y2: int)->int:\r\n    \"\"\" Distancia Manhattan\r\n    Parámetros:\r\n      x1 (int): Coordenada en X del primer punto\r\n      y1 (int): Coordenada en Y del primer punto\r\n      x2 (int): Coordenada en X del segundo punto\r\n      y2 (int): Coordenada en Y del segundo punto\r\n    Retorno:\r\n      int: Distancia manhattan entre las dos coordenadas dadas como parámetro\r\n    \"\"\"\r\n    distancia = abs(x1 - x2) + abs(y1 - y2)\r\n    return distancia'),
	(55,'Encontrar el elemento mayor',1,142,'En este ejercicio se quiere encontrar el número mayor en una lista de enteros positivos. Usted debe construir una función que retorne el número mayor que se encuentre en la lista. En caso de que la lista esté vacía, se debe retornar -1.',2,'NU','encontrar_mayor','int','El número más grande en la lista',1,'98be8fbc48924ef1',3,'2019-08-19 15:22:24.326231',1,'B','def encontrar_mayor(entrada: list)->int:\r\n    \"\"\" Encontrar el elemento mayor\r\n    Parámetros:\r\n      entrada (list): La lista de números que se desea buscar\r\n    Retorno:\r\n      int: El número más grande en la lista\r\n    \"\"\"\r\n    if len(entrada) == 0:\r\n      return -1\r\n    else:\r\n      return max(entrada)'),
	(56,'Encontrar el elemento menor',1,142,'En este ejercicio se quiere encontrar el número menor en una lista de enteros. Usted debe construir una función que retorne el número menor que se encuentre en la lista. En caso de que la lista esté vacía, se debe retornar None.',2,'NU','encontrar_menor','int','El número más pequeño en la lista',1,'bdee45bd1bcf4a47',3,'2019-08-19 15:22:49.191592',1,'B','def encontrar_menor(entrada: list)->int:\r\n    \"\"\" Encontrar el elemento menor\r\n    Parámetros:\r\n      entrada (list): La lista\r\n    Retorno:\r\n      int: El número más pequeño en la lista\r\n    \"\"\"\r\n    if len(entrada) == 0:\r\n      return -1\r\n    return min(entrada)'),
	(57,'Buscar un elemento en una lista',1,142,'En este ejercicio se quiere saber si un número entero se encuentra en una lista. Usted debe construir una función que reciba una lista y un número entero a buscar, y que retorne un entero que indique el índice en que se encuentra este elemento. En caso de que el elemento se encuentre más de una vez, debe retornar la primera posición en que lo encuentre. En caso de no encontrarse, retorne -1.',3,'NU','buscar_elemento','int','Número que indica el índice en que se encuentra el elemento bsucado',1,'19c5c3be6ad943c5',3,'2019-08-19 15:25:07.780950',1,'B','def buscar_elemento(entrada: list, buscado: int)->int:\r\n    \"\"\" Buscar un elemento en una lista\r\n    Parámetros:\r\n      entrada (list): Lista en la cuál se debe buscar el número\r\n      buscado (int): Número entero a buscar\r\n    Retorno:\r\n      int: Número que indica el índice en que se encuentra el elemento bsucado\r\n    \"\"\"\r\n    if not buscado in entrada:\r\n      return -1\r\n    else:\r\n      return entrada.index(buscado)'),
	(58,'Moda en una cadena',1,142,'En este ejercicio usted deberá identificar la letra más común (o moda) en una cadena recibida por parámetro. Cree una función que reciba una cadena (str) que será analizada, y que retorne otra cadena (str) que contenga la letra más común en esta cadena inicial. Para su facilidad las cadenas que usted recibirá solo contendrán letras mayúsculas y no tendrán tildes o acentos. No obstante estas sí pueden tener espacios, puntos y comas. En caso de que haya 2 letras con la misma cantidad de apariciones, debe retornar la que sea alfabéticamente posterior.',3,'NU','letra_mas_comun','str','La letra más común en la cadena que ingresa como parámetro',1,'fc67586816744d85',3,'2019-08-19 15:26:13.212104',1,'B','import string\r\n\r\ndef letra_mas_comun(cadena: str)->str:\r\n    \"\"\" Moda en una cadena\r\n    Parámetros:\r\n      cadena (str): La cadena en la que se quiere saber cuál es la letra más común\r\n    Retorno:\r\n      str: La letra más común en la cadena que ingresa como parámetro\r\n    \"\"\"\r\n    elems = list(cadena)\r\n    elems.sort()\r\n    \r\n    moda_num = 0\r\n    moda = \"\"\r\n    \r\n    for char in elems:\r\n      if char in string.ascii_uppercase:\r\n        cantidad = elems.count(char)\r\n        if cantidad >= moda_num:\r\n            moda = char\r\n            moda_num = cantidad\r\n          \r\n    return moda'),
	(59,'Encontrar si un número es Primo',1,142,'Para el siguiente ejercicio usted deberá determinar con ayuda de un ciclo si un número es primo. Un número se denomina como primo cuando este solamente es divisible por 1 y por sí mismo. Cree una función que reciba un entero por parámetro y que retorne un booleano que indique si dicho número es primo. El entero que se va a recibir, siempre será positivo.',2,'NU','es_primo','bool','Booleano que indica si el número entero recibido por parámetro es primo',1,'d1894450d8b740a8',3,'2019-08-19 15:32:32.414472',1,'B','def es_primo(numero: int)->bool:\r\n    \"\"\" Encontrar si un número es Primo\r\n    Parámetros:\r\n      numero (int): Entero que se busca ver si es primo\r\n    Retorno:\r\n      boolean: Booleano que indica si el número entero recibido por parámetro es primo\r\n    \"\"\"\r\n    mayor = (numero / 2) + 1\r\n    for i in range(2, int(mayor)):\r\n        if numero % i == 0:\r\n            return False\r\n    else:\r\n        return True');

/*!40000 ALTER TABLE `dashboard_problema` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dashboard_problema_tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dashboard_problema_tags`;

CREATE TABLE `dashboard_problema_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `problema_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dashboard_problema_tags_problema_id_tag_id_8b5f899d_uniq` (`problema_id`,`tag_id`),
  KEY `dashboard_problema_tags_tag_id_aaa27a33_fk_dashboard_tag_id` (`tag_id`),
  CONSTRAINT `dashboard_problema_t_problema_id_4692c0bf_fk_dashboard` FOREIGN KEY (`problema_id`) REFERENCES `dashboard_problema` (`id`),
  CONSTRAINT `dashboard_problema_tags_tag_id_aaa27a33_fk_dashboard_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `dashboard_tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

LOCK TABLES `dashboard_problema_tags` WRITE;
/*!40000 ALTER TABLE `dashboard_problema_tags` DISABLE KEYS */;

INSERT INTO `dashboard_problema_tags` (`id`, `problema_id`, `tag_id`)
VALUES
	(12,1,1),
	(1,1,2),
	(2,1,6),
	(3,1,7),
	(4,2,1),
	(5,2,3),
	(6,3,1),
	(7,3,3),
	(8,4,6),
	(9,5,1),
	(10,5,3),
	(11,5,9),
	(30,17,19),
	(31,17,20),
	(32,17,21),
	(33,17,22),
	(35,19,19),
	(36,19,22),
	(37,20,19),
	(38,20,22),
	(39,21,19),
	(40,21,22),
	(41,21,24),
	(45,23,19),
	(46,23,22),
	(47,23,24),
	(53,26,19),
	(54,26,22),
	(57,28,19),
	(60,28,20),
	(59,28,21),
	(58,28,22),
	(61,29,19),
	(62,29,22),
	(63,30,19),
	(64,30,22),
	(65,31,19),
	(67,31,21),
	(66,31,22),
	(68,32,19),
	(69,32,22),
	(70,33,19),
	(72,33,20),
	(73,33,21),
	(71,33,22),
	(74,34,19),
	(75,34,22),
	(76,34,24),
	(77,35,19),
	(78,35,22),
	(79,36,19),
	(81,36,21),
	(80,36,22),
	(82,37,19),
	(83,37,22),
	(84,38,19),
	(85,38,22),
	(86,39,19),
	(87,39,22),
	(88,40,19),
	(90,40,20),
	(89,40,22),
	(91,41,19),
	(92,41,20),
	(93,41,21),
	(94,41,22),
	(95,42,19),
	(96,42,22),
	(97,42,24),
	(98,43,19),
	(99,43,22),
	(100,44,19),
	(101,44,22),
	(102,45,19),
	(103,45,22),
	(104,46,19),
	(105,46,21),
	(106,46,24),
	(107,46,25),
	(108,47,19),
	(110,47,22),
	(109,47,26),
	(111,48,19),
	(112,48,22),
	(113,49,19),
	(115,49,21),
	(114,49,22),
	(121,55,1),
	(122,55,3),
	(123,55,30),
	(124,56,1),
	(125,56,3),
	(126,56,30),
	(127,57,1),
	(128,57,2),
	(129,57,30),
	(130,58,1),
	(131,58,3),
	(132,58,9),
	(133,59,1),
	(134,59,31);

/*!40000 ALTER TABLE `dashboard_problema_tags` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dashboard_profesor
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dashboard_profesor`;

CREATE TABLE `dashboard_profesor` (
  `usuario_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`usuario_ptr_id`),
  CONSTRAINT `dashboard_profesor_usuario_ptr_id_710edb52_fk_dashboard` FOREIGN KEY (`usuario_ptr_id`) REFERENCES `dashboard_usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

LOCK TABLES `dashboard_profesor` WRITE;
/*!40000 ALTER TABLE `dashboard_profesor` DISABLE KEYS */;

INSERT INTO `dashboard_profesor` (`usuario_ptr_id`)
VALUES
	(8),
	(118),
	(142),
	(143),
	(168);

/*!40000 ALTER TABLE `dashboard_profesor` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dashboard_profesor_secciones
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dashboard_profesor_secciones`;

CREATE TABLE `dashboard_profesor_secciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profesor_id` int(11) NOT NULL,
  `seccion_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dashboard_profesor_secci_profesor_id_seccion_id_1bad0adf_uniq` (`profesor_id`,`seccion_id`),
  KEY `dashboard_profesor_s_seccion_id_cfa7ac41_fk_dashboard` (`seccion_id`),
  CONSTRAINT `dashboard_profesor_s_profesor_id_3358d81e_fk_dashboard` FOREIGN KEY (`profesor_id`) REFERENCES `dashboard_profesor` (`usuario_ptr_id`),
  CONSTRAINT `dashboard_profesor_s_seccion_id_cfa7ac41_fk_dashboard` FOREIGN KEY (`seccion_id`) REFERENCES `dashboard_seccion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

LOCK TABLES `dashboard_profesor_secciones` WRITE;
/*!40000 ALTER TABLE `dashboard_profesor_secciones` DISABLE KEYS */;

INSERT INTO `dashboard_profesor_secciones` (`id`, `profesor_id`, `seccion_id`)
VALUES
	(7,8,1),
	(8,8,2),
	(17,118,16),
	(19,118,17),
	(21,118,18),
	(23,118,19),
	(25,118,20),
	(37,118,28),
	(18,142,16),
	(20,142,17),
	(22,142,18),
	(24,142,19),
	(26,142,20),
	(38,142,28),
	(35,143,27),
	(36,168,27);

/*!40000 ALTER TABLE `dashboard_profesor_secciones` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dashboard_prueba
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dashboard_prueba`;

CREATE TABLE `dashboard_prueba` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` int(11) NOT NULL,
  `descripcion` varchar(120) NOT NULL,
  `comentario_ok` varchar(120) NOT NULL,
  `comentario_error` varchar(120) NOT NULL,
  `problema_id` int(11) DEFAULT NULL,
  `tiempo` int(11) NOT NULL,
  `tipo` varchar(2) NOT NULL,
  `peso` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_prueba_problema_id_5889d570_fk_dashboard_problema_id` (`problema_id`),
  CONSTRAINT `dashboard_prueba_problema_id_5889d570_fk_dashboard_problema_id` FOREIGN KEY (`problema_id`) REFERENCES `dashboard_problema` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

LOCK TABLES `dashboard_prueba` WRITE;
/*!40000 ALTER TABLE `dashboard_prueba` DISABLE KEYS */;

INSERT INTO `dashboard_prueba` (`id`, `numero`, `descripcion`, `comentario_ok`, `comentario_error`, `problema_id`, `tiempo`, `tipo`, `peso`)
VALUES
	(1,1,'Prueba básica','Correcto con datos básicos','La respuesta es incorrecta para datos básicos',1,5,'IO',1),
	(6,1,'Buscar caracteres duplicados en una cadena sin caracteres duplicados','Reconoció que no había caracteres duplicados','No respondió correctamente cuando no había caracteres duplicados',5,5,'IO',0.2),
	(7,2,'Encontrar caracteres alfabéticos duplicados','Encontró caracteres alfabéticos duplicados','No encontró caracteres alfabéticos duplicados',5,5,'IO',0.2),
	(8,3,'Encontrar caracteres no-alfabéticos duplicados','Encontró caracteres no-alfabéticos duplicados','No encontró caracteres no-alfabéticos duplicados',5,5,'IO',0.2),
	(9,4,'Diferenciar entre mayúsculas y minúsculas','Diferenció correctamente entre mayúsculas y minúsuclas','No diferenció correctamente entre mayúsculas y minúsuclas',5,5,'IO',0.2),
	(10,5,'Reconocer correctamente cadenas vacías','Reconoció correctamente el caso en que la cadena estaba vacía','No reconoció correctamente el caso en que la cadena estaba vacía',5,5,'IO',0.2),
	(11,1,'Calcular correctamente la distancia entre dos puntos en la Tierra','Se calcula correctamente la distancia entre dos puntos en la Tierra','No se calcula correctamente la distancia entre dos puntos en la Tierra',17,5,'IO',1),
	(13,1,'La función calcula correctamente el área','Se calculó correctamente el área','No calcula el área de forma correcta',19,5,'IO',1),
	(14,1,'Calcular correctamente la eficiencia en litros por cada 100 km','Se calcula correctamente la eficiencia en litros por cada 100 km','No se calcula correctamente la eficiencia en litros por cada 100 km',20,5,'IO',1),
	(15,1,'Calcular correctamente el número de monedas, cuando solo se deben retornar de 500','Se calcula correctamente el número de monedas, cuando solo se deben retornar de 500','No se calcula correctamente el número de monedas, cuando solo se deben retornar de 500',21,5,'IO',0.1),
	(16,2,'Calcular correctamente el número de monedas, cuando solo se deben retornar de 200','Se calcula correctamente el número de monedas, cuando solo se deben retornar de 200','No se calcula correctamente el número de monedas, cuando solo se deben retornar de 200',21,5,'IO',0.1),
	(17,3,'Calcular correctamente el número de monedas, cuando solo se deben retornar de 100','Se calcula correctamente el número de monedas, cuando solo se deben retornar de 100','No se calcula correctamente el número de monedas, cuando solo se deben retornar de 100',21,5,'IO',0.1),
	(18,4,'Calcular correctamente el número de monedas, cuando solo se deben retornar de 50','Se calcula correctamente el número de monedas, cuando solo se deben retornar de 50','No se calcula correctamente el número de monedas, cuando solo se deben retornar de 50',21,5,'IO',0.1),
	(19,5,'Calcular correctamente el número de monedas, cuando se retornan de varias denominaciones','Se calcula correctamente el número de monedas, cuando se retornan de varias denominaciones','No se calcula correctamente el número de monedas, cuando se retornan de varias denominaciones',21,5,'IO',0.6),
	(21,1,'Calcular correctamente propina, iva y total de la factura','Calcula correctamente el IVA, propina y total de la factura','No calcula correctamente el Iva, propina y total de la factura',23,5,'IO',1),
	(28,1,'Calcular correctamente el número de moles del gas','Se calcula correctamente el número de moles del gas','No se calcula correctamente el número de moles del gas',26,5,'IO',1),
	(30,1,'Calcula correctamente la velocidad al tocar el suelo del objeto','Se calcula correctamente la velocidad al tocar el suelo del objeto','No se calcula correctamente la velocidad al tocar el suelo del objeto',28,5,'IO',1),
	(31,1,'Calcular correctamente la suma','Se calcula correctamente la suma desde 1 hasta n','No se calcula correctamente la suma desde 1 hasta n',29,5,'IO',1),
	(32,1,'Calcula correctamente el valor de hervir la masa de agua','Se calcula correctamente el valor de hervir la masa de agua','No se calcula correctamente el valor de hervir la masa de agua',30,5,'IO',1),
	(33,1,'Calcular correctamente la mediana de los enteros','Se calcula correctamente la mediana del conjunto de enteros','No se calcula correctamente la mediana del conjunto de enteros',31,5,'IO',1),
	(34,1,'Calcular tarifa correctamente','Calcula correctamente la tarifa del viaje','No calcula correctamente la tarifa del viaje',32,5,'IO',1),
	(35,1,'Calcular correctamente el área del polígono','Se calcula correctamente el área del polígono','No se calcula correctamente el área del polígono',33,5,'IO',1),
	(36,1,'Calcular la hora de llegada del vuelo, cuando la duración es menor a una hora','Se calcula correctamente la hora de llegada del vuelo, cuando la duración es menor a una hora','No se calcula correctamente la hora de llegada del vuelo, cuando la duración es menor a una hora',34,5,'IO',0.5),
	(37,2,'Calcular la hora de llegada del vuelo, cuando la duración es mayor a una hora','Se calcula correctamente la hora de llegada del vuelo, cuando la duración es mayor a una hora','No se calcula correctamente la hora de llegada del vuelo, cuando la duración es mayor a una hora',34,5,'IO',0.5),
	(38,1,'Calcular correctamente la altura en metros','Se calcula correctamente la altura en metros','No se calcula correctamente la altura en metros',35,5,'IO',1),
	(39,1,'Ordenar correctamente los tres enteros de mayor a menor','Se ordenan correctamente los tres enteros de mayor a menor','No se ordenan correctamente los tres enteros de mayor a menor',36,5,'IO',1),
	(40,1,'Calcular correctamente el ángulo entre las agujas del reloj','Se calcula correctamente el ángulo entre las agujas del reloj','No se calcula correctamente el ángulo entre las agujas del reloj',37,5,'IO',1),
	(41,1,'Calcular correctamente el pago cuando no hay botellas pequeñas','Calcula correctamente el pago cuando no hay botellas pequeñas','No calcula correctamente el pago cuando no hay botellas pequeñas',38,5,'IO',0.33),
	(42,2,'Calcular correctamente el pago cuando no hay botellas grandes','Calcula correctamente el pago cuando no hay botellas grandes','No calcula correctamente el pago cuando no hay botellas grandes',38,5,'IO',0.33),
	(43,3,'Calcular correctamente el pago cuando hay botellas de ambos tamaños','Calcula correctamente el pago cuando hay botellas de ambos tamaños','No calcula correctamente el pago cuando hay botellas de ambos tamaños',38,5,'IO',0.34),
	(44,1,'Calcular correctamente el valor de la compra cuando solo se llevan panes frescos','Se calcula correctamente el valor de la compra cuando solo se llevan panes frescos','No se calcula correctamente el valor de la compra cuando solo se llevan panes frescos',39,5,'IO',0.33),
	(45,2,'Calcular correctamente el valor de la compra cuando solo se llevan panes viejos','Se calcula correctamente el valor de la compra cuando solo se llevan panes viejos','No se calcula correctamente el valor de la compra cuando solo se llevan panes viejos',39,5,'IO',0.33),
	(46,3,'Calcular correctamente el valor de la compra cuando se compran ambos tipos de pan','Se calcula correctamente el valor de la compra cuando se compran ambos tipos de pan','No se calcula correctamente el valor de la compra cuando se compran ambos tipos de pan',39,5,'IO',0.34),
	(47,1,'Calcular correctamente el área del cilindro','Calcula correctamente el área del cilindro','No calcula correctamente el área del cilindro',40,5,'IO',1),
	(48,1,'Calcular correctamente el área del triángulo','Se calcula correctamente el área del triángulo','No se calcula correctamente el área del triángulo',41,5,'IO',1),
	(49,1,'Calcular edad cuando es de sólo días','Se calcula correctamente la edad cuando consiste solamente de días','No se calcula correctamente la edad cuando consiste solamente de días',42,5,'IO',0.33),
	(50,2,'Calcular edad cuando es de meses','Se calcula correctamente la edad cuando consiste en meses','No se calcula correctamente la edad cuando consiste en meses',42,5,'IO',0.33),
	(51,3,'Calcular edad cuando comprende años, meses y días','Se calcula correctamente la edad cuando consiste en años, meses y días','No se calcula correctamente la edad cuando consiste en años, meses y días',42,5,'IO',0.34),
	(52,1,'Calcula correctamente el número de segundos cuando el periodo solo incluye dias','Se calcula correctamente el número de segundos cuando el periodo solo incluye dias','No se calcula correctamente el número de segundos cuando el periodo solo incluye dias',43,5,'IO',0.25),
	(53,2,'Calcula correctamente el número de segundos cuando el periodo solo incluye horas','Se calcula correctamente el número de segundos cuando el periodo solo incluye horas','No se calcula correctamente el número de segundos cuando el periodo solo incluye horas',43,5,'IO',0.25),
	(54,3,'Calcula correctamente el número de segundos cuando el periodo solo incluye minutos','Se calcula correctamente el número de segundos cuando el periodo solo incluye minutos','No se calcula correctamente el número de segundos cuando el periodo solo incluye minutos',43,5,'IO',0.25),
	(55,4,'Calcula correctamente el número de segundos cuando el periodo incluye valores en todas las unidades','Se calcula correctamente el número de segundos cuando el periodo incluye valores en todas las unidades','No se calcula correctamente el número de segundos cuando el periodo incluye valores en todas las unidades',43,5,'IO',0.25),
	(56,1,'Calcular correctamente el BMI de una persona','Se calcula correctamente el BMI dado el peso en libras y la altura en pulgadas','No se calcula correctamente el BMI dado el peso en libras y la altura en pulgadas',44,5,'IO',1),
	(57,1,'Retornar correctamente el número entero a partir de los caracteres dados','Se retorna correctamente el número entero que se forma a partir de los caracteres dados como parámetro','No se retorna correctamente el número entero que se forma a partir de los caracteres dados como parámetro',45,5,'IO',1),
	(58,1,'Retorna correctamente la cadena de saludo','Se retorna correctamente la cadena de saludo','No se retorna correctamente la cadena de saludo',46,5,'IO',1),
	(59,1,'Centrar correctamente el texto en la terminal','Se centra correctamente el texto en la terminal','No se centra correctamente el texto en la terminal',47,5,'IO',1),
	(60,1,'Calcular correctamente el tiempo de descarga','Se calcula correctamente el tiempo de descarga','No se calcula correctamente el tiempo de descarga',48,5,'IO',1),
	(61,1,'Calcular correctamente la distancia Manhattan entre dos puntos','Se calcula correctamente la distancia Manhattan','No se calcula correctamente la distancia Manhattan',49,5,'IO',1),
	(62,1,'Prueba una aparición','Funciona correctamente cuando el elemento está sólo una vez','No se encontró el elemento que aparecía una sola vez',3,5,'IO',1),
	(63,2,'El elemento no existe','Responde correctamente cuando el elemento no existe','No responde correctamente si el elemento no existe en la lista',3,5,'IO',1),
	(64,3,'Prueba múltiples apariciones','Cuenta correctamente cuando el elemento aparece múltiples veces','No cuenta correctamente cuando el elemento aparece múltiples veces',3,5,'IO',1),
	(65,4,'Lista vacía','Maneja correctamente el caso en que la lista está vacía','No funciona correctamente cuando la lista está vacía',3,5,'IO',1),
	(75,1,'Lista Vacía','El retorno es el esperado cuando la lista está vacía','No se responde correctamente si la lista no tiene elementos',55,5,'IO',0.1),
	(76,2,'Listas llenas','Se ha encontrado el elemento mayor para todos los casos','No se ha encontrado el elemento mayor en todos los casos',55,5,'IO',0.9),
	(77,1,'Lista Vacía','El retorno es el esperado cuando la lista está vacía','No se responde correctamente si la lista no tiene elementos',56,5,'IO',0.1),
	(78,2,'Listas Llenas','Se ha encontrado el elemento menor en todos los casos','No se ha encontrado el elemento menor en todos los casos',56,5,'IO',0.9),
	(79,1,'El número se encuentra en la lista.','Encontró el número buscado','No encontró el número buscado',57,5,'IO',0.3),
	(80,2,'El número no existe en la lista','Identificó que el número no se encontraba en la lista','No se obtuvo la respuesta esperada cuando el número no existía en la lista',57,5,'IO',0.3),
	(81,3,'Encontrar solamente la primera aparición del número','La posición del número encontrado es correcta','No se ha retornado la posición esperada',57,5,'IO',0.4),
	(82,1,'Moda en cadenas sencillas','La letra más común fue identificada correctamente','La letra más común no es la esperada',58,5,'IO',0.3),
	(83,2,'Moda en cadenas con espacios y comas','La letra más común fue identificada correctamente','La letra más común no es la esperada cuando hay puntos, comas y espacios',58,5,'IO',0.3),
	(84,3,'Moda cuando hay varias letras con las mismas apariciones','La letra más común fue identificada correctamente','La letra más común no es la esperada cuando hay varias letras igual de comunes',58,5,'IO',0.4),
	(85,1,'Reconocimiento de No Primos','Los números No primos se reconocieron como tal','Un número No primo fue reconocido como Primo',59,5,'IO',0.5),
	(86,2,'Reconocimiento de Primos','Los números que son Primos fueron reconocidos','Un número primo no fue reconocido',59,5,'IO',0.5);

/*!40000 ALTER TABLE `dashboard_prueba` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dashboard_pruebaio
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dashboard_pruebaio`;

CREATE TABLE `dashboard_pruebaio` (
  `prueba_ptr_id` int(11) NOT NULL,
  `entrada` longtext NOT NULL,
  `salida` longtext NOT NULL,
  PRIMARY KEY (`prueba_ptr_id`),
  CONSTRAINT `dashboard_pruebaio_prueba_ptr_id_c98c4f95_fk_dashboard_prueba_id` FOREIGN KEY (`prueba_ptr_id`) REFERENCES `dashboard_prueba` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

LOCK TABLES `dashboard_pruebaio` WRITE;
/*!40000 ALTER TABLE `dashboard_pruebaio` DISABLE KEYS */;

INSERT INTO `dashboard_pruebaio` (`prueba_ptr_id`, `entrada`, `salida`)
VALUES
	(6,'\'abcdef\'\r\n\'12345\'\r\n\'.,!@\'\r\n\'abcd1234!@#\'','[]\r\n[]\r\n[]\r\n[]\r\n[]'),
	(7,'\'abcdeabcde\'\r\n\'abcdeabcdeabcdeabcde\'\r\n\'abcaaabbbccc\'\r\n\'abcddcba\'','[\'a\', \'b\', \'c\', \'d\', \'e\']\r\n[\'a\', \'b\', \'c\', \'d\', \'e\']\r\n[\'a\', \'b\', \'c\', \'d\', \'e\']\r\n[\'a\', \'b\', \'c\', \'d\', \'e\']'),
	(8,'\"12341234\"\r\n\"12344321\"\r\n\"123412341234\"\r\n\"111222333444\"\r\n\"!23$!23$\"','[\'1\',\'2\',\'3\',\'4\']\r\n[\'1\',\'2\',\'3\',\'4\']\r\n[\'1\',\'2\',\'3\',\'4\']\r\n[\'1\',\'2\',\'3\',\'4\']\r\n[\'!\',\'$\',\'2\',\'3\']'),
	(9,'\'abcdABCD\'\r\n\'AbcdABCD\'\r\n\'abcdABcD\'\r\n\'aBcdABcD\'','[]\r\n[\'A\']\r\n[\'c\']\r\n[\'B\', \'c\']'),
	(10,'\'\'','[]'),
	(11,'4.624335,-74.063644,10.963889,-74.796387\n40.416775,-3.703790,41.390205,2.154007\n48.864716,2.349014,52.520008,13.404954\n41.902782,12.496366,45.438759,12.327145','709.53\n503.96\n877.18\n393.42'),
	(13,'10,5\n0,0\n11.2,4.5\n3.5,9.3\n5.1,14.32','50\n0\n50.4\n32.55\n73.03'),
	(14,'10\n45\n21.62\n55.11','23.62\n5.25\n10.93\n4.29'),
	(15,'1500\n3000\n4500','\'3,0,0,0\'\n\'6,0,0,0\'\n\'9,0,0,0\''),
	(16,'200\r\n400','\'0,1,0,0\'\r\n\'0,2,0,0\''),
	(17,'100','\'0,0,1,0\''),
	(18,'50','\'0,0,0,1\''),
	(19,'3400\r\n7250\r\n9100\r\n600\r\n850\r\n150','\'6,2,0,0\'\r\n\'14,1,0,1\'\r\n\'18,0,1,0\'\r\n\'1,0,1,0\'\r\n\'1,1,1,1\'\r\n\'0,0,1,1\''),
	(21,'5500\n17400\n20900\n57250','\'1045,550,7095\'\n\'3306,1740,22446\'\n\'3971,2090,26961\'\n\'10878,5725,73852\''),
	(28,'10000,14,42\n900000,5,50\n1550000,15.5,30.2\n400500,2,20.75','0.05\n1.67\n9.53\n0.33'),
	(30,'10\n30.5\n2.32\n500.64','14\n24.45\n6.74\n99.06'),
	(31,'50\n25\n93\n140\n1','1275\n325\n4371\n9870\n1'),
	(32,'1000\n50\n70520\n512','0.0083\n0.0004\n0.5838\n0.0042'),
	(33,'1,2,3\n17,36,74\n92,41,52\n9,0,2\n14,53,12','2\n36\n52\n2\n14'),
	(34,'1.5\n10.7\n12\n7.6','5230\n12774\n13840\n10232'),
	(35,'5,10\n10,2\n3,9.34\n8,1.23\n15,5.45','172.05\n30.78\n37.77\n7.3\n524.02'),
	(36,'14,15,20,0,52,10\n23,30,0,0,40,20\n7,3,58,0,24,33','\'15:7:30\'\n\'0:10:20\'\n\'7:28:31\''),
	(37,'14,15,20,3,52,10\n23,30,0,8,40,20\n7,3,58,12,24,33','\'18:7:30\'\n\'8:10:20\'\n\'19:28:31\''),
	(38,'5,11\n6,2\n6,6\n9,0\n5,7','1.8\n1.88\n1.98\n2.74\n1.7'),
	(39,'1,2,3\n17,36,74\n92,41,52\n9,0,2\n14,53,12','\'3,2,1\'\n\'74,36,17\'\n\'92,52,41\'\n\'9,2,0\'\n\'53,14,12\''),
	(40,'2,20\n4,15\n5,57\n8,11','50\n37.5\n163.5\n179.5'),
	(41,'0,10\n0,3\n0,15\n0,4','2.5\n0.75\n3.75\n1'),
	(42,'10,0\n3,0\n15,0\n4,0','1\n0.3\n1.5\n0.4'),
	(43,'10,4\n6,5\n11,9\n2,8\n1,7\n4,20','2\n1.85\n3.35\n2.2\n1.85\n5.4'),
	(44,'10,0\n4,0\n22,0\n7,0','4500\n1800\n9900\n3150'),
	(45,'0,10\n0,4\n0,22\n0,7','1800\n720\n3960\n1260'),
	(46,'10,3\n4,4\n22,15\n7,6','5040\n2520\n12600\n4230'),
	(47,'5,2\n7,9\n5.6,7.1\n10.5,15.2\n11.45,2.32','157.1\n1385.4\n699.5\n5264.7\n955.5'),
	(48,'9.6,18.9,24\n8.9,17.3,11.5\n31,16.1,15.1\n19.5,19.5,25.8','85\n46.2\n27.3\n188.6'),
	(49,'5,8,2019,15,8,2019\n1,1,1970,25,1,1970\n28,3,2004,10,4,2004','\'0,0,10\'\n\'0,0,24\'\n\'0,0,12\''),
	(50,'5,8,2019,5,9,2019\n1,1,1970,1,10,1970\n28,12,2004,28,3,2005','\'0,1,0\'\n\'0,9,0\'\n\'0,3,0\''),
	(51,'25,10,1993,4,8,2019\n15,1,1993,4,8,2019\n1,1,1970,14,2,1970\n14,5,2003,3,8,2019','\'25,9,9\'\n\'26,6,19\'\n\'0,1,13\'\n\'16,2,19\''),
	(52,'3,0,0,0\n1,0,0,0\n2,0,0,0\n15,0,0,0','259200\n86400\n172800\n1296000'),
	(53,'0,3,0,0\n0,1,0,0\n0,15,0,0\n0,23,0,0','10800\n3600\n54000\n82800'),
	(54,'0,0,20,0\n0,0,7,0\n0,0,59,0\n0,0,12,0','1200\n420\n3540\n720'),
	(55,'2,20,12,15\n5,9,17,46\n1,10,45,10\n12,23,20,14','245535\n465466\n125110\n1120814'),
	(56,'154,70.86\n170,72.42\n140.5,62.31\n220,78','22.08\n23.34\n26.06\n26.04'),
	(57,'\'2\',\'1\',\'7\'\n\'9\',\'1\',\'4\'\n\'0\',\'0\',\'7\'\n\'0\',\'5\',\'1\'\n\'0\',\'4\',\'0\'','217\n914\n7\n51\n40'),
	(58,'\'Nairo\',4\n\'Rigo\',2\n\'James\',10\n\'Falcao\',9','\'Hoooolaa Nairo\'\n\'Hoola Rigo\'\n\'Hoooooooooolaaaaa James\'\n\'Hooooooooolaaaa Falcao\''),
	(59,'\'Hola\',70\n\'Esta es una cadena\',70\n\'Intro a la programacion\',70\n\'¿Como se llama el calificador?\',70','\'                                 Hola\'\n\'                          Esta es una cadena\'\n\'                       Intro a la programacion\'\n\'                    ¿Como se llama el calificador?\''),
	(60,'20,1\n5,2\n100,50\n50,4','7\n53\n67\n11'),
	(61,'0,0,20,10\n2,4,9,2\n4,1,8,12\n6,7,15,4','30\n9\n15\n12'),
	(62,'1,[1,2,3,4,5,6]\r\n2,[1,2,3,4,5,6]\r\n3,[1,2,3,4,5,6]\r\n4,[1,2,3,4,5,6]\r\n5,[1,2,3,4,5,6]','1\r\n1\r\n1\r\n1\r\n1'),
	(63,'1,[2,3,4,5]\r\n7,[2,3,4,5]\r\n9,[2,3,4,5]\r\n1,[2,3,5,6]\r\n4,[2,3,5,6]','0\r\n0\r\n0\r\n0\r\n0'),
	(64,'1,[1,1,2,3,4,5]\r\n1,[1,2,3,4,5,1]\r\n1,[1,2,1,4,5]\r\n1,[8,1,1,3,4,5]\r\n1,[9,2,1,4,5,1]\r\n1,[1,1]\r\n1,[1,1,1,1,1]','2\r\n2\r\n2\r\n2\r\n2\r\n2\r\n5'),
	(65,'1,[]\r\n2,[]\r\n0,[]\r\n-1,[]\r\n-2,[]','0\r\n0\r\n0\r\n0\r\n0'),
	(75,'[]','-1'),
	(76,'[1,2,3,4,5,6,7,8,9,10]\n[0,1,0,1,0,0,0,1,0,0,1,1,0,2,1]\n[5,4,3,2,1]\n[1,0,13,6,8,9,2,9,2]','10\n2\n5\n13'),
	(77,'[]','None'),
	(78,'[1,2,3,4,5,6,7,8,9,10]\n[0,1,0,1,2,0,0,-1,0,0,-1,1,0,-2,1]\n[5,4,3,2,1]\n[1,0,13,-6,8,-9,2,9,-2]','1\n-2\n1\n-9'),
	(79,'[2,5,0,6,1,9,9,9],6\n[5,4,3,2,1],3\n[1,0,1,3,6,8,9,2,9,2],8\n[1,2,3,4,5,6,7,8,9],2','3\n2\n5\n1'),
	(80,'[2,5,0,6,1,9,9,9],7\n[5,4,3,2,1],8\n[1,0,1,3,6,8,9,2,9,2],14\n[1,2,3,4,5,6,7,8,9],11','-1\n-1\n-1\n-1'),
	(81,'[2,5,0,6,1,9,9,9],9\n[5,4,3,4,1],4\n[1,0,1,3,6,8,9,2,9,2],2\n[1,2,3,4,5,4,3,2,1],4','5\n1\n7\n3'),
	(82,'\'AAAAAAAAAAAAAAA\'\n\'MIMAMAMEMIMA\'\n\'BEBENLOSPECESENELRIO\'\n\'DITTOATULADITTO\'','\'A\'\n\'M\'\n\'E\'\n\'T\''),
	(83,'\'A                                         A\'\n\'M.U.C.H.O.O.O.S. P.UN.T.OS.. DI.S.T.R.A.E.N\'\n\'YO, AUN, TE, AMO, MUCHO,\'\n\',.,.,.,., ,. ,. , . ,. , ., . ,. , ., . ,. , . ,., X\'','\'A\'\n\'O\'\n\'O\'\n\'X\''),
	(84,'\'ABCDEFGH\'\n\'A VER SI ESTO ES DE TU TALLA, AMIGA ENORME\'\n\'AAAABBBCCDDDDEEEFF\'','\'H\'\n\'E\'\n\'D\''),
	(85,'12\n26\n22\n6\n39','False\nFalse\nFalse\nFalse\nFalse'),
	(86,'13\n7\n31\n2\n23','True\nTrue\nTrue\nTrue\nTrue');

/*!40000 ALTER TABLE `dashboard_pruebaio` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dashboard_pruebascript
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dashboard_pruebascript`;

CREATE TABLE `dashboard_pruebascript` (
  `prueba_ptr_id` int(11) NOT NULL,
  `script` longtext NOT NULL,
  PRIMARY KEY (`prueba_ptr_id`),
  CONSTRAINT `dashboard_pruebascri_prueba_ptr_id_66d767a0_fk_dashboard` FOREIGN KEY (`prueba_ptr_id`) REFERENCES `dashboard_prueba` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;



# Dump of table dashboard_recurso
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dashboard_recurso`;

CREATE TABLE `dashboard_recurso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(300) NOT NULL,
  `url` varchar(2000) NOT NULL,
  `problema_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_recurso_problema_id_a0a4236c_fk_dashboard_problema_id` (`problema_id`),
  CONSTRAINT `dashboard_recurso_problema_id_a0a4236c_fk_dashboard_problema_id` FOREIGN KEY (`problema_id`) REFERENCES `dashboard_problema` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;



# Dump of table dashboard_registro
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dashboard_registro`;

CREATE TABLE `dashboard_registro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(15) DEFAULT NULL,
  `timestamp` datetime(6) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_registro_usuario_id_33d1b83f_fk_dashboard_usuario_id` (`usuario_id`),
  CONSTRAINT `dashboard_registro_usuario_id_33d1b83f_fk_dashboard_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `dashboard_usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

LOCK TABLES `dashboard_registro` WRITE;
/*!40000 ALTER TABLE `dashboard_registro` DISABLE KEYS */;

INSERT INTO `dashboard_registro` (`id`, `ip`, `timestamp`, `usuario_id`)
VALUES
	(1,'127.0.0.1','2019-06-15 14:30:38.698000',9),
	(2,'127.0.0.1','2019-06-15 14:47:41.851000',8),
	(3,'127.0.0.1','2019-06-15 14:48:18.291000',9),
	(4,'127.0.0.1','2019-06-15 15:45:41.899000',8),
	(5,'127.0.0.1','2019-06-15 15:46:37.375000',10),
	(6,'127.0.0.1','2019-06-15 15:47:48.627000',1),
	(7,'127.0.0.1','2019-06-15 15:49:34.335000',9),
	(8,'127.0.0.1','2019-06-15 16:20:09.009000',9),
	(9,'127.0.0.1','2019-06-15 16:43:24.666000',9),
	(10,'127.0.0.1','2019-06-15 17:33:20.411000',1),
	(11,'127.0.0.1','2019-06-15 17:42:38.382000',9),
	(12,'127.0.0.1','2019-06-16 01:03:20.128000',9),
	(13,'127.0.0.1','2019-06-16 01:03:33.351000',9),
	(14,'127.0.0.1','2019-06-16 01:18:01.469000',9),
	(15,'127.0.0.1','2019-06-16 03:52:07.914000',8),
	(16,'127.0.0.1','2019-06-16 21:13:17.695000',1),
	(17,'127.0.0.1','2019-06-16 21:20:46.389000',10),
	(18,'127.0.0.1','2019-06-16 21:20:58.025000',11),
	(19,'127.0.0.1','2019-06-16 21:21:08.642000',8),
	(20,'127.0.0.1','2019-06-17 01:50:57.168000',9),
	(21,'127.0.0.1','2019-06-17 01:51:54.385000',1),
	(22,'127.0.0.1','2019-06-17 01:52:42.194000',8),
	(23,'127.0.0.1','2019-06-17 02:03:54.852000',9),
	(24,'127.0.0.1','2019-06-17 02:04:19.416000',1),
	(25,'127.0.0.1','2019-06-17 02:05:44.518000',8),
	(26,'127.0.0.1','2019-06-17 06:35:26.065000',1),
	(27,'127.0.0.1','2019-06-17 06:36:10.948000',8),
	(28,'127.0.0.1','2019-06-17 07:10:21.133000',1),
	(29,'127.0.0.1','2019-06-17 07:31:11.136000',9),
	(30,'127.0.0.1','2019-06-17 16:33:17.563000',1),
	(31,'127.0.0.1','2019-06-17 16:42:23.758000',8),
	(32,'127.0.0.1','2019-06-17 17:05:14.901000',9),
	(33,'127.0.0.1','2019-06-17 17:05:23.544000',1),
	(34,'127.0.0.1','2019-06-17 19:51:28.022000',8),
	(35,'127.0.0.1','2019-06-22 00:37:52.668945',9),
	(36,'127.0.0.1','2019-06-22 01:05:59.757339',9),
	(37,'127.0.0.1','2019-06-22 01:44:44.914411',8),
	(38,'127.0.0.1','2019-06-22 16:52:44.758103',9),
	(39,'127.0.0.1','2019-06-22 17:41:10.881748',1),
	(40,'127.0.0.1','2019-06-25 02:52:27.068699',9),
	(41,'127.0.0.1','2019-06-25 04:25:26.770103',8),
	(42,'127.0.0.1','2019-06-25 14:07:52.686779',9),
	(43,'127.0.0.1','2019-06-25 14:08:12.761064',8),
	(44,'127.0.0.1','2019-06-25 22:20:37.677483',8),
	(45,'127.0.0.1','2019-06-26 11:09:31.217387',9),
	(46,'127.0.0.1','2019-06-26 21:45:50.054722',9),
	(47,'127.0.0.1','2019-06-26 21:53:58.127219',9),
	(48,'127.0.0.1','2019-06-26 21:54:28.339435',1),
	(49,'127.0.0.1','2019-06-26 22:30:50.303513',9),
	(50,'127.0.0.1','2019-06-26 23:47:04.564445',9),
	(51,'127.0.0.1','2019-06-27 02:28:30.797758',9),
	(52,'127.0.0.1','2019-06-27 23:54:59.158387',9),
	(53,'127.0.0.1','2019-06-28 17:34:26.707093',9),
	(54,'127.0.0.1','2019-06-28 17:34:47.089249',1),
	(55,'127.0.0.1','2019-07-15 22:07:18.908144',8),
	(56,'127.0.0.1','2019-08-02 19:48:28.970736',8),
	(57,'127.0.0.1','2019-08-04 14:51:24.843769',9),
	(58,'127.0.0.1','2019-08-04 23:41:53.875557',9),
	(59,'127.0.0.1','2019-08-05 02:12:37.584792',11),
	(60,'127.0.0.1','2019-08-05 03:51:11.842717',NULL),
	(61,'127.0.0.1','2019-08-05 03:51:49.108005',NULL),
	(62,'127.0.0.1','2019-08-05 04:00:44.518587',11),
	(63,'127.0.0.1','2019-08-05 04:02:11.283073',NULL),
	(64,'127.0.0.1','2019-08-05 04:06:55.813679',11),
	(65,'127.0.0.1','2019-08-05 04:09:46.103502',NULL),
	(66,'127.0.0.1','2019-08-05 11:50:04.126822',11),
	(67,'127.0.0.1','2019-08-05 11:51:34.718989',118),
	(68,'127.0.0.1','2019-08-05 11:53:16.017485',11),
	(69,'127.0.0.1','2019-08-05 11:53:37.948283',118),
	(70,'127.0.0.1','2019-08-05 11:55:07.992753',11),
	(71,'127.0.0.1','2019-08-05 14:48:52.509671',118),
	(72,'127.0.0.1','2019-08-05 15:30:41.780805',11),
	(73,'127.0.0.1','2019-08-05 15:48:11.841549',9),
	(74,'127.0.0.1','2019-08-05 15:48:44.503647',118),
	(75,'127.0.0.1','2019-08-05 15:48:57.354928',117),
	(76,'127.0.0.1','2019-08-05 19:51:33.712861',11),
	(77,'127.0.0.1','2019-08-10 19:28:07.983795',9),
	(78,'127.0.0.1','2019-08-10 19:28:27.357186',11),
	(79,'127.0.0.1','2019-08-10 19:28:47.842956',8),
	(80,'127.0.0.1','2019-08-10 19:30:46.129743',118),
	(81,'127.0.0.1','2019-08-12 03:57:58.954792',9),
	(82,'127.0.0.1','2019-08-12 03:59:13.532135',11),
	(83,'127.0.0.1','2019-08-12 03:59:25.683493',8),
	(84,'127.0.0.1','2019-08-12 11:49:39.071117',9),
	(85,'127.0.0.1','2019-08-12 11:50:18.433500',118),
	(86,'127.0.0.1','2019-08-12 11:50:33.793753',117),
	(87,'127.0.0.1','2019-08-12 13:22:41.114227',11),
	(88,'127.0.0.1','2019-08-12 13:23:39.416049',8),
	(89,'127.0.0.1','2019-08-13 12:06:56.626606',11),
	(90,'127.0.0.1','2019-08-13 15:51:41.294307',9),
	(91,'127.0.0.1','2019-08-14 05:39:01.679195',8),
	(92,'127.0.0.1','2019-08-14 05:39:30.008266',118),
	(93,'127.0.0.1','2019-08-14 13:12:13.744344',1),
	(94,'127.0.0.1','2019-08-14 13:17:27.217806',11),
	(95,'127.0.0.1','2019-08-15 13:23:23.502055',11),
	(96,'127.0.0.1','2019-08-20 04:16:35.310937',9),
	(97,'127.0.0.1','2019-08-20 04:52:54.211435',11),
	(98,'127.0.0.1','2019-08-20 06:01:45.483022',11),
	(99,'127.0.0.1','2019-08-20 06:01:58.510944',9),
	(100,'127.0.0.1','2019-08-20 06:02:04.055394',8),
	(101,'127.0.0.1','2019-08-20 06:27:43.607090',9),
	(102,'127.0.0.1','2019-08-20 13:04:38.287060',9);

/*!40000 ALTER TABLE `dashboard_registro` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dashboard_resultadoestudiante
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dashboard_resultadoestudiante`;

CREATE TABLE `dashboard_resultadoestudiante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resuelto` tinyint(1) NOT NULL,
  `primer_intento` datetime(6) NOT NULL,
  `puntos` int(11) NOT NULL,
  `estudiante_id` int(11) DEFAULT NULL,
  `problema_id` int(11) DEFAULT NULL,
  `ultimo_intento` datetime(6) DEFAULT NULL,
  `ultimo_envio_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_resultadoe_estudiante_id_bc82239a_fk_dashboard` (`estudiante_id`),
  KEY `dashboard_resultadoe_problema_id_83acf253_fk_dashboard` (`problema_id`),
  KEY `dashboard_resultadoe_ultimo_envio_id_4eb4241e_fk_dashboard` (`ultimo_envio_id`),
  CONSTRAINT `dashboard_resultadoe_estudiante_id_bc82239a_fk_dashboard` FOREIGN KEY (`estudiante_id`) REFERENCES `dashboard_estudiante` (`usuario_ptr_id`),
  CONSTRAINT `dashboard_resultadoe_problema_id_83acf253_fk_dashboard` FOREIGN KEY (`problema_id`) REFERENCES `dashboard_problema` (`id`),
  CONSTRAINT `dashboard_resultadoe_ultimo_envio_id_4eb4241e_fk_dashboard` FOREIGN KEY (`ultimo_envio_id`) REFERENCES `dashboard_envio` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

LOCK TABLES `dashboard_resultadoestudiante` WRITE;
/*!40000 ALTER TABLE `dashboard_resultadoestudiante` DISABLE KEYS */;

INSERT INTO `dashboard_resultadoestudiante` (`id`, `resuelto`, `primer_intento`, `puntos`, `estudiante_id`, `problema_id`, `ultimo_intento`, `ultimo_envio_id`)
VALUES
	(1,1,'2019-06-02 21:29:11.511000',26,1,1,'2019-06-02 21:29:04.000000',3),
	(3,0,'2019-06-07 16:51:30.694000',0,1,3,'2019-06-07 16:51:28.000000',16),
	(4,0,'2019-06-12 23:31:12.158000',0,1,2,NULL,NULL),
	(5,1,'2019-06-15 00:58:39.325000',26,9,1,'2019-06-15 01:36:33.000000',15),
	(6,0,'2019-06-15 01:32:50.964000',0,9,2,NULL,17),
	(8,0,'2019-06-17 06:59:38.846000',0,9,3,NULL,NULL),
	(9,0,'2019-06-26 11:29:01.492334',0,9,5,NULL,NULL),
	(10,0,'2019-06-26 21:54:58.206979',0,1,5,NULL,NULL),
	(11,0,'2019-08-20 04:26:32.988326',0,9,19,NULL,18);

/*!40000 ALTER TABLE `dashboard_resultadoestudiante` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dashboard_resultadoprueba
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dashboard_resultadoprueba`;

CREATE TABLE `dashboard_resultadoprueba` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resultado_exitoso` tinyint(1) NOT NULL,
  `envio_id` int(11) DEFAULT NULL,
  `prueba_id` int(11) DEFAULT NULL,
  `numero` int(11) NOT NULL,
  `mensaje` longtext,
  PRIMARY KEY (`id`),
  KEY `dashboard_resultadop_envio_id_88f972d4_fk_dashboard` (`envio_id`),
  KEY `dashboard_resultadop_prueba_id_b29e37d9_fk_dashboard` (`prueba_id`),
  CONSTRAINT `dashboard_resultadop_envio_id_88f972d4_fk_dashboard` FOREIGN KEY (`envio_id`) REFERENCES `dashboard_envio` (`id`),
  CONSTRAINT `dashboard_resultadop_prueba_id_b29e37d9_fk_dashboard` FOREIGN KEY (`prueba_id`) REFERENCES `dashboard_prueba` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

LOCK TABLES `dashboard_resultadoprueba` WRITE;
/*!40000 ALTER TABLE `dashboard_resultadoprueba` DISABLE KEYS */;

INSERT INTO `dashboard_resultadoprueba` (`id`, `resultado_exitoso`, `envio_id`, `prueba_id`, `numero`, `mensaje`)
VALUES
	(1,1,4,NULL,1,NULL),
	(2,1,4,NULL,1,NULL),
	(3,0,4,NULL,1,NULL),
	(4,0,4,NULL,1,NULL),
	(5,0,9,1,1,NULL),
	(6,1,15,1,1,NULL);

/*!40000 ALTER TABLE `dashboard_resultadoprueba` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dashboard_resultadotarea
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dashboard_resultadotarea`;

CREATE TABLE `dashboard_resultadotarea` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `avance` double NOT NULL,
  `puntos` int(11) NOT NULL,
  `estudiante_id` int(11) DEFAULT NULL,
  `tarea_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_resultadot_estudiante_id_3d00896d_fk_dashboard` (`estudiante_id`),
  KEY `dashboard_resultadotarea_tarea_id_3a2cd365_fk_dashboard_tarea_id` (`tarea_id`),
  CONSTRAINT `dashboard_resultadot_estudiante_id_3d00896d_fk_dashboard` FOREIGN KEY (`estudiante_id`) REFERENCES `dashboard_estudiante` (`usuario_ptr_id`),
  CONSTRAINT `dashboard_resultadotarea_tarea_id_3a2cd365_fk_dashboard_tarea_id` FOREIGN KEY (`tarea_id`) REFERENCES `dashboard_tarea` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

LOCK TABLES `dashboard_resultadotarea` WRITE;
/*!40000 ALTER TABLE `dashboard_resultadotarea` DISABLE KEYS */;

INSERT INTO `dashboard_resultadotarea` (`id`, `avance`, `puntos`, `estudiante_id`, `tarea_id`)
VALUES
	(1,0,0,1,1),
	(2,100,26,1,2),
	(3,0,0,9,1),
	(4,100,26,9,2),
	(5,0,0,1,1),
	(6,100,26,1,2),
	(7,0,0,1,1),
	(8,100,26,1,2),
	(9,0,0,1,1),
	(10,100,26,1,2),
	(11,0,0,9,NULL),
	(12,0,0,9,5),
	(13,0,0,1,5);

/*!40000 ALTER TABLE `dashboard_resultadotarea` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dashboard_revision
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dashboard_revision`;

CREATE TABLE `dashboard_revision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_inicio_rev` datetime(6) NOT NULL,
  `fecha_fin_rev` datetime(6) DEFAULT NULL,
  `estado_revision` int(11) NOT NULL,
  `worker_id` int(11) DEFAULT NULL,
  `envio_revision_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_revision_envio_revision_id_d58f7bad_fk_dashboard` (`envio_revision_id`),
  KEY `dashboard_revision_worker_id_537c4401` (`worker_id`),
  CONSTRAINT `dashboard_revision_envio_revision_id_d58f7bad_fk_dashboard` FOREIGN KEY (`envio_revision_id`) REFERENCES `dashboard_envio` (`id`),
  CONSTRAINT `dashboard_revision_worker_id_537c4401_fk_dashboard_worker_id` FOREIGN KEY (`worker_id`) REFERENCES `dashboard_worker` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;



# Dump of table dashboard_seccion
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dashboard_seccion`;

CREATE TABLE `dashboard_seccion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` int(11) NOT NULL,
  `nombre_semestre` varchar(16) NOT NULL,
  `curso_seccion_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_seccion_curso_seccion_id_ac0fb169_fk_dashboard` (`curso_seccion_id`),
  CONSTRAINT `dashboard_seccion_curso_seccion_id_ac0fb169_fk_dashboard` FOREIGN KEY (`curso_seccion_id`) REFERENCES `dashboard_curso` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

LOCK TABLES `dashboard_seccion` WRITE;
/*!40000 ALTER TABLE `dashboard_seccion` DISABLE KEYS */;

INSERT INTO `dashboard_seccion` (`id`, `numero`, `nombre_semestre`, `curso_seccion_id`)
VALUES
	(1,1,'201920',1),
	(2,2,'201920',1),
	(16,5,'201920',NULL),
	(17,6,'201920',NULL),
	(18,7,'201920',NULL),
	(19,8,'201920',NULL),
	(20,9,'201920',NULL),
	(27,10,'201920',NULL),
	(28,99,'201920',1);

/*!40000 ALTER TABLE `dashboard_seccion` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dashboard_tag
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dashboard_tag`;

CREATE TABLE `dashboard_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `texto` varchar(100) NOT NULL,
  `descripcion` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

LOCK TABLES `dashboard_tag` WRITE;
/*!40000 ALTER TABLE `dashboard_tag` DISABLE KEYS */;

INSERT INTO `dashboard_tag` (`id`, `texto`, `descripcion`)
VALUES
	(1,'Ciclos','Ciclos (de todos los tipos)'),
	(2,'Recorridos parciales','Recorridos parciales'),
	(3,'Recorridos totales','Recorridos totales'),
	(4,'Recorridos dobles','Recorridos dobles'),
	(6,'Funciones','Funciones'),
	(7,'Dividir y Conquistar','Descomposición Funcional'),
	(8,'Geometría','Problemas geométricos'),
	(9,'Cadenas','Ejercicios sobre cadenas de caracteres'),
	(19,'Creación de funciones','Creación de funciones'),
	(20,'módulo math','módulo math'),
	(21,'llamado de funciones','llamado de funciones'),
	(22,'operadores aritméticos','operadores aritméticos'),
	(24,'concatenación','concatenación'),
	(25,'operadores sobre strings','operadores sobre strings'),
	(26,'operaciones sobre strings','operaciones sobre strings'),
	(30,'Listas','Listas'),
	(31,'Enteros','Enteros');

/*!40000 ALTER TABLE `dashboard_tag` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dashboard_tarea
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dashboard_tarea`;

CREATE TABLE `dashboard_tarea` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` int(11) NOT NULL,
  `fecha_limite` datetime(6) NOT NULL,
  `seccion_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_tarea_seccion_id_8ab14bd5_fk_dashboard_seccion_id` (`seccion_id`),
  CONSTRAINT `dashboard_tarea_seccion_id_8ab14bd5_fk_dashboard_seccion_id` FOREIGN KEY (`seccion_id`) REFERENCES `dashboard_seccion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

LOCK TABLES `dashboard_tarea` WRITE;
/*!40000 ALTER TABLE `dashboard_tarea` DISABLE KEYS */;

INSERT INTO `dashboard_tarea` (`id`, `numero`, `fecha_limite`, `seccion_id`)
VALUES
	(1,1,'2019-06-12 00:45:22.000000',1),
	(2,2,'2019-06-26 23:41:29.000000',1),
	(5,3,'2019-06-26 11:28:52.000000',1);

/*!40000 ALTER TABLE `dashboard_tarea` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dashboard_tarea_problemas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dashboard_tarea_problemas`;

CREATE TABLE `dashboard_tarea_problemas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tarea_id` int(11) NOT NULL,
  `problema_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dashboard_tarea_problemas_tarea_id_problema_id_de2f9ac3_uniq` (`tarea_id`,`problema_id`),
  KEY `dashboard_tarea_prob_problema_id_6f810da9_fk_dashboard` (`problema_id`),
  CONSTRAINT `dashboard_tarea_prob_problema_id_6f810da9_fk_dashboard` FOREIGN KEY (`problema_id`) REFERENCES `dashboard_problema` (`id`),
  CONSTRAINT `dashboard_tarea_prob_tarea_id_46352ebf_fk_dashboard` FOREIGN KEY (`tarea_id`) REFERENCES `dashboard_tarea` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

LOCK TABLES `dashboard_tarea_problemas` WRITE;
/*!40000 ALTER TABLE `dashboard_tarea_problemas` DISABLE KEYS */;

INSERT INTO `dashboard_tarea_problemas` (`id`, `tarea_id`, `problema_id`)
VALUES
	(1,1,2),
	(2,1,3),
	(3,2,1),
	(5,5,5);

/*!40000 ALTER TABLE `dashboard_tarea_problemas` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dashboard_usuario
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dashboard_usuario`;

CREATE TABLE `dashboard_usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL,
  `nombre` varchar(120) NOT NULL,
  `avatar` varchar(100) DEFAULT NULL,
  `tipo` varchar(2) NOT NULL,
  `ultimo_acceso` datetime(6) NOT NULL,
  `password` varchar(200) NOT NULL,
  `medallas` int(11) NOT NULL,
  `puntos` int(11) NOT NULL,
  `usuario_local` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

LOCK TABLES `dashboard_usuario` WRITE;
/*!40000 ALTER TABLE `dashboard_usuario` DISABLE KEYS */;

INSERT INTO `dashboard_usuario` (`id`, `login`, `nombre`, `avatar`, `tipo`, `ultimo_acceso`, `password`, `medallas`, `puntos`, `usuario_local`)
VALUES
	(1,'wey','Weymar Contreras','avatars/wey.png','ES','2019-08-14 13:12:13.729196','pbkdf2_sha256$150000$Weymar Contreras$lbAGs7tw8380m4P+hVTouDldJt9aa1/R5JwMd5sR+XY=',3,26,1),
	(2,'autor','Autor Problemas','avatars/autor.png','PR','2019-06-07 16:33:39.587000','autor',0,0,0),
	(8,'prof1','Francis Goldman','avatars/prof1.png','PR','2019-08-20 06:02:04.048066','pbkdf2_sha256$150000$Francis Goldman$sVC+f9Bw+aUKF4oS5vPkrEAN2PYGekcjGN+OQ1CUhKM=',0,0,1),
	(9,'est1','Juan Segundo','avatars/est1b468c283fec74893.png','ES','2019-08-20 13:04:38.283455','pbkdf2_sha256$150000$Juan Segundo$F57bVcPsK5YAi1Ey//aqplQk7K8+bmfcaArJxwfYyak=',0,0,1),
	(10,'monitor1','Roberta S. Towers','avatars/monitor1.png','MO','2019-06-16 21:20:46.380000','pbkdf2_sha256$150000$Robert S. Towers$+Ox7J4/LcGNF5kG2zaSEb+yBC5J+a9q+Q8nuA8OR84g=',0,0,1),
	(11,'admin1','Xavier Yi','avatars/admin199f0943d89424f04.png','AD','2019-08-20 06:01:45.466981','pbkdf2_sha256$150000$Xavier Yi$lcrDMIDV7pP/dwWvbaT3Q9PckN3nC7ZzB/62lNfCsGU=',0,0,1),
	(117,'da.rubioh','Diego Andres Rubio Herrera','avatars/avatars_basico/007-biohazard.png','ES','2019-08-12 11:50:33.785405','pbkdf2_sha256$150000$Diego Andres Rubio Herrera$77rZJ5Q+3b34bb3aD4jRyTrBMdfgXnJE9ckvmTsUoLA=',0,0,0),
	(118,'mar-san1','Mario Eduardo Sanchez','avatars/avatars_basico/034-tamagotchi.png','PR','2019-08-14 05:39:30.007009','pbkdf2_sha256$150000$Mario Eduardo Sanchez$DpMVEhNROrUKg6o0zzWnr/RYd2nhTMx/ZEuM9YmlwEk=',0,0,1),
	(119,'s.arangoa','Sergio Arango Arango','avatars/avatars_basico/012-plant.png','ES','2019-08-05 11:51:18.539830','pbkdf2_sha256$150000$Sergio Arango Arango$r/oDHLJjJpPpcgDNvZywmIS74HBXVnGE4fSZZwyOIaU=',0,0,0),
	(120,'jd.bernalc','Juan Diego Bernal Castro','avatars/avatars_basico/009-music.png','ES','2019-08-05 11:51:18.676725','pbkdf2_sha256$150000$Juan Diego Bernal Castro$iF6mhI0qCAbwIGkEQpviWHqa/yuqJ8t9mFx0aKL3H78=',0,0,0),
	(121,'a.besalel','Alan Besalel Valle','avatars/avatars_basico/033-rabbit.png','ES','2019-08-05 11:51:18.814253','pbkdf2_sha256$150000$Alan Besalel Valle$oKidkx/Akq/bKw2NSEXpKNui+B8JWhN10gXCAaFEuSE=',0,0,0),
	(122,'ac.celis10','Andrea Carolina Celis Laverde','avatars/avatars_basico/029-magnetism.png','ES','2019-08-05 11:51:18.950924','pbkdf2_sha256$150000$Andrea Carolina Celis Laverde$R5lAgBksCR3X3yPd0kROJx4O6atO0wcU/EfEK8/tbVU=',0,0,0),
	(123,'m.colon','Mateo Colon Oliveros','avatars/avatars_basico/038-biofuel.png','ES','2019-08-05 11:51:19.098900','pbkdf2_sha256$150000$Mateo Colon Oliveros$wctENXntFEav9xBQYq+wDHbvepkpMv4KWrERlh5HMrg=',0,0,0),
	(124,'pa.gomezc','Paula Andrea Gomez Colorado','avatars/avatars_basico/031-sunglasses.png','ES','2019-08-05 11:51:19.236875','pbkdf2_sha256$150000$Paula Andrea Gomez Colorado$uREiQLhvHsxK653+5dSuoXNwiJjYaWtTeZm5vMBBZwY=',0,0,0),
	(125,'mj.gomez12','Maria Jose Gomez Hughes','avatars/avatars_basico/038-ice skating shoes.png','ES','2019-08-05 11:51:19.371594','pbkdf2_sha256$150000$Maria Jose Gomez Hughes$4CsZVWd93gS23IWTRl/qZfIB5pYjA8OlyhGWQGYOpYI=',0,0,0),
	(126,'n.gonzalezb1','Nicolas Gonzalez Buenaventura','avatars/avatars_basico/017-astronaut.png','ES','2019-08-05 11:51:19.513549','pbkdf2_sha256$150000$Nicolas Gonzalez Buenaventura$uB9AX3QbSIKm27ebV4Is3nFDcCYZd0NGGiFhp6BMU9s=',0,0,0),
	(127,'s.gonzalez32','Santiago Gonzalez Buenaventura','avatars/avatars_basico/048-microscope.png','ES','2019-08-05 11:51:19.652521','pbkdf2_sha256$150000$Santiago Gonzalez Buenaventura$vAOI81UJeRAZKlIX3akMzBrWELd5PKC7SmyHBF4V4C8=',0,0,0),
	(128,'jc.gonzalezg','Juan Camilo Gonzalez Garcia','avatars/avatars_basico/012-astronaut.png','ES','2019-08-05 11:51:19.800159','pbkdf2_sha256$150000$Juan Camilo Gonzalez Garcia$IvvldfIjlgqsFnfVWQs5+0y7vLTR7+ninXPwdqsXeJY=',0,0,0),
	(129,'l.hernandezb','Laura Valentina Hernandez Beltran','avatars/avatars_basico/007-biohazard.png','ES','2019-08-05 11:51:19.949861','pbkdf2_sha256$150000$Laura Valentina Hernandez Beltran$tNZAhbHf0faxA2EcQEFF1f/+RA+iZ3eH1umRgZEC4V0=',0,0,0),
	(130,'a.herrera20','Alejandro Herrera Jimenez','avatars/avatars_basico/014-growing.png','ES','2019-08-05 11:51:20.087725','pbkdf2_sha256$150000$Alejandro Herrera Jimenez$tA80rVHZT0Np1UOGnfrN8pMeHiq5aPAzuQex279S3jk=',0,0,0),
	(131,'as.jacobs','Ana Sofia Jacobs Sanchez','avatars/avatars_basico/014-growing.png','ES','2019-08-05 11:51:20.232629','pbkdf2_sha256$150000$Ana Sofia Jacobs Sanchez$SZiYGetWeH10UpwUIExCqVWHMIsz6oGkJ0PXnbJROyw=',0,0,0),
	(132,'jd.lopeza','Juan Diego Lopez Ayala','avatars/avatars_basico/038-biofuel.png','ES','2019-08-05 11:51:20.377376','pbkdf2_sha256$150000$Juan Diego Lopez Ayala$2s6Y/TayaBg4LeyPeaipAQHkJOHQhUy+NwhfCvQwcUY=',0,0,0),
	(133,'jd.martinez20','Jose David Martinez Guerrero','avatars/avatars_basico/047-gmo.png','ES','2019-08-05 11:51:20.523972','pbkdf2_sha256$150000$Jose David Martinez Guerrero$tm/IBYi6vXyM7NREoGkyM6/L++rXXFkvltL1RGyTUEE=',0,0,0),
	(134,'v.murillo','Vanessa Murillo Vargas','avatars/avatars_basico/014-astronaut.png','ES','2019-08-05 11:51:20.667670','pbkdf2_sha256$150000$Vanessa Murillo Vargas$gEdPjBjUUnX0bmtd77UdlWuzh9BlrAYwECKst9TW1Cw=',0,0,0),
	(135,'da.naranjob','Diego Alexander Naranjo Bernal','avatars/avatars_basico/022-pipette.png','ES','2019-08-05 11:51:20.807062','pbkdf2_sha256$150000$Diego Alexander Naranjo Bernal$DEGv9vmT648eMJcnvnnIiMd0rO5/0zZVJiua614wDsU=',0,0,0),
	(136,'d.perezf','Daniel Perez Figueroa','avatars/avatars_basico/029-magnetism.png','ES','2019-08-05 11:51:20.954156','pbkdf2_sha256$150000$Daniel Perez Figueroa$UOgqZMKaiTiWx6i2btGl08c+Mfr5xLykF89sTa5VpWk=',0,0,0),
	(137,'jm.pinilla','Julian Mateo Pinilla Gonzalez','avatars/avatars_basico/037-astronaut.png','ES','2019-08-05 11:51:21.093699','pbkdf2_sha256$150000$Julian Mateo Pinilla Gonzalez$RIMqOkYR7tJj7pf6uRRGgbDjTaB2NUWsfh00OSKjfK4=',0,0,0),
	(138,'l.quiroga','Laura Gabriela Quiroga Sanchez','avatars/avatars_basico/030-dna.png','ES','2019-08-05 11:51:21.232949','pbkdf2_sha256$150000$Laura Gabriela Quiroga Sanchez$BW+nbL40JlH3CbGgZRxvv5i9jz0cxuPdn7gV+cqqlpQ=',0,0,0),
	(139,'a.robayo10','Alejandro Robayo Delgado','avatars/avatars_basico/015-petri dish.png','ES','2019-08-05 11:51:21.377432','pbkdf2_sha256$150000$Alejandro Robayo Delgado$+odHPn53fHYw7Jr0h6hdOcvj6HhrvkVbbq3Eh7jIegM=',0,0,0),
	(140,'mc.rios','María Camila Ríos Medina','avatars/avatars_basico/033-troll.png','ES','2019-08-05 11:51:21.526851','pbkdf2_sha256$150000$María Camila Ríos Medina$QBkz0Ypjw/BKJ7YTPwPl1JZp2uJsIPuX0AW3d7XP8X8=',0,0,0),
	(141,'jd.vasquezh','Juan David Vasquez Hernandez','avatars/avatars_basico/012-plant.png','ES','2019-08-05 11:51:21.672624','pbkdf2_sha256$150000$Juan David Vasquez Hernandez$UEn9j0Eelpgw9c15iyQyXJp3YU3kDyB6LMWy+CA8q8g=',0,0,0),
	(142,'id.salazar','Iván David  Salazar Cárdenas','avatars/avatars_basico/031-dna.png','PR','2019-08-05 11:51:21.814300','pbkdf2_sha256$150000$Iván David  Salazar Cárdenas$Ra4PN5HCHzYtfg54QMzlHBg7qTUEnFSWh6X42Sr2i9Q=',0,0,0),
	(143,'af.melani3365','Andres Felipe Melani De La Hoz','avatars/avatars_basico/030-dna.png','PR','2019-08-05 19:51:46.904229','pbkdf2_sha256$150000$Andres Felipe Melani De La Hoz$Y4+ziJWol3ABFYfp+nv/Ed5rlY8apKFhAIuKxDtHH10=',0,0,0),
	(168,'ja.esguerra','Jorge Andres  Esguerra Alarcon','avatars/avatars_basico/005-astronaut.png','PR','2019-08-05 19:54:24.835919','pbkdf2_sha256$150000$Jorge Andres  Esguerra Alarcon$1fhf6Gc/NFptO82txJGW7fuGl0n8NcpJ2RU8ow2nwnw=',0,0,0),
	(169,'pa.martinezc1','Pablo Andres Martinez Corrales','avatars/avatars_basico/019-campervan.png','ES','2019-08-05 19:55:51.102395','pbkdf2_sha256$150000$Pablo Andres Martinez Corrales$N6eILgf4ZsKfM/2zZbyL49JqiNENr3Y8ztjTF1P11cU=',0,0,0),
	(170,'pa.guzmans','Paula Alejandra Guzman Sastoque','avatars/avatars_basico/048-microscope.png','ES','2019-08-05 19:55:51.257139','pbkdf2_sha256$150000$Paula Alejandra Guzman Sastoque$4QAxU2yd5uyxh/RXBWw6NY6yUd8/baHoS/DD+5oA/fE=',0,0,0),
	(171,'m.acevedoo','Manuela Acevedo Otalvaro','avatars/avatars_basico/008-boom box.png','ES','2019-08-05 19:55:51.404512','pbkdf2_sha256$150000$Manuela Acevedo Otalvaro$3JwdIxrpMy1INhw7L7RLgP5jKkaBIIgfXJLfMyuBrX4=',0,0,0),
	(172,'s.bonillac','Santiago Bonilla Crespo','avatars/avatars_basico/006-astronaut.png','ES','2019-08-05 19:55:51.551839','pbkdf2_sha256$150000$Santiago Bonilla Crespo$W4VAH4thNDvmFDTe5siJzH8hKl7IgQCMuUNGNYWuTOw=',0,0,0),
	(173,'jc.burgos','Juan Camilo Burgos Pino','avatars/avatars_basico/035-dummy.png','ES','2019-08-05 19:55:51.696630','pbkdf2_sha256$150000$Juan Camilo Burgos Pino$jU8dxoV0LKLVmygVY9zEjHwlfflNji37bBBAo6VnURw=',0,0,0),
	(174,'av.criado','Angie Valentina Criado Sanchez','avatars/avatars_basico/006-nuclear.png','ES','2019-08-05 19:55:51.847881','pbkdf2_sha256$150000$Angie Valentina Criado Sanchez$1Oue2o63Ex5e5fDZVhHrV1x++zZcd445zUYkACOwBbE=',0,0,0),
	(175,'am.diazv1','Ana Maria Diaz Valencia','avatars/avatars_basico/026-target.png','ES','2019-08-05 19:55:51.993624','pbkdf2_sha256$150000$Ana Maria Diaz Valencia$/SFjUvSSohswb+zmPBXzU3Thx6mbCdOndjxnktBV/Ho=',0,0,0),
	(176,'jf.gomezb1','Jose Fernando Gomez Bonilla','avatars/avatars_basico/016-burguer.png','ES','2019-08-05 19:55:52.155809','pbkdf2_sha256$150000$Jose Fernando Gomez Bonilla$EOpritKNpqSooi3752rBkwNyiyJQqb5n2uBoDiyap7U=',0,0,0),
	(177,'da.gomezc2','Diego Alejandro Gomez Cardenas','avatars/avatars_basico/013-searching.png','ES','2019-08-05 19:55:52.319384','pbkdf2_sha256$150000$Diego Alejandro Gomez Cardenas$HB4wtqHEohHG2trkJRncR2D2rt5xQuFlLD60yzpAMng=',0,0,0),
	(178,'pg.gonzalez','Paula Giovanna Gonzalez Bravo','avatars/avatars_basico/014-astronaut.png','ES','2019-08-05 19:55:52.469063','pbkdf2_sha256$150000$Paula Giovanna Gonzalez Bravo$q6/vHhqqotilJnA/JlRm1jCDwG4xjhokI/rdc5il4g0=',0,0,0),
	(179,'a.lopezs3','Abigail Lopez Saavedra','avatars/avatars_basico/038-ice skating shoes.png','ES','2019-08-05 19:55:52.605283','pbkdf2_sha256$150000$Abigail Lopez Saavedra$v1XM5Q3VFxS8jz7USNatlHe3vskSImyLWzkUN3oSGFU=',0,0,0),
	(180,'jc.lopezs','Julian Camilo Lopez Sanchez','avatars/avatars_basico/041-checklist.png','ES','2019-08-05 19:55:52.747029','pbkdf2_sha256$150000$Julian Camilo Lopez Sanchez$3MzciUATx9aKVTjVYOBQ2kIyrKIi1lZgyjL5+UR8F8o=',0,0,0),
	(181,'e.marquezm','Estefania Marquez Martinez','avatars/avatars_basico/009-music.png','ES','2019-08-05 19:55:52.891411','pbkdf2_sha256$150000$Estefania Marquez Martinez$fgY69AwVYt5c/yT55AXST6LuUTxMTPvlLcHe5+wdhVc=',0,0,0),
	(182,'sc.menjura','Sebastian Camilo Menjura Florian','avatars/avatars_basico/005-hip hop.png','ES','2019-08-05 19:55:53.039674','pbkdf2_sha256$150000$Sebastian Camilo Menjura Florian$7jjWlWyF0tSzZVWiqdVO5AdaSO9Z9KY1jKRt6wpEok4=',0,0,0),
	(183,'ef.murcia','Erick Fernando Murcia Barrueto','avatars/avatars_basico/008-boom box.png','ES','2019-08-05 19:55:53.206644','pbkdf2_sha256$150000$Erick Fernando Murcia Barrueto$JLJaHRGZMdRRXDq87kkQpWUeh9zPE5dNCSFCedQKHFc=',0,0,0),
	(184,'ll.palacios','Lesly Lorena Palacios Reyes','avatars/avatars_basico/009-book.png','ES','2019-08-05 19:55:53.354641','pbkdf2_sha256$150000$Lesly Lorena Palacios Reyes$I+qYNaw5blhksqDbY+E01mqCYG4wWyLwHy3SFXAkHzM=',0,0,0),
	(185,'m.perezc1','Mariana Perez Cañon','avatars/avatars_basico/001-astronaut.png','ES','2019-08-05 19:55:53.520161','pbkdf2_sha256$150000$Mariana Perez Cañon$bN17uT5k0Gj8BMqmIbLPR5kapnhSb7SC+7HvObrQxpE=',0,0,0),
	(186,'s.polo','Santiago Polo Ballesteros','avatars/avatars_basico/011-microscope.png','ES','2019-08-05 19:55:53.671135','pbkdf2_sha256$150000$Santiago Polo Ballesteros$23mwd/iLPdfY6kHcnPT810SRHYHibFNCD6HHpLpQ+UU=',0,0,0),
	(187,'se.quiroga','Steven Eduardo Quiroga Mongui','avatars/avatars_basico/036-ivf.png','ES','2019-08-05 19:55:53.820050','pbkdf2_sha256$150000$Steven Eduardo Quiroga Mongui$TWI5zUkKa94OATPJwX8nTWCqT50pLFPQHBoTCnIgwoM=',0,0,0),
	(188,'as.ramosg','Ana Sofia Ramos Guerra','avatars/avatars_basico/011-reggae.png','ES','2019-08-05 19:55:53.989541','pbkdf2_sha256$150000$Ana Sofia Ramos Guerra$fCrHijrgLIcYKIEQhhOLFKKqf/viftHV1YowKLShOqw=',0,0,0),
	(189,'si.rincon','Sergio Ivan Rincon Carvajal','avatars/avatars_basico/030-dna.png','ES','2019-08-05 19:55:54.197324','pbkdf2_sha256$150000$Sergio Ivan Rincon Carvajal$KyJ4gouOkaQgFvlpLqommeysue8k55Q9fGiiJ6jxSbo=',0,0,0),
	(190,'m.rodriguez31','Manuela Rodriguez Guerrero','avatars/avatars_basico/032-belt pouch.png','ES','2019-08-05 19:55:54.387781','pbkdf2_sha256$150000$Manuela Rodriguez Guerrero$3kBsAgXx52z9Fq7tf5xobwCEC127nrnv08szP15WUN0=',0,0,0),
	(191,'af.romerog','Andres Felipe Romero Gomez','avatars/avatars_basico/020-genetics.png','ES','2019-08-05 19:55:54.573861','pbkdf2_sha256$150000$Andres Felipe Romero Gomez$TFSK2PctLr75TjHVRydlc0QkvUb9Z9VDJrsH7jMDMPA=',0,0,0),
	(192,'c.suarezv','Carolina Suarez Valdes','avatars/avatars_basico/003-tape.png','ES','2019-08-05 19:55:54.735543','pbkdf2_sha256$150000$Carolina Suarez Valdes$SXG5HTPWUQF3ZAZpcADJr4De1SlOkTsB+oXeazQRHC0=',0,0,0);

/*!40000 ALTER TABLE `dashboard_usuario` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dashboard_worker
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dashboard_worker`;

CREATE TABLE `dashboard_worker` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `fecha_registro` datetime(6) NOT NULL,
  `ip` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;



# Dump of table django_admin_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE latin1_spanish_ci,
  `object_repr` varchar(200) COLLATE latin1_spanish_ci NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE latin1_spanish_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`)
VALUES
	(1,'2019-05-22 14:41:54.623000','1','Introducción a la Programación',1,'[{\"added\": {}}]',7,1),
	(2,'2019-05-22 14:42:00.089000','1','Introducción a la Programación - 201920: 1',1,'[{\"added\": {}}]',13,1),
	(3,'2019-05-22 14:42:14.179000','1','Estudiante object (1)',1,'[{\"added\": {}}]',21,1),
	(4,'2019-05-22 14:46:22.142000','1','Primer problema (1)',1,'[{\"added\": {}}]',10,1),
	(5,'2019-05-27 12:16:53.516000','2','Segundo problema (2)',1,'[{\"added\": {}}]',10,1),
	(6,'2019-05-27 12:17:00.276000','3','Tercer problema (3)',1,'[{\"added\": {}}]',10,1),
	(7,'2019-05-27 18:46:04.922000','3','Tercer problema (3)',3,'',10,1),
	(8,'2019-05-27 18:46:04.925000','2','Segundo problema (2)',3,'',10,1),
	(9,'2019-05-27 18:46:04.926000','1','Primer problema (1)',3,'',10,1),
	(10,'2019-05-28 05:34:05.221000','1','Primer problema (1)',1,'[{\"added\": {}}]',10,1),
	(11,'2019-05-30 03:12:50.196000','1','Pregunta object (1)',1,'[{\"added\": {}}]',15,1),
	(12,'2019-05-30 03:13:09.621000','2','Pregunta object (2)',1,'[{\"added\": {}}]',15,1),
	(13,'2019-05-30 03:21:56.346000','1','ComentarioPregunta object (1)',1,'[{\"added\": {}}]',17,1),
	(14,'2019-05-30 03:22:04.992000','2','ComentarioPregunta object (2)',1,'[{\"added\": {}}]',17,1),
	(15,'2019-05-30 03:22:15.156000','3','ComentarioPregunta object (3)',1,'[{\"added\": {}}]',17,1),
	(16,'2019-05-31 11:45:09.334000','2','Segundo problema (2)',1,'[{\"added\": {}}]',10,1),
	(17,'2019-05-31 20:28:00.659000','1','est1 (ES)',2,'[{\"changed\": {\"fields\": [\"avatar\"]}}]',12,1),
	(18,'2019-05-31 20:41:07.308000','1','usuario.uniandes (ES)',2,'[{\"changed\": {\"fields\": [\"login\", \"nombre\"]}}]',12,1),
	(19,'2019-05-31 20:49:25.202000','20','Resumen pregunta - 20',2,'[{\"changed\": {\"fields\": [\"autor\"]}}]',15,1),
	(20,'2019-06-02 03:01:28.549000','13','Resumen pregunta - 13',3,'',15,1),
	(21,'2019-06-02 03:01:31.640000','16','Resumen pregunta - 16',3,'',15,1),
	(22,'2019-06-02 03:01:35.083000','17','Resumen pregunta - 17',3,'',15,1),
	(23,'2019-06-02 03:01:38.086000','15','Resumen pregunta - 15',3,'',15,1),
	(24,'2019-06-02 03:01:41.179000','9','Resumen pregunta - 9',3,'',15,1),
	(25,'2019-06-02 03:01:44.490000','18','Resumen pregunta - 18',3,'',15,1),
	(26,'2019-06-02 03:01:56.689000','14','Resumen pregunta - 14',3,'',15,1),
	(27,'2019-06-02 03:02:00.447000','12','Resumen pregunta - 12',3,'',15,1),
	(28,'2019-06-02 03:02:03.669000','19','Resumen pregunta - 19',3,'',15,1),
	(29,'2019-06-02 03:04:37.485000','20','Una pregunta muy importante sobre el problema - 20',2,'[{\"changed\": {\"fields\": [\"titulo\", \"contenido\"]}}]',15,1),
	(30,'2019-06-02 03:05:00.511000','11','Otra pregunta fundamental! - 11',2,'[{\"changed\": {\"fields\": [\"titulo\", \"contenido\", \"autor\"]}}]',15,1),
	(31,'2019-06-02 05:02:13.706000','1','Tag object (1)',1,'[{\"added\": {}}]',23,1),
	(32,'2019-06-02 05:02:24.014000','2','Tag object (2)',1,'[{\"added\": {}}]',23,1),
	(33,'2019-06-02 05:02:31.740000','3','Tag object (3)',1,'[{\"added\": {}}]',23,1),
	(34,'2019-06-02 05:02:38.720000','4','Tag object (4)',1,'[{\"added\": {}}]',23,1),
	(35,'2019-06-02 05:02:40.405000','5','Tag object (5)',1,'[{\"added\": {}}]',23,1),
	(36,'2019-06-02 05:05:43.002000','5','TAG',3,'',23,1),
	(37,'2019-06-02 05:07:18.835000','2','Segundo problema (2)',2,'[{\"changed\": {\"fields\": [\"tags\"]}}]',10,1),
	(38,'2019-06-02 05:43:54.494000','1','input1: str',1,'[{\"added\": {}}]',24,1),
	(39,'2019-06-02 05:44:07.004000','2','input2: str',1,'[{\"added\": {}}]',24,1),
	(40,'2019-06-02 05:44:20.336000','3','input3: int',1,'[{\"added\": {}}]',24,1),
	(41,'2019-06-02 21:06:48.721000','1','Envio object (1)',1,'[{\"added\": {}}]',9,1),
	(42,'2019-06-02 21:08:21.551000','2','Envio object (2)',1,'[{\"added\": {}}]',9,1),
	(43,'2019-06-02 21:08:34.611000','3','Envio object (3)',1,'[{\"added\": {}}]',9,1),
	(44,'2019-06-02 21:29:11.512000','1','Primer problema - Juan Perez Perez - 2019-06-02 21:29:04+00:00',1,'[{\"added\": {}}]',22,1),
	(45,'2019-06-02 21:29:21.720000','1','Primer problema - Juan Perez Perez - 2019-06-02 21:29:04+00:00',2,'[{\"changed\": {\"fields\": [\"resuelto\", \"puntos\"]}}]',22,1),
	(46,'2019-06-02 21:29:57.108000','3','3: Juan Perez Perez-->Primer problema (2019-06-02 21:08:34.610409+00:00)',2,'[{\"changed\": {\"fields\": [\"problema\", \"resultado_estudiante\"]}}]',9,1),
	(47,'2019-06-02 21:30:02.855000','2','2: Juan Perez Perez-->Primer problema (2019-06-02 21:08:21.550382+00:00)',2,'[{\"changed\": {\"fields\": [\"problema\", \"resultado_estudiante\"]}}]',9,1),
	(48,'2019-06-02 21:30:08.542000','1','1: Juan Perez Perez-->Primer problema (2019-06-02 21:06:48.720693+00:00)',2,'[{\"changed\": {\"fields\": [\"problema\", \"resultado_estudiante\"]}}]',9,1),
	(49,'2019-06-02 22:44:04.155000','2','Segundo problema - Juan Perez Perez - 2019-06-02 22:44:01+00:00',1,'[{\"added\": {}}]',22,1),
	(50,'2019-06-03 15:13:33.803000','2','Segundo problema (2)',2,'[{\"changed\": {\"fields\": [\"retorno_descripcion\"]}}]',10,1),
	(51,'2019-06-03 15:17:29.505000','6','Funciones',1,'[{\"added\": {}}]',23,1),
	(52,'2019-06-03 15:17:50.126000','7','Dividir y Conquistar',1,'[{\"added\": {}}]',23,1),
	(53,'2019-06-03 15:18:06.821000','8','Geometría',1,'[{\"added\": {}}]',23,1),
	(54,'2019-06-03 15:18:23.616000','1','Primer problema (1)',2,'[{\"changed\": {\"fields\": [\"tags\"]}}]',10,1),
	(55,'2019-06-05 13:57:02.293000','3','3: Juan Perez Perez-->Primer problema (2019-06-02 21:08:34.610409+00:00)',2,'[]',9,1),
	(56,'2019-06-05 13:57:07.556000','3','3: Juan Perez Perez-->Primer problema (2019-06-02 21:08:34.610409+00:00)',2,'[{\"changed\": {\"fields\": [\"estado\"]}}]',9,1),
	(57,'2019-06-05 20:46:44.171000','2','2: Juan Perez Perez-->Primer problema (2019-06-02 21:08:21.550382+00:00)',2,'[{\"changed\": {\"fields\": [\"estado\"]}}]',9,1),
	(58,'2019-06-05 20:46:55.057000','1','1: Juan Perez Perez-->Primer problema (2019-06-02 21:06:48.720693+00:00)',2,'[{\"changed\": {\"fields\": [\"estado\"]}}]',9,1),
	(59,'2019-06-05 20:46:59.369000','2','2: Juan Perez Perez-->Primer problema (2019-06-02 21:08:21.550382+00:00)',2,'[{\"changed\": {\"fields\": [\"estado\"]}}]',9,1),
	(60,'2019-06-05 20:47:02.946000','3','3: Juan Perez Perez-->Primer problema (2019-06-02 21:08:34.610409+00:00)',2,'[{\"changed\": {\"fields\": [\"estado\"]}}]',9,1),
	(61,'2019-06-07 16:22:36.421000','1','Primer problema (1) - 1: Prueba básica',1,'[{\"added\": {}}]',11,1),
	(62,'2019-06-07 16:33:39.588000','2','autor (PR)',1,'[{\"added\": {}}]',12,1),
	(63,'2019-06-07 16:40:58.309000','3','Contar aparciones en lista (3)',1,'[{\"added\": {}}]',10,1),
	(64,'2019-06-07 16:42:21.062000','4','lista_elementos: list',1,'[{\"added\": {}}]',24,1),
	(65,'2019-06-07 16:44:18.876000','5','elemento_buscado: int',1,'[{\"added\": {}}]',24,1),
	(66,'2019-06-07 16:44:23.320000','4','lista_elementos: list',2,'[]',24,1),
	(67,'2019-06-07 16:45:02.663000','3','Contar aparciones en lista (3)',2,'[{\"changed\": {\"fields\": [\"descripcion\", \"retorno_descripcion\"]}}]',10,1),
	(68,'2019-06-07 16:46:06.051000','2','Contar aparciones en lista (3) - 1: Prueba sencilla',1,'[{\"added\": {}}]',11,1),
	(69,'2019-06-07 16:47:20.573000','3','Contar aparciones en lista (3) - 2: El elemento no existe',1,'[{\"added\": {}}]',11,1),
	(70,'2019-06-07 16:47:57.652000','4','Contar aparciones en lista (3) - 3: Prueba múltiples apariciones',1,'[{\"added\": {}}]',11,1),
	(71,'2019-06-07 16:48:49.685000','5','Contar aparciones en lista (3) - 1: Lista vacía',1,'[{\"added\": {}}]',11,1),
	(72,'2019-06-07 16:49:28.939000','2','Contar aparciones en lista (3) - 1: Prueba una aparición',2,'[{\"changed\": {\"fields\": [\"descripcion\", \"comentario_ok\", \"comentario_error\"]}}]',11,1),
	(73,'2019-06-07 16:49:39.719000','5','Contar aparciones en lista (3) - 1: Lista vacía',2,'[]',11,1),
	(74,'2019-06-07 16:50:01.574000','5','Contar aparciones en lista (3) - 4: Lista vacía',2,'[{\"changed\": {\"fields\": [\"numero\"]}}]',11,1),
	(75,'2019-06-07 16:51:30.696000','3','Contar aparciones en lista - Juan Perez Perez - 2019-06-07 16:51:28+00:00',1,'[{\"added\": {}}]',22,1),
	(76,'2019-06-07 16:51:34.082000','4','1: Juan Perez Perez-->Contar aparciones en lista (2019-06-07 16:51:34.081191+00:00)',1,'[{\"added\": {}}]',9,1),
	(77,'2019-06-07 17:16:09.155000','1','ResultadoPrueba object (1)',1,'[{\"added\": {}}]',14,1),
	(78,'2019-06-07 17:16:26.905000','2','ResultadoPrueba object (2)',1,'[{\"added\": {}}]',14,1),
	(79,'2019-06-07 17:17:24.715000','3','ResultadoPrueba object (3)',1,'[{\"added\": {}}]',14,1),
	(80,'2019-06-07 17:17:47.020000','4','ResultadoPrueba object (4)',1,'[{\"added\": {}}]',14,1),
	(81,'2019-06-07 17:54:49.684000','3','Contar aparciones en lista - 2: El elemento no existe',2,'[{\"changed\": {\"fields\": [\"comentario_ok\"]}}]',11,1),
	(82,'2019-06-07 17:58:58.996000','2','Segundo problema - Juan Perez Perez - 2019-06-02 22:44:01+00:00',3,'',22,1),
	(83,'2019-06-07 17:59:16.728000','3','Contar apariciones en lista (3)',2,'[{\"changed\": {\"fields\": [\"titulo\"]}}]',10,1),
	(84,'2019-06-07 18:05:11.425000','3','Juan Perez Perez: Primer problema - 3: NU 0.0',2,'[{\"changed\": {\"fields\": [\"avance\"]}}]',9,1),
	(85,'2019-06-07 18:05:26.009000','3','Juan Perez Perez: Primer problema - 3: OK 100.0',2,'[{\"changed\": {\"fields\": [\"avance\", \"estado\"]}}]',9,1),
	(86,'2019-06-07 18:05:30.379000','2','Juan Perez Perez: Primer problema - 2: ER 20.0',2,'[{\"changed\": {\"fields\": [\"estado\"]}}]',9,1),
	(87,'2019-06-07 18:05:33.876000','1','Juan Perez Perez: Primer problema - 1: ER 0.0',2,'[]',9,1),
	(88,'2019-06-07 18:14:45.850000','16','ComentarioPregunta object (16)',2,'[{\"changed\": {\"fields\": [\"autor\"]}}]',17,1),
	(89,'2019-06-08 02:07:53.856000','1','Notificacion object (1)',1,'[{\"added\": {}}]',26,1),
	(90,'2019-06-08 21:59:25.081000','4','Juan Perez Perez: Contar apariciones en lista - 1: ER 50.0',2,'[{\"changed\": {\"fields\": [\"contenido\"]}}]',9,1),
	(91,'2019-06-08 22:04:15.752000','4','Juan Perez Perez: Contar apariciones en lista - 1: ER 50.0',2,'[{\"changed\": {\"fields\": [\"contenido\"]}}]',9,1),
	(92,'2019-06-08 22:04:19.985000','4','Juan Perez Perez: Contar apariciones en lista - 1: ER 50.0',2,'[]',9,1),
	(93,'2019-06-09 16:20:10.034000','17','ComentarioPregunta object (17)',1,'[{\"added\": {}}]',17,1),
	(94,'2019-06-09 16:23:08.415000','17','ComentarioPregunta object (17)',2,'[{\"changed\": {\"fields\": [\"contenido\"]}}]',17,1),
	(95,'2019-06-09 16:25:15.072000','18','ComentarioPregunta object (18)',1,'[{\"added\": {}}]',17,1),
	(96,'2019-06-09 16:25:52.816000','19','ComentarioPregunta object (19)',1,'[{\"added\": {}}]',17,1),
	(97,'2019-06-09 16:26:17.453000','19','ComentarioPregunta object (19)',2,'[{\"changed\": {\"fields\": [\"titulo\", \"contenido\"]}}]',17,1),
	(98,'2019-06-09 16:27:41.705000','20','ComentarioPregunta object (20)',1,'[{\"added\": {}}]',17,1),
	(99,'2019-06-09 16:28:58.489000','20','ComentarioPregunta object (20)',2,'[]',17,1),
	(100,'2019-06-09 16:29:19.175000','20','ComentarioPregunta object (20)',2,'[{\"changed\": {\"fields\": [\"contenido\"]}}]',17,1),
	(101,'2019-06-09 16:30:12.932000','20','ComentarioPregunta object (20)',2,'[]',17,1),
	(102,'2019-06-09 16:30:14.992000','20','ComentarioPregunta object (20)',2,'[]',17,1),
	(103,'2019-06-09 16:30:26.616000','20','ComentarioPregunta object (20)',2,'[]',17,1),
	(104,'2019-06-09 16:30:38.218000','21','ComentarioPregunta object (21)',1,'[{\"added\": {}}]',17,1),
	(105,'2019-06-09 16:30:48.510000','21','ComentarioPregunta object (21)',2,'[{\"changed\": {\"fields\": [\"contenido\", \"pregunta\"]}}]',17,1),
	(106,'2019-06-09 19:30:21.924000','1','ComentarioPregunta object (1)',2,'[{\"changed\": {\"fields\": [\"titulo\"]}}]',17,1),
	(107,'2019-06-09 21:03:32.162000','2','Notificacion object (2)',1,'[{\"added\": {}}]',26,1),
	(108,'2019-06-09 21:53:19.903000','4','Juan Perez Perez: Contar apariciones en lista - 1: ER 50.0',2,'[]',9,1),
	(109,'2019-06-09 23:29:16.614000','1','Medalla: Ayudante - Bronce',1,'[{\"added\": {}}]',27,1),
	(110,'2019-06-09 23:29:28.254000','2','Medalla: Super Ayudante - Plata',1,'[{\"added\": {}}]',27,1),
	(111,'2019-06-09 23:29:49.969000','3','Medalla: Ayudante Increíble - Oro',1,'[{\"added\": {}}]',27,1),
	(112,'2019-06-09 23:30:00.165000','1','Juan Perez Perez --> Medalla: Ayudante - Bronce',1,'[{\"added\": {}}]',28,1),
	(113,'2019-06-10 03:57:38.845000','1','Medalla: Gran Ayudante - Bronce',2,'[{\"changed\": {\"fields\": [\"nombre\"]}}]',27,1),
	(114,'2019-06-10 03:57:48.833000','2','Medalla: Ayudante dedicado - Plata',2,'[{\"changed\": {\"fields\": [\"nombre\"]}}]',27,1),
	(115,'2019-06-10 03:58:48.077000','4','Medalla: Autobiografo - Plata',1,'[{\"added\": {}}]',27,1),
	(116,'2019-06-10 03:59:13.725000','5','Medalla: Narciso - Oro',1,'[{\"added\": {}}]',27,1),
	(117,'2019-06-10 03:59:27.245000','2','Juan Perez Perez --> Medalla: Autobiografo - Plata',1,'[{\"added\": {}}]',28,1),
	(118,'2019-06-10 03:59:32.337000','3','Juan Perez Perez --> Medalla: Narciso - Oro',1,'[{\"added\": {}}]',28,1),
	(119,'2019-06-10 04:01:45.245000','4','Medalla: Autobiógrafo - Plata',2,'[{\"changed\": {\"fields\": [\"nombre\"]}}]',27,1),
	(120,'2019-06-10 13:36:37.490000','1','usuario.uniandes (ES)',2,'[{\"changed\": {\"fields\": [\"medallas\"]}}]',12,1),
	(121,'2019-06-10 13:36:57.936000','1','usuario.uniandes (ES)',2,'[{\"changed\": {\"fields\": [\"puntos\"]}}]',12,1),
	(122,'2019-06-10 21:38:30.502000','4','lista_elementos: list',2,'[{\"changed\": {\"fields\": [\"posicion\"]}}]',24,1),
	(123,'2019-06-12 00:45:22.955000','1','Tarea object (1)',1,'[{\"added\": {}}]',34,1),
	(124,'2019-06-12 01:16:21.943000','1','ResultadoTarea object (1)',2,'[{\"changed\": {\"fields\": [\"avance\"]}}]',33,1),
	(125,'2019-06-12 23:04:45.578000','4','Juan Perez Perez: Contar apariciones en lista - 1: ER 50.0',2,'[{\"changed\": {\"fields\": [\"slug\"]}}]',9,1),
	(126,'2019-06-12 23:04:50.514000','3','Juan Perez Perez: Primer problema - 3: OK 100.0',2,'[{\"changed\": {\"fields\": [\"slug\"]}}]',9,1),
	(127,'2019-06-12 23:04:55.678000','2','Juan Perez Perez: Primer problema - 2: ER 20.0',2,'[{\"changed\": {\"fields\": [\"slug\"]}}]',9,1),
	(128,'2019-06-12 23:05:01.608000','1','Juan Perez Perez: Primer problema - 1: ER 0.0',2,'[{\"changed\": {\"fields\": [\"slug\"]}}]',9,1),
	(129,'2019-06-12 23:05:34.842000','3','Contar apariciones en lista (3)',2,'[{\"changed\": {\"fields\": [\"slug\"]}}]',10,1),
	(130,'2019-06-12 23:05:42.200000','2','Segundo problema (2)',2,'[{\"changed\": {\"fields\": [\"slug\"]}}]',10,1),
	(131,'2019-06-12 23:05:48.010000','1','Primer problema (1)',2,'[{\"changed\": {\"fields\": [\"slug\"]}}]',10,1),
	(132,'2019-06-12 23:11:36.310000','3','Contar apariciones en lista - Juan Perez Perez - 2019-06-07 16:51:28+00:00',2,'[{\"changed\": {\"fields\": [\"ultimo_envio\"]}}]',22,1),
	(133,'2019-06-12 23:11:42.001000','1','Primer problema - Juan Perez Perez - 2019-06-02 21:29:04+00:00',2,'[{\"changed\": {\"fields\": [\"ultimo_envio\"]}}]',22,1),
	(134,'2019-06-12 23:25:06.373000','1','Tarea object (1)',2,'[{\"changed\": {\"fields\": [\"problemas\"]}}]',34,1),
	(135,'2019-06-12 23:25:25.988000','1','Tarea object (1)',2,'[]',34,1),
	(136,'2019-06-12 23:25:30.359000','1','Tarea object (1)',2,'[]',34,1),
	(137,'2019-06-12 23:41:00.879000','1','Tarea object (1)',2,'[{\"changed\": {\"fields\": [\"problemas\"]}}]',34,1),
	(138,'2019-06-12 23:41:34.428000','2','Tarea object (2)',1,'[{\"added\": {}}]',34,1),
	(139,'2019-06-13 21:46:07.184000','6','Juan Perez Perez: Contar apariciones en lista - 3: NU 0.0',2,'[{\"changed\": {\"fields\": [\"resultado_estudiante\"]}}]',9,1),
	(140,'2019-06-13 21:46:11.418000','5','Juan Perez Perez: Contar apariciones en lista - 2: NU 0.0',2,'[{\"changed\": {\"fields\": [\"resultado_estudiante\"]}}]',9,1),
	(141,'2019-06-14 15:50:33.190000','3','Juan Perez Perez: Primer problema - 3: OK 99.0',2,'[{\"changed\": {\"fields\": [\"avance\"]}}]',9,1),
	(142,'2019-06-14 15:50:53.663000','3','Juan Perez Perez: Primer problema - 3: OK 100.0',2,'[{\"changed\": {\"fields\": [\"avance\"]}}]',9,1),
	(143,'2019-06-14 20:52:40.204000','3','Contar apariciones en lista - Juan Perez Perez - 2019-06-07 16:51:28+00:00',2,'[]',22,1),
	(144,'2019-06-14 21:01:49.058000','8','Juan Perez Perez: Contar apariciones en lista - 5: NU 0.0',3,'',9,1),
	(145,'2019-06-14 21:01:49.060000','7','Juan Perez Perez: Contar apariciones en lista - 4: NU 0.0',3,'',9,1),
	(146,'2019-06-14 21:01:49.062000','6','Juan Perez Perez: Contar apariciones en lista - 3: NU 0.0',3,'',9,1),
	(147,'2019-06-14 21:01:49.065000','5','Juan Perez Perez: Contar apariciones en lista - 2: NU 0.0',3,'',9,1),
	(148,'2019-06-14 21:02:04.260000','3','Contar apariciones en lista - Juan Perez Perez - 2019-06-07 16:51:28+00:00',2,'[{\"changed\": {\"fields\": [\"ultimo_envio\"]}}]',22,1),
	(149,'2019-06-14 23:15:14.836000','5','monitor1 (MO)',2,'[{\"changed\": {\"fields\": [\"tipo\"]}}]',12,1),
	(150,'2019-06-15 00:01:35.590000','1','usuario.uniandes (ES)',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',12,1),
	(151,'2019-06-15 00:17:07.342000','5','monitor1 (MO)',2,'[{\"changed\": {\"fields\": [\"nombre\"]}}]',12,1),
	(152,'2019-06-15 00:18:14.114000','1','mario (ES)',2,'[{\"changed\": {\"fields\": [\"login\"]}}]',12,1),
	(153,'2019-06-15 00:56:02.279000','7','prof1 (PR)',3,'',12,1),
	(154,'2019-06-15 00:56:02.282000','6','admin1 (AD)',3,'',12,1),
	(155,'2019-06-15 00:56:02.284000','5','monitor1 (MO)',3,'',12,1),
	(156,'2019-06-15 00:56:02.286000','4','est1 (ES)',3,'',12,1),
	(157,'2019-06-15 00:56:02.288000','3','autor1 (PR)',3,'',12,1),
	(158,'2019-06-15 01:32:40.605000','9','est1 -- DEPT-1234 - 201920: 1',2,'[{\"changed\": {\"fields\": [\"seccion\"]}}]',21,1),
	(159,'2019-06-15 01:33:20.500000','9','Francis Goldman: Primer problema - 1: NU 100.0',2,'[{\"changed\": {\"fields\": [\"avance\"]}}]',9,1),
	(160,'2019-06-15 01:35:19.597000','9','Francis Goldman: Primer problema - 1: OK 100.0',2,'[{\"changed\": {\"fields\": [\"estado\"]}}]',9,1),
	(161,'2019-06-15 01:36:39.456000','5','Primer problema - Francis Goldman - 2019-06-15 01:36:33+00:00',2,'[{\"changed\": {\"fields\": [\"resuelto\", \"ultimo_intento\"]}}]',22,1),
	(162,'2019-06-15 15:47:09.825000','10','monitor1 (MO)',2,'[{\"changed\": {\"fields\": [\"nombre\"]}}]',20,1),
	(163,'2019-06-15 16:39:42.949000','11','Francis Goldman: Segundo problema - 1: NU 0.0',2,'[{\"changed\": {\"fields\": [\"slug\"]}}]',9,1),
	(164,'2019-06-15 16:39:47.617000','10','Francis Goldman: Segundo problema - 1: NU 0.0',2,'[{\"changed\": {\"fields\": [\"slug\"]}}]',9,1),
	(165,'2019-06-15 17:39:23.495000','2','DEPT-1234 - 201920: 2',1,'[{\"added\": {}}]',13,1),
	(166,'2019-06-15 17:39:52.289000','9','est1 -- DEPT-1234 - 201920: 2',2,'[{\"changed\": {\"fields\": [\"seccion\"]}}]',21,1),
	(167,'2019-06-15 17:41:54.333000','9','est1 -- DEPT-1234 - 201920: 1',2,'[{\"changed\": {\"fields\": [\"seccion\"]}}]',21,1),
	(168,'2019-06-15 17:41:58.255000','1','mario -- DEPT-1234 - 201920: 2',2,'[{\"changed\": {\"fields\": [\"seccion\"]}}]',21,1),
	(169,'2019-06-15 17:42:21.981000','1','mario -- DEPT-1234 - 201920: 1',2,'[{\"changed\": {\"fields\": [\"seccion\"]}}]',21,1),
	(170,'2019-06-16 04:20:04.704000','8','prof1 (PR)',2,'[{\"changed\": {\"fields\": [\"secciones\"]}}]',19,1),
	(171,'2019-06-16 17:19:38.327000','9','est1 -- DEPT-1234 - 201920: 1',2,'[{\"changed\": {\"fields\": [\"pulso_actividad\", \"pulso_puntos\"]}}]',21,1),
	(172,'2019-06-16 17:20:59.984000','1','mario -- DEPT-1234 - 201920: 1',2,'[{\"changed\": {\"fields\": [\"pulso_actividad\", \"pulso_puntos\"]}}]',21,1),
	(173,'2019-06-17 02:03:30.381000','1','mario -- DEPT-1234 - 201920: 1',2,'[{\"changed\": {\"fields\": [\"nombre\"]}}]',21,1),
	(174,'2019-06-17 02:03:44.308000','9','est1 -- DEPT-1234 - 201920: 1',2,'[{\"changed\": {\"fields\": [\"nombre\"]}}]',21,1),
	(175,'2019-06-17 02:05:20.880000','12','Mario: Contar apariciones en lista - 2: NU 0.0',3,'',9,1),
	(176,'2019-06-17 02:05:37.510000','3','Contar apariciones en lista - Mario - 2019-06-07 16:51:28+00:00',2,'[{\"changed\": {\"fields\": [\"ultimo_envio\"]}}]',22,1),
	(177,'2019-06-17 06:35:14.007000','1','wey -- DEPT-1234 - 201920: 1',2,'[{\"changed\": {\"fields\": [\"login\", \"nombre\"]}}]',21,1),
	(178,'2019-06-17 06:35:20.024000','1','wey -- DEPT-1234 - 201920: 1',2,'[]',21,1),
	(179,'2019-06-17 06:59:25.000000','7','Contar apariciones en lista - Juan Segundo - None',3,'',22,1),
	(180,'2019-06-22 17:43:21.201601','4','Nuevo problema (15)',1,'[{\"added\": {}}]',10,1),
	(181,'2019-06-23 04:28:03.108560','9','Cadenas',1,'[{\"added\": {}}]',23,1),
	(182,'2019-06-23 04:28:18.080001','5','Encontrar caracteres duplicados (5)',1,'[{\"added\": {}}]',10,1),
	(183,'2019-06-23 04:29:18.495607','6','entrada: str',1,'[{\"added\": {}}]',24,1),
	(184,'2019-06-23 04:33:20.979745','6','Encontrar caracteres duplicados - 1: Buscar caracteres duplicados en una cadena sin caracteres duplicados',1,'[{\"added\": {}}]',11,1),
	(185,'2019-06-23 04:34:11.010347','7','Encontrar caracteres duplicados - 2: Encontrar caracteres alfabéticos duplicados',1,'[{\"added\": {}}]',11,1),
	(186,'2019-06-23 04:35:12.885627','6','Encontrar caracteres duplicados - 1: Buscar caracteres duplicados en una cadena sin caracteres duplicados',2,'[{\"changed\": {\"fields\": [\"peso\"]}}]',11,1),
	(187,'2019-06-23 04:35:18.525733','7','Encontrar caracteres duplicados - 2: Encontrar caracteres alfabéticos duplicados',2,'[{\"changed\": {\"fields\": [\"peso\"]}}]',11,1),
	(188,'2019-06-23 04:35:53.364095','8','Encontrar caracteres duplicados - 3: Encontrar caracteres no-alfabéticos duplicados',1,'[{\"added\": {}}]',11,1),
	(189,'2019-06-23 04:36:45.588743','9','Encontrar caracteres duplicados - 4: Diferenciar entre mayúsculas y minúsculas',1,'[{\"added\": {}}]',11,1),
	(190,'2019-06-23 04:37:48.823219','10','Encontrar caracteres duplicados - 5: Reconocer correctamente cadenas vacías',1,'[{\"added\": {}}]',11,1),
	(191,'2019-06-23 04:42:50.087778','6','Encontrar caracteres duplicados - 1: Buscar caracteres duplicados en una cadena sin caracteres duplicados',2,'[{\"changed\": {\"fields\": [\"entrada\", \"salida\"]}}]',29,1),
	(192,'2019-06-23 04:43:02.491085','10','Encontrar caracteres duplicados - 5: Reconocer correctamente cadenas vacías',2,'[{\"changed\": {\"fields\": [\"entrada\", \"salida\"]}}]',29,1),
	(193,'2019-06-23 04:44:24.595314','9','Encontrar caracteres duplicados - 4: Diferenciar entre mayúsculas y minúsculas',2,'[{\"changed\": {\"fields\": [\"entrada\", \"salida\"]}}]',29,1),
	(194,'2019-06-23 04:45:50.518371','7','Encontrar caracteres duplicados - 2: Encontrar caracteres alfabéticos duplicados',2,'[{\"changed\": {\"fields\": [\"entrada\", \"salida\"]}}]',29,1),
	(195,'2019-06-23 04:47:26.207788','8','Encontrar caracteres duplicados - 3: Encontrar caracteres no-alfabéticos duplicados',2,'[{\"changed\": {\"fields\": [\"entrada\", \"salida\"]}}]',29,1),
	(196,'2019-06-25 22:22:45.696707','3','Contar apariciones en lista (3)',2,'[{\"changed\": {\"fields\": [\"autor\"]}}]',10,1),
	(197,'2019-06-25 22:22:50.711260','2','Segundo problema del banco (2)',2,'[{\"changed\": {\"fields\": [\"autor\"]}}]',10,1),
	(198,'2019-06-25 22:22:56.166614','1','Primer problema (1)',2,'[{\"changed\": {\"fields\": [\"autor\"]}}]',10,1),
	(199,'2019-06-25 22:48:38.084263','1','Primer problema (1)',2,'[{\"changed\": {\"fields\": [\"tags\"]}}]',10,1),
	(200,'2019-06-25 23:00:33.758693','5','Primer problema - Juan Segundo - 2019-06-15 01:36:33+00:00',2,'[{\"changed\": {\"fields\": [\"puntos\"]}}]',22,1),
	(201,'2019-06-26 11:28:17.879291','4','Tarea object (4)',1,'[{\"added\": {}}]',34,1),
	(202,'2019-06-26 11:28:48.108835','4','Tarea object (4)',2,'[]',34,1),
	(203,'2019-06-26 11:28:56.868213','5','Tarea object (5)',1,'[{\"added\": {}}]',34,1),
	(204,'2019-06-26 11:30:46.259679','4','Tarea object (4)',3,'',34,1),
	(205,'2019-06-26 11:34:06.398071','5','Tarea object (5)',2,'[{\"changed\": {\"fields\": [\"seccion\"]}}]',34,1),
	(206,'2019-06-26 11:34:19.254034','5','Tarea object (5)',2,'[{\"changed\": {\"fields\": [\"seccion\"]}}]',34,1),
	(207,'2019-06-26 11:37:22.464594','5','Tarea object (5)',2,'[{\"changed\": {\"fields\": [\"numero\"]}}]',34,1),
	(208,'2019-06-26 22:34:00.797709','7','Encontrar caracteres duplicados - 2: Encontrar caracteres alfabéticos duplicados',2,'[{\"changed\": {\"fields\": [\"salida\"]}}]',29,1),
	(209,'2019-06-26 23:14:18.941360','9','Juan Segundo: Primer problema - 1: NU 0.0',2,'[{\"changed\": {\"fields\": [\"avance\", \"estado\"]}}]',9,1),
	(210,'2019-06-26 23:14:45.778289','5','Primer problema - Juan Segundo - 2019-06-15 01:36:33+00:00',2,'[{\"changed\": {\"fields\": [\"resuelto\", \"puntos\"]}}]',22,1),
	(211,'2019-06-26 23:14:52.185663','9','Juan Segundo: Primer problema - 1: NU 0.0',2,'[]',9,1),
	(212,'2019-06-26 23:23:58.170176','5','ResultadoPrueba object (5)',1,'[{\"added\": {}}]',14,1),
	(213,'2019-06-26 23:25:21.200673','5','ResultadoPrueba object (5)',2,'[{\"changed\": {\"fields\": [\"resultado_exitoso\"]}}]',14,1),
	(214,'2019-06-26 23:27:06.986004','5','Primer problema - Juan Segundo - 2019-06-15 01:36:33+00:00',2,'[{\"changed\": {\"fields\": [\"resuelto\", \"puntos\"]}}]',22,1),
	(215,'2019-06-26 23:27:26.607531','9','Juan Segundo: Primer problema - 1: NU 0.0',2,'[{\"changed\": {\"fields\": [\"avance\", \"estado\"]}}]',9,1),
	(216,'2019-06-26 23:27:46.774690','5','ResultadoPrueba object (5)',2,'[{\"changed\": {\"fields\": [\"resultado_exitoso\"]}}]',14,1),
	(217,'2019-06-26 23:28:47.633886','15','Juan Segundo: Primer problema - 2: NU 0.0',2,'[]',9,1),
	(218,'2019-06-26 23:29:13.578105','6','ResultadoPrueba object (6)',1,'[{\"added\": {}}]',14,1),
	(219,'2019-06-27 00:53:09.632250','4','Nuevo problema (4)',2,'[{\"changed\": {\"fields\": [\"autor\"]}}]',10,1),
	(220,'2019-06-27 01:31:33.402343','14','Weymar Contreras: Contar apariciones en lista - 1: NU 0.0',2,'[{\"changed\": {\"fields\": [\"numero\"]}}]',9,1),
	(221,'2019-06-27 01:31:41.934235','4','Weymar Contreras: Contar apariciones en lista - 3: ER 50.0',2,'[{\"changed\": {\"fields\": [\"numero\"]}}]',9,1),
	(222,'2019-06-27 01:32:03.933332','3','Contar apariciones en lista - Weymar Contreras - 2019-06-07 16:51:28+00:00',2,'[{\"changed\": {\"fields\": [\"ultimo_envio\"]}}]',22,1),
	(223,'2019-08-05 02:31:40.332260','1','CursoSemestre object (1)',1,'[{\"added\": {}}]',8,2),
	(224,'2019-08-05 03:48:49.461785','38','id.salazar (ES)',3,'',19,2),
	(225,'2019-08-05 03:48:49.464406','37','mar-san1 (ES)',3,'',19,2),
	(226,'2019-08-05 03:49:02.874676','8','*** - 201920: 7',3,'',13,2),
	(227,'2019-08-05 03:49:02.876251','7','*** - 201920: 7',3,'',13,2),
	(228,'2019-08-05 03:49:02.878354','6','*** - 201920: 7',3,'',13,2),
	(229,'2019-08-05 03:49:02.880527','5','*** - 201920: 4',3,'',13,2),
	(230,'2019-08-05 03:49:02.881967','4','*** - 201920: 4',3,'',13,2),
	(231,'2019-08-05 03:49:02.883731','3','*** - 201920: 3',3,'',13,2),
	(232,'2019-08-05 03:49:37.307189','35','jd.vasquezh -- None',3,'',21,2),
	(233,'2019-08-05 03:49:37.309141','34','mc.rios -- None',3,'',21,2),
	(234,'2019-08-05 03:49:37.311328','33','a.robayo10 -- None',3,'',21,2),
	(235,'2019-08-05 03:49:37.313359','32','l.quiroga -- None',3,'',21,2),
	(236,'2019-08-05 03:49:37.315043','31','jm.pinilla -- None',3,'',21,2),
	(237,'2019-08-05 03:49:37.315991','30','d.perezf -- None',3,'',21,2),
	(238,'2019-08-05 03:49:37.317627','29','da.naranjob -- None',3,'',21,2),
	(239,'2019-08-05 03:49:37.319010','28','v.murillo -- None',3,'',21,2),
	(240,'2019-08-05 03:49:37.320449','27','jd.martinez20 -- None',3,'',21,2),
	(241,'2019-08-05 03:49:37.321971','26','jd.lopeza -- None',3,'',21,2),
	(242,'2019-08-05 03:49:37.323481','25','as.jacobs -- None',3,'',21,2),
	(243,'2019-08-05 03:49:37.324302','24','a.herrera20 -- None',3,'',21,2),
	(244,'2019-08-05 03:49:37.325967','23','l.hernandezb -- None',3,'',21,2),
	(245,'2019-08-05 03:49:37.326837','22','jc.gonzalezg -- None',3,'',21,2),
	(246,'2019-08-05 03:49:37.328267','21','s.gonzalez32 -- None',3,'',21,2),
	(247,'2019-08-05 03:49:37.329143','20','n.gonzalezb1 -- None',3,'',21,2),
	(248,'2019-08-05 03:49:37.330435','19','mj.gomez12 -- None',3,'',21,2),
	(249,'2019-08-05 03:49:37.331237','18','pa.gomezc -- None',3,'',21,2),
	(250,'2019-08-05 03:49:37.332641','17','m.colon -- None',3,'',21,2),
	(251,'2019-08-05 03:49:37.333894','16','ac.celis10 -- None',3,'',21,2),
	(252,'2019-08-05 03:49:37.335182','15','a.besalel -- None',3,'',21,2),
	(253,'2019-08-05 03:49:37.335822','14','jd.bernalc -- None',3,'',21,2),
	(254,'2019-08-05 03:49:37.337121','13','s.arangoa -- None',3,'',21,2),
	(255,'2019-08-05 03:49:37.338438','12','da.rubioh -- None',3,'',21,2),
	(256,'2019-08-05 03:51:07.085775','40','mar-san1 (ES)',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',19,2),
	(257,'2019-08-05 03:51:36.867001','40','mar-san1 (PR)',2,'[{\"changed\": {\"fields\": [\"tipo\"]}}]',19,2),
	(258,'2019-08-05 04:00:52.971681','64','id.salazar (ES)',3,'',19,2),
	(259,'2019-08-05 04:00:52.973341','40','mar-san1 (PR)',3,'',19,2),
	(260,'2019-08-05 04:01:05.807577','63','jd.vasquezh -- *** - 201920: 6',3,'',21,2),
	(261,'2019-08-05 04:01:05.810316','62','mc.rios -- *** - 201920: 6',3,'',21,2),
	(262,'2019-08-05 04:01:05.811459','61','a.robayo10 -- *** - 201920: 6',3,'',21,2),
	(263,'2019-08-05 04:01:05.813693','60','l.quiroga -- *** - 201920: 6',3,'',21,2),
	(264,'2019-08-05 04:01:05.815275','59','jm.pinilla -- *** - 201920: 6',3,'',21,2),
	(265,'2019-08-05 04:01:05.817046','58','d.perezf -- *** - 201920: 6',3,'',21,2),
	(266,'2019-08-05 04:01:05.818598','57','da.naranjob -- *** - 201920: 6',3,'',21,2),
	(267,'2019-08-05 04:01:05.820027','56','v.murillo -- *** - 201920: 6',3,'',21,2),
	(268,'2019-08-05 04:01:05.821403','55','jd.martinez20 -- *** - 201920: 6',3,'',21,2),
	(269,'2019-08-05 04:01:05.822964','54','jd.lopeza -- *** - 201920: 6',3,'',21,2),
	(270,'2019-08-05 04:01:05.823675','53','as.jacobs -- *** - 201920: 6',3,'',21,2),
	(271,'2019-08-05 04:01:05.824457','52','a.herrera20 -- *** - 201920: 6',3,'',21,2),
	(272,'2019-08-05 04:01:05.825278','51','l.hernandezb -- *** - 201920: 6',3,'',21,2),
	(273,'2019-08-05 04:01:05.826109','50','jc.gonzalezg -- *** - 201920: 6',3,'',21,2),
	(274,'2019-08-05 04:01:05.827140','49','s.gonzalez32 -- *** - 201920: 6',3,'',21,2),
	(275,'2019-08-05 04:01:05.828535','48','n.gonzalezb1 -- *** - 201920: 6',3,'',21,2),
	(276,'2019-08-05 04:01:05.830366','47','mj.gomez12 -- *** - 201920: 6',3,'',21,2),
	(277,'2019-08-05 04:01:05.831920','46','pa.gomezc -- *** - 201920: 6',3,'',21,2),
	(278,'2019-08-05 04:01:05.833282','45','m.colon -- *** - 201920: 6',3,'',21,2),
	(279,'2019-08-05 04:01:05.834558','44','ac.celis10 -- *** - 201920: 6',3,'',21,2),
	(280,'2019-08-05 04:01:05.835935','43','a.besalel -- *** - 201920: 6',3,'',21,2),
	(281,'2019-08-05 04:01:05.837173','42','jd.bernalc -- *** - 201920: 6',3,'',21,2),
	(282,'2019-08-05 04:01:05.837876','41','s.arangoa -- *** - 201920: 6',3,'',21,2),
	(283,'2019-08-05 04:01:05.838672','39','da.rubioh -- *** - 201920: 6',3,'',21,2),
	(284,'2019-08-05 04:01:14.829932','9','*** - 201920: 6',3,'',13,2),
	(285,'2019-08-05 04:08:10.194458','89','jd.vasquezh -- *** - 201920: 4',3,'',21,2),
	(286,'2019-08-05 04:08:10.200708','88','mc.rios -- *** - 201920: 4',3,'',21,2),
	(287,'2019-08-05 04:08:10.201560','87','a.robayo10 -- *** - 201920: 4',3,'',21,2),
	(288,'2019-08-05 04:08:10.202304','86','l.quiroga -- *** - 201920: 4',3,'',21,2),
	(289,'2019-08-05 04:08:10.203028','85','jm.pinilla -- *** - 201920: 4',3,'',21,2),
	(290,'2019-08-05 04:08:10.203820','84','d.perezf -- *** - 201920: 4',3,'',21,2),
	(291,'2019-08-05 04:08:10.204760','83','da.naranjob -- *** - 201920: 4',3,'',21,2),
	(292,'2019-08-05 04:08:10.205952','82','v.murillo -- *** - 201920: 4',3,'',21,2),
	(293,'2019-08-05 04:08:10.206717','81','jd.martinez20 -- *** - 201920: 4',3,'',21,2),
	(294,'2019-08-05 04:08:10.207494','80','jd.lopeza -- *** - 201920: 4',3,'',21,2),
	(295,'2019-08-05 04:08:10.208964','79','as.jacobs -- *** - 201920: 4',3,'',21,2),
	(296,'2019-08-05 04:08:10.209713','78','a.herrera20 -- *** - 201920: 4',3,'',21,2),
	(297,'2019-08-05 04:08:10.210486','77','l.hernandezb -- *** - 201920: 4',3,'',21,2),
	(298,'2019-08-05 04:08:10.211226','76','jc.gonzalezg -- *** - 201920: 4',3,'',21,2),
	(299,'2019-08-05 04:08:10.211977','75','s.gonzalez32 -- *** - 201920: 4',3,'',21,2),
	(300,'2019-08-05 04:08:10.212703','74','n.gonzalezb1 -- *** - 201920: 4',3,'',21,2),
	(301,'2019-08-05 04:08:10.214073','73','mj.gomez12 -- *** - 201920: 4',3,'',21,2),
	(302,'2019-08-05 04:08:10.214886','72','pa.gomezc -- *** - 201920: 4',3,'',21,2),
	(303,'2019-08-05 04:08:10.215597','71','m.colon -- *** - 201920: 4',3,'',21,2),
	(304,'2019-08-05 04:08:10.216298','70','ac.celis10 -- *** - 201920: 4',3,'',21,2),
	(305,'2019-08-05 04:08:10.217274','69','a.besalel -- *** - 201920: 4',3,'',21,2),
	(306,'2019-08-05 04:08:10.218060','68','jd.bernalc -- *** - 201920: 4',3,'',21,2),
	(307,'2019-08-05 04:08:10.218825','67','s.arangoa -- *** - 201920: 4',3,'',21,2),
	(308,'2019-08-05 04:08:10.219562','65','da.rubioh -- *** - 201920: 4',3,'',21,2),
	(309,'2019-08-05 04:08:22.876365','90','id.salazar (PR)',3,'',19,2),
	(310,'2019-08-05 04:08:22.877235','66','mar-san1 (PR)',3,'',19,2),
	(311,'2019-08-05 04:08:39.416425','14','*** - 201920: 6',3,'',13,2),
	(312,'2019-08-05 04:08:39.417468','13','*** - 201920: 6',3,'',13,2),
	(313,'2019-08-05 04:08:39.418297','12','*** - 201920: 6',3,'',13,2),
	(314,'2019-08-05 04:08:39.420182','11','*** - 201920: 5',3,'',13,2),
	(315,'2019-08-05 04:08:39.421400','10','*** - 201920: 4',3,'',13,2),
	(316,'2019-08-05 11:50:30.369486','115','jd.vasquezh -- *** - 201920: 3',3,'',21,2),
	(317,'2019-08-05 11:50:30.377032','114','mc.rios -- *** - 201920: 3',3,'',21,2),
	(318,'2019-08-05 11:50:30.379242','113','a.robayo10 -- *** - 201920: 3',3,'',21,2),
	(319,'2019-08-05 11:50:30.380278','112','l.quiroga -- *** - 201920: 3',3,'',21,2),
	(320,'2019-08-05 11:50:30.381084','111','jm.pinilla -- *** - 201920: 3',3,'',21,2),
	(321,'2019-08-05 11:50:30.382599','110','d.perezf -- *** - 201920: 3',3,'',21,2),
	(322,'2019-08-05 11:50:30.383372','109','da.naranjob -- *** - 201920: 3',3,'',21,2),
	(323,'2019-08-05 11:50:30.384174','108','v.murillo -- *** - 201920: 3',3,'',21,2),
	(324,'2019-08-05 11:50:30.385756','107','jd.martinez20 -- *** - 201920: 3',3,'',21,2),
	(325,'2019-08-05 11:50:30.386607','106','jd.lopeza -- *** - 201920: 3',3,'',21,2),
	(326,'2019-08-05 11:50:30.387443','105','as.jacobs -- *** - 201920: 3',3,'',21,2),
	(327,'2019-08-05 11:50:30.388843','104','a.herrera20 -- *** - 201920: 3',3,'',21,2),
	(328,'2019-08-05 11:50:30.389746','103','l.hernandezb -- *** - 201920: 3',3,'',21,2),
	(329,'2019-08-05 11:50:30.391420','102','jc.gonzalezg -- *** - 201920: 3',3,'',21,2),
	(330,'2019-08-05 11:50:30.392434','101','s.gonzalez32 -- *** - 201920: 3',3,'',21,2),
	(331,'2019-08-05 11:50:30.393280','100','n.gonzalezb1 -- *** - 201920: 3',3,'',21,2),
	(332,'2019-08-05 11:50:30.394338','99','mj.gomez12 -- *** - 201920: 3',3,'',21,2),
	(333,'2019-08-05 11:50:30.395078','98','pa.gomezc -- *** - 201920: 3',3,'',21,2),
	(334,'2019-08-05 11:50:30.395801','97','m.colon -- *** - 201920: 3',3,'',21,2),
	(335,'2019-08-05 11:50:30.397378','96','ac.celis10 -- *** - 201920: 3',3,'',21,2),
	(336,'2019-08-05 11:50:30.398153','95','a.besalel -- *** - 201920: 3',3,'',21,2),
	(337,'2019-08-05 11:50:30.399013','94','jd.bernalc -- *** - 201920: 3',3,'',21,2),
	(338,'2019-08-05 11:50:30.399832','93','s.arangoa -- *** - 201920: 3',3,'',21,2),
	(339,'2019-08-05 11:50:30.400603','91','da.rubioh -- *** - 201920: 3',3,'',21,2),
	(340,'2019-08-05 11:50:41.503154','116','id.salazar (PR)',3,'',19,2),
	(341,'2019-08-05 11:50:41.504057','92','mar-san1 (PR)',3,'',19,2),
	(342,'2019-08-05 12:04:12.108533','15','*** - 201920: 3',3,'',13,2),
	(343,'2019-08-05 19:54:46.368455','25','*** - 201920: 8',3,'',13,2),
	(344,'2019-08-05 19:54:46.374549','24','*** - 201920: 8',3,'',13,2),
	(345,'2019-08-05 19:54:46.375487','23','*** - 201920: 8',3,'',13,2),
	(346,'2019-08-05 19:54:46.376339','22','*** - 201920: 8',3,'',13,2),
	(347,'2019-08-05 19:54:46.377295','21','*** - 201920: 8',3,'',13,2),
	(348,'2019-08-05 19:55:10.423483','26','*** - 201920: 10',3,'',13,2),
	(349,'2019-08-05 19:55:41.498834','167','c.suarezv -- None',3,'',21,2),
	(350,'2019-08-05 19:55:41.499828','166','af.romerog -- None',3,'',21,2),
	(351,'2019-08-05 19:55:41.500627','165','m.rodriguez31 -- None',3,'',21,2),
	(352,'2019-08-05 19:55:41.501229','164','si.rincon -- None',3,'',21,2),
	(353,'2019-08-05 19:55:41.502560','163','as.ramosg -- None',3,'',21,2),
	(354,'2019-08-05 19:55:41.503770','162','se.quiroga -- None',3,'',21,2),
	(355,'2019-08-05 19:55:41.504260','161','s.polo -- None',3,'',21,2),
	(356,'2019-08-05 19:55:41.506054','160','m.perezc1 -- None',3,'',21,2),
	(357,'2019-08-05 19:55:41.506534','159','ll.palacios -- None',3,'',21,2),
	(358,'2019-08-05 19:55:41.507014','158','ef.murcia -- None',3,'',21,2),
	(359,'2019-08-05 19:55:41.507551','157','sc.menjura -- None',3,'',21,2),
	(360,'2019-08-05 19:55:41.508683','156','e.marquezm -- None',3,'',21,2),
	(361,'2019-08-05 19:55:41.509206','155','jc.lopezs -- None',3,'',21,2),
	(362,'2019-08-05 19:55:41.509870','154','a.lopezs3 -- None',3,'',21,2),
	(363,'2019-08-05 19:55:41.510633','153','pg.gonzalez -- None',3,'',21,2),
	(364,'2019-08-05 19:55:41.511338','152','da.gomezc2 -- None',3,'',21,2),
	(365,'2019-08-05 19:55:41.512375','151','jf.gomezb1 -- None',3,'',21,2),
	(366,'2019-08-05 19:55:41.513303','150','am.diazv1 -- None',3,'',21,2),
	(367,'2019-08-05 19:55:41.513762','149','av.criado -- None',3,'',21,2),
	(368,'2019-08-05 19:55:41.514205','148','jc.burgos -- None',3,'',21,2),
	(369,'2019-08-05 19:55:41.514661','147','s.bonillac -- None',3,'',21,2),
	(370,'2019-08-05 19:55:41.515538','146','m.acevedoo -- None',3,'',21,2),
	(371,'2019-08-05 19:55:41.515992','145','pa.guzmans -- None',3,'',21,2),
	(372,'2019-08-05 19:55:41.516512','144','pa.martinezc1 -- None',3,'',21,2),
	(373,'2019-08-12 02:10:49.804924','4','Nuevo problema (4)',2,'[{\"changed\": {\"fields\": [\"es_reto\", \"nivel_reto\"]}}]',10,2),
	(374,'2019-08-12 02:10:56.163269','2','Segundo problema del banco (2)',2,'[{\"changed\": {\"fields\": [\"es_reto\", \"nivel_reto\"]}}]',10,2),
	(375,'2019-08-12 02:11:03.569829','1','Primer problema (1)',2,'[{\"changed\": {\"fields\": [\"es_reto\", \"nivel_reto\"]}}]',10,2),
	(376,'2019-08-12 13:22:36.438671','11','admin1 (AD)',2,'[{\"changed\": {\"fields\": [\"usuario_local\"]}}]',12,2),
	(377,'2019-08-12 13:22:57.805289','1','wey (ES)',2,'[{\"changed\": {\"fields\": [\"usuario_local\"]}}]',12,2),
	(378,'2019-08-12 13:23:04.093238','8','prof1 (PR)',2,'[{\"changed\": {\"fields\": [\"usuario_local\"]}}]',12,2),
	(379,'2019-08-12 13:23:08.217348','8','prof1 (PR)',2,'[]',12,2),
	(380,'2019-08-12 13:23:12.314712','9','est1 (ES)',2,'[{\"changed\": {\"fields\": [\"usuario_local\"]}}]',12,2),
	(381,'2019-08-12 13:23:16.548821','10','monitor1 (MO)',2,'[{\"changed\": {\"fields\": [\"usuario_local\"]}}]',12,2),
	(382,'2019-08-12 13:23:20.005354','11','admin1 (AD)',2,'[]',12,2),
	(383,'2019-08-12 13:23:26.140593','1','wey (ES)',2,'[]',12,2),
	(384,'2019-08-13 13:15:27.564479','6','Distancia entre dos puntos en la Tierra (6)',3,'',10,2),
	(385,'2019-08-13 15:43:14.493095','13','Distancia entre dos puntos en la Tierra (13)',3,'',10,2),
	(386,'2019-08-13 15:43:14.496337','12','Distancia entre dos puntos en la Tierra (12)',3,'',10,2),
	(387,'2019-08-13 15:43:14.498594','11','Distancia entre dos puntos en la Tierra (11)',3,'',10,2),
	(388,'2019-08-13 15:43:14.500959','10','Distancia entre dos puntos en la Tierra (10)',3,'',10,2),
	(389,'2019-08-13 15:43:14.503685','9','Distancia entre dos puntos en la Tierra (9)',3,'',10,2),
	(390,'2019-08-13 15:43:14.507510','8','Distancia entre dos puntos en la Tierra (8)',3,'',10,2),
	(391,'2019-08-13 15:43:14.510454','7','Distancia entre dos puntos en la Tierra (7)',3,'',10,2),
	(392,'2019-08-13 15:43:36.223492','18','operadores aritméticos',3,'',23,2),
	(393,'2019-08-13 15:43:36.226522','17','llamado de funciones',3,'',23,2),
	(394,'2019-08-13 15:43:36.228272','16','módulo math',3,'',23,2),
	(395,'2019-08-13 15:43:36.229973','15','Creación de funciones',3,'',23,2),
	(396,'2019-08-13 15:43:36.239358','14','operadores aritméticos',3,'',23,2),
	(397,'2019-08-13 15:43:36.241461','13','llamado de funciones',3,'',23,2),
	(398,'2019-08-13 15:43:36.243584','12','módulo math',3,'',23,2),
	(399,'2019-08-13 15:43:36.246661','11','Creación de funciones',3,'',23,2),
	(400,'2019-08-13 15:43:36.248830','10','Creación de funciones',3,'',23,2),
	(401,'2019-08-14 02:07:57.495737','12','Área de una habitación - 1: La función calcula correctamente el área',3,'',29,2),
	(402,'2019-08-14 02:08:15.151157','18','Área de una habitación (18)',3,'',10,2),
	(403,'2019-08-14 02:08:15.153782','16','Distancia entre dos puntos en la Tierra (16)',3,'',10,2),
	(404,'2019-08-14 02:08:15.156299','15','Distancia entre dos puntos en la Tierra (15)',3,'',10,2),
	(405,'2019-08-14 02:08:15.158952','14','Distancia entre dos puntos en la Tierra (14)',3,'',10,2),
	(406,'2019-08-14 02:08:28.273464','23','Creación de funciones; operadores aritméticos',3,'',23,2),
	(407,'2019-08-14 02:12:17.116872','16','Cambio a retornar - 2: Calcular correctamente el número de monedas, cuando solo se deben retornar de 200',2,'[{\"changed\": {\"fields\": [\"numero\", \"entrada\", \"salida\"]}}]',29,2),
	(408,'2019-08-14 02:12:21.925354','17','Cambio a retornar - 3: Calcular correctamente el número de monedas, cuando solo se deben retornar de 100',2,'[{\"changed\": {\"fields\": [\"numero\"]}}]',29,2),
	(409,'2019-08-14 02:12:28.077793','18','Cambio a retornar - 4: Calcular correctamente el número de monedas, cuando solo se deben retornar de 50',2,'[{\"changed\": {\"fields\": [\"numero\"]}}]',29,2),
	(410,'2019-08-14 02:12:33.521707','19','Cambio a retornar - 5: Calcular correctamente el número de monedas, cuando se retornan de varias denominaciones',2,'[{\"changed\": {\"fields\": [\"numero\", \"entrada\", \"salida\"]}}]',29,2),
	(411,'2019-08-14 02:14:30.161503','21','Cambio a retornar (21)',2,'[{\"changed\": {\"fields\": [\"descripcion\", \"autor\", \"curso\"]}}]',10,2),
	(412,'2019-08-14 02:20:00.426266','20','Eficiencia de combustible (20)',2,'[{\"changed\": {\"fields\": [\"autor\", \"curso\"]}}]',10,2),
	(413,'2019-08-14 02:20:09.301124','19','Área de una habitación (19)',2,'[{\"changed\": {\"fields\": [\"autor\", \"curso\"]}}]',10,2),
	(414,'2019-08-14 02:20:17.408507','17','Distancia entre dos puntos en la Tierra (17)',2,'[{\"changed\": {\"fields\": [\"autor\", \"curso\"]}}]',10,2),
	(415,'2019-08-14 02:20:33.256103','17','Distancia entre dos puntos en la Tierra (17)',2,'[]',10,2),
	(416,'2019-08-14 02:20:52.658856','1','Primer problema (1)',2,'[{\"changed\": {\"fields\": [\"es_reto\"]}}]',10,2),
	(417,'2019-08-14 02:20:56.461375','2','Segundo problema del banco (2)',2,'[{\"changed\": {\"fields\": [\"es_reto\"]}}]',10,2),
	(418,'2019-08-14 02:21:02.320174','3','Contar apariciones en lista (3)',2,'[{\"changed\": {\"fields\": [\"es_reto\"]}}]',10,2),
	(419,'2019-08-14 02:21:06.269601','4','Nuevo problema (4)',2,'[{\"changed\": {\"fields\": [\"es_reto\"]}}]',10,2),
	(420,'2019-08-14 02:21:11.320791','5','Encontrar caracteres duplicados (5)',2,'[]',10,2),
	(421,'2019-08-14 02:21:41.157762','17','Distancia entre dos puntos en la Tierra (17)',2,'[{\"changed\": {\"fields\": [\"dificultad\", \"nivel_reto\"]}}]',10,2),
	(422,'2019-08-14 03:19:14.238281','28','Caída libre (28)',2,'[{\"changed\": {\"fields\": [\"nivel_reto\"]}}]',10,2),
	(423,'2019-08-14 03:19:36.848058','27','Suma de los primeros N enteros positivos (27)',2,'[]',10,2),
	(424,'2019-08-14 03:19:46.559068','27','Suma de los primeros N enteros positivos (27)',3,'',10,2),
	(425,'2019-08-14 03:20:32.037541','28','Caída libre (28)',2,'[{\"changed\": {\"fields\": [\"nivel_reto\"]}}]',10,2),
	(426,'2019-08-14 03:23:55.792509','25','Cambio a retornar (25)',3,'',10,2),
	(427,'2019-08-14 03:23:55.795516','22','IVA y propina (22)',3,'',10,2),
	(428,'2019-08-14 03:24:05.233440','24','Ley de los gases ideales (24)',3,'',10,2),
	(429,'2019-08-14 04:32:40.868441','29','Primer problema - 1: Calcular correctamente la suma',3,'',11,2),
	(430,'2019-08-14 04:32:40.872376','27','Primer problema - 5: Calcular correctamente el número de monedas, cuando se retornan de varias denominaciones',3,'',11,2),
	(431,'2019-08-14 04:32:40.874109','26','Primer problema - 4: Calcular correctamente el número de monedas, cuando solo se deben retornar de 50',3,'',11,2),
	(432,'2019-08-14 04:32:40.875888','25','Primer problema - 3: Calcular correctamente el número de monedas, cuando solo se deben retornar de 100',3,'',11,2),
	(433,'2019-08-14 04:32:40.876870','24','Primer problema - 2: Calcular correctamente el número de monedas, cuando solo se deben retornar de 200',3,'',11,2),
	(434,'2019-08-14 04:32:40.879130','23','Primer problema - 1: Calcular correctamente el número de monedas, cuando solo se deben retornar de 500',3,'',11,2),
	(435,'2019-08-14 04:32:40.881156','22','Primer problema - 1: Calcular correctamente el número de moles del gas',3,'',11,2),
	(436,'2019-08-14 04:32:40.882244','20','Primer problema - 1: Calcular correctamente propina, iva y total de la factura',3,'',11,2),
	(437,'2019-08-14 05:39:26.281727','118','mar-san1 (PR)',2,'[{\"changed\": {\"fields\": [\"usuario_local\"]}}]',12,2),
	(438,'2019-08-19 14:53:28.485073','62','Contar apariciones en lista - 1: Prueba una aparición',1,'[{\"added\": {}}]',29,2),
	(439,'2019-08-19 14:53:36.515962','2','Contar apariciones en lista - 1: Prueba una aparición',3,'',11,2),
	(440,'2019-08-19 14:54:56.838433','63','Contar apariciones en lista - 2: El elemento no existe',1,'[{\"added\": {}}]',29,2),
	(441,'2019-08-19 14:55:00.299782','3','Contar apariciones en lista - 2: El elemento no existe',3,'',11,2),
	(442,'2019-08-19 14:57:43.091300','64','Contar apariciones en lista - 3: Prueba múltiples apariciones',1,'[{\"added\": {}}]',29,2),
	(443,'2019-08-19 14:57:45.965737','4','Contar apariciones en lista - 3: Prueba múltiples apariciones',3,'',11,2),
	(444,'2019-08-19 14:58:30.183327','65','Contar apariciones en lista - 4: Lista vacía',1,'[{\"added\": {}}]',29,2),
	(445,'2019-08-19 14:58:33.117021','5','Contar apariciones en lista - 4: Lista vacía',3,'',11,2),
	(446,'2019-08-19 15:19:10.828120','50','Encontrar el elemento mayor (50)',3,'',10,2),
	(447,'2019-08-19 15:20:32.843748','52','Encontrar el elemento menor (52)',3,'',10,2),
	(448,'2019-08-19 15:20:45.248404','29','Ciclos; Enteros',3,'',23,2),
	(449,'2019-08-19 15:20:45.250883','28','Ciclos; Recorridos parciales; Listas',3,'',23,2),
	(450,'2019-08-19 15:20:45.251987','27','Ciclos; Recorridos totales; Listas',3,'',23,2),
	(451,'2019-08-19 15:22:14.814033','54','Encontrar si un número es Primo (54)',3,'',10,2),
	(452,'2019-08-19 15:22:14.815871','53','Buscar un elemento en una lista (53)',3,'',10,2),
	(453,'2019-08-19 15:22:14.817992','51','Encontrar el elemento mayor (51)',3,'',10,2),
	(454,'2019-08-19 15:44:11.319534','59','Encontrar si un número es Primo (59)',2,'[]',10,2),
	(455,'2019-08-19 15:47:01.778005','74','Primer problema - 2: Reconocimiento de Primos',3,'',11,2),
	(456,'2019-08-19 15:47:01.781362','73','Primer problema - 1: Reconocimiento de No Primos',3,'',11,2),
	(457,'2019-08-19 15:47:01.782682','72','Primer problema - 3: Encontrar solamente la primera aparición del número',3,'',11,2),
	(458,'2019-08-19 15:47:01.784993','71','Primer problema - 2: El número no existe en la lista',3,'',11,2),
	(459,'2019-08-19 15:47:01.786182','70','Primer problema - 1: El número se encuentra en la lista.',3,'',11,2),
	(460,'2019-08-19 15:47:01.787195','69','Primer problema - 2: Listas Llenas',3,'',11,2),
	(461,'2019-08-19 15:47:01.788194','68','Primer problema - 1: Lista Vacía',3,'',11,2),
	(462,'2019-08-19 15:47:01.790407','67','Primer problema - 2: Listas llenas',3,'',11,2),
	(463,'2019-08-19 15:47:01.792463','66','Primer problema - 1: Lista Vacía',3,'',11,2);

/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table django_content_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `model` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;

INSERT INTO `django_content_type` (`id`, `app_label`, `model`)
VALUES
	(1,'admin','logentry'),
	(3,'auth','group'),
	(2,'auth','permission'),
	(4,'auth','user'),
	(5,'contenttypes','contenttype'),
	(24,'dashboard','argumento'),
	(18,'dashboard','blogpost'),
	(17,'dashboard','comentariopregunta'),
	(16,'dashboard','comentarioproblema'),
	(36,'dashboard','consultarecurso'),
	(7,'dashboard','curso'),
	(8,'dashboard','cursosemestre'),
	(9,'dashboard','envio'),
	(21,'dashboard','estudiante'),
	(28,'dashboard','logro'),
	(27,'dashboard','medalla'),
	(20,'dashboard','monitor'),
	(26,'dashboard','notificacion'),
	(15,'dashboard','pregunta'),
	(10,'dashboard','problema'),
	(19,'dashboard','profesor'),
	(11,'dashboard','prueba'),
	(29,'dashboard','pruebaio'),
	(30,'dashboard','pruebascript'),
	(35,'dashboard','recurso'),
	(37,'dashboard','registro'),
	(22,'dashboard','resultadoestudiante'),
	(25,'dashboard','resultadoproblema'),
	(14,'dashboard','resultadoprueba'),
	(33,'dashboard','resultadotarea'),
	(32,'dashboard','revision'),
	(13,'dashboard','seccion'),
	(23,'dashboard','tag'),
	(34,'dashboard','tarea'),
	(12,'dashboard','usuario'),
	(31,'dashboard','worker'),
	(6,'sessions','session');

/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table django_migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE latin1_spanish_ci NOT NULL,
  `name` varchar(255) COLLATE latin1_spanish_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`)
VALUES
	(1,'contenttypes','0001_initial','2019-06-22 00:28:48.692569'),
	(2,'auth','0001_initial','2019-06-22 00:28:48.832371'),
	(3,'admin','0001_initial','2019-06-22 00:28:49.051826'),
	(4,'admin','0002_logentry_remove_auto_add','2019-06-22 00:28:49.101702'),
	(5,'admin','0003_logentry_add_action_flag_choices','2019-06-22 00:28:49.111540'),
	(6,'contenttypes','0002_remove_content_type_name','2019-06-22 00:28:49.163827'),
	(7,'auth','0002_alter_permission_name_max_length','2019-06-22 00:28:49.188844'),
	(8,'auth','0003_alter_user_email_max_length','2019-06-22 00:28:49.218195'),
	(9,'auth','0004_alter_user_username_opts','2019-06-22 00:28:49.230328'),
	(10,'auth','0005_alter_user_last_login_null','2019-06-22 00:28:49.261465'),
	(11,'auth','0006_require_contenttypes_0002','2019-06-22 00:28:49.263643'),
	(12,'auth','0007_alter_validators_add_error_messages','2019-06-22 00:28:49.274357'),
	(13,'auth','0008_alter_user_username_max_length','2019-06-22 00:28:49.304250'),
	(14,'auth','0009_alter_user_last_name_max_length','2019-06-22 00:28:49.336796'),
	(15,'auth','0010_alter_group_name_max_length','2019-06-22 00:28:49.360916'),
	(16,'auth','0011_update_proxy_permissions','2019-06-22 00:28:49.369363'),
	(17,'dashboard','0001_initial','2019-06-22 00:28:49.775747'),
	(18,'dashboard','0002_curso_codigo_curso','2019-06-22 00:28:50.207729'),
	(19,'dashboard','0003_auto_20190528_0530','2019-06-22 00:28:50.473775'),
	(20,'dashboard','0004_auto_20190530_0257','2019-06-22 00:28:50.560949'),
	(21,'dashboard','0005_auto_20190531_1931','2019-06-22 00:28:50.860789'),
	(22,'dashboard','0006_pregunta_titulo','2019-06-22 00:28:50.906911'),
	(23,'dashboard','0007_auto_20190602_0456','2019-06-22 00:28:50.957374'),
	(24,'dashboard','0008_auto_20190602_0506','2019-06-22 00:28:51.052553'),
	(25,'dashboard','0009_argumento','2019-06-22 00:28:51.139251'),
	(26,'dashboard','0010_auto_20190602_2104','2019-06-22 00:28:51.237879'),
	(27,'dashboard','0011_auto_20190602_2122','2019-06-22 00:28:51.521165'),
	(28,'dashboard','0012_envio_resultado_estudiante','2019-06-22 00:28:51.583504'),
	(29,'dashboard','0013_auto_20190602_2125','2019-06-22 00:28:51.679923'),
	(30,'dashboard','0014_resultadoestudiante_ultimo_intento','2019-06-22 00:28:51.770470'),
	(31,'dashboard','0015_auto_20190602_2149','2019-06-22 00:28:51.834036'),
	(32,'dashboard','0016_auto_20190602_2150','2019-06-22 00:28:51.875653'),
	(33,'dashboard','0017_auto_20190602_2150','2019-06-22 00:28:51.905384'),
	(34,'dashboard','0018_auto_20190603_1510','2019-06-22 00:28:51.980107'),
	(35,'dashboard','0019_envio_estado','2019-06-22 00:28:52.032176'),
	(36,'dashboard','0020_auto_20190607_1431','2019-06-22 00:28:52.098336'),
	(37,'dashboard','0021_notificacion','2019-06-22 00:28:52.136264'),
	(38,'dashboard','0022_auto_20190608_2113','2019-06-22 00:28:52.207290'),
	(39,'dashboard','0023_logro_medalla','2019-06-22 00:28:52.267302'),
	(40,'dashboard','0024_auto_20190609_2336','2019-06-22 00:28:52.361014'),
	(41,'dashboard','0025_medalla_cantidad','2019-06-22 00:28:52.399469'),
	(42,'dashboard','0026_auto_20190610_0331','2019-06-22 00:28:52.493317'),
	(43,'dashboard','0027_argumento_posicion','2019-06-22 00:28:52.538996'),
	(44,'dashboard','0028_auto_20190610_2149','2019-06-22 00:28:52.625735'),
	(45,'dashboard','0029_auto_20190610_2154','2019-06-22 00:28:52.729956'),
	(46,'dashboard','0030_auto_20190611_0257','2019-06-22 00:28:53.238555'),
	(47,'dashboard','0031_resultadoprueba_numero','2019-06-22 00:28:53.475544'),
	(48,'dashboard','0032_auto_20190611_0329','2019-06-22 00:28:53.595665'),
	(49,'dashboard','0033_resultadotarea_tarea','2019-06-22 00:28:53.693493'),
	(50,'dashboard','0034_resultadotarea_tarea','2019-06-22 00:28:53.828931'),
	(51,'dashboard','0035_auto_20190612_1539','2019-06-22 00:28:54.031505'),
	(52,'dashboard','0036_auto_20190612_1646','2019-06-22 00:28:54.249749'),
	(53,'dashboard','0037_auto_20190612_2304','2019-06-22 00:28:54.298007'),
	(54,'dashboard','0038_resultadoestudiante_ultimo_envio','2019-06-22 00:28:54.345068'),
	(55,'dashboard','0039_auto_20190612_2331','2019-06-22 00:28:54.406244'),
	(56,'dashboard','0040_auto_20190612_2346','2019-06-22 00:28:54.430027'),
	(57,'dashboard','0041_auto_20190614_2314','2019-06-22 00:28:54.476948'),
	(58,'dashboard','0042_registro','2019-06-22 00:28:54.515083'),
	(59,'dashboard','0043_notificacion_link','2019-06-22 00:28:54.568790'),
	(60,'dashboard','0044_auto_20190615_1506','2019-06-22 00:28:54.620514'),
	(61,'dashboard','0045_auto_20190616_1717','2019-06-22 00:28:54.737320'),
	(62,'sessions','0001_initial','2019-06-22 00:28:54.760328'),
	(63,'dashboard','0046_problema_nivel','2019-06-22 16:38:24.611330'),
	(64,'dashboard','0047_problema_ultima_modificacion','2019-06-22 17:20:48.463184'),
	(65,'dashboard','0048_remove_problema_numero','2019-06-22 17:43:51.910884'),
	(66,'dashboard','0049_prueba_peso','2019-06-23 04:35:00.526004'),
	(67,'dashboard','0050_auto_20190731_2229','2019-08-02 15:19:25.795154'),
	(68,'dashboard','0051_resultadoprueba_mensaje','2019-08-02 20:04:52.162816'),
	(69,'dashboard','0052_auto_20190811_2110','2019-08-12 02:10:13.772059'),
	(70,'dashboard','0053_usuario_usuario_local','2019-08-12 13:20:16.928154'),
	(71,'dashboard','0054_problema_solucion_referencia','2019-08-14 13:17:53.604469');

/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table django_session
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE latin1_spanish_ci NOT NULL,
  `session_data` longtext COLLATE latin1_spanish_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`)
VALUES
	('0vwhnjwrliowq4qyjxs8yx9m5hr4s2ya','ZjAyM2NiNzNiMmYyODhmNjFhNGYyZTMzOTMwNGYxZDkzZDhjOTc0ZTp7InVzdWFyaW8iOiJlc3QxIiwidGlwb191c3VhcmlvIjoiRVMiLCJpZF91c3VhcmlvIjo5fQ==','2019-07-10 23:47:04.569228'),
	('5p16l0ovfc867v0s2qncjz9px695mngt','ZWMwZjlkMGI2MDQxZjY0YTVlMzYxNjBhODdlNWI0ODRlMTUyNTFiNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNTUyZGQxN2Y4ZTFjMjE2MTFmNTMxNDA1M2U1MDk2OGIyMDdiZDJjIiwidXN1YXJpbyI6InByb2YxIiwidGlwb191c3VhcmlvIjoiUFIiLCJpZF91c3VhcmlvIjo4fQ==','2019-07-01 19:51:28.024000'),
	('a29aighmyi5r3alw031z50rocm92q44s','NDhjMzAzY2YyZmNmYTYzZGM3YTc3N2U2ZjdhZDAwMGE5NWMzZGVkNDp7InVzdWFyaW8iOiJ3ZXkiLCJ0aXBvX3VzdWFyaW8iOiJFUyIsImlkX3VzdWFyaW8iOjF9','2019-07-10 21:54:28.341897'),
	('cwa6bvnv2wi2x751fxss4mzkk1mds79k','YTE0OTZlNzc0YzVjYWQ1OTZjYTI0NTg5OWI2MjRkZjMzZjg2ZGZlYTp7InVzdWFyaW8iOiJwcm9mMSIsInRpcG9fdXN1YXJpbyI6IlBSIiwiaWRfdXN1YXJpbyI6OCwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImE1NTJkZDE3ZjhlMWMyMTYxMWY1MzE0MDUzZTUwOTY4YjIwN2JkMmMifQ==','2019-07-09 22:20:37.679125'),
	('j7pyhmwth8xojsvrqs6kb4ard9a5kqhs','ODczYWE4MGExYTllZTBjMDFmY2U0YzJhNjA0YTNhYjM1MzA5MTFlNTp7InVzdWFyaW8iOiJlc3QxIiwidGlwb191c3VhcmlvIjoiRVMiLCJpZF91c3VhcmlvIjo5LCJfc2Vzc2lvbl9pbml0X3RpbWVzdGFtcF8iOjE1NjYzMDYyNzguMjk4MDM4fQ==','2019-09-03 13:04:38.366408'),
	('jz4o3zahkoe01nt5kkf7nat9kndrjlwz','Yzc3MWVkMjczNjA5YTkyODE1ZDg3ZDRmNGY5NWZiNDhlYjAyMTZlZDp7InVzdWFyaW8iOiJtYXItc2FuMSIsInRpcG9fdXN1YXJpbyI6IlBSIiwiaWRfdXN1YXJpbyI6MTE4fQ==','2019-08-28 05:39:30.010345'),
	('mxj72rrzo2x7nixjt2en4jedzfyw5pu5','NDViMzU1NGE5ZmE3YzgzMDVmNDJmNGFmMTU0NTZhN2FlMzZlNzJjMDp7InVzdWFyaW8iOiJhZG1pbjEiLCJ0aXBvX3VzdWFyaW8iOiJBRCIsImlkX3VzdWFyaW8iOjExLCJfc2Vzc2lvbl9pbml0X3RpbWVzdGFtcF8iOjE1NjYyODIxNjQuMjAwNDc3fQ==','2019-09-03 06:22:44.202814'),
	('obv7tmoeec5ob0yaaw0ailo4krn105m1','ZjAyM2NiNzNiMmYyODhmNjFhNGYyZTMzOTMwNGYxZDkzZDhjOTc0ZTp7InVzdWFyaW8iOiJlc3QxIiwidGlwb191c3VhcmlvIjoiRVMiLCJpZF91c3VhcmlvIjo5fQ==','2019-07-10 21:45:50.059486'),
	('om0veqjj0hej0lxol2g2kgvofoucfimm','NDhjMzAzY2YyZmNmYTYzZGM3YTc3N2U2ZjdhZDAwMGE5NWMzZGVkNDp7InVzdWFyaW8iOiJ3ZXkiLCJ0aXBvX3VzdWFyaW8iOiJFUyIsImlkX3VzdWFyaW8iOjF9','2019-07-12 17:34:47.090998'),
	('oskpy6jmmx9yjf4m2b7n9a39eyadc2ty','ZjAyM2NiNzNiMmYyODhmNjFhNGYyZTMzOTMwNGYxZDkzZDhjOTc0ZTp7InVzdWFyaW8iOiJlc3QxIiwidGlwb191c3VhcmlvIjoiRVMiLCJpZF91c3VhcmlvIjo5fQ==','2019-07-11 23:54:59.175664'),
	('s6lecguedcpec8noyu6dp7zal3ticml1','ZjAyM2NiNzNiMmYyODhmNjFhNGYyZTMzOTMwNGYxZDkzZDhjOTc0ZTp7InVzdWFyaW8iOiJlc3QxIiwidGlwb191c3VhcmlvIjoiRVMiLCJpZF91c3VhcmlvIjo5fQ==','2019-07-10 22:30:50.308061'),
	('ukwxvvsqfmjc9dm303wwcgvwsui9rot8','YTE0OTZlNzc0YzVjYWQ1OTZjYTI0NTg5OWI2MjRkZjMzZjg2ZGZlYTp7InVzdWFyaW8iOiJwcm9mMSIsInRpcG9fdXN1YXJpbyI6IlBSIiwiaWRfdXN1YXJpbyI6OCwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImE1NTJkZDE3ZjhlMWMyMTYxMWY1MzE0MDUzZTUwOTY4YjIwN2JkMmMifQ==','2019-08-02 18:46:34.213964'),
	('uopqi5vbe1rj1ekxp3ahnrmbss2z9txn','ODc1NzQ2Zjg3YTYzODU2NDc5Y2JlZGZmODZhNWY2M2I4ZWE4MTNmODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNTUyZGQxN2Y4ZTFjMjE2MTFmNTMxNDA1M2U1MDk2OGIyMDdiZDJjIiwidGlwb191c3VhcmlvIjoiZXN0dWRpYW50ZSIsInVzdWFyaW8iOiJ1c3VhcmlvLnVuaWFuZGVzIn0=','2019-06-14 20:45:11.709000'),
	('vqon2crcyvd2erm22h0y23q33zl1iolt','ZjAyM2NiNzNiMmYyODhmNjFhNGYyZTMzOTMwNGYxZDkzZDhjOTc0ZTp7InVzdWFyaW8iOiJlc3QxIiwidGlwb191c3VhcmlvIjoiRVMiLCJpZF91c3VhcmlvIjo5fQ==','2019-07-10 11:09:31.268319'),
	('vr8te7kx3gdravs7d4p26g7krpdm0sp1','ZjAyM2NiNzNiMmYyODhmNjFhNGYyZTMzOTMwNGYxZDkzZDhjOTc0ZTp7InVzdWFyaW8iOiJlc3QxIiwidGlwb191c3VhcmlvIjoiRVMiLCJpZF91c3VhcmlvIjo5fQ==','2019-07-11 02:28:30.850597'),
	('yegnu55z2dobh7lv6f1nmzynpzf8iksb','M2Q1NmVmN2Q2ZWM2ZmZjYmYxZDc1YWE3Y2ZiOTgyMGIyMWQwYzY0MDp7InVzdWFyaW8iOiJlc3QxIiwidGlwb191c3VhcmlvIjoiRVMiLCJpZF91c3VhcmlvIjo5fQ==','2019-08-27 15:51:41.297812');

/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
