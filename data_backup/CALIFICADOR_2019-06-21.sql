# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.6.24-log)
# Database: CALIFICADOR
# Generation Time: 2019-06-22 00:42:12 +0000
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
  `name` varchar(150) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;



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
  `name` varchar(255) COLLATE latin1_spanish_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

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
  `password` varchar(128) COLLATE latin1_spanish_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE latin1_spanish_ci NOT NULL,
  `first_name` varchar(30) COLLATE latin1_spanish_ci NOT NULL,
  `last_name` varchar(150) COLLATE latin1_spanish_ci NOT NULL,
  `email` varchar(254) COLLATE latin1_spanish_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`)
VALUES
	(1,'pbkdf2_sha256$150000$ytQ7kwtmbFpa$9Z4625kL7rc0dRwPTSeiT6/toV90vZNodUczZySS89A=','2019-06-14 22:44:28.704000',1,'giove','','','',1,1,'2019-05-22 14:41:03.643000');

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
  `nombre` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `tipo` varchar(30) COLLATE latin1_spanish_ci NOT NULL,
  `descripcion` varchar(300) COLLATE latin1_spanish_ci NOT NULL,
  `problema_id` int(11) DEFAULT NULL,
  `posicion` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_argumento_problema_id_91b7d9ea_fk_dashboard` (`problema_id`),
  CONSTRAINT `dashboard_argumento_problema_id_91b7d9ea_fk_dashboard` FOREIGN KEY (`problema_id`) REFERENCES `dashboard_problema` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

LOCK TABLES `dashboard_argumento` WRITE;
/*!40000 ALTER TABLE `dashboard_argumento` DISABLE KEYS */;

INSERT INTO `dashboard_argumento` (`id`, `nombre`, `tipo`, `descripcion`, `problema_id`, `posicion`)
VALUES
	(1,'input1','str','Cadena de caracteres para el primer input',2,1),
	(2,'input2','str','Características del segundo input',2,1),
	(3,'input3','int','Tercer input: este es un entero',2,1),
	(4,'lista_elementos','list','Lista de elementos en la que se quiere hacer una búsqueda',3,2),
	(5,'elemento_buscado','int','Elemento que se quiere buscar en la lista',3,1);

/*!40000 ALTER TABLE `dashboard_argumento` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dashboard_comentariopregunta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dashboard_comentariopregunta`;

CREATE TABLE `dashboard_comentariopregunta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contenido` longtext COLLATE latin1_spanish_ci,
  `autor_id` int(11) DEFAULT NULL,
  `pregunta_id` int(11) DEFAULT NULL,
  `timestamp` datetime(6) NOT NULL,
  `titulo` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_comentario_autor_id_7311b0a7_fk_dashboard` (`autor_id`),
  KEY `dashboard_comentario_pregunta_id_5b3e44c1_fk_dashboard` (`pregunta_id`),
  CONSTRAINT `dashboard_comentario_autor_id_7311b0a7_fk_dashboard` FOREIGN KEY (`autor_id`) REFERENCES `dashboard_usuario` (`id`),
  CONSTRAINT `dashboard_comentario_pregunta_id_5b3e44c1_fk_dashboard` FOREIGN KEY (`pregunta_id`) REFERENCES `dashboard_pregunta` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

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
	(39,'Me respondo a mí mismo para poder tener notificaciones ...',9,29,'2019-06-15 16:19:53.618000','Respuesta a pregunta');

/*!40000 ALTER TABLE `dashboard_comentariopregunta` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dashboard_comentarioproblema
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dashboard_comentarioproblema`;

CREATE TABLE `dashboard_comentarioproblema` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contenido` longtext COLLATE latin1_spanish_ci,
  `autor_id` int(11) DEFAULT NULL,
  `problema_id` int(11) DEFAULT NULL,
  `timestamp` datetime(6) NOT NULL,
  `titulo` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_comentario_autor_id_53c898fc_fk_dashboard` (`autor_id`),
  KEY `dashboard_comentario_problema_id_f14d1415_fk_dashboard` (`problema_id`),
  CONSTRAINT `dashboard_comentario_autor_id_53c898fc_fk_dashboard` FOREIGN KEY (`autor_id`) REFERENCES `dashboard_usuario` (`id`),
  CONSTRAINT `dashboard_comentario_problema_id_f14d1415_fk_dashboard` FOREIGN KEY (`problema_id`) REFERENCES `dashboard_problema` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;



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
  `nombre_curso` varchar(120) COLLATE latin1_spanish_ci NOT NULL,
  `codigo_curso` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_curso` (`nombre_curso`),
  UNIQUE KEY `codigo_curso` (`codigo_curso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

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
  `nombre_semestre` varchar(120) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_semestre` (`nombre_semestre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;



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
  `estado` varchar(2) COLLATE latin1_spanish_ci NOT NULL,
  `contenido` longtext COLLATE latin1_spanish_ci NOT NULL,
  `revision_worker_id` int(11) DEFAULT NULL,
  `slug` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

LOCK TABLES `dashboard_envio` WRITE;
/*!40000 ALTER TABLE `dashboard_envio` DISABLE KEYS */;

INSERT INTO `dashboard_envio` (`id`, `numero`, `timestamp`, `avance`, `estudiante_id`, `problema_id`, `resultado_estudiante_id`, `estado`, `contenido`, `revision_worker_id`, `slug`)
VALUES
	(1,1,'2019-06-02 21:06:48.720000',0,1,1,1,'ER','',NULL,'e1'),
	(2,2,'2019-06-02 21:08:21.550000',20,1,1,1,'ER','',NULL,'e2'),
	(3,3,'2019-06-02 21:08:34.610000',100,1,1,1,'OK','',NULL,'e3'),
	(4,1,'2019-06-07 16:51:34.081000',50,1,3,3,'ER','def contar_apariciones(lista_elementos:list, elemento_buscado:int)->int:\r\n    \"\"\" Contar apariciones en lista\r\n    Argumentos:\r\n      lista_elementos (list): Lista de elementos en la que se quiere hacer una búsqueda\r\n      elemento_buscado (int): Elemento que se quiere buscar en la lista\r\n    Retorno:\r\n      int: La cantidad de veces que aparece el valor buscado en la lista.\r\n    \"\"\"\r\n    if (elemento_buscado in lista_elementos) or len(lista_elementos)<1:\r\n        return 1\r\n    else:\r\n        return 0',NULL,'e4'),
	(9,1,'2019-06-15 00:58:39.329000',100,9,1,5,'OK','def primero()->str:\r\n    \"\"\" Primer problema\r\n    Argumentos:\r\n    Retorno:\r\n      str: \r\n    \"\"\"\r\n    return \"Hello, World!\"',NULL,'primerprob1'),
	(10,1,'2019-06-15 16:37:36.494000',0,9,2,6,'NU','def segunda_funcion(input1:str, input2:str, input3:int)->str:\r\n    \"\"\" Segundo problema\r\n    Argumentos:\r\n      input1 (str): Cadena de caracteres para el primer input\r\n      input2 (str): Características del segundo input\r\n      input3 (int): Tercer input: este es un entero\r\n    Retorno:\r\n      str: El resultado de aplicar la función, convertido a una cadena de caracteres\r\n    \"\"\"\r\n    return 1+1',NULL,'segundoprob1wwe'),
	(11,1,'2019-06-15 16:37:59.296000',0,9,2,6,'NU','def segunda_funcion(input1:str, input2:str, input3:int)->str:\r\n    \"\"\" Segundo problema\r\n    Argumentos:\r\n      input1 (str): Cadena de caracteres para el primer input\r\n      input2 (str): Características del segundo input\r\n      input3 (int): Tercer input: este es un entero\r\n    Retorno:\r\n      str: El resultado de aplicar la función, convertido a una cadena de caracteres\r\n    \"\"\"\r\n    return 1+1',NULL,'segundoprob1sss'),
	(13,2,'2019-06-17 16:36:04.104000',0,1,3,3,'NU','def contar_apariciones(elemento_buscado:int, lista_elementos:list)->int:\r\n    \"\"\" Contar apariciones en lista\r\n    Argumentos:\r\n      elemento_buscado (int): Elemento que se quiere buscar en la lista\r\n      lista_elementos (list): Lista de elementos en la que se quiere hacer una búsqueda\r\n    Retorno:\r\n      int: La cantidad de veces que aparece el valor buscado en la lista.\r\n    \"\"\"\r\n    return elemento_buscado.index(1)',NULL,'contaraps2'),
	(14,3,'2019-06-17 19:50:40.265000',0,1,3,3,'NU','def contar_apariciones(elemento_buscado:int, lista_elementos:list)->int:\r\n    \"\"\" Contar apariciones en lista\r\n    Argumentos:\r\n      elemento_buscado (int): Elemento que se quiere buscar en la lista\r\n      lista_elementos (list): Lista de elementos en la que se quiere hacer una búsqueda\r\n    Retorno:\r\n      int: La cantidad de veces que aparece el valor buscado en la lista.\r\n    \"\"\"\r\n    pass',NULL,'contaraps3');

/*!40000 ALTER TABLE `dashboard_envio` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dashboard_estudiante
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dashboard_estudiante`;

CREATE TABLE `dashboard_estudiante` (
  `usuario_ptr_id` int(11) NOT NULL,
  `seccion_id` int(11) DEFAULT NULL,
  `preguntas_sin_respuesta` tinyint(1) NOT NULL,
  `pulso_actividad` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  `pulso_puntos` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`usuario_ptr_id`),
  KEY `dashboard_estudiante_seccion_id_4cf73e1d_fk_dashboard_seccion_id` (`seccion_id`),
  CONSTRAINT `dashboard_estudiante_seccion_id_4cf73e1d_fk_dashboard_seccion_id` FOREIGN KEY (`seccion_id`) REFERENCES `dashboard_seccion` (`id`),
  CONSTRAINT `dashboard_estudiante_usuario_ptr_id_a2ae9e9f_fk_dashboard` FOREIGN KEY (`usuario_ptr_id`) REFERENCES `dashboard_usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

LOCK TABLES `dashboard_estudiante` WRITE;
/*!40000 ALTER TABLE `dashboard_estudiante` DISABLE KEYS */;

INSERT INTO `dashboard_estudiante` (`usuario_ptr_id`, `seccion_id`, `preguntas_sin_respuesta`, `pulso_actividad`, `pulso_puntos`)
VALUES
	(1,1,0,'pulso/actividad_9ZBCuPO.png','pulso/puntos_cDDxU0P.png'),
	(9,1,0,'pulso/actividad.png','pulso/puntos.png');

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
  `nombre` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `descripcion` varchar(300) COLLATE latin1_spanish_ci NOT NULL,
  `nivel` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

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
  `tipo` varchar(2) COLLATE latin1_spanish_ci NOT NULL,
  `contenido` longtext COLLATE latin1_spanish_ci,
  `leida` tinyint(1) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `link` varchar(300) COLLATE latin1_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_notificaci_usuario_id_e4418005_fk_dashboard` (`usuario_id`),
  CONSTRAINT `dashboard_notificaci_usuario_id_e4418005_fk_dashboard` FOREIGN KEY (`usuario_id`) REFERENCES `dashboard_usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

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
	(13,'RE','Se recibió una respuesta para la pregunta \'Mi primera pregunta ....\'',0,'2019-06-15 16:19:53.628000',9,'/problemas/primerprob/#pregunta29'),
	(14,'EE','Se recibió el envío 1',0,'2019-06-15 16:37:59.332000',9,'/envios/segundoprob1/'),
	(15,'EE','Se recibió el envío 1',0,'2019-06-15 16:39:42.948000',9,'/envios/segundoprob1sss/'),
	(16,'EE','Se recibió el envío 1',0,'2019-06-15 16:39:47.616000',9,'/envios/segundoprob1wwe/'),
	(17,'EE','Se recibió el envío 2',0,'2019-06-16 21:15:52.988000',1,'/envios/contaraps2/'),
	(18,'EE','Se recibió el envío 2',0,'2019-06-17 16:36:04.108000',1,'/envios/contaraps2/'),
	(19,'EE','Se recibió el envío 3',0,'2019-06-17 19:50:40.268000',1,'/envios/contaraps3/');

/*!40000 ALTER TABLE `dashboard_notificacion` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dashboard_pregunta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dashboard_pregunta`;

CREATE TABLE `dashboard_pregunta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contenido` longtext COLLATE latin1_spanish_ci,
  `resuelta` tinyint(1) NOT NULL,
  `autor_id` int(11) DEFAULT NULL,
  `problema_id` int(11) DEFAULT NULL,
  `timestamp` datetime(6) NOT NULL,
  `tipo` varchar(40) COLLATE latin1_spanish_ci NOT NULL,
  `titulo` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_pregunta_autor_id_5ccb7c35_fk_dashboard_usuario_id` (`autor_id`),
  KEY `dashboard_pregunta_problema_id_2c2436f5_fk_dashboard_problema_id` (`problema_id`),
  CONSTRAINT `dashboard_pregunta_autor_id_5ccb7c35_fk_dashboard_usuario_id` FOREIGN KEY (`autor_id`) REFERENCES `dashboard_usuario` (`id`),
  CONSTRAINT `dashboard_pregunta_problema_id_2c2436f5_fk_dashboard_problema_id` FOREIGN KEY (`problema_id`) REFERENCES `dashboard_problema` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

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
	(30,'Primera pregunta ...',0,10,1,'2019-06-15 01:28:45.689000','Aclaracion','La primera de roberta ...');

/*!40000 ALTER TABLE `dashboard_pregunta` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dashboard_problema
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dashboard_problema`;

CREATE TABLE `dashboard_problema` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` int(11) NOT NULL,
  `titulo` varchar(120) COLLATE latin1_spanish_ci NOT NULL,
  `curso_id` int(11) DEFAULT NULL,
  `autor_id` int(11) DEFAULT NULL,
  `descripcion` longtext COLLATE latin1_spanish_ci,
  `dificultad` int(11) NOT NULL,
  `estado` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `funcion` varchar(120) COLLATE latin1_spanish_ci NOT NULL,
  `retorno_tipo` varchar(120) COLLATE latin1_spanish_ci NOT NULL,
  `retorno_descripcion` longtext COLLATE latin1_spanish_ci,
  `publico` tinyint(1) NOT NULL,
  `slug` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numero` (`numero`),
  UNIQUE KEY `dashboard_problema_slug_358bce9f_uniq` (`slug`),
  KEY `dashboard_problema_curso_id_91521338_fk_dashboard_curso_id` (`curso_id`),
  KEY `dashboard_problema_autor_id_8ac34609_fk_dashboard_usuario_id` (`autor_id`),
  CONSTRAINT `dashboard_problema_autor_id_8ac34609_fk_dashboard_usuario_id` FOREIGN KEY (`autor_id`) REFERENCES `dashboard_usuario` (`id`),
  CONSTRAINT `dashboard_problema_curso_id_91521338_fk_dashboard_curso_id` FOREIGN KEY (`curso_id`) REFERENCES `dashboard_curso` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

LOCK TABLES `dashboard_problema` WRITE;
/*!40000 ALTER TABLE `dashboard_problema` DISABLE KEYS */;

INSERT INTO `dashboard_problema` (`id`, `numero`, `titulo`, `curso_id`, `autor_id`, `descripcion`, `dificultad`, `estado`, `funcion`, `retorno_tipo`, `retorno_descripcion`, `publico`, `slug`)
VALUES
	(1,1,'Primer problema',1,1,'Descripción del primer problema creado',34,'Creado','primero','str','',1,'primerprob'),
	(2,2,'Segundo problema',1,1,'Esta es la descripción del segundo problema ... enjoy!\r\n\r\nThe standard Lorem Ipsum passage, used since the 1500s\r\n\r\n\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"\r\nSection 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\r\n\r\n\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"',20,'Nuevo','segunda_funcion','str','El resultado de aplicar la función, convertido a una cadena de caracteres',1,'segundoprob'),
	(3,3,'Contar apariciones en lista',1,2,'Se quiere contar la cantidad de veces que aparece un determinado valor (\'elemento_buscado\') en una lista (\'lista_elementos\'). \r\nLos elementos de la lista y el valor buscado son de tipo int y se pueden comparar usando \'==\'.',10,'Nuevo','contar_apariciones','int','La cantidad de veces que aparece el valor buscado en la lista.',1,'contaraps');

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
	(1,1,2),
	(2,1,6),
	(3,1,7),
	(4,2,1),
	(5,2,3),
	(6,3,1),
	(7,3,3);

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
	(8);

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
	(8,8,2);

/*!40000 ALTER TABLE `dashboard_profesor_secciones` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dashboard_prueba
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dashboard_prueba`;

CREATE TABLE `dashboard_prueba` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` int(11) NOT NULL,
  `descripcion` varchar(120) COLLATE latin1_spanish_ci NOT NULL,
  `comentario_ok` varchar(120) COLLATE latin1_spanish_ci NOT NULL,
  `comentario_error` varchar(120) COLLATE latin1_spanish_ci NOT NULL,
  `problema_id` int(11) DEFAULT NULL,
  `tiempo` int(11) NOT NULL,
  `tipo` varchar(2) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_prueba_problema_id_5889d570_fk_dashboard_problema_id` (`problema_id`),
  CONSTRAINT `dashboard_prueba_problema_id_5889d570_fk_dashboard_problema_id` FOREIGN KEY (`problema_id`) REFERENCES `dashboard_problema` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

LOCK TABLES `dashboard_prueba` WRITE;
/*!40000 ALTER TABLE `dashboard_prueba` DISABLE KEYS */;

INSERT INTO `dashboard_prueba` (`id`, `numero`, `descripcion`, `comentario_ok`, `comentario_error`, `problema_id`, `tiempo`, `tipo`)
VALUES
	(1,1,'Prueba básica','Correcto con datos básicos','La respuesta es incorrecta para datos básicos',1,5,'IO'),
	(2,1,'Prueba una aparición','Funciona correctamente cuando el elemento está sólo una vez','No se encontró el elemento que aparecía una sola vez',3,5,'IO'),
	(3,2,'El elemento no existe','Responde correctamente cuando el elemento no existe','No responde correctamente si el elemento no existe en la lista',3,5,'IO'),
	(4,3,'Prueba múltiples apariciones','Cuenta correctamente cuando el elemento aparece múltiples veces','No cuenta correctamente cuando el elemento aparece múltiples veces',3,5,'IO'),
	(5,4,'Lista vacía','Maneja correctamente el caso en que la lista está vacía','No funciona correctamente cuando la lista está vacía',3,5,'IO');

/*!40000 ALTER TABLE `dashboard_prueba` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dashboard_pruebaio
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dashboard_pruebaio`;

CREATE TABLE `dashboard_pruebaio` (
  `prueba_ptr_id` int(11) NOT NULL,
  `entrada` longtext COLLATE latin1_spanish_ci NOT NULL,
  `salida` longtext COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`prueba_ptr_id`),
  CONSTRAINT `dashboard_pruebaio_prueba_ptr_id_c98c4f95_fk_dashboard_prueba_id` FOREIGN KEY (`prueba_ptr_id`) REFERENCES `dashboard_prueba` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;



# Dump of table dashboard_pruebascript
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dashboard_pruebascript`;

CREATE TABLE `dashboard_pruebascript` (
  `prueba_ptr_id` int(11) NOT NULL,
  `script` longtext COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`prueba_ptr_id`),
  CONSTRAINT `dashboard_pruebascri_prueba_ptr_id_66d767a0_fk_dashboard` FOREIGN KEY (`prueba_ptr_id`) REFERENCES `dashboard_prueba` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;



# Dump of table dashboard_recurso
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dashboard_recurso`;

CREATE TABLE `dashboard_recurso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(300) COLLATE latin1_spanish_ci NOT NULL,
  `url` varchar(2000) COLLATE latin1_spanish_ci NOT NULL,
  `problema_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_recurso_problema_id_a0a4236c_fk_dashboard_problema_id` (`problema_id`),
  CONSTRAINT `dashboard_recurso_problema_id_a0a4236c_fk_dashboard_problema_id` FOREIGN KEY (`problema_id`) REFERENCES `dashboard_problema` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;



# Dump of table dashboard_registro
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dashboard_registro`;

CREATE TABLE `dashboard_registro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(15) COLLATE latin1_spanish_ci DEFAULT NULL,
  `timestamp` datetime(6) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_registro_usuario_id_33d1b83f_fk_dashboard_usuario_id` (`usuario_id`),
  CONSTRAINT `dashboard_registro_usuario_id_33d1b83f_fk_dashboard_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `dashboard_usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

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
	(35,'127.0.0.1','2019-06-22 00:37:52.668945',9);

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
	(3,0,'2019-06-07 16:51:30.694000',0,1,3,'2019-06-07 16:51:28.000000',14),
	(4,0,'2019-06-12 23:31:12.158000',0,1,2,NULL,NULL),
	(5,1,'2019-06-15 00:58:39.325000',0,9,1,'2019-06-15 01:36:33.000000',9),
	(6,0,'2019-06-15 01:32:50.964000',0,9,2,NULL,11),
	(8,0,'2019-06-17 06:59:38.846000',0,9,3,NULL,NULL);

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
  PRIMARY KEY (`id`),
  KEY `dashboard_resultadop_envio_id_88f972d4_fk_dashboard` (`envio_id`),
  KEY `dashboard_resultadop_prueba_id_b29e37d9_fk_dashboard` (`prueba_id`),
  CONSTRAINT `dashboard_resultadop_envio_id_88f972d4_fk_dashboard` FOREIGN KEY (`envio_id`) REFERENCES `dashboard_envio` (`id`),
  CONSTRAINT `dashboard_resultadop_prueba_id_b29e37d9_fk_dashboard` FOREIGN KEY (`prueba_id`) REFERENCES `dashboard_prueba` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

LOCK TABLES `dashboard_resultadoprueba` WRITE;
/*!40000 ALTER TABLE `dashboard_resultadoprueba` DISABLE KEYS */;

INSERT INTO `dashboard_resultadoprueba` (`id`, `resultado_exitoso`, `envio_id`, `prueba_id`, `numero`)
VALUES
	(1,1,4,2,1),
	(2,1,4,3,1),
	(3,0,4,4,1),
	(4,0,4,5,1);

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
	(4,100,0,9,2),
	(5,0,0,1,1),
	(6,100,26,1,2),
	(7,0,0,1,1),
	(8,100,26,1,2),
	(9,0,0,1,1),
	(10,100,26,1,2);

/*!40000 ALTER TABLE `dashboard_resultadotarea` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dashboard_revision
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dashboard_revision`;

CREATE TABLE `dashboard_revision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_inicio_rev` datetime(6) NOT NULL,
  `fecha_fin_rev` datetime(6) NOT NULL,
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
  `nombre_semestre` varchar(16) COLLATE latin1_spanish_ci NOT NULL,
  `curso_seccion_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_seccion_curso_seccion_id_ac0fb169_fk_dashboard` (`curso_seccion_id`),
  CONSTRAINT `dashboard_seccion_curso_seccion_id_ac0fb169_fk_dashboard` FOREIGN KEY (`curso_seccion_id`) REFERENCES `dashboard_curso` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

LOCK TABLES `dashboard_seccion` WRITE;
/*!40000 ALTER TABLE `dashboard_seccion` DISABLE KEYS */;

INSERT INTO `dashboard_seccion` (`id`, `numero`, `nombre_semestre`, `curso_seccion_id`)
VALUES
	(1,1,'201920',1),
	(2,2,'201920',1);

/*!40000 ALTER TABLE `dashboard_seccion` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dashboard_tag
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dashboard_tag`;

CREATE TABLE `dashboard_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `texto` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `descripcion` varchar(300) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

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
	(8,'Geometría','Problemas geométricos');

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
	(2,2,'2019-06-26 23:41:29.000000',1);

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
	(3,2,1);

/*!40000 ALTER TABLE `dashboard_tarea_problemas` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dashboard_usuario
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dashboard_usuario`;

CREATE TABLE `dashboard_usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `nombre` varchar(120) COLLATE latin1_spanish_ci NOT NULL,
  `avatar` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  `tipo` varchar(2) COLLATE latin1_spanish_ci NOT NULL,
  `ultimo_acceso` datetime(6) NOT NULL,
  `password` varchar(200) COLLATE latin1_spanish_ci NOT NULL,
  `medallas` int(11) NOT NULL,
  `puntos` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

LOCK TABLES `dashboard_usuario` WRITE;
/*!40000 ALTER TABLE `dashboard_usuario` DISABLE KEYS */;

INSERT INTO `dashboard_usuario` (`id`, `login`, `nombre`, `avatar`, `tipo`, `ultimo_acceso`, `password`, `medallas`, `puntos`)
VALUES
	(1,'wey','Weymar Contreras','avatars/wey.png','ES','2019-06-17 17:05:23.536000','pbkdf2_sha256$150000$Weymar Contreras$lbAGs7tw8380m4P+hVTouDldJt9aa1/R5JwMd5sR+XY=',3,26),
	(2,'autor','Autor Problemas','avatars/autor.png','PR','2019-06-07 16:33:39.587000','autor',0,0),
	(8,'prof1','Francis Goldman','avatars/prof1.png','PR','2019-06-17 19:51:28.014000','pbkdf2_sha256$150000$Francis Goldman$sVC+f9Bw+aUKF4oS5vPkrEAN2PYGekcjGN+OQ1CUhKM=',0,0),
	(9,'est1','Juan Segundo','avatars/est1.png','ES','2019-06-22 00:37:52.659832','pbkdf2_sha256$150000$Juan Segundo$F57bVcPsK5YAi1Ey//aqplQk7K8+bmfcaArJxwfYyak=',0,0),
	(10,'monitor1','Roberta S. Towers','avatars/monitor1.png','MO','2019-06-16 21:20:46.380000','pbkdf2_sha256$150000$Robert S. Towers$+Ox7J4/LcGNF5kG2zaSEb+yBC5J+a9q+Q8nuA8OR84g=',0,0),
	(11,'admin1','Xavier Yi','','AD','2019-06-16 21:20:58.016000','pbkdf2_sha256$150000$Xavier Yi$lcrDMIDV7pP/dwWvbaT3Q9PckN3nC7ZzB/62lNfCsGU=',0,0);

/*!40000 ALTER TABLE `dashboard_usuario` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dashboard_worker
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dashboard_worker`;

CREATE TABLE `dashboard_worker` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) COLLATE latin1_spanish_ci NOT NULL,
  `fecha_registro` datetime(6) NOT NULL,
  `ip` varchar(30) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;



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
	(179,'2019-06-17 06:59:25.000000','7','Contar apariciones en lista - Juan Segundo - None',3,'',22,1);

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
	(62,'sessions','0001_initial','2019-06-22 00:28:54.760328');

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
	('5p16l0ovfc867v0s2qncjz9px695mngt','ZWMwZjlkMGI2MDQxZjY0YTVlMzYxNjBhODdlNWI0ODRlMTUyNTFiNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNTUyZGQxN2Y4ZTFjMjE2MTFmNTMxNDA1M2U1MDk2OGIyMDdiZDJjIiwidXN1YXJpbyI6InByb2YxIiwidGlwb191c3VhcmlvIjoiUFIiLCJpZF91c3VhcmlvIjo4fQ==','2019-07-01 19:51:28.024000'),
	('6k9y57l8r3gt77fodp45rq72i5pq0dfu','ZjAyM2NiNzNiMmYyODhmNjFhNGYyZTMzOTMwNGYxZDkzZDhjOTc0ZTp7InVzdWFyaW8iOiJlc3QxIiwidGlwb191c3VhcmlvIjoiRVMiLCJpZF91c3VhcmlvIjo5fQ==','2019-07-06 00:37:52.690302'),
	('uopqi5vbe1rj1ekxp3ahnrmbss2z9txn','ODc1NzQ2Zjg3YTYzODU2NDc5Y2JlZGZmODZhNWY2M2I4ZWE4MTNmODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNTUyZGQxN2Y4ZTFjMjE2MTFmNTMxNDA1M2U1MDk2OGIyMDdiZDJjIiwidGlwb191c3VhcmlvIjoiZXN0dWRpYW50ZSIsInVzdWFyaW8iOiJ1c3VhcmlvLnVuaWFuZGVzIn0=','2019-06-14 20:45:11.709000');

/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
