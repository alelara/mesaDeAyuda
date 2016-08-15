--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: adjunto_de_caso_id_seq; Type: SEQUENCE; Schema: public; Owner: rt
--

CREATE SEQUENCE adjunto_de_caso_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.adjunto_de_caso_id_seq OWNER TO rt;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: adjuntos_de_caso; Type: TABLE; Schema: public; Owner: rt; Tablespace: 
--

CREATE TABLE adjuntos_de_caso (
    id_adjunto bigint NOT NULL,
    version bigint NOT NULL,
    caso_id bigint NOT NULL,
    fecha timestamp without time zone NOT NULL,
    nombre_del_adjunto character varying(520) NOT NULL,
    ruta_del_adjunto character varying(520) NOT NULL
);


ALTER TABLE public.adjuntos_de_caso OWNER TO rt;

--
-- Name: atencion_directa; Type: TABLE; Schema: public; Owner: rt; Tablespace: 
--

CREATE TABLE atencion_directa (
    id_atencion_directa bigint NOT NULL,
    version bigint NOT NULL,
    categoria_id bigint NOT NULL,
    descrpcion_del_problema character varying(1200),
    fecha_de_atencion timestamp without time zone NOT NULL,
    id_team_viewer character varying(255),
    sitio character varying(255),
    telefono character varying(255),
    tipo_de_atencion character varying(255) NOT NULL,
    unidad_id bigint NOT NULL,
    usuario_de_atencion_id bigint NOT NULL,
    usuario_que_se_atiende character varying(255) NOT NULL
);


ALTER TABLE public.atencion_directa OWNER TO rt;

--
-- Name: atencion_directa_id_seq; Type: SEQUENCE; Schema: public; Owner: rt
--

CREATE SEQUENCE atencion_directa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.atencion_directa_id_seq OWNER TO rt;

--
-- Name: bitacora_de_caso; Type: TABLE; Schema: public; Owner: rt; Tablespace: 
--

CREATE TABLE bitacora_de_caso (
    id_bitacora_de_caso bigint NOT NULL,
    version bigint NOT NULL,
    caso_id integer NOT NULL,
    diagnostico character varying(1000),
    fecha timestamp without time zone NOT NULL,
    movimiento character varying(255) NOT NULL,
    solucion character varying(1000),
    usuario_id integer NOT NULL
);


ALTER TABLE public.bitacora_de_caso OWNER TO rt;

--
-- Name: bitacora_de_caso_id_seq; Type: SEQUENCE; Schema: public; Owner: rt
--

CREATE SEQUENCE bitacora_de_caso_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bitacora_de_caso_id_seq OWNER TO rt;

--
-- Name: cargo; Type: TABLE; Schema: public; Owner: rt; Tablespace: 
--

CREATE TABLE cargo (
    id_cargo bigint NOT NULL,
    version bigint NOT NULL,
    nombre character varying(255) NOT NULL
);


ALTER TABLE public.cargo OWNER TO rt;

--
-- Name: cargo_id_seq; Type: SEQUENCE; Schema: public; Owner: rt
--

CREATE SEQUENCE cargo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cargo_id_seq OWNER TO rt;

--
-- Name: caso; Type: TABLE; Schema: public; Owner: rt; Tablespace: 
--

CREATE TABLE caso (
    id_caso bigint NOT NULL,
    version bigint NOT NULL,
    creador_id bigint NOT NULL,
    descripcion_del_problema character varying(256) NOT NULL,
    diagnostico character varying(255),
    estado_id bigint NOT NULL,
    fecha_de_cierre timestamp without time zone,
    fecha_de_creacion timestamp without time zone NOT NULL,
    fecha_de_diagnostico timestamp without time zone,
    fecha_de_solucion timestamp without time zone,
    propietario_actual_id bigint NOT NULL,
    responsable_id bigint,
    solucion character varying(255),
    tipo_de_caso_id bigint NOT NULL,
    encuesta_resuelta boolean
);


ALTER TABLE public.caso OWNER TO rt;

--
-- Name: caso_categoria_del_problema; Type: TABLE; Schema: public; Owner: rt; Tablespace: 
--

CREATE TABLE caso_categoria_del_problema (
    caso_id bigint NOT NULL,
    categoria_id bigint NOT NULL
);


ALTER TABLE public.caso_categoria_del_problema OWNER TO rt;

--
-- Name: caso_id_seq; Type: SEQUENCE; Schema: public; Owner: rt
--

CREATE SEQUENCE caso_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.caso_id_seq OWNER TO rt;

--
-- Name: categoria_del_problema; Type: TABLE; Schema: public; Owner: rt; Tablespace: 
--

CREATE TABLE categoria_del_problema (
    id_categoria bigint NOT NULL,
    version bigint NOT NULL,
    activo boolean NOT NULL,
    descripcion character varying(255),
    nombre character varying(255),
    unidad_administrativa_responsable_id bigint NOT NULL,
    prioridad_id bigint
);


ALTER TABLE public.categoria_del_problema OWNER TO rt;

--
-- Name: categoria_del_problema_id_seq; Type: SEQUENCE; Schema: public; Owner: rt
--

CREATE SEQUENCE categoria_del_problema_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categoria_del_problema_id_seq OWNER TO rt;

--
-- Name: comentario; Type: TABLE; Schema: public; Owner: rt; Tablespace: 
--

CREATE TABLE comentario (
    id_comentario bigint NOT NULL,
    version bigint NOT NULL,
    caso_id bigint NOT NULL,
    fecha_de_comentario timestamp without time zone NOT NULL,
    texto_comentario character varying(1000) NOT NULL,
    usuario_id bigint NOT NULL
);


ALTER TABLE public.comentario OWNER TO rt;

--
-- Name: comentario_id_seq; Type: SEQUENCE; Schema: public; Owner: rt
--

CREATE SEQUENCE comentario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comentario_id_seq OWNER TO rt;

--
-- Name: configuracion_de_mesa_de_ayuda; Type: TABLE; Schema: public; Owner: rt; Tablespace: 
--

CREATE TABLE configuracion_de_mesa_de_ayuda (
    id_configuracion bigint NOT NULL,
    version bigint NOT NULL,
    dia_de_fin_estadistica integer NOT NULL,
    dia_de_inicio_estadistica integer NOT NULL,
    dias_para_cierre_de_casos integer NOT NULL,
    fundamento_de_cierre character varying(1200) NOT NULL,
    dias_para_cierre_de_encuestas integer,
    url_servidor character varying(120)
);


ALTER TABLE public.configuracion_de_mesa_de_ayuda OWNER TO rt;

--
-- Name: configuracion_mesa_ayuda_id_seq; Type: SEQUENCE; Schema: public; Owner: rt
--

CREATE SEQUENCE configuracion_mesa_ayuda_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.configuracion_mesa_ayuda_id_seq OWNER TO rt;

--
-- Name: dato_requerido_id_seq; Type: SEQUENCE; Schema: public; Owner: rt
--

CREATE SEQUENCE dato_requerido_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dato_requerido_id_seq OWNER TO rt;

--
-- Name: datos_requeridos; Type: TABLE; Schema: public; Owner: rt; Tablespace: 
--

CREATE TABLE datos_requeridos (
    id_dato_requerido bigint NOT NULL,
    version bigint NOT NULL,
    activo boolean NOT NULL,
    categoria_id bigint NOT NULL,
    nombre_campo character varying(255),
    obligatorio boolean NOT NULL,
    tipo_de_dato character varying(255)
);


ALTER TABLE public.datos_requeridos OWNER TO rt;

--
-- Name: encuesta; Type: TABLE; Schema: public; Owner: rt; Tablespace: 
--

CREATE TABLE encuesta (
    id_encuesta bigint NOT NULL,
    version bigint NOT NULL,
    amabilidad integer NOT NULL,
    caso_id bigint NOT NULL,
    claridad integer NOT NULL,
    contestada_por_sistema boolean NOT NULL,
    disponibilidad integer NOT NULL,
    estado_de_cableado integer NOT NULL,
    estado_del_equipo integer NOT NULL,
    facilidad_de_uso integer NOT NULL,
    fecha timestamp without time zone NOT NULL,
    observaciones character varying(255),
    rapidez integer NOT NULL,
    resolucion integer NOT NULL,
    satisfaccion integer NOT NULL,
    tiempos_de_respuesta integer NOT NULL,
    velocidad integer NOT NULL
);


ALTER TABLE public.encuesta OWNER TO rt;

--
-- Name: encuesta_de_area_id_seq; Type: SEQUENCE; Schema: public; Owner: rt
--

CREATE SEQUENCE encuesta_de_area_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.encuesta_de_area_id_seq OWNER TO rt;

--
-- Name: encuesta_del_area; Type: TABLE; Schema: public; Owner: rt; Tablespace: 
--

CREATE TABLE encuesta_del_area (
    id_encuesta_unidad bigint NOT NULL,
    version bigint NOT NULL,
    nombre character varying(255) NOT NULL,
    unidad_id bigint NOT NULL
);


ALTER TABLE public.encuesta_del_area OWNER TO rt;

--
-- Name: encuesta_id_seq; Type: SEQUENCE; Schema: public; Owner: rt
--

CREATE SEQUENCE encuesta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.encuesta_id_seq OWNER TO rt;

--
-- Name: estado_del_caso; Type: TABLE; Schema: public; Owner: rt; Tablespace: 
--

CREATE TABLE estado_del_caso (
    id_estado_del_caso bigint NOT NULL,
    version bigint NOT NULL,
    nombre character varying(255) NOT NULL
);


ALTER TABLE public.estado_del_caso OWNER TO rt;

--
-- Name: estado_del_caso_id_seq; Type: SEQUENCE; Schema: public; Owner: rt
--

CREATE SEQUENCE estado_del_caso_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.estado_del_caso_id_seq OWNER TO rt;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: rt
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO rt;

--
-- Name: observaciones_de_encuesta; Type: TABLE; Schema: public; Owner: rt; Tablespace: 
--

CREATE TABLE observaciones_de_encuesta (
    id_observacion bigint NOT NULL,
    version bigint NOT NULL,
    caso_id bigint NOT NULL,
    fecha timestamp without time zone NOT NULL,
    observacion character varying(255),
    unidad_id bigint NOT NULL
);


ALTER TABLE public.observaciones_de_encuesta OWNER TO rt;

--
-- Name: observaciones_encuesta_id_seq; Type: SEQUENCE; Schema: public; Owner: rt
--

CREATE SEQUENCE observaciones_encuesta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.observaciones_encuesta_id_seq OWNER TO rt;

--
-- Name: pregunta_encuesta_id_seq; Type: SEQUENCE; Schema: public; Owner: rt
--

CREATE SEQUENCE pregunta_encuesta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pregunta_encuesta_id_seq OWNER TO rt;

--
-- Name: preguntas_de_encuesta; Type: TABLE; Schema: public; Owner: rt; Tablespace: 
--

CREATE TABLE preguntas_de_encuesta (
    id_pregunta_encuesta bigint NOT NULL,
    version bigint NOT NULL,
    activo boolean NOT NULL,
    encuesta_id bigint NOT NULL,
    pregunta character varying(255) NOT NULL,
    rubro_id bigint NOT NULL
);


ALTER TABLE public.preguntas_de_encuesta OWNER TO rt;

--
-- Name: prioridad_del_caso_id_seq; Type: SEQUENCE; Schema: public; Owner: rt
--

CREATE SEQUENCE prioridad_del_caso_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prioridad_del_caso_id_seq OWNER TO rt;

--
-- Name: prioridad_del_problema; Type: TABLE; Schema: public; Owner: rt; Tablespace: 
--

CREATE TABLE prioridad_del_problema (
    id_prioridad bigint NOT NULL,
    version bigint NOT NULL,
    descripcion character varying(255) NOT NULL,
    nombre character varying(255) NOT NULL,
    tiempo_de_resolucion character varying(255) NOT NULL
);


ALTER TABLE public.prioridad_del_problema OWNER TO rt;

--
-- Name: prioridad_id_seq; Type: SEQUENCE; Schema: public; Owner: rt
--

CREATE SEQUENCE prioridad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prioridad_id_seq OWNER TO rt;

--
-- Name: rubro_encuesta_id_seq; Type: SEQUENCE; Schema: public; Owner: rt
--

CREATE SEQUENCE rubro_encuesta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rubro_encuesta_id_seq OWNER TO rt;

--
-- Name: rubros_de_encuesta; Type: TABLE; Schema: public; Owner: rt; Tablespace: 
--

CREATE TABLE rubros_de_encuesta (
    id_rubro bigint NOT NULL,
    version bigint NOT NULL,
    encuesta_id bigint NOT NULL,
    rubro character varying(255) NOT NULL
);


ALTER TABLE public.rubros_de_encuesta OWNER TO rt;

--
-- Name: sec_role; Type: TABLE; Schema: public; Owner: rt; Tablespace: 
--

CREATE TABLE sec_role (
    id bigint NOT NULL,
    version bigint NOT NULL,
    authority character varying(255) NOT NULL
);


ALTER TABLE public.sec_role OWNER TO rt;

--
-- Name: sec_usuario; Type: TABLE; Schema: public; Owner: rt; Tablespace: 
--

CREATE TABLE sec_usuario (
    id bigint NOT NULL,
    version bigint NOT NULL,
    account_expired boolean NOT NULL,
    account_locked boolean NOT NULL,
    enabled boolean NOT NULL,
    password character varying(255) NOT NULL,
    password_expired boolean NOT NULL,
    username character varying(255) NOT NULL,
    class character varying(255) NOT NULL,
    cargo_id bigint,
    nombre character varying(255),
    email character varying(255)
);


ALTER TABLE public.sec_usuario OWNER TO rt;

--
-- Name: sec_usuario_sec_role; Type: TABLE; Schema: public; Owner: rt; Tablespace: 
--

CREATE TABLE sec_usuario_sec_role (
    sec_usuario_id bigint NOT NULL,
    sec_role_id bigint NOT NULL
);


ALTER TABLE public.sec_usuario_sec_role OWNER TO rt;

--
-- Name: tipo_de_caso; Type: TABLE; Schema: public; Owner: rt; Tablespace: 
--

CREATE TABLE tipo_de_caso (
    id_tipo_de_caso bigint NOT NULL,
    version bigint NOT NULL,
    nombre character varying(255) NOT NULL
);


ALTER TABLE public.tipo_de_caso OWNER TO rt;

--
-- Name: tipo_de_caso_id_seq; Type: SEQUENCE; Schema: public; Owner: rt
--

CREATE SEQUENCE tipo_de_caso_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_de_caso_id_seq OWNER TO rt;

--
-- Name: topico_de_impresoras; Type: TABLE; Schema: public; Owner: rt; Tablespace: 
--

CREATE TABLE topico_de_impresoras (
    id_impresora bigint NOT NULL,
    version bigint NOT NULL,
    marca character varying(255) NOT NULL,
    modelo character varying(255) NOT NULL,
    tipo character varying(255) NOT NULL
);


ALTER TABLE public.topico_de_impresoras OWNER TO rt;

--
-- Name: topico_impresora_id_seq; Type: SEQUENCE; Schema: public; Owner: rt
--

CREATE SEQUENCE topico_impresora_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.topico_impresora_id_seq OWNER TO rt;

--
-- Name: unidad_administrativa; Type: TABLE; Schema: public; Owner: rt; Tablespace: 
--

CREATE TABLE unidad_administrativa (
    id_unidad_administrativa bigint NOT NULL,
    version bigint NOT NULL,
    clave character varying(255),
    nombre character varying(255),
    tipo character varying(255),
    extension character varying(255),
    numero character varying(255),
    correo_electronico character varying(255) NOT NULL
);


ALTER TABLE public.unidad_administrativa OWNER TO rt;

--
-- Name: unidad_administrativa_id_seq; Type: SEQUENCE; Schema: public; Owner: rt
--

CREATE SEQUENCE unidad_administrativa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.unidad_administrativa_id_seq OWNER TO rt;

--
-- Name: usuario_unidad_administrativa; Type: TABLE; Schema: public; Owner: rt; Tablespace: 
--

CREATE TABLE usuario_unidad_administrativa (
    usuario_id bigint NOT NULL,
    unidad_id bigint NOT NULL
);


ALTER TABLE public.usuario_unidad_administrativa OWNER TO rt;

--
-- Name: valor_dato_requerido; Type: TABLE; Schema: public; Owner: rt; Tablespace: 
--

CREATE TABLE valor_dato_requerido (
    id_valor_dato_requerido bigint NOT NULL,
    version bigint NOT NULL,
    caso_id bigint NOT NULL,
    dato_requerido_id bigint NOT NULL,
    valor character varying(255) NOT NULL
);


ALTER TABLE public.valor_dato_requerido OWNER TO rt;

--
-- Name: valor_dato_requerido_id_seq; Type: SEQUENCE; Schema: public; Owner: rt
--

CREATE SEQUENCE valor_dato_requerido_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.valor_dato_requerido_id_seq OWNER TO rt;

--
-- Name: valor_de_pregunta; Type: TABLE; Schema: public; Owner: rt; Tablespace: 
--

CREATE TABLE valor_de_pregunta (
    id_valor_pregunta bigint NOT NULL,
    version bigint NOT NULL,
    caso_id bigint NOT NULL,
    fecha timestamp without time zone NOT NULL,
    pregunta_id bigint NOT NULL,
    valor integer NOT NULL
);


ALTER TABLE public.valor_de_pregunta OWNER TO rt;

--
-- Name: valor_de_pregunta_id_seq; Type: SEQUENCE; Schema: public; Owner: rt
--

CREATE SEQUENCE valor_de_pregunta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.valor_de_pregunta_id_seq OWNER TO rt;

--
-- Name: wiki_categoria_del_probema; Type: TABLE; Schema: public; Owner: rt; Tablespace: 
--

CREATE TABLE wiki_categoria_del_probema (
    id bigint NOT NULL,
    version bigint NOT NULL,
    categoria_id bigint NOT NULL,
    texto text NOT NULL
);


ALTER TABLE public.wiki_categoria_del_probema OWNER TO rt;

--
-- Name: adjunto_de_caso_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rt
--

SELECT pg_catalog.setval('adjunto_de_caso_id_seq', 17, true);


--
-- Data for Name: adjuntos_de_caso; Type: TABLE DATA; Schema: public; Owner: rt
--

COPY adjuntos_de_caso (id_adjunto, version, caso_id, fecha, nombre_del_adjunto, ruta_del_adjunto) FROM stdin;
1	0	39	2015-10-06 14:11:54.506	plano-planta-alta-13119_131.jpg	/var/uploads/mesaDeAyuda/adjuntosDelTicket_39/plano-planta-alta-13119_131.jpg
2	0	39	2015-10-06 14:13:08.783	plano-planta-alta-13119_131.jpg	/var/uploads/mesaDeAyuda/adjuntosDelTicket_39/plano-planta-alta-13119_131.jpg
3	0	39	2015-10-06 14:14:19.851	plano-de-casa-de-140-m2-con-3-dormitorios-y-diseno-moderno-2_78189.jpg	/var/uploads/mesaDeAyuda/adjuntosDelTicket_39/plano-de-casa-de-140-m2-con-3-dormitorios-y-diseno-moderno-2_78189.jpg
4	0	39	2015-10-06 15:26:32.781	PLANO-DE-CASA-MODERNA-DE-16.jpg	/var/uploads/mesaDeAyuda/adjuntosDelTicket_39/PLANO-DE-CASA-MODERNA-DE-16.jpg
5	0	39	2015-10-06 15:27:44.94	plano-planta-alta-13119_131.jpg	/var/uploads/mesaDeAyuda/adjuntosDelTicket_39/plano-planta-alta-13119_131.jpg
6	0	39	2015-10-06 15:51:49.463	plano-planta-alta-13119_131.jpg	/var/uploads/mesaDeAyuda/adjuntosDelTicket_39/plano-planta-alta-13119_131.jpg
7	0	39	2015-10-06 16:24:57.2	ESTADISTICA_FOLIOS_VALIDADOS_9_ABRIL_2015.xlsx	/var/uploads/mesaDeAyuda/adjuntosDelTicket_39/ESTADISTICA_FOLIOS_VALIDADOS_9_ABRIL_2015.xlsx
8	0	48	2015-10-06 18:03:28.423	screenshot5.jpg	/var/uploads/mesaDeAyuda/adjuntosDelTicket_48/screenshot5.jpg
9	0	48	2015-10-06 18:08:01.887	screenshot2.jpg	/var/uploads/mesaDeAyuda/adjuntosDelTicket_48/screenshot2.jpg
10	0	48	2015-10-06 18:08:32.261	screenshot5.jpg	/var/uploads/mesaDeAyuda/adjuntosDelTicket_48/screenshot5.jpg
11	0	49	2015-10-07 10:26:43.578	19_01_AUX0003_C0001_L.JPG	/var/uploads/mesaDeAyuda/adjuntosDelTicket_49/19_01_AUX0003_C0001_L.JPG
12	0	57	2015-10-09 10:16:25.13	Captura de pantalla de 2015-10-07 10:00:48.png	/var/uploads/mesaDeAyuda/adjuntosDelTicket_57/Captura de pantalla de 2015-10-07 10:00:48.png
13	0	58	2015-10-09 10:28:40.753	24332.png	/var/uploads/mesaDeAyuda/adjuntosDelTicket_58/24332.png
14	0	93	2015-11-23 13:30:41.923	Solicitud 1896 - Contratacion internet redundante.pdf	/var/uploads/mesaDeAyuda/adjuntosDelTicket_93/Solicitud 1896 - Contratacion internet redundante.pdf
15	0	96	2015-11-25 12:19:17.901	iphone4_autumnfloor.jpg	/var/uploads/mesaDeAyuda/adjuntosDelTicket_96/iphone4_autumnfloor.jpg
16	0	100	2015-11-25 12:35:05.193	1920_autumnfloor.jpg	/var/uploads/mesaDeAyuda/adjuntosDelTicket_100/1920_autumnfloor.jpg
17	0	110	2016-08-15 18:23:36.562	VolanteUniversal.pdf	/var/uploads/mesaDeAyuda/adjuntosDelTicket_110/VolanteUniversal.pdf
\.


--
-- Data for Name: atencion_directa; Type: TABLE DATA; Schema: public; Owner: rt
--

COPY atencion_directa (id_atencion_directa, version, categoria_id, descrpcion_del_problema, fecha_de_atencion, id_team_viewer, sitio, telefono, tipo_de_atencion, unidad_id, usuario_de_atencion_id, usuario_que_se_atiende) FROM stdin;
22	0	2	djksadnjaskdnjskandjsakdn  dnjsndjksanda jndsjadnasjdnsaj jdnasjkdnasjdnasndjsak ndjsakndjaskdnasjkdnasj ndsandjsandjsandnasjk	2015-10-28 10:14:38.705	2121212121	\N	\N	teamViewer	4	19	ADRIAN HERNANDEZ PEREX
23	0	2	sdaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa	2015-10-28 10:16:54.353	\N	\N	2874545	llamada	1	19	ADRIAN HERNANDEZ PEREX
24	0	2	sddsandkjasnjkdnasjkdnasjkdnkasjndjas	2015-10-28 10:17:53.049	\N	toluca	\N	sitio	2	19	ADRIAN HERNANDEZ PEREX
25	0	29	sdklsadnklsandsa jndsajkdnasjkdn sa j jdnsajkdnsajdnasjdnsa jdnasjdnasjdnasjkn njdnasdnasjdnaskjdnj njdnjkadnasjkdnsa 	2015-10-28 10:28:15.514	\N	\N	0557842145	llamada	6	19	ADRIAN HERNANDEZ PEREX
26	0	2	sdjksndjksandjksandsadasdsadsadsa	2015-10-29 17:40:03.044	10200222220	\N	\N	teamViewer	6	19	llamada llamadallamada llamada
27	0	2	qqqqqqqqqqqqqqqqqq	2015-10-30 13:31:39.81	015854899	\N	\N	teamViewer	1	19	qqqqqqqqqqqqqq
28	0	2	<br><br><br>32323232	2015-11-23 12:12:45.07	333333333	\N	\N	teamViewer	1	19	32323232 32323 2323
29	0	2	SUARIO A QSSUARIO A QUARIO A QSUARIO A Q	2015-11-23 12:13:43.767	\N	\N	1111111111	llamada	1	19	<br> <br>SUARIO A QSUARIO A Q
30	0	2	SUARIO A QSUARIO A QSUARIO A QSUARIO A Q	2015-11-23 12:14:31.663	\N	SUARIO A Q	\N	sitio	1	19	SUARIO A QSUARIO A Q
\.


--
-- Name: atencion_directa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rt
--

SELECT pg_catalog.setval('atencion_directa_id_seq', 30, true);


--
-- Data for Name: bitacora_de_caso; Type: TABLE DATA; Schema: public; Owner: rt
--

COPY bitacora_de_caso (id_bitacora_de_caso, version, caso_id, diagnostico, fecha, movimiento, solucion, usuario_id) FROM stdin;
11	0	50	\N	2015-10-07 10:44:37.334	CREADO	\N	3
12	0	50	\N	2015-10-07 10:46:15.146	SEGUIMIENTO	\N	6
13	0	50	EL TRAMITE NO GENERO VOLANTE DE EEL TRAMITE NO GENERO VOLANTE DE ENTRADEL TRAMITE NO GENERO VOLANTE DE ENTRADEL TRAMITE NO GENERO VOLANTE DE ENTRADNTRADEL TRAMITE NO GENERO VOLANTE DE ENTRADEL TRAMITE NO GENERO VOLANTE DE ENTRAD	2015-10-07 10:47:18.562	ATENDIDO	EL TRAMITE NO GENERO VOLANTE DE ENTRADEL TRAMITE NO GENERO VOLANTE DE ENTRADEL TRAMITE NO GENERO VOLANTE DE ENTRADEL TRAMITE NO GENERO VOLANTE DE ENTRADEL TRAMITE NO GENERO VOLANTE DE ENTRADEL TRAMITE NO GENERO VOLANTE DE ENTRAD	2
14	0	50	EL TRAMITE NO GENERO VOLANTE DE EEL TRAMITE NO GENERO VOLANTE DE ENTRADEL TRAMITE NO GENERO VOLANTE DE ENTRADEL TRAMITE NO GENERO VOLANTE DE ENTRADNTRADEL TRAMITE NO GENERO VOLANTE DE ENTRADEL TRAMITE NO GENERO VOLANTE DE ENTRAD	2015-10-07 10:49:15.766	CLONCLUIDO	EL TRAMITE NO GENERO VOLANTE DE ENTRADEL TRAMITE NO GENERO VOLANTE DE ENTRADEL TRAMITE NO GENERO VOLANTE DE ENTRADEL TRAMITE NO GENERO VOLANTE DE ENTRADEL TRAMITE NO GENERO VOLANTE DE ENTRADEL TRAMITE NO GENERO VOLANTE DE ENTRAD	3
15	0	51	\N	2015-10-07 17:38:45.838	CREADO	\N	9
16	0	52	\N	2015-10-08 17:30:32.648	CREADO	\N	3
17	0	53	\N	2015-10-08 17:43:06.314	CREADO	\N	3
18	0	54	\N	2015-10-08 17:47:18.629	CREADO	\N	3
19	0	52	 [RemoveSession] Session  [RemoveSession] Session ID m6Nyvh-4LuaccF8XdRTgJClq removida [RemoveSession] Session ID m6	2015-10-08 18:16:18.428	ATENDIDO	 [RemoveSession] Session ID m6Nyvh-4LuaccF8XdRTgJClq removida [RemoveSession] Session ID m6Nyvh-4LuaccF8XdRTgJClq] 	11
20	0	52	 [RemoveSession] Session  [RemoveSession] Session ID m6Nyvh-4LuaccF8XdRTgJClq removida [RemoveSession] Session ID m6	2015-10-08 18:17:04.699	CLONCLUIDO	 [RemoveSession] Session ID m6Nyvh-4LuaccF8XdRTgJClq removida [RemoveSession] Session ID m6Nyvh-4LuaccF8XdRTgJClq] 	3
21	0	55	\N	2015-10-09 10:03:40.343	CREADO	\N	9
22	0	55	\N	2015-10-09 10:05:26.173	SEGUIMIENTO	\N	12
23	0	55	\N	2015-10-09 10:06:06.216	SEGUIMIENTO	\N	9
24	0	55	error de capa 8	2015-10-09 10:06:50.348	ATENDIDO	se conecto erl cabñe de luz	12
25	0	55	error de capa 8	2015-10-09 10:07:45.631	CLONCLUIDO	se conecto erl cabñe de luz	9
26	0	56	\N	2015-10-09 10:14:39.396	CREADO	\N	5
27	0	57	\N	2015-10-09 10:16:25.044	CREADO	\N	5
28	0	41	pruebas	2015-10-09 10:26:04.927	ATENDIDO	pruebas	2
29	0	58	\N	2015-10-09 10:28:40.747	CREADO	\N	2
30	0	59	\N	2015-10-09 11:25:43.581	CREADO	\N	2
31	0	58	no estaba conectado a la luz electrica	2015-10-09 11:40:36.386	ATENDIDO	error de capa 8	12
32	0	56	\N	2015-10-09 11:48:55.52	SEGUIMIENTO	\N	10
33	0	56	\N	2015-10-09 13:04:35.018	SEGUIMIENTO	\N	5
34	0	56	\N	2015-10-09 13:19:53.034	SEGUIMIENTO	\N	10
35	0	59	\N	2015-10-09 13:28:15.54	SEGUIMIENTO	\N	10
36	0	59	\N	2015-10-09 16:23:33.833	SEGUIMIENTO	\N	2
37	0	59	Probablemente sea un clásico problema de capa 8.	2015-10-12 09:28:54.172	ATENDIDO	Error de capa 8!	10
38	0	59	Probablemente sea un clásico problema de capa 8.	2015-10-12 10:31:17.409	TURNAR	Error de capa 8!	11
39	0	43	\N	2015-10-12 17:45:24.526	SEGUIMIENTO	\N	2
40	0	60	\N	2015-10-15 09:58:43.883	CREADO	\N	9
41	0	61	\N	2015-10-15 09:58:59.078	CREADO	\N	9
42	0	62	\N	2015-10-15 09:59:22.009	CREADO	\N	9
43	0	63	\N	2015-10-15 09:59:45.8	CREADO	\N	9
44	0	58	no estaba conectado a la luz electrica	2015-10-15 13:50:46.69	SEGUIMIENTO	error de capa 8	2
45	0	58	no estaba conectado a la luz electrica	2015-10-15 13:55:06.67	ATENDIDO	error de capa 8	2
46	0	57	\N	2015-10-15 13:56:16.539	SEGUIMIENTO	\N	2
47	0	64	\N	2015-10-15 14:26:18.804	CREADO	\N	2
48	0	46	ssdasdsdsdsadsa	2015-10-14 12:14:25	ATENDIDO	54564564646	2
49	0	45	ssdasdsdsdsadsa	2015-10-10 12:14:25	ATENDIDO	54564564646	2
50	0	47	ssdasdsdsdsadsa	2015-10-02 12:14:25	ATENDIDO	54564564646	2
51	0	47	ssdasdsdsdsadsa	2015-10-12 12:14:25	ATENDIDO	54564564646	2
52	0	47	ssdasdsdsdsadsa	2015-10-15 12:14:25	ATENDIDO	54564564646	2
53	0	41	\N	2015-10-15 18:39:00.035	CLONCLUIDO	\N	1
54	0	45	\N	2015-10-15 18:39:00.051	CLONCLUIDO	\N	1
55	0	41	\N	2015-10-15 18:46:00.037	CLONCLUIDO	\N	1
56	0	45	\N	2015-10-15 18:46:00.053	CLONCLUIDO	\N	1
57	0	65	\N	2015-10-16 12:37:55.173	CREADO	\N	9
58	0	66	\N	2015-10-16 12:38:18.731	CREADO	\N	9
59	0	67	\N	2015-10-16 12:38:33.094	CREADO	\N	9
60	0	68	\N	2015-10-16 12:38:50.113	CREADO	\N	9
61	0	65	wqwqw	2015-10-16 12:39:44.983	ATENDIDO	wqwqw	2
62	0	65	wqwqw	2015-10-16 12:40:07.879	CLONCLUIDO	wqwqw	9
63	0	66	\N	2015-10-16 12:40:49.435	SEGUIMIENTO	\N	2
64	0	67	wqwqw	2015-10-16 12:40:59.967	ATENDIDO	wqwqw	2
65	0	46	\N	2015-10-19 18:46:00.494	CLONCLUIDO	\N	1
66	0	58	\N	2015-10-20 18:46:00.165	CLONCLUIDO	\N	1
67	0	47	\N	2015-10-20 18:46:00.182	CLONCLUIDO	\N	1
68	0	67	\N	2015-10-21 18:46:00.778	CLONCLUIDO	\N	1
69	0	69	\N	2015-10-23 11:35:55.418	CREADO	\N	9
70	0	70	\N	2015-10-23 11:37:21.548	CREADO	\N	9
71	0	71	\N	2015-10-23 11:37:47.425	CREADO	\N	9
72	0	72	\N	2015-10-23 11:39:06.511	CREADO	\N	9
73	0	73	\N	2015-10-23 11:39:30.301	CREADO	\N	9
74	0	74	\N	2015-10-23 11:41:42.606	CREADO	\N	24
75	0	75	\N	2015-10-23 11:41:58.167	CREADO	\N	24
76	0	76	\N	2015-10-23 11:42:16.676	CREADO	\N	24
77	0	77	\N	2015-10-23 11:45:53.617	CREADO	\N	24
78	0	78	\N	2015-10-23 11:48:18.147	CREADO	\N	24
79	0	79	\N	2015-10-23 11:48:35.239	CREADO	\N	24
80	0	69	 </sec:ifAnyGranted> </sec:ifAnyGranted> </sec:ifAnyGranted> </sec:ifAnyGranted> </sec:ifAnyGranted>	2015-10-28 17:31:24.514	ATENDIDO	 </sec:ifAnyGranted> </sec:ifAnyGranted> </sec:ifAnyGranted> </sec:ifAnyGranted> </sec:ifAnyGranted>	19
81	0	69	 </sec:ifAnyGranted> </sec:ifAnyGranted> </sec:ifAnyGranted> </sec:ifAnyGranted> </sec:ifAnyGranted>	2015-10-29 17:50:21.596	CLONCLUIDO	 </sec:ifAnyGranted> </sec:ifAnyGranted> </sec:ifAnyGranted> </sec:ifAnyGranted> </sec:ifAnyGranted>	9
82	0	66	\N	2015-10-29 17:51:40.644	SEGUIMIENTO	\N	9
83	0	80	\N	2015-10-30 13:10:34.553	CREADO	\N	9
84	0	81	\N	2015-10-30 13:11:20.582	CREADO	\N	9
85	0	82	\N	2015-10-30 13:11:41.285	CREADO	\N	9
86	0	83	\N	2015-10-30 13:12:01.113	CREADO	\N	9
87	0	84	\N	2015-10-30 13:12:17.474	CREADO	\N	9
88	0	85	\N	2015-10-30 13:17:59.161	CREADO	\N	9
89	0	74	\N	2015-11-04 12:11:06.399	SEGUIMIENTO	\N	19
90	0	74	sadadsa	2015-11-04 12:24:52.552	ATENDIDO	dsadasdas	19
91	0	74	sadadsa	2015-11-04 12:50:01.171	CLONCLUIDO	dsadasdas	24
92	0	86	\N	2015-11-04 19:00:19.914	CREADO	\N	9
93	0	87	\N	2015-11-05 11:20:08.642	CREADO	\N	9
94	0	88	\N	2015-11-05 11:27:28.931	CREADO	\N	11
95	0	89	\N	2015-11-18 17:27:03.997	CREADO	\N	9
96	0	90	\N	2015-11-18 17:27:27.337	CREADO	\N	9
97	0	91	\N	2015-11-18 17:27:41.297	CREADO	\N	9
98	0	92	\N	2015-11-18 17:27:52.998	CREADO	\N	9
99	0	85	ativa Remativa Rem	2015-11-18 17:28:11.688	ATENDIDO	ativa Remativa Rem	19
100	0	90	ativa Remativa Rem	2015-11-18 17:28:23.573	ATENDIDO	ativa Remativa Remativa Rem	19
101	0	70	ativa Remativa Rem	2015-11-18 17:28:32.033	ATENDIDO	ativa Remativa Rem	19
102	0	75	ativa Remativa Remativa Rem	2015-11-18 17:28:42.739	ATENDIDO	ativa Remativa Remativa Rem	19
103	0	91	ativa Remativa Remativa Rem	2015-11-18 17:28:53.001	ATENDIDO	ativa Remativa Rem	19
104	0	85	ativa Remativa Rem	2015-11-18 17:29:07.491	CLONCLUIDO	ativa Remativa Rem	9
105	0	90	ativa Remativa Rem	2015-11-18 17:29:12.477	CLONCLUIDO	ativa Remativa Remativa Rem	9
106	0	70	ativa Remativa Rem	2015-11-18 17:29:17.436	CLONCLUIDO	ativa Remativa Rem	9
107	0	91	ativa Remativa Remativa Rem	2015-11-18 17:29:22.588	CLONCLUIDO	ativa Remativa Rem	9
108	0	93	\N	2015-11-23 13:30:41.889	CREADO	\N	12
109	0	54	seguimos atendiendo	2015-11-23 13:34:24.245	ATENDIDO	en proceso	12
110	0	53	en ´proceso	2015-11-23 13:35:28.05	ATENDIDO	en proceso	12
111	0	75	\N	2015-11-24 10:50:01.004	CLONCLUIDO	\N	1
112	0	72	fa-slackfa-slackfa-slackfa-slack	2015-11-25 11:05:34.92	ATENDIDO	fa-slackfa-slackfafa-slack-slackfa-slack	19
113	0	72	fa-slackfa-slackfa-slackfa-slack	2015-11-25 11:08:21.834	CLONCLUIDO	fa-slackfa-slackfafa-slack-slackfa-slack	9
114	0	71	\N	2015-11-25 11:37:03.876	SEGUIMIENTO	\N	19
115	0	71	\N	2015-11-25 11:40:40.869	SEGUIMIENTO	\N	9
116	0	71	\N	2015-11-25 11:42:18.074	SEGUIMIENTO	\N	9
117	0	71	\N	2015-11-25 11:42:41.999	SEGUIMIENTO	\N	9
118	0	71	\N	2015-11-25 11:49:29.928	SEGUIMIENTO	\N	19
119	0	71	\N	2015-11-25 11:50:38.314	SEGUIMIENTO	\N	19
120	0	71	\N	2015-11-25 11:52:27.699	SEGUIMIENTO	\N	9
121	0	77	\N	2015-11-25 11:58:49.696	SEGUIMIENTO	\N	19
122	0	77	\N	2015-11-25 11:59:55.955	SEGUIMIENTO	\N	19
123	0	94	\N	2015-11-25 12:07:19.892	CREADO	\N	24
124	0	95	\N	2015-11-25 12:07:48.838	CREADO	\N	24
125	0	96	\N	2015-11-25 12:09:19.475	CREADO	\N	24
126	0	96	\N	2015-11-25 12:09:50.674	SEGUIMIENTO	\N	19
127	0	71	                     def conf=ConfiguracionDeMesaDeAyuda.get(1)\r\n//             def url=conf?.urlServidor+"solicitudDeCaso/verCaso?idCaso="+resultado?.caso\r\n	2015-11-25 12:11:47.681	ATENDIDO	                     def conf=ConfiguracionDeMesaDeAyuda.get(1)\r\n//             def url=conf?.urlServidor+"solicitudDeCaso/verCaso?idCaso="+resultado?.caso	19
128	0	95	resultado?.casoresultado?.caso	2015-11-25 12:13:38.212	ATENDIDO	resultado?.casoresultado?.casoresultado?.caso	19
129	0	95	resultado?.casoresultado?.caso	2015-11-25 12:17:01.316	CLONCLUIDO	resultado?.casoresultado?.casoresultado?.caso	24
130	0	97	\N	2015-11-25 12:21:57.679	CREADO	\N	24
131	0	98	\N	2015-11-25 12:23:15.146	CREADO	\N	24
132	0	99	\N	2015-11-25 12:32:53.981	CREADO	\N	24
133	0	100	\N	2015-11-25 12:33:34.079	CREADO	\N	24
134	0	100	\N	2015-11-25 12:34:28.323	SEGUIMIENTO	\N	19
135	0	100	TARIOSCOMENTARIOSCOMENTARIOSCOMENTARIOSCOMTARIOSCOMENTARIOSCOMENTARIOSCOMENTARIOSCOMTARIOSCOMENTARIOSCOMENTARIOSCOMENTARIOSCOM	2015-11-25 12:35:29.396	ATENDIDO	TARIOSCOMENTARIOSCOMENTARIOSCOMENTARIOSCOMTARIOSCOMENTARIOSCOMENTARIOSCOMENTARIOSCOMTARIOSCOMENTARIOSCOMENTARIOSCOMENTARIOSCOM	19
136	0	100	TARIOSCOMENTARIOSCOMENTARIOSCOMENTARIOSCOMTARIOSCOMENTARIOSCOMENTARIOSCOMENTARIOSCOMTARIOSCOMENTARIOSCOMENTARIOSCOMENTARIOSCOM	2015-11-25 12:35:50.144	CLONCLUIDO	TARIOSCOMENTARIOSCOMENTARIOSCOMENTARIOSCOMTARIOSCOMENTARIOSCOMENTARIOSCOMENTARIOSCOMTARIOSCOMENTARIOSCOMENTARIOSCOMENTARIOSCOM	24
137	0	78	DE AVISO PREVEN	2015-11-25 13:15:50.355	ATENDIDO	DE AVISO PREVEN	19
138	0	101	\N	2015-11-25 16:45:13.07	CREADO	\N	24
139	0	101	\N	2015-11-25 16:56:38.12	SEGUIMIENTO	\N	23
140	0	71	                     def conf=ConfiguracionDeMesaDeAyuda.get(1)\r\n//             def url=conf?.urlServidor+"solicitudDeCaso/verCaso?idCaso="+resultado?.caso\r\n	2015-11-25 17:04:05.492	CLONCLUIDO	                     def conf=ConfiguracionDeMesaDeAyuda.get(1)\r\n//             def url=conf?.urlServidor+"solicitudDeCaso/verCaso?idCaso="+resultado?.caso	9
141	0	102	\N	2015-11-25 17:04:48.587	CREADO	\N	9
142	0	102	\N	2015-11-25 17:05:43.039	TURNAR	\N	19
143	0	102	\N	2015-11-25 17:06:11.385	SEGUIMIENTO	\N	23
144	0	102	http://www.tolucahoy.com.mx/2015/11/25/coreanos-encierran-a-empleada-que-despiden-para-no-pagarle-indemnizaci%C3%B3n/	2015-11-25 17:06:41.03	ATENDIDO	http://www.tolucahoy.com.mx/2015/11/25/coreanos-encierran-a-empleada-que-despiden-para-no-pagarle-indemnizaci%C3%B3n/	19
145	0	102	http://www.tolucahoy.com.mx/2015/11/25/coreanos-encierran-a-empleada-que-despiden-para-no-pagarle-indemnizaci%C3%B3n/	2015-11-25 17:07:35.957	CLONCLUIDO	http://www.tolucahoy.com.mx/2015/11/25/coreanos-encierran-a-empleada-que-despiden-para-no-pagarle-indemnizaci%C3%B3n/	23
146	0	89	\N	2015-11-25 17:38:18.105	SEGUIMIENTO	\N	19
147	0	89	\N	2015-11-25 17:38:51.238	SEGUIMIENTO	\N	19
148	0	89	\N	2015-11-25 17:49:07.804	SEGUIMIENTO	\N	19
149	0	89	\N	2015-11-25 17:50:22.726	SEGUIMIENTO	\N	9
150	0	89	\N	2015-11-25 17:50:49.359	SEGUIMIENTO	\N	19
151	0	89	\N	2015-11-25 17:58:27.016	SEGUIMIENTO	\N	9
152	0	103	\N	2015-11-25 18:01:10.964	CREADO	\N	9
153	0	104	\N	2015-11-25 18:02:09.181	CREADO	\N	9
154	0	54	\N	2015-11-30 10:50:00.091	CLONCLUIDO	\N	1
155	0	53	\N	2015-11-30 10:50:00.136	CLONCLUIDO	\N	1
156	0	87	RUBRORUBRORUBRO	2015-11-30 12:52:16.043	ATENDIDO	RUBRORUBRO	12
157	0	87	RUBRORUBRORUBRO	2015-11-30 12:52:36.296	CLONCLUIDO	RUBRORUBRO	9
158	0	104	lerema	2015-11-30 16:21:16.577	ATENDIDO	lerema	19
159	0	92	lerema	2015-11-30 16:21:25.26	ATENDIDO	lerema	19
160	0	92	lerema	2015-11-30 16:21:49.613	CLONCLUIDO	lerema	9
161	0	89	resolucionresolucion	2015-12-01 09:49:03.831	ATENDIDO	resolucionresolucionresolucion	19
162	0	89	resolucionresolucion	2015-12-01 09:50:28.525	CLONCLUIDO	resolucionresolucionresolucion	9
163	0	103	select distinct(e.observaciones)	2015-12-01 10:47:11.831	ATENDIDO	select distinct(e.observaciones)	19
164	0	73	select distinct(e.observaciones)	2015-12-01 10:47:20.264	ATENDIDO	select distinct(e.observaciones)	19
165	0	86	select distinct(e.observaciones)	2015-12-01 10:47:29.146	ATENDIDO	select distinct(e.observaciones)	19
166	0	103	select distinct(e.observaciones)	2015-12-01 10:47:49.126	CLONCLUIDO	select distinct(e.observaciones)	9
167	0	104	lerema	2015-12-01 10:48:12.908	CLONCLUIDO	lerema	9
168	0	86	select distinct(e.observaciones)	2015-12-01 10:48:32.653	CLONCLUIDO	select distinct(e.observaciones)	9
169	0	73	select distinct(e.observaciones)	2015-12-01 10:48:50.163	CLONCLUIDO	select distinct(e.observaciones)	9
170	0	78	\N	2015-12-01 10:50:00.102	CLONCLUIDO	\N	1
171	0	88	, fechaFin:params.fechaFin, fechaInicial:params.fechaInicio, unidadDeUsuario:unidadDeUsuario	2015-12-01 12:48:18.362	ATENDIDO	, fechaFin:params.fechaFin, fechaInicial:params.fechaInicio, unidadDeUsuario:unidadDeUsuario	12
172	0	64	, fechaFin:params.fechaFin, fechaInicial:params.fechaInicio, unidadDeUsuario:unidadDeUsuario	2015-12-01 12:48:42.515	ATENDIDO	, fechaFin:params.fechaFin, fechaInicial:params.fechaInicio, unidadDeUsuario:unidadDeUsuario	12
173	0	81	, fechaFin:params.fechaFin, fechaInicial:params.fechaInicio, unidadDeUsuario:unidadDeUsuario	2015-12-01 12:49:14.069	ATENDIDO	, fechaFin:params.fechaFin, fechaInicial:params.fechaInicio, unidadDeUsuario:unidadDeUsuario	12
174	0	80	, fechaFin:params.fechaFin, fechaInicial:params.fechaInicio, unidadDeUsuario:unidadDeUsuario	2015-12-01 12:49:21.674	ATENDIDO	, fechaFin:params.fechaFin, fechaInicial:params.fechaInicio, unidadDeUsuario:unidadDeUsuario	12
175	0	82	, fechaFin:params.fechaFin, fechaInicial:params.fechaInicio, unidadDeUsuario:unidadDeUsuario	2015-12-01 12:49:29.055	ATENDIDO	, fechaFin:params.fechaFin, fechaInicial:params.fechaInicio, unidadDeUsuario:unidadDeUsuario	12
176	0	83	, fechaFin:params.fechaFin, fechaInicial:params.fechaInicio, unidadDeUsuario:unidadDeUsuario	2015-12-01 12:49:37.336	ATENDIDO	, fechaFin:params.fechaFin, fechaInicial:params.fechaInicio, unidadDeUsuario:unidadDeUsuario	12
177	0	84	, fechaFin:params.fechaFin, fechaInicial:params.fechaInicio, unidadDeUsuario:unidadDeUsuario	2015-12-01 12:49:43.819	ATENDIDO	, fechaFin:params.fechaFin, fechaInicial:params.fechaInicio, unidadDeUsuario:unidadDeUsuario	12
178	0	80	, fechaFin:params.fechaFin, fechaInicial:params.fechaInicio, unidadDeUsuario:unidadDeUsuario	2015-12-01 12:50:07.438	CLONCLUIDO	, fechaFin:params.fechaFin, fechaInicial:params.fechaInicio, unidadDeUsuario:unidadDeUsuario	9
179	0	81	, fechaFin:params.fechaFin, fechaInicial:params.fechaInicio, unidadDeUsuario:unidadDeUsuario	2015-12-01 12:50:27.414	CLONCLUIDO	, fechaFin:params.fechaFin, fechaInicial:params.fechaInicio, unidadDeUsuario:unidadDeUsuario	9
180	0	82	, fechaFin:params.fechaFin, fechaInicial:params.fechaInicio, unidadDeUsuario:unidadDeUsuario	2015-12-01 12:50:45.683	CLONCLUIDO	, fechaFin:params.fechaFin, fechaInicial:params.fechaInicio, unidadDeUsuario:unidadDeUsuario	9
181	0	83	, fechaFin:params.fechaFin, fechaInicial:params.fechaInicio, unidadDeUsuario:unidadDeUsuario	2015-12-01 12:51:03.739	CLONCLUIDO	, fechaFin:params.fechaFin, fechaInicial:params.fechaInicio, unidadDeUsuario:unidadDeUsuario	9
182	0	84	, fechaFin:params.fechaFin, fechaInicial:params.fechaInicio, unidadDeUsuario:unidadDeUsuario	2015-12-01 12:51:20.994	CLONCLUIDO	, fechaFin:params.fechaFin, fechaInicial:params.fechaInicio, unidadDeUsuario:unidadDeUsuario	9
183	0	105	\N	2015-12-01 12:54:19.246	CREADO	\N	9
184	0	105	, fechaFin:params.fechaFin, fechaInicial:params.fechaInicio, unidadDeUsuario:unidadDeUsuario, fechaFin:params.fechaFin, fechaInicial:params.fechaInicio, unidadDeUsuario:unidadDeUsuario	2015-12-01 12:54:44.674	ATENDIDO	, fechaFin:params.fechaFin, fechaInicial:params.fechaInicio, unidadDeUsuario:unidadDeUsuario, fechaFin:params.fechaFin, fechaInicial:params.fechaInicio, unidadDeUsuario:unidadDeUsuario	19
185	0	105	, fechaFin:params.fechaFin, fechaInicial:params.fechaInicio, unidadDeUsuario:unidadDeUsuario, fechaFin:params.fechaFin, fechaInicial:params.fechaInicio, unidadDeUsuario:unidadDeUsuario	2015-12-01 12:55:01.338	CLONCLUIDO	, fechaFin:params.fechaFin, fechaInicial:params.fechaInicio, unidadDeUsuario:unidadDeUsuario, fechaFin:params.fechaFin, fechaInicial:params.fechaInicio, unidadDeUsuario:unidadDeUsuario	9
186	0	106	\N	2015-12-01 13:22:36.38	CREADO	\N	9
187	0	59	Probablemente sea un clásico problema de capa 8.	2015-12-01 13:45:54.855	ATENDIDO	Error de capa 8!	12
188	0	107	\N	2015-12-01 13:46:38.233	CREADO	\N	9
189	0	107	107	2015-12-01 13:46:55.418	ATENDIDO	107	12
190	0	107	107	2015-12-01 13:47:09.099	CLONCLUIDO	107	9
191	0	97	observacion	2015-12-01 16:32:05.381	ATENDIDO	observacion	19
192	0	98	observacion	2015-12-01 16:32:16.173	ATENDIDO	observacion	19
193	0	101	observacion	2015-12-01 16:32:25.468	ATENDIDO	observacion	19
194	0	77	\N	2015-12-01 16:32:48.949	SEGUIMIENTO	\N	24
195	0	96	\N	2015-12-01 16:32:58.47	SEGUIMIENTO	\N	24
196	0	97	observacion	2015-12-01 16:33:06.109	CLONCLUIDO	observacion	24
197	0	98	observacion	2015-12-01 16:33:40.35	CLONCLUIDO	observacion	24
198	0	101	observacion	2015-12-01 16:34:11.117	CLONCLUIDO	observacion	24
199	0	64	\N	2015-12-08 10:50:01.152	CLONCLUIDO	\N	1
200	0	59	\N	2015-12-08 10:50:01.191	CLONCLUIDO	\N	1
201	0	88	\N	2015-12-08 10:50:01.2	CLONCLUIDO	\N	1
202	0	77	    206 | run . . . . . . . .  in home_alara_mesaDeAyuda_grails_app_views_layouts_rt_gsp    206 | run . . . . . . . .  in home_alara_mesaDeAyuda_grails_app_views_layouts_rt_gsp	2015-12-15 13:03:14.326	ATENDIDO	    206 | run . . . . . . . .  in home_alara_mesaDeAyuda_grails_app_views_layouts_rt_gsp	19
203	0	108	\N	2016-01-13 16:15:04.368	CREADO	\N	9
204	0	109	\N	2016-01-13 17:31:04.265	CREADO	\N	9
205	0	109	\N	2016-01-13 17:35:41.288	SEGUIMIENTO	\N	19
206	0	109	\N	2016-01-13 17:37:10.618	SEGUIMIENTO	\N	9
207	0	109	se atendio correctamente	2016-01-13 17:39:41.339	ATENDIDO	se antendio	19
208	0	109	se atendio correctamente	2016-01-13 17:42:36.806	CLONCLUIDO	se antendio	9
209	0	77	\N	2016-01-14 10:50:00.194	CLONCLUIDO	\N	1
210	0	110	\N	2016-08-15 18:23:36.516	CREADO	\N	9
\.


--
-- Name: bitacora_de_caso_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rt
--

SELECT pg_catalog.setval('bitacora_de_caso_id_seq', 210, true);


--
-- Data for Name: cargo; Type: TABLE DATA; Schema: public; Owner: rt
--

COPY cargo (id_cargo, version, nombre) FROM stdin;
1	0	ANALISTA
2	0	ENLACE
\.


--
-- Name: cargo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rt
--

SELECT pg_catalog.setval('cargo_id_seq', 2, true);


--
-- Data for Name: caso; Type: TABLE DATA; Schema: public; Owner: rt
--

COPY caso (id_caso, version, creador_id, descripcion_del_problema, diagnostico, estado_id, fecha_de_cierre, fecha_de_creacion, fecha_de_diagnostico, fecha_de_solucion, propietario_actual_id, responsable_id, solucion, tipo_de_caso_id, encuesta_resuelta) FROM stdin;
68	0	9	2121	\N	1	\N	2015-10-16 12:38:50.106	\N	\N	5	5	\N	1	f
65	3	9	\r\n<!--Lock Screen Dialog Modal-->\r\n<div clasddasdnaskjdksa	wqwqw	4	2015-10-16 12:40:07.876	2015-10-16 12:37:54.947	2015-10-16 12:39:44.97	2015-10-16 12:39:44.97	9	2	wqwqw	1	t
39	0	2	7878787878787878787878787878787878787878787878787878787878787878	\N	1	\N	2015-10-06 11:22:46.737	\N	\N	5	5	\N	1	f
50	5	3	def springSecurityServicedef springSecurityServicedef springSecurityServicedef springSecurityServicedef springSecurityServicedef springSecurityService	EL TRAMITE NO GENERO VOLANTE DE EEL TRAMITE NO GENERO VOLANTE DE ENTRADEL TRAMITE NO GENERO VOLANTE DE ENTRADEL TRAMITE NO GENERO VOLANTE DE ENTRADNTRADEL TRAMITE NO GENERO VOLANTE DE ENTRADEL TRAMITE NO GENERO VOLANTE DE ENTRAD	4	2015-10-07 10:49:15.763	2015-04-05 10:25:08	2015-10-07 10:47:18.554	2015-10-07 10:47:18.554	3	2	EL TRAMITE NO GENERO VOLANTE DE ENTRADEL TRAMITE NO GENERO VOLANTE DE ENTRADEL TRAMITE NO GENERO VOLANTE DE ENTRADEL TRAMITE NO GENERO VOLANTE DE ENTRADEL TRAMITE NO GENERO VOLANTE DE ENTRADEL TRAMITE NO GENERO VOLANTE DE ENTRAD	1	t
93	0	12	sdefsdfdsf	\N	1	\N	2015-11-23 13:30:41.874	\N	\N	10	10	\N	1	f
55	5	9	5465465465465465465454521245	error de capa 8	4	2015-10-09 10:07:45.628	2015-02-05 11:25:08	2015-10-09 10:06:50.343	2015-10-09 10:06:50.343	9	12	se conecto erl cabñe de luz	1	t
71	7	9	2121	                     def conf=ConfiguracionDeMesaDeAyuda.get(1)\r\n//             def url=conf?.urlServidor+"solicitudDeCaso/verCaso?idCaso="+resultado?.caso\r\n	4	2015-11-25 17:04:05.488	2015-10-23 11:37:47.42	2015-11-25 12:11:47.67	2015-11-25 12:11:47.67	9	19	                     def conf=ConfiguracionDeMesaDeAyuda.get(1)\r\n//             def url=conf?.urlServidor+"solicitudDeCaso/verCaso?idCaso="+resultado?.caso	1	t
48	0	3	21212121212121212112121 2121212122121212121212121211212121212121212121212112121 12121212112121 	\N	1	\N	2015-04-05 10:25:08	\N	\N	5	5	\N	1	f
56	3	5	favor de revisar el AP de desarrollo por que no permite descargar peliculas,,,URGEEEEEENTE	\N	2	\N	2015-04-05 10:25:08	\N	\N	5	11	\N	1	f
57	1	5	EL FOLIO SE ENCUENTRA BLOQUEDO 	\N	2	\N	2015-04-05 10:25:08	\N	\N	5	5	\N	1	f
91	3	9	ativa Remativa Rem	ativa Remativa Remativa Rem	4	2015-11-18 17:29:22.586	2015-11-18 17:27:41.292	2015-11-18 17:28:52.995	2015-11-18 17:28:52.995	9	19	ativa Remativa Rem	1	t
67	3	9	2222	wqwqw	4	2015-10-21 18:46:00.767	2015-10-16 12:38:33.09	2015-10-16 12:40:59.962	2015-10-16 12:40:59.962	9	2	wqwqw	1	t
70	3	9	bandejaCasosbandejaCasos	ativa Remativa Rem	4	2015-11-18 17:29:17.434	2015-10-23 11:37:21.544	2015-11-18 17:28:32.027	2015-11-18 17:28:32.027	9	19	ativa Remativa Rem	1	t
37	7	3	probando probando probando 	 s a ambos calificadores\r\nJORGE MANUEL MARTÍNEZ RAMÍREZ y KAREN AZUCENA FLORES GASPAR, con\r\nexcepción de inmatriculación administrativa el cual únicamente deber ser\r\nasignado a JORGE MANUEL MARTINEZ RAMIREZ Y JOSÉ JESÚS TOVA	4	2015-10-06 10:58:16.982	2015-10-06 10:48:42.25	2015-10-06 10:56:47.636	2015-10-06 10:56:47.636	3	2	s a ambos calificadores\r\nJORGE MANUEL MARTÍNEZ RAMÍREZ y KAREN AZUCENA FLORES GASPAR, con\r\nexcepción de inmatriculación administrativa el cual únicamente deber ser\r\nasignado a JORGE MANUEL MARTINEZ RAMIREZ Y JOSÉ JESÚS TOVA::::: YA ESTA BIEN ::::	1	t
72	3	9	bandejaCasosbandejaCasosbandejaCasosbandejaCasos	fa-slackfa-slackfa-slackfa-slack	4	2015-11-25 11:08:21.827	2015-10-23 11:39:06.503	2015-11-25 11:05:34.868	2015-11-25 11:05:34.868	9	19	fa-slackfa-slackfafa-slack-slackfa-slack	1	t
109	5	9	limpieza de linea de captura	se atendio correctamente	4	2016-01-13 17:42:36.803	2016-01-13 17:31:04.255	2016-01-13 17:39:41.331	2016-01-13 17:39:41.331	9	19	se antendio	1	t
101	4	24	solicitudDeCaso/verCaso?idCasosolicitudDeCaso/verCaso?idCasosolicitudDeCaso/verCaso?idCaso	observacion	4	2015-12-01 16:34:11.105	2015-11-25 16:45:13.01	2015-12-01 16:32:25.463	2015-12-01 16:32:25.463	24	19	observacion	1	t
64	2	2	I4G50444858010439290II4G504448580104392904G50444858010439290I4G50444858010439290I4G50444858010439290	, fechaFin:params.fechaFin, fechaInicial:params.fechaInicio, unidadDeUsuario:unidadDeUsuario	4	2015-12-08 10:50:01.131	2015-10-15 14:26:18.758	2015-12-01 12:48:42.511	2015-12-01 12:48:42.511	2	12	, fechaFin:params.fechaFin, fechaInicial:params.fechaInicio, unidadDeUsuario:unidadDeUsuario	1	f
59	5	2	como hago negritas las letras ???	Probablemente sea un clásico problema de capa 8.	4	2015-12-08 10:50:01.188	2015-04-05 10:25:08	2015-12-01 13:45:54.849	2015-12-01 13:45:54.849	2	12	Error de capa 8!	1	f
102	5	9		http://www.tolucahoy.com.mx/2015/11/25/coreanos-encierran-a-empleada-que-despiden-para-no-pagarle-indemnizaci%C3%B3n/	4	2015-11-25 17:07:35.954	2015-11-25 17:04:48.581	2015-11-25 17:06:41.025	2015-11-25 17:06:41.025	9	19	http://www.tolucahoy.com.mx/2015/11/25/coreanos-encierran-a-empleada-que-despiden-para-no-pagarle-indemnizaci%C3%B3n/	1	t
108	0	9	glglglglglglglglglglglgl	\N	1	\N	2016-01-13 16:15:04.28	\N	\N	21	21	\N	1	f
110	0	9	••••••••••••••••••	\N	1	\N	2016-08-15 18:23:36.385	\N	\N	20	20	\N	1	f
80	3	9	321321321	, fechaFin:params.fechaFin, fechaInicial:params.fechaInicio, unidadDeUsuario:unidadDeUsuario	4	2015-12-01 12:50:07.435	2015-10-30 13:10:34.449	2015-12-01 12:49:21.67	2015-12-01 12:49:21.67	9	12	, fechaFin:params.fechaFin, fechaInicial:params.fechaInicio, unidadDeUsuario:unidadDeUsuario	1	t
90	3	9	ativa Remativa Remativa Rem	ativa Remativa Rem	4	2015-11-18 17:29:12.474	2015-11-18 17:27:27.331	2015-11-18 17:28:23.565	2015-11-18 17:28:23.565	9	19	ativa Remativa Remativa Rem	1	t
69	3	9	21212121	 </sec:ifAnyGranted> </sec:ifAnyGranted> </sec:ifAnyGranted> </sec:ifAnyGranted> </sec:ifAnyGranted>	4	2015-10-29 17:50:21.593	2015-10-23 11:35:55.28	2015-10-28 17:31:24.481	2015-10-28 17:31:24.481	9	19	 </sec:ifAnyGranted> </sec:ifAnyGranted> </sec:ifAnyGranted> </sec:ifAnyGranted> </sec:ifAnyGranted>	1	t
85	3	9	323232	ativa Remativa Rem	4	2015-11-18 17:29:07.488	2015-10-30 13:17:59.151	2015-11-18 17:28:11.674	2015-11-18 17:28:11.674	9	19	ativa Remativa Rem	1	t
86	3	9	3232	select distinct(e.observaciones)	4	2015-12-01 10:48:32.651	2015-11-04 19:00:19.795	2015-12-01 10:47:29.142	2015-12-01 10:47:29.142	9	19	select distinct(e.observaciones)	1	t
82	3	9	234432432	, fechaFin:params.fechaFin, fechaInicial:params.fechaInicio, unidadDeUsuario:unidadDeUsuario	4	2015-12-01 12:50:45.681	2015-10-30 13:11:41.281	2015-12-01 12:49:29.052	2015-12-01 12:49:29.052	9	12	, fechaFin:params.fechaFin, fechaInicial:params.fechaInicio, unidadDeUsuario:unidadDeUsuario	1	t
42	0	3	isEmpy	\N	1	\N	2015-10-06 17:48:03.077	\N	\N	2	2	\N	1	f
76	0	24	bandejaCasosbandejaCasos	\N	1	\N	2015-10-23 11:42:16.669	\N	\N	21	21	\N	1	f
100	4	24	dsadasdsad INA REGISTRAL DE TOLUCAINA REGISTRAL DE TOLUCAINA REGISTRAL DE TOLUCAINA REGISTRAL DE TOLUCAINA REGISTRAL DE TOLUCA	TARIOSCOMENTARIOSCOMENTARIOSCOMENTARIOSCOMTARIOSCOMENTARIOSCOMENTARIOSCOMENTARIOSCOMTARIOSCOMENTARIOSCOMENTARIOSCOMENTARIOSCOM	4	2015-11-25 12:35:50.141	2015-11-25 12:33:34.071	2015-11-25 12:35:29.39	2015-11-25 12:35:29.39	24	19	TARIOSCOMENTARIOSCOMENTARIOSCOMENTARIOSCOMTARIOSCOMENTARIOSCOMENTARIOSCOMENTARIOSCOMTARIOSCOMENTARIOSCOMENTARIOSCOMENTARIOSCOM	1	t
79	0	24	wqwqwwqwqwwqwqwwqwqw	\N	1	\N	2015-10-23 11:48:35.234	\N	\N	19	19	\N	1	f
75	2	24	rererererer	ativa Remativa Remativa Rem	4	2015-11-24 10:50:00.971	2015-10-23 11:41:58.154	2015-11-18 17:28:42.734	2015-11-18 17:28:42.734	24	19	ativa Remativa Remativa Rem	1	f
83	3	9	543543534543	, fechaFin:params.fechaFin, fechaInicial:params.fechaInicio, unidadDeUsuario:unidadDeUsuario	4	2015-12-01 12:51:03.736	2015-10-30 13:12:01.108	2015-12-01 12:49:37.332	2015-12-01 12:49:37.332	9	12	, fechaFin:params.fechaFin, fechaInicial:params.fechaInicio, unidadDeUsuario:unidadDeUsuario	1	t
66	2	9	wqwq	\N	2	\N	2015-10-16 12:38:18.724	\N	\N	5	5	\N	1	f
84	3	9	rewrewrewre	, fechaFin:params.fechaFin, fechaInicial:params.fechaInicio, unidadDeUsuario:unidadDeUsuario	4	2015-12-01 12:51:20.992	2015-10-30 13:12:17.468	2015-12-01 12:49:43.814	2015-12-01 12:49:43.814	9	12	, fechaFin:params.fechaFin, fechaInicial:params.fechaInicio, unidadDeUsuario:unidadDeUsuario	1	t
97	3	24	UsuarioUnidadAdministrativa	observacion	4	2015-12-01 16:33:06.106	2015-11-25 12:21:57.668	2015-12-01 16:32:05.328	2015-12-01 16:32:05.328	24	19	observacion	1	t
81	3	9	http://localhost:8080/mesaDeAyuda/estadistica/estadistica	, fechaFin:params.fechaFin, fechaInicial:params.fechaInicio, unidadDeUsuario:unidadDeUsuario	4	2015-12-01 12:50:27.411	2015-10-30 13:11:20.577	2015-12-01 12:49:14.052	2015-12-01 12:49:14.052	9	12	, fechaFin:params.fechaFin, fechaInicial:params.fechaInicio, unidadDeUsuario:unidadDeUsuario	1	t
41	4	3	322222222222222222222222222222222222222222222	pruebas	4	2015-10-15 18:46:00.035	2015-10-06 17:41:40.551	2015-10-09 10:26:04.922	2015-10-09 10:26:04.922	3	2	pruebas	1	t
98	3	24	UsuarioUnidadAdministrativa	observacion	4	2015-12-01 16:33:40.346	2015-11-25 12:23:15.139	2015-12-01 16:32:16.168	2015-12-01 16:32:16.168	24	19	observacion	1	t
58	5	2	no enciende equipo	no estaba conectado a la luz electrica	4	2015-10-20 18:46:00.154	2015-04-05 10:25:08	2015-10-15 13:55:06.666	2015-10-15 13:55:06.666	2	2	error de capa 8	1	t
77	4	24	wqwqwwqwqw	    206 | run . . . . . . . .  in home_alara_mesaDeAyuda_grails_app_views_layouts_rt_gsp    206 | run . . . . . . . .  in home_alara_mesaDeAyuda_grails_app_views_layouts_rt_gsp	4	2016-01-14 10:50:00.19	2015-10-23 11:45:53.552	2015-12-15 13:03:14.272	2015-12-15 13:03:14.272	24	19	    206 | run . . . . . . . .  in home_alara_mesaDeAyuda_grails_app_views_layouts_rt_gsp	1	f
96	2	24	SE AGREGO UN CSSE AGREGO UN COMENTARIO AL E AGREGO UN COMENTARIO AL OMENTARIO AL 	\N	2	\N	2015-11-25 12:09:19.467	\N	\N	19	19	\N	1	f
74	4	24	21212121	sadadsa	4	2015-11-04 12:50:01.138	2015-10-23 11:41:42.602	2015-11-04 12:24:52.549	2015-11-04 12:24:52.549	24	19	dsadasdas	1	t
43	1	3	21212121isEmpyisEmpyisEmpyisEmpyisEmpy	\N	2	\N	2015-10-06 17:48:38.265	\N	\N	3	2	\N	1	f
73	3	9	bandejaCasosbandejaCasosbandejaCasos	select distinct(e.observaciones)	4	2015-12-01 10:48:50.144	2015-10-23 11:39:30.296	2015-12-01 10:47:20.26	2015-12-01 10:47:20.26	9	19	select distinct(e.observaciones)	1	t
78	2	24	wqwqwwqwqwwwqwqwqwqw	DE AVISO PREVEN	4	2015-12-01 10:50:00.1	2015-10-23 11:48:18.142	2015-11-25 13:15:50.316	2015-11-25 13:15:50.317	24	19	DE AVISO PREVEN	1	f
94	0	24	CasoCategoriaDelProblema.findByCaso(Caso.get(params.casoId))CasoCategoriaDelProblema.findByCaso(Caso.get(params.casoId))	\N	1	\N	2015-11-25 12:07:19.828	\N	\N	20	20	\N	1	f
103	3	9	OFICINAOFICINAOFICINAOFICINAOFICINA	select distinct(e.observaciones)	4	2015-12-01 10:47:49.123	2015-11-25 18:01:10.958	2015-12-01 10:47:11.823	2015-12-01 10:47:11.823	9	19	select distinct(e.observaciones)	1	t
95	2	24	CasoCategoriaDelProblema.findByCaso(Caso.get(params.casoId))CasoCategoriaDelProblema.findByCaso(Caso.get(params.casoId))	resultado?.casoresultado?.caso	4	2015-11-25 12:17:01.31	2015-11-25 12:07:48.827	2015-11-25 12:13:38.198	2015-11-25 12:13:38.198	24	19	resultado?.casoresultado?.casoresultado?.caso	1	f
99	0	24	fhdsbdfhasdbhasdbdf hdsahdbashd dsadbashdbsajdbsaj	\N	1	\N	2015-11-25 12:32:53.977	\N	\N	20	20	\N	1	f
104	3	9	OFICINAOFICINAOFICINAOFICINAOFICINA	lerema	4	2015-12-01 10:48:12.905	2015-11-25 18:02:09.172	2015-11-30 16:21:16.554	2015-11-30 16:21:16.554	9	19	lerema	1	t
92	3	9	ativa Remativa Remativa Rem	lerema	4	2015-11-30 16:21:49.609	2015-11-18 17:27:52.993	2015-11-30 16:21:25.256	2015-11-30 16:21:25.256	9	19	lerema	1	t
89	7	9	ativa Remativa Rem	resolucionresolucion	4	2015-12-01 09:50:28.521	2015-11-18 17:27:03.754	2015-12-01 09:49:03.825	2015-12-01 09:49:03.825	9	19	resolucionresolucionresolucion	1	t
107	3	9	unidadAdministrativaResponsableunidadAdministrativaResponsableunidadAdministrativaResponsable	107	4	2015-05-01 15:47:00	2015-12-01 13:46:38.228	2015-12-01 13:46:55.415	2015-12-01 13:46:55.415	9	12	107	1	t
106	0	9	212121	\N	1	\N	2015-12-01 13:22:36.373	\N	\N	21	21	\N	1	f
60	1	9	212121	\N	4	\N	2015-08-22 13:25:08	\N	\N	2	2	\N	1	t
63	1	9	212121	\N	4	\N	2015-08-22 13:25:08	\N	\N	5	5	\N	1	t
62	1	9	ewewe	\N	4	2015-01-01 15:25:55	2015-08-22 13:25:08	\N	\N	2	2	\N	1	t
38	5	3	SSASDSDSADSADSDSSDSADSSDSDSADSADSDSSDSADSSDSDSADSADSDSSDSADSSDSDSADSADSDSSDSADSSDSDSADSADSDSSDSADSSDSDSADSADSDSSDSADS SDSDSADSADSDSSDSADSSDSDSADSADSDSSDSADSSDSDSADSADSDSSDSADSSDSDSADSADSDSSDSADS SDSDSADSADSDSSDSADSSSDSDSADSADSDSSDSADS DSDSADSADSDSSDSADS	PROBLEMA: A partir del trámite 4661 el sisteta únicamente ha asignado\r\ntrámites a la calificadora KAREN AZUCENA FLORES GASPAR.	4	2015-10-06 11:21:09.509	2015-07-05 13:25:08	2015-10-06 11:19:59.576	2015-10-06 11:19:59.576	3	2	PROBLEMA: A partir del trámite 4661 el sisteta únicamente ha asignado\r\ntrámites a la calificadora KAREN AZUCENA FLORES GASPAR.	1	t
36	9	3	BUENAS TARDES EL PRESENTE TICKET PROVIENE DE LA OFICINA REGISTRAL DE\r\nTEXCOCO. EL PROBLEMA QUE SE PRESENTA ES CON EL TRAMITE NUMERO 153688 EL\r\nCUAL AL INGRESARLO OCURRIOUN ERROR EN OFICIALIA DE PARTES Y NO LO ASIGNO\r\nA CALIFICADOR. AGRADECIENDO LA ATENCION	se esta realizando una búsqueda de este volumen, en los\r\nrespaldos locales, en cuanto se localice se avisara inmediatamente, para\r\nque continúen con su calificación	4	2015-10-06 10:00:16.384	2015-07-05 13:25:08	2015-10-05 18:23:58.942	2015-10-05 18:23:58.942	3	2	ya se habia resuelto el problema, favor de cerrar el ticket	1	t
40	6	3	dsdsdsd dsdsds 	PROBLEMA: A partir del trámite 4661 el sisteta únicamente ha asignado\r\ntrámites a la calificadora KAREN AZUCENA FLORES GASPAR.	4	2015-10-06 11:26:07.2	2015-07-05 13:25:08	2015-10-06 11:25:26.889	2015-10-06 11:25:26.889	3	2	PROBLEMA: A partir del trámite 4661 el sisteta únicamente ha asignado\r\ntrámites a la calificadora KAREN AZUCENA FLORES GASPAR.	1	t
61	0	9	323232	\N	2	\N	2015-03-22 13:25:08	\N	\N	5	5	\N	1	f
105	3	9	, fechaFin:params.fechaFin, fechaInicial:params.fechaInicio, unidadDeUsuario:unidadDeUsuario, fechaFin:params.fechaFin, fechaInicial:params.fechaInicio, unidadDeUsuario:unidadDeUsuario	, fechaFin:params.fechaFin, fechaInicial:params.fechaInicio, unidadDeUsuario:unidadDeUsuario, fechaFin:params.fechaFin, fechaInicial:params.fechaInicio, unidadDeUsuario:unidadDeUsuario	4	2015-05-01 15:47:00	2015-12-01 12:54:19.098	2015-12-01 12:54:44.671	2015-12-01 12:54:44.671	9	19	, fechaFin:params.fechaFin, fechaInicial:params.fechaInicio, unidadDeUsuario:unidadDeUsuario, fechaFin:params.fechaFin, fechaInicial:params.fechaInicio, unidadDeUsuario:unidadDeUsuario	1	t
51	0	9	456464654645646465464564646546456464654645646465464564646546456464654645646465464564646546456464654645646465464564646546456464654645646465464564646546456464654645646465464564646546	\N	1	\N	2015-04-05 10:25:08	\N	\N	2	2	\N	1	f
44	1	3	2222222222222	\N	2	\N	2015-02-05 11:25:08	\N	\N	3	5	\N	1	f
52	3	3	VELAZQUEZVELAZQUEZVELAZQUEZVELAZQUEZVELAZQUEZVELAZQUEZVELAZQUEZVELAZQUEZVELAZQUEZVELAZQUEZ	 [RemoveSession] Session  [RemoveSession] Session ID m6Nyvh-4LuaccF8XdRTgJClq removida [RemoveSession] Session ID m6	4	2015-10-08 18:17:04.696	2015-04-05 10:25:08	2015-10-08 18:16:18.42	2015-10-08 18:16:18.42	3	11	 [RemoveSession] Session ID m6Nyvh-4LuaccF8XdRTgJClq removida [RemoveSession] Session ID m6Nyvh-4LuaccF8XdRTgJClq] 	1	t
49	9	3	casocasocasocasocasocasocasocasocasocasocasocasocaso	INEA DE CAPTURA IBJD0429492109581295 CORRESPONDIENTE A\r\nUN CERTIFICADO DE GRAVAMENES PARA SU CORRECCION Y REEXPEDICION, APARECE\r\nUN MENSAJE QUE DICE: "OCURRIO UN ERROR Y NO SE L	4	2015-10-07 10:27:23.371	2015-04-05 10:25:08	2015-10-07 10:27:16.916	2015-10-07 10:27:16.916	3	2	INEA DE CAPTURA IBJD0429492109581295 CORRESPONDIENTE A\r\nUN CERTIFICADO DE GRAVAMENES PARA SU CORRECCION Y REEXPEDICION, APARECE\r\nUN MENSAJE QUE DICE: "OCURRIO UN ERROR Y NO SE L	1	t
45	3	3	111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111	\N	4	2015-10-15 18:46:00.05	2015-01-22 13:25:08	\N	\N	2	2	\N	1	t
46	2	3	adjutoadjutoadjutoadjutoadjutoadjutoadjuto	\N	4	2015-10-19 18:46:00.411	2015-01-22 13:25:08	\N	\N	2	2	\N	1	t
47	2	3	4444444	\N	4	2015-10-20 18:46:00.18	2015-01-22 13:25:08	\N	\N	5	5	\N	1	t
54	2	3	println "laCategoriaDelProblema seleccioanada : " + categoria + " tiene campos REQUERIDOS: "  + datosRequeridosprintln "laCategoriaDelProblema seleccioanada : " + categoria + " tiene campos REQUERIDOS: "  + datosRequeridosprintln "laCategoriaDelProblema se	seguimos atendiendo	4	2015-11-30 10:50:00.077	2015-03-22 13:25:08	2015-11-23 13:34:24.239	2015-11-23 13:34:24.239	3	12	en proceso	1	f
53	2	3	, visible:vis, visible:visible, visible:visible, visible:visible, visible:visible, visible:visibleible, visible:visible, visible:visible	en ´proceso	4	2015-11-30 10:50:00.132	2015-03-22 13:25:08	2015-11-23 13:35:28.045	2015-11-23 13:35:28.045	3	12	en proceso	1	f
87	3	9	fdskjfnsdjfnsdjknfdsjnfjsdkfsd	RUBRORUBRORUBRO	4	2015-11-30 12:52:36.293	2015-11-05 11:20:08.616	2015-11-30 12:52:16.001	2015-11-30 12:52:16.001	9	12	RUBRORUBRO	1	t
88	2	11	25132123123123123	, fechaFin:params.fechaFin, fechaInicial:params.fechaInicio, unidadDeUsuario:unidadDeUsuario	4	2015-12-08 10:50:01.198	2015-11-05 11:27:28.916	2015-12-01 12:48:18.355	2015-12-01 12:48:18.355	11	12	, fechaFin:params.fechaFin, fechaInicial:params.fechaInicio, unidadDeUsuario:unidadDeUsuario	1	f
\.


--
-- Data for Name: caso_categoria_del_problema; Type: TABLE DATA; Schema: public; Owner: rt
--

COPY caso_categoria_del_problema (caso_id, categoria_id) FROM stdin;
36	2
37	2
38	3
39	1
40	2
41	2
42	1
43	2
44	2
45	2
46	2
47	2
48	1
49	2
50	2
51	1
52	5
53	14
54	7
55	14
56	13
57	1
58	5
59	21
60	1
61	2
62	2
63	2
64	6
65	3
66	2
67	2
68	1
69	2
70	1
71	3
72	29
73	4
74	2
75	27
76	4
77	2
78	28
79	4
80	5
81	5
82	5
83	5
84	5
85	2
86	1
87	9
88	9
89	2
90	2
91	27
92	27
93	6
94	4
95	4
96	2
97	29
98	29
99	28
100	28
101	29
102	28
103	2
104	2
105	2
106	2
107	6
108	27
109	27
110	27
\.


--
-- Name: caso_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rt
--

SELECT pg_catalog.setval('caso_id_seq', 110, true);


--
-- Data for Name: categoria_del_problema; Type: TABLE DATA; Schema: public; Owner: rt
--

COPY categoria_del_problema (id_categoria, version, activo, descripcion, nombre, unidad_administrativa_responsable_id, prioridad_id) FROM stdin;
2	0	t	POR INTERMITENCIA EL SISTEMA NO GENERA VOLANTE DE ENTRADA DE LOS TRAMITES	EL TRAMITE NO GENERO VOLANTE DE ENTRADA	1	2
1	0	t	EL FOLIO REAL SE ENCUENTRA BLOQUEADO POR TRAMITE	FOLIO REAL BLOQUEADO POR TRAMITE	1	3
3	0	t	PERMITE RESETEAR LA CONTRASEÑA A UNA GENERICA	RESTABLECER CONTRASEÑA	1	4
4	0	t	PERMITE AL USUARIO FINAL COMENTAR SOBRE POSIBLES MEJORAS O PROBLEMAS ENCONTRADOS EN LOS PROCESOS	MEJORA CONTINUA	1	5
5	0	t	CUANDO EL EQUIPO DE COMPUTO NO ENCIENDE	EQUIPO DE COMPUTO - NO ENCIENDE	5	2
6	0	t	CUANDO UN DISPOSITIVO DE ENTRADA/SALIDA NO FUNCIONA(MOUSE, TECLADO, MOTINOR Y DEMAS)	EQUIPO DE COMPUTO - PERIFÉRICO NO FUNCIONA	5	2
7	0	t	AGREGAR UN DISPOSITIVO PERIFÉRICO (ENTRADA/SALIDA)	EQUIPO DE COMPUTO - AGREGAR PERIFERICO	5	3
8	0	t	CUANDO UN EQUIPO VA A CAMBIAR DE LUGAR FISICO	EQUIPO DE COMPUTO - CAMBIO DE LUGAR	5	5
10	0	t	CAMBIAR DE LUGAR FISICO LA IMPRESORA	IMPRESORA - CAMBIO DE LUGAR	5	5
11	0	t	INSTALAR UNA IMPRESORA EN LA UNIDAD SOLICITADA	IMPRESORA - INSTALACIÓN DE IMPRESORA	5	4
12	0	t	PROPORCIONAR EL KIT DE MANTEMIENTO	IMPRESORA - REMPLAZO DE KIT	5	4
13	0	t	VISITA FISICA PARA EL MANTENIMIENTO DE LOS EQUIPOS	IMPRESORA - REVISIÓN Y MANTENIMIENTO	5	5
14	0	t	CUALQUIER OTRO TIPO DE PROBLEMA	IMPRESORA - OTRO	5	4
9	1	t	CUANDO SE QUEDA ATASCADO EL PAPEL Y BLOQUEA LAS IMPRESIONES	IMPRESORA - ATASCO DE PAPEL	5	1
15	0	t	PAGINAS BLOQUEADAS	INTERNET - PAGINAS BLOQUEADAS	5	3
16	0	t	INTERNET - PROBLEMAS AL NAVEGAR EN INTERNET	INTERNET - PROBLEMAS AL NAVEGAR EN INTERNET	5	3
17	0	t	TELEFONÍA - NO ENCIENDE TELEFONO	TELEFONÍA - NO ENCIENDE TELEFONO	5	2
18	0	t	TELEFONÍA - NO SIRVE DIADEMA	TELEFONÍA - NO SIRVE DIADEMA	5	2
19	0	t	TELEFONÍA - CLAVE DE MARCACION NO FUNCIONA	TELEFONÍA - CLAVE DE MARCACION NO FUNCIONA	5	3
20	0	t	TELEFONÍA - INSTALAR DIAMEMA/TELEFONO	TELEFONÍA - INSTALAR DIAMEMA/TELEFONO	5	4
21	0	t	PROGRAMAS - WORD	PROGRAMAS - WORD	5	4
22	0	t	PROGRAMAS - EXCEL	PROGRAMAS - EXCEL	5	4
23	0	t	PROGRAMAS - POWER POINT	PROGRAMAS - POWER POINT	5	4
24	0	t	PROGRAMAS - INSTALAR PROGRAMA	PROGRAMAS - INSTALAR PROGRAMA	5	5
25	0	t	PROGRAMAS - REVISAR SISTEMA OPERATIVO	PROGRAMAS - REVISAR SISTEMA OPERATIVO	5	5
26	0	t	PROGRAMAS - OTROS	PROGRAMAS - OTROS	5	3
27	0	t	UNIDADDEUSUARIO?.UNIDADUNIDADDEUSUARIO?.UNIDADUNIDADDEUSUARIO?.UNIDADUNIDADDEUSUARIO?.UNIDAD	LIMPIAR LINEA DE CAPTURA	1	3
28	0	t	ERRORERRORERRORERRORERRORERRORERRORERRORERRORERRORERROR	HABILITAR AVISO PREVENTIVO	1	2
29	0	t	IMPRESIONIMPRESIONIMPRESIONIMPRESIONIMPRESIONIMPRESIONIMPRESIONIMPRESIONIMPRESION	IMPRESION DE CONSTANCIAS INCOMPLETAS	1	3
30	3	t	ALTADECATEGORIAALTADECALTADECATEGORIAALTADECATEGORIAATEGORIAALTADECATEGORIA	TRAMITES 	1	5
\.


--
-- Name: categoria_del_problema_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rt
--

SELECT pg_catalog.setval('categoria_del_problema_id_seq', 30, true);


--
-- Data for Name: comentario; Type: TABLE DATA; Schema: public; Owner: rt
--

COPY comentario (id_comentario, version, caso_id, fecha_de_comentario, texto_comentario, usuario_id) FROM stdin;
27	0	36	2015-10-05 18:12:53.223	AÑADE LA LINEA DE CAPTURA CORRECTA	2
28	0	36	2015-10-05 18:13:30.975	7878979789SDSDSDSDDSDS	3
29	0	36	2015-10-05 18:22:00.808	XD AUN NO QUEDA 	3
30	0	36	2015-10-05 18:22:36.323	YA QUEDO, FAVOR DE REVISAR BIEN	2
31	0	36	2015-10-05 18:22:54.226	OK, YA QUEDO... ME EQUIVOQUE DE TRAMITE	3
32	0	37	2015-10-06 10:50:01.059	NO EXISTE TU TRAMITE, VERIFICALO!!!!! =)	2
33	0	37	2015-10-06 10:50:51.616	EL TRAMITE CORRECTO ES 21456 CORESPONDIENTE A LA OFICINA DE TOLUCA	3
34	0	37	2015-10-06 10:52:13.631	A UN NO HA QUEDADO EL TRAMITE PERSISTE EL PROBLEMA	3
35	0	38	2015-10-06 11:14:38.339	ESPERAMOS SU VALIDACION .....	2
36	0	38	2015-10-06 11:19:10.004	SE VALIDA PARA LA CONTINUACION DEL TRAMITE... SE CANCELE LOS FOLIOS REALES	6
37	0	40	2015-10-06 11:23:56.753	VALIDACION....	2
38	0	40	2015-10-06 11:24:48.862	AJKSDBDHASBDSAHBDHAS	2
39	0	40	2015-10-06 11:25:04.434	DSDFDSASADFSDFSDFSDFSDFDS	6
40	0	44	2015-10-07 10:24:05.467	BETY	2
41	0	49	2015-10-07 10:24:31.004	BETY CARA DE BETY	2
42	0	49	2015-10-07 10:25:12.104	LISTO	3
43	0	49	2015-10-07 10:26:01.12	ERROR	3
44	0	49	2015-10-07 10:26:14.031	ANEXAR CAPTURA DE PANTALLA	2
45	0	49	2015-10-07 10:26:54.914	IMAGEN ANEXADA	3
46	0	50	2015-10-07 10:45:26.064	ESPERAMOS SU VALIDACION....	2
47	0	50	2015-10-07 10:46:15.136	APROBADO...	6
48	0	55	2015-10-09 10:05:26.148	ESTA MA BHWDFBDBFHDGDSHFVB	12
49	0	55	2015-10-09 10:06:06.211	5465465465465JKHKJHJKHJKGJHGJHGJHGJHGVBJH	9
50	0	56	2015-10-09 11:48:55.515	SALUDOS, ENTIENDO LA DIFICULTAD DE TU PROBLEMA, ¿YA INTENTASTE DESCARGAR POR TORRENT?	10
51	0	56	2015-10-09 13:04:35.012	SI :-( DE HECHO LOS SERVICIOS DE TORRENT ESTAN BLOQUEADOS...ME APARECE UNA PANTALLA FEA.... ESTO ES URGENTE SI NO MUERO HOY \r\n	5
52	0	56	2015-10-09 13:19:53.029	ESTAMOS REVISANDO YA EL PROBLEMA, AL PARECER ALGUIEN HA BLOQUEADO LAS DESCARGAS POR TORRENT TAMBIÉN ?_? LO CUAL ES UNA COMPLETA DESCONSIDERACIÓN EL NO DEJAR VER PELICULAS A LA HORA DEL TRABAJO.	10
53	0	59	2015-10-09 13:28:15.534	SALUDOS, HAS INTENTANDO MIRAR CON LOS OJOS ENTRECERRADOS, A VECES FUNCIONA Y PUEDES VER LAS LETRAS NEGRITAS.	10
54	0	59	2015-10-09 16:23:33.539	JAJAJAJJA OK; ESO SOLUCIONO MI PROBLEMA =)	2
55	0	59	2015-10-12 10:31:17.456	SE REASIGNA TICKET	11
56	0	43	2015-10-12 17:45:24.337	AAA	2
57	0	58	2015-10-15 13:50:46.602	HRTGRTGRGRTGTR	2
58	0	57	2015-10-15 13:56:16.532	JUYJY	2
60	0	41	2015-10-15 18:39:00.026	POR POLITICA DEL MANUAL DE PROCEDIMIENTOS DE LA UNIDAD DE INFORMATICA DEL INSTITUTO DE LA FUNCION REGISTRAL DEL ESTADO DE MEXICO CON CODIGO 202G12000/05, SE CIERRA EL TICKET CON FUNDAMENTO EN LA SIGUIENTE POLITICA: "Si no recibe respuesta de satisfacción después de una semana de haber resuelto el problema, la Unidad de informática, podrá cerrar el ticket"	1
61	0	45	2015-10-15 18:39:00.043	POR POLITICA DEL MANUAL DE PROCEDIMIENTOS DE LA UNIDAD DE INFORMATICA DEL INSTITUTO DE LA FUNCION REGISTRAL DEL ESTADO DE MEXICO CON CODIGO 202G12000/05, SE CIERRA EL TICKET CON FUNDAMENTO EN LA SIGUIENTE POLITICA: "Si no recibe respuesta de satisfacción después de una semana de haber resuelto el problema, la Unidad de informática, podrá cerrar el ticket"	1
62	0	41	2015-10-15 18:46:00.029	POR POLITICA DEL MANUAL DE PROCEDIMIENTOS DE LA UNIDAD DE INFORMATICA DEL INSTITUTO DE LA FUNCION REGISTRAL DEL ESTADO DE MEXICO CON CODIGO 202G12000/05, SE CIERRA EL TICKET CON FUNDAMENTO EN LA SIGUIENTE POLITICA: "Si no recibe respuesta de satisfacción después de una semana de haber resuelto el problema, la Unidad de informática, podrá cerrar el ticket"	1
63	0	45	2015-10-15 18:46:00.048	POR POLITICA DEL MANUAL DE PROCEDIMIENTOS DE LA UNIDAD DE INFORMATICA DEL INSTITUTO DE LA FUNCION REGISTRAL DEL ESTADO DE MEXICO CON CODIGO 202G12000/05, SE CIERRA EL TICKET CON FUNDAMENTO EN LA SIGUIENTE POLITICA: "Si no recibe respuesta de satisfacción después de una semana de haber resuelto el problema, la Unidad de informática, podrá cerrar el ticket"	1
64	0	66	2015-10-16 12:40:49.427	WQWQWWQWQW	2
65	0	46	2015-10-19 18:46:00.281	POR POLITICA DEL MANUAL DE PROCEDIMIENTOS DE LA UNIDAD DE INFORMATICA DEL INSTITUTO DE LA FUNCION REGISTRAL DEL ESTADO DE MEXICO CON CODIGO 202G12000/05, SE CIERRA EL TICKET CON FUNDAMENTO EN LA SIGUIENTE POLITICA: "Si no recibe respuesta de satisfacción después de una semana de haber resuelto el problema, la Unidad de informática, podrá cerrar el ticket"	1
66	0	58	2015-10-20 18:46:00.139	POR POLITICA DEL MANUAL DE PROCEDIMIENTOS DE LA UNIDAD DE INFORMATICA DEL INSTITUTO DE LA FUNCION REGISTRAL DEL ESTADO DE MEXICO CON CODIGO 202G12000/05, SE CIERRA EL TICKET CON FUNDAMENTO EN LA SIGUIENTE POLITICA: "Si no recibe respuesta de satisfacción después de una semana de haber resuelto el problema, la Unidad de informática, podrá cerrar el ticket"	1
67	0	47	2015-10-20 18:46:00.175	POR POLITICA DEL MANUAL DE PROCEDIMIENTOS DE LA UNIDAD DE INFORMATICA DEL INSTITUTO DE LA FUNCION REGISTRAL DEL ESTADO DE MEXICO CON CODIGO 202G12000/05, SE CIERRA EL TICKET CON FUNDAMENTO EN LA SIGUIENTE POLITICA: "Si no recibe respuesta de satisfacción después de una semana de haber resuelto el problema, la Unidad de informática, podrá cerrar el ticket"	1
68	0	67	2015-10-21 18:46:00.576	POR POLITICA DEL MANUAL DE PROCEDIMIENTOS DE LA UNIDAD DE INFORMATICA DEL INSTITUTO DE LA FUNCION REGISTRAL DEL ESTADO DE MEXICO CON CODIGO 202G12000/05, SE CIERRA EL TICKET CON FUNDAMENTO EN LA SIGUIENTE POLITICA: "Si no recibe respuesta de satisfacción después de una semana de haber resuelto el problema, la Unidad de informática, podrá cerrar el ticket"	1
69	0	66	2015-10-29 17:51:40.441	 ID_TEAM_VIEWER          | CHARACTER VARYING(255)      | \r\n SITIO                   | CHARACTER VARYING(255)      | \r\n TELEFONO                | CHARACTER VARYING(255)      | \r\n TIPO_DE_ATENCION        | CHARACTER VARYING(255)      | NOT NULL ID_TEAM_VIEWER          | CHARACTER VARYING(255)      | \r\n SITIO                   | CHARACTER VARYING(255)      | \r\n TELEFONO                | CHARACTER VARYING(255)      | \r\n TIPO_DE_ATENCION        | CHARACTER VARYING(255)      | NOT NULL	9
70	0	74	2015-11-04 12:11:05.978	EWQEQWEWQEWQ	19
71	0	75	2015-11-24 10:50:00.61	POR POLITICA DEL MANUAL DE PROCEDIMIENTOS DE LA UNIDAD DE INFORMATICA DEL INSTITUTO DE LA FUNCION REGISTRAL DEL ESTADO DE MEXICO CON CODIGO 202G12000/05, SE CIERRA EL TICKET CON FUNDAMENTO EN LA SIGUIENTE POLITICA: "Si no recibe respuesta de satisfacción después de una semana de haber resuelto el problema, la Unidad de informática, podrá cerrar el ticket"	1
72	0	71	2015-11-25 11:37:03.811	HTTP://LOCALHOST:8080/MESADEAYUDA/SOLICITUDDECASO/VERCASO?IDCASO=71	19
73	0	71	2015-11-25 11:40:40.859	DIRECTADIRECTADIRECTADIRECTA	9
74	0	71	2015-11-25 11:42:18.067	DIRECTADIRECTADIRECTADIRECTA	9
75	0	71	2015-11-25 11:42:41.99	DIRECTADIRECTADIRECTADIRECTA	9
76	0	71	2015-11-25 11:49:29.921	CREADORCREADORCREADOR	19
77	0	71	2015-11-25 11:50:38.308	DIRECTA?.USUARIOQUESEATIENDEDIRECTA?.USUARIOQUESEATIENDEDIRECTA?.USUARIOQUESEATIENDE	19
78	0	71	2015-11-25 11:52:27.689	DIRECTA?.USUARIOQUESEATIENDEDIRECTA?.USUARIOQDIRECTA?.USUARIOQUESEATIENDEUESEATIENDE	9
79	0	77	2015-11-25 11:58:49.608	${DIRECTA?.DESCRPCIONDELPROBLEMA}${DIRECTA?.DESCRPCIONDELPROBLEMA}${DIRECTA?.DESCRPCIONDELPROBLEMA}	19
80	0	77	2015-11-25 11:59:55.946	TEXT-TRANSFORM: UPPERCASE;TEXT-TRANSFORM: UPPERCASE;TEXT-TRANSFORM: UPPERCASE;	19
81	0	96	2015-11-25 12:09:50.666	SE AGREGO UN COMENTARIO AL SE AGREGO UN COMENTARIO AL SE AGREGO UN COMENTARIO AL SE AGREGO UN COMENTARIO AL 	19
82	0	100	2015-11-25 12:34:28.313	COMENTARIOSCOMENTARIOSCOMENTARIOSCOMENTARIOSCOMENTARIOSCOMENTARIOSCOMENTARIOSCOMENTARIOSCOMENTARIOSCOMENTARIOS	19
83	0	101	2015-11-25 16:56:38.056	HOLA	23
84	0	102	2015-11-25 17:05:43.041	VALICADIOOBNNN BHDWQ	19
85	0	102	2015-11-25 17:06:11.379	SEVALDSAJKDHASUI DSABDHSABDHSBDJAS	23
86	0	89	2015-11-25 17:38:18.096	CASO?.CREADORCASO?.CREADORCASO?.CREADOR	19
87	0	89	2015-11-25 17:38:51.229	CASO?.CREADORCASO?.CREADORCASO?.CREADOR	19
88	0	89	2015-11-25 17:49:07.8	LARE_200@HOTMAIL.COM	19
89	0	89	2015-11-25 17:50:22.718	PROPIETARIOACTUAL?.NOMBREPROPIETARIOACTUAL?.NOMBRE	9
90	0	89	2015-11-25 17:50:49.347	PROPIETARIOACTUAL?.NOMBREPROPIETARIOACTUAL?.NOMBRE	19
91	0	89	2015-11-25 17:58:27.008	CORREODEAREADELCREADORTICKETCORREODEAREADELCREADORTICKET	9
92	0	54	2015-11-30 10:50:00.067	POR POLITICA DEL MANUAL DE PROCEDIMIENTOS DE LA UNIDAD DE INFORMATICA DEL INSTITUTO DE LA FUNCION REGISTRAL DEL ESTADO DE MEXICO CON CODIGO 202G12000/05, SE CIERRA EL TICKET CON FUNDAMENTO EN LA SIGUIENTE POLITICA: "Si no recibe respuesta de satisfacción después de una semana de haber resuelto el problema, la Unidad de informática, podrá cerrar el ticket"	1
93	0	53	2015-11-30 10:50:00.122	POR POLITICA DEL MANUAL DE PROCEDIMIENTOS DE LA UNIDAD DE INFORMATICA DEL INSTITUTO DE LA FUNCION REGISTRAL DEL ESTADO DE MEXICO CON CODIGO 202G12000/05, SE CIERRA EL TICKET CON FUNDAMENTO EN LA SIGUIENTE POLITICA: "Si no recibe respuesta de satisfacción después de una semana de haber resuelto el problema, la Unidad de informática, podrá cerrar el ticket"	1
94	0	78	2015-12-01 10:50:00.09	POR POLITICA DEL MANUAL DE PROCEDIMIENTOS DE LA UNIDAD DE INFORMATICA DEL INSTITUTO DE LA FUNCION REGISTRAL DEL ESTADO DE MEXICO CON CODIGO 202G12000/05, SE CIERRA EL TICKET CON FUNDAMENTO EN LA SIGUIENTE POLITICA: "Si no recibe respuesta de satisfacción después de una semana de haber resuelto el problema, la Unidad de informática, podrá cerrar el ticket"	1
95	0	77	2015-12-01 16:32:48.928	OBSERVACIONOBSERVACION	24
96	0	96	2015-12-01 16:32:58.463	OBSERVACIONOBSERVACION	24
97	0	64	2015-12-08 10:50:00.669	POR POLITICA DEL MANUAL DE PROCEDIMIENTOS DE LA UNIDAD DE INFORMATICA DEL INSTITUTO DE LA FUNCION REGISTRAL DEL ESTADO DE MEXICO CON CODIGO 202G12000/05, SE CIERRA EL TICKET CON FUNDAMENTO EN LA SIGUIENTE POLITICA: "Si no recibe respuesta de satisfacción después de una semana de haber resuelto el problema, la Unidad de informática, podrá cerrar el ticket"	1
98	0	59	2015-12-08 10:50:01.173	POR POLITICA DEL MANUAL DE PROCEDIMIENTOS DE LA UNIDAD DE INFORMATICA DEL INSTITUTO DE LA FUNCION REGISTRAL DEL ESTADO DE MEXICO CON CODIGO 202G12000/05, SE CIERRA EL TICKET CON FUNDAMENTO EN LA SIGUIENTE POLITICA: "Si no recibe respuesta de satisfacción después de una semana de haber resuelto el problema, la Unidad de informática, podrá cerrar el ticket"	1
99	0	88	2015-12-08 10:50:01.196	POR POLITICA DEL MANUAL DE PROCEDIMIENTOS DE LA UNIDAD DE INFORMATICA DEL INSTITUTO DE LA FUNCION REGISTRAL DEL ESTADO DE MEXICO CON CODIGO 202G12000/05, SE CIERRA EL TICKET CON FUNDAMENTO EN LA SIGUIENTE POLITICA: "Si no recibe respuesta de satisfacción después de una semana de haber resuelto el problema, la Unidad de informática, podrá cerrar el ticket"	1
100	0	109	2016-01-13 17:35:41.247	SE ATENDIO FAVOR DE VERIFICAR NUEVAMENTE	19
101	0	109	2016-01-13 17:37:10.61	EL CASO A UN PERSISTE	9
102	0	77	2016-01-14 10:50:00.186	POR POLITICA DEL MANUAL DE PROCEDIMIENTOS DE LA UNIDAD DE INFORMATICA DEL INSTITUTO DE LA FUNCION REGISTRAL DEL ESTADO DE MEXICO CON CODIGO 202G12000/05, SE CIERRA EL TICKET CON FUNDAMENTO EN LA SIGUIENTE POLITICA: "Si no recibe respuesta de satisfacción después de una semana de haber resuelto el problema, la Unidad de informática, podrá cerrar el ticket"	1
\.


--
-- Name: comentario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rt
--

SELECT pg_catalog.setval('comentario_id_seq', 102, true);


--
-- Data for Name: configuracion_de_mesa_de_ayuda; Type: TABLE DATA; Schema: public; Owner: rt
--

COPY configuracion_de_mesa_de_ayuda (id_configuracion, version, dia_de_fin_estadistica, dia_de_inicio_estadistica, dias_para_cierre_de_casos, fundamento_de_cierre, dias_para_cierre_de_encuestas, url_servidor) FROM stdin;
1	0	16	15	5	POR POLITICA DEL MANUAL DE PROCEDIMIENTOS DE LA UNIDAD DE INFORMATICA DEL INSTITUTO DE LA FUNCION REGISTRAL DEL ESTADO DE MEXICO CON CODIGO 202G12000/05, SE CIERRA EL TICKET CON FUNDAMENTO EN LA SIGUIENTE POLITICA: "Si no recibe respuesta de satisfacción después de una semana de haber resuelto el problema, la Unidad de informática, podrá cerrar el ticket"	30	http://10.8.6.144:8080/mesaDeAyuda/
\.


--
-- Name: configuracion_mesa_ayuda_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rt
--

SELECT pg_catalog.setval('configuracion_mesa_ayuda_id_seq', 1, true);


--
-- Name: dato_requerido_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rt
--

SELECT pg_catalog.setval('dato_requerido_id_seq', 33, true);


--
-- Data for Name: datos_requeridos; Type: TABLE DATA; Schema: public; Owner: rt
--

COPY datos_requeridos (id_dato_requerido, version, activo, categoria_id, nombre_campo, obligatorio, tipo_de_dato) FROM stdin;
5	0	t	2	NUMERO DE TRAMITE	t	int
6	0	t	3	USUARIO	t	varchar
7	0	t	3	CORREO ELECTRONICO	t	correo
8	0	t	4	CORREO ELECTRONICO DEL SOLICITANTE	t	correo
4	1	t	2	LINEA DE CAPTURA	t	varchar
3	1	t	1	TRAMITE POR TRABAJAR	t	int
2	1	t	1	TRAMITE QUE BLOQUEA EL FOLIO	f	int
1	2	t	1	FOLIO REAL	f	int
14	0	t	2	TEST	t	int
15	0	t	28	FOLIO REAL ELECTRONICO	t	int
16	0	t	28	TRAMITE DE LA CANCELACIÓN DE AVISO PREVENTIVO	t	int
19	0	t	7	NUMERO DE INVENTARIO	t	int
18	1	t	7	NUMERO DE INVENTARIO	t	varchar
20	1	t	8	NUMERO DE INVENTARIO	t	varchar
21	0	t	5	NUMERO DE INVENTARIO	t	varchar
22	0	t	6	NUMERO DE INVENTARIO	t	varchar
23	0	t	9	NUMERO DE INVENTARIO	t	varchar
25	0	t	10	NUMERO DE INVENTARIO	t	varchar
26	0	t	11	NUMERO DE INVENTARIO	t	varchar
27	0	t	11	MARCA DE IMPRESORA	t	varchar
30	0	t	13	NUMERO DE INVENTARIO	t	varchar
31	0	t	13	MARCA DE IMPRESORA	t	varchar
32	0	t	15	IP DEL EQUIPO	f	varchar
28	1	t	14	NUMERO DE INVENTARIO	t	varchar
24	1	t	9	MARCA DE IMPRESORA	t	impresora
33	0	t	29	TRAMITE	t	int
\.


--
-- Data for Name: encuesta; Type: TABLE DATA; Schema: public; Owner: rt
--

COPY encuesta (id_encuesta, version, amabilidad, caso_id, claridad, contestada_por_sistema, disponibilidad, estado_de_cableado, estado_del_equipo, facilidad_de_uso, fecha, observaciones, rapidez, resolucion, satisfaccion, tiempos_de_respuesta, velocidad) FROM stdin;
8	0	3	69	5	f	4	3	5	2	2015-11-24 13:32:42.366	\N	5	3	5	3	5
9	0	3	85	2	f	4	5	5	3	2015-11-24 13:35:13.958	USUARIO, LE RECUERDO LO IMPORTANTE QUE ES PARA NOSOTROS SU OPINIÓN. SI USTED NO HA CONTESTADO AÚN A LA MISMA LE PIDO QUE POR FAVOR LE DEDIQUE DOS MINUTOS DE SU TIEMP	1	4	5	4	3
10	0	4	70	5	f	4	3	5	2	2015-11-24 13:46:47.518	 RECUERDO LO IMPORTANTE QUE ES PARA NOSOTROS SU OPINIÓN. SI USTED NO HA CONTESTADO AÚN A LA MISMA LE	3	5	5	3	1
11	0	5	62	5	t	5	5	5	5	2015-11-24 14:06:00.027	\N	5	5	5	5	5
12	0	5	37	5	t	5	5	5	5	2015-11-24 14:10:00.027	\N	5	5	5	5	5
13	0	5	65	5	t	5	5	5	5	2015-11-24 14:10:00.036	\N	5	5	5	5	5
14	0	5	50	5	t	5	5	5	5	2015-11-24 14:10:00.045	\N	5	5	5	5	5
15	0	5	55	5	t	5	5	5	5	2015-11-24 14:10:00.053	\N	5	5	5	5	5
16	0	5	41	5	t	5	5	5	5	2015-11-24 14:10:00.061	\N	5	5	5	5	5
17	0	5	58	5	t	5	5	5	5	2015-11-24 14:10:00.068	\N	5	5	5	5	5
18	0	5	38	5	t	5	5	5	5	2015-11-24 14:10:00.079	\N	5	5	5	5	5
19	0	5	36	5	t	5	5	5	5	2015-11-24 14:10:00.086	\N	5	5	5	5	5
20	0	5	40	5	t	5	5	5	5	2015-11-24 14:10:00.094	\N	5	5	5	5	5
21	0	5	52	5	t	5	5	5	5	2015-11-24 14:10:00.101	\N	5	5	5	5	5
22	0	5	49	5	t	5	5	5	5	2015-11-24 14:10:00.108	\N	5	5	5	5	5
23	0	5	45	5	t	5	5	5	5	2015-11-24 14:10:00.116	\N	5	5	5	5	5
24	0	5	46	5	t	5	5	5	5	2015-11-24 14:10:00.123	\N	5	5	5	5	5
25	0	5	47	5	t	5	5	5	5	2015-11-24 14:10:00.131	\N	5	5	5	5	5
26	0	4	72	5	f	5	4	3	4	2015-11-25 11:08:42.136	SI EN UN LAPSO DE 30 DIAS NO HA CONTESTADO LA ENCUESTA, SE DARA POR HECHO QUE ESTA COMPLETAMENTE SATISFECHO CON LOS SERVICIOS PROPORCIONADOS. 	1	4	3	4	4
27	0	5	100	5	f	4	5	5	5	2015-11-25 12:36:02.102		5	5	5	4	5
28	0	4	71	4	f	4	4	4	4	2015-11-25 17:04:19.733		4	4	4	4	4
29	0	4	102	4	f	3	3	3	3	2015-11-25 17:07:50.335		4	4	3	3	3
\.


--
-- Name: encuesta_de_area_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rt
--

SELECT pg_catalog.setval('encuesta_de_area_id_seq', 2, true);


--
-- Data for Name: encuesta_del_area; Type: TABLE DATA; Schema: public; Owner: rt
--

COPY encuesta_del_area (id_encuesta_unidad, version, nombre, unidad_id) FROM stdin;
1	0	PRESTACION DE SERVICIOS DE SOPORTE TECNICO E INFRAESTRUCTURA DE REDES Y COMUNICACION	5
2	0	ENCUESTA DE SATISFACCION	1
\.


--
-- Name: encuesta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rt
--

SELECT pg_catalog.setval('encuesta_id_seq', 29, true);


--
-- Data for Name: estado_del_caso; Type: TABLE DATA; Schema: public; Owner: rt
--

COPY estado_del_caso (id_estado_del_caso, version, nombre) FROM stdin;
1	0	CREADO
2	0	SEGUIMIENTO
4	0	CLONCLUIDO
3	1	ATENDIDO
\.


--
-- Name: estado_del_caso_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rt
--

SELECT pg_catalog.setval('estado_del_caso_id_seq', 4, true);


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: rt
--

SELECT pg_catalog.setval('hibernate_sequence', 30, true);


--
-- Data for Name: observaciones_de_encuesta; Type: TABLE DATA; Schema: public; Owner: rt
--

COPY observaciones_de_encuesta (id_observacion, version, caso_id, fecha, observacion, unidad_id) FROM stdin;
2	0	103	2015-12-01 10:48:02.257	select distinct(e.observaciones)	2
3	0	97	2015-12-01 16:33:25.317	observacionobservacionobservacionobservacionobservacionobservacionobservacionobservacion	2
4	0	98	2015-12-01 16:33:54.145	ta, se dara por hecho que esta completamta, se dara por hecho que esta completamente satisfecho con los servicios proporcionados. \r\nente satisfecho con los servicios proporcionados. \r\n	2
5	0	101	2015-12-01 16:34:32.174	ta, se dara por hecho que esta completamente satisfecho con los serviciosuarsuars propo Regular\r\n Bueno\r\n Excelente\r\nrcionados. \r\n	2
\.


--
-- Name: observaciones_encuesta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rt
--

SELECT pg_catalog.setval('observaciones_encuesta_id_seq', 5, true);


--
-- Name: pregunta_encuesta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rt
--

SELECT pg_catalog.setval('pregunta_encuesta_id_seq', 24, true);


--
-- Data for Name: preguntas_de_encuesta; Type: TABLE DATA; Schema: public; Owner: rt
--

COPY preguntas_de_encuesta (id_pregunta_encuesta, version, activo, encuesta_id, pregunta, rubro_id) FROM stdin;
10	0	t	1	¿EL PERSONAL LE ATENDIÓ CORDIALMENTE AL SOLICITAR EL SERVICIO?	3
11	0	t	1	EL HORARIO DE ATENCIÓN RESPONDE A SUS NECESIDADES	3
12	0	t	1	EL PERSONAL RESPONDE EFICAZMENTE ANTE UNA SOLICITUD DE SERVICIO	3
13	0	t	1	EL TIEMPO DE ESPERA DESDE SU SOLICITUD A SU REALIZACIÓN ES: 	4
14	0	t	1	EL SERVICIO SOLICITADO CUBRE SUS EXPECTATIVAS	4
9	2	t	2	FACILIDAD DE USO	1
15	0	t	2	TIEMPOS DE RESPUESTA	1
16	0	t	2	DISPONIBILIDAD	1
17	0	t	2	SATISFACCIÓN GENERAL	1
19	0	t	2	ESTADO DE CABLEADO DE RED	2
20	0	t	2	VELOCIDAD DE RED	2
21	0	t	2	RAPIDEZ	5
22	0	t	2	AMABILIDAD	5
23	0	t	2	RESOLUCIÓN EN UN TIEMPO APROPIADO	5
24	0	t	2	CLARIDAD DE RESPUESTA	5
8	2	t	2	ESTADO DEL EQUIPO DE COMPUTO	2
\.


--
-- Name: prioridad_del_caso_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rt
--

SELECT pg_catalog.setval('prioridad_del_caso_id_seq', 1, false);


--
-- Data for Name: prioridad_del_problema; Type: TABLE DATA; Schema: public; Owner: rt
--

COPY prioridad_del_problema (id_prioridad, version, descripcion, nombre, tiempo_de_resolucion) FROM stdin;
1	0	CRITICO	CRITICO	2 HORAS
2	0	ALTO	ALTO	6 HORAS
3	0	MEDIO	MEDIO	24 HORAS
4	0	BAJO	BAJO	48 HORAS
5	0	PLANEADO	PLANEADO	PLANEADO
\.


--
-- Name: prioridad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rt
--

SELECT pg_catalog.setval('prioridad_id_seq', 1, false);


--
-- Name: rubro_encuesta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rt
--

SELECT pg_catalog.setval('rubro_encuesta_id_seq', 5, true);


--
-- Data for Name: rubros_de_encuesta; Type: TABLE DATA; Schema: public; Owner: rt
--

COPY rubros_de_encuesta (id_rubro, version, encuesta_id, rubro) FROM stdin;
3	0	1	I. ATENCION
4	0	1	II. SERVICIO
1	0	2	I. SISTEMAS (PORTAL DE PAGOS, SIREM WEB)
2	0	2	II. INFRAESTRUCTURA
5	0	2	III. ATENCION 
\.


--
-- Data for Name: sec_role; Type: TABLE DATA; Schema: public; Owner: rt
--

COPY sec_role (id, version, authority) FROM stdin;
1	0	ROLE_ADMIN
4	0	ROLE_ENLACE
7	1	ROLE_ATENCION
8	1	ROLE_TURNAR
2	0	ROLE_CONSULTA
3	0	ROLE_CONSULTAWIKI
\.


--
-- Data for Name: sec_usuario; Type: TABLE DATA; Schema: public; Owner: rt
--

COPY sec_usuario (id, version, account_expired, account_locked, enabled, password, password_expired, username, class, cargo_id, nombre, email) FROM stdin;
9	4	f	f	t	$2a$10$hXUR1uau9gZ5cPPJwiMgxOlYZL/nbejBcWKxWTOKa92wr/K6GAmre	f	lerma	mx.gob.ifr.rt.Usuario	1	OFICINA REGISTRAL DE LERMA	sincer0052@gmail.com
22	0	f	f	t	$2a$10$Dw8E5TmEo2X0pv7bbDCkS.ib/yodlFL3Fu9OM5mDku5nEN7EE3GmO	f	ecatepec	mx.gob.ifr.rt.Usuario	2	OFICINA REGISTRAL DE ECATEPEC	sincer0052@gmail.com
10	0	f	f	t	$2a$10$QH0uWut6KZu7iACH3n89VOkssi/LwVv7lQDkQ6hPrUAY2g.HkM.MG	f	bruno	mx.gob.ifr.rt.Usuario	1	ING BRUNO VELASQUEZ	alelara25@gmail.com
11	0	f	f	t	$2a$10$9wjhwck7pTLS/hmq6YYlUOfCZqbMj9O8KpPKYtSymUi3yrpwFoBlC	f	neto	mx.gob.ifr.rt.Usuario	1	ING ERNESTO ALABID CARDENAS	alelara25@gmail.com
12	0	f	f	t	$2a$10$BinWdLragJJZhOVEF3BKHuWBth7yuksmOfNGtAR4HrxjQ0fBCVRKG	f	navarrete	mx.gob.ifr.rt.Usuario	1	ING ALEJANDRO NAVARRETE	alelara25@gmail.com
1	0	f	f	t	$2a$10$sQaXc8S6c7nA9/bG5YXnT.CLaDXHxxf4b288bDgfBlIZpKl/FUPn.	f	root	mx.gob.ifr.rt.Usuario	1	ADMINISTRADOR DEL PROCESO	alelara25@gmail.com
6	1	f	f	t	$2a$10$zkFaFmCApEJGjrEdIwI.eOgdRFOVFSTuXdk3/y.wRu4mmvAEILBYO	f	iris	mx.gob.ifr.rt.Usuario	1	IRIS	alelara25@gmail.com
3	1	f	f	t	$2a$10$./SzhEhzpAxNwlxJ4OY55u7Ii9PtApHTXHSN/17HvXrfyaRZivmjC	f	toluca	mx.gob.ifr.rt.Usuario	1	ALEJANDRA PLATA	alelara25@gmail.com
2	1	f	f	t	$2a$10$bb33fu1CLL9IV.xeNhvi4uK6Ak9hOiEcLMn5d8ULFnmHs7v9n879O	f	lrara	mx.gob.ifr.rt.Usuario	1	ALARA	alelara25@gmail.com
5	0	f	f	t	$2a$10$1PL64QNtOtZbe17G20FV5OWMdqJ9MDZtpjCdgde9yvGymRhdC8VU6	f	lraraa	mx.gob.ifr.rt.Usuario	1	BEATRIZ VAZQUEZ GARDUÑO	alelara25@gmail.com
21	1	f	f	t	$2a$10$uRuemz8oMC7mEuTnkeEw5eCqq/dN6Swz0FnxeQDGJ6aeK9H236/9.	f	jesus	mx.gob.ifr.rt.Usuario	1	JESUS VALLEJO SILVA	alelara25@gmail.com
23	1	f	f	t	$2a$10$1S7GCgYgzPhe2KA5wKSe0uJGQ2D5FrD8QQrzBn/oOzv9IobErXBtW	f	fer	mx.gob.ifr.rt.Usuario	1	FERNANDA 	alelara25@gmail.com
24	0	f	f	t	$2a$10$vh8jPl1RLGb.Uid60yj0f.Ou2GbN9QTFPSkTzw.3OxMbVj6VeSUCy	f	plata	mx.gob.ifr.rt.Usuario	2	ALEJANDRA PLATA	alelara25@gmail.com
25	1	f	f	t	$2a$10$7SV9LBBKHWjtXIAeJsQoVurzYteArcJJqNb6Zf8V0eFYLnfqxEwr.	f	123456	mx.gob.ifr.rt.Usuario	1	NAU	alelara25@gmail.com
19	2	f	f	t	$2a$10$mlaeFGPcVYdCeF8ejO0lVOBn4Rmwa302vrkqHXuCG958OtVGG/WNG	f	lara	mx.gob.ifr.rt.Usuario	1	ALE LARA	alelara25@gmail.com
20	1	f	t	f	$2a$10$.V8yVeEAyO6jhjfLOKWYAOq/o50tliB0nsbygu37IX4AMY5qyPZg.	f	bety	mx.gob.ifr.rt.Usuario	1	BETY	alelara25@gmail.com
26	0	f	f	t	$2a$10$FHVfQ6UYsTkMk/0.lfn/.uBXHEJvvfmgd9IJNRbwYBxdSwebzMuUy	f	tenan	mx.gob.ifr.rt.Usuario	2	OFICINA REGISTRAL DE TENANCINGO	sincer0052@gmail.com
28	1	f	f	t	$2a$10$EqQY1.cDu8s/jnH8ppEsQuf25oEm3ji04UkxaoA6TVHUhTG5uEL/O	f	agalicia	mx.gob.ifr.rt.Usuario	1	OFICINA REGISTRAL DE TOLUCA	sincer0052@gmail.com
29	0	f	f	t	$2a$10$jm3kyBMandpZQ6jVBg4eE.UgM2k/Ez/BzAzMIhbadN9Iby.W2F3CK	f	consulta_ler	mx.gob.ifr.rt.Usuario	2	CONSULTA WIKI LERMA	sincer0052@gmail.com
\.


--
-- Data for Name: sec_usuario_sec_role; Type: TABLE DATA; Schema: public; Owner: rt
--

COPY sec_usuario_sec_role (sec_usuario_id, sec_role_id) FROM stdin;
3	4
6	4
9	4
11	7
12	7
19	7
20	7
10	4
24	4
1	8
26	4
21	7
23	4
22	4
25	4
28	4
23	2
29	3
\.


--
-- Data for Name: tipo_de_caso; Type: TABLE DATA; Schema: public; Owner: rt
--

COPY tipo_de_caso (id_tipo_de_caso, version, nombre) FROM stdin;
1	0	TICKET
2	0	LLAMADA
3	0	TEAMVIEWER
\.


--
-- Name: tipo_de_caso_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rt
--

SELECT pg_catalog.setval('tipo_de_caso_id_seq', 3, true);


--
-- Data for Name: topico_de_impresoras; Type: TABLE DATA; Schema: public; Owner: rt
--

COPY topico_de_impresoras (id_impresora, version, marca, modelo, tipo) FROM stdin;
1	1	EPSON	EPSON2077	SCANNER
2	2	HP	SCA504	SCANNER
3	0	HP	METALASER 4700	IMPRESORA
\.


--
-- Name: topico_impresora_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rt
--

SELECT pg_catalog.setval('topico_impresora_id_seq', 3, true);


--
-- Data for Name: unidad_administrativa; Type: TABLE DATA; Schema: public; Owner: rt
--

COPY unidad_administrativa (id_unidad_administrativa, version, clave, nombre, tipo, extension, numero, correo_electronico) FROM stdin;
4	0	OR-07	OFICINA REGISTRAL DE LERMA	OFICINA REGISTRAL	\N	\N	lare_200@hotmail.com
5	1	ST-01	DEPARTAMENTO  DE SOPORTE TECNICO	TECNICA	\N	\N	lare_200@hotmail.com
3	1	DCYSOR	DIRECCION DE CONTROL Y SUPERVISION DE OFICINAS REGISTRALES	DIRECCION	12547, 5745 ,2510	2968745	lare_200@hotmail.com
1	2	0001	DEPARTAMENTO DE DESARROLLO	TECNICA	24014, 25412	2865214	lare_200@hotmail.com
8	0	OR-08	OFICINA REGISTRAL DE NAUCALPAN	OFICINA REGISTRAL	54101	015578541236	lare_200@hotmail.com
6	1	OR-03	OFICINA REGISTRAL DE ECATEPEC	OFICINA REGISTRAL	N/A	558769810	lare_200@hotmail.com
2	2	OR-17	OFICINA REGISTRAL DE TOLUCA	OFICINA REGISTRAL	N/A	n/a	lare_200@hotmail.com
9	0	OR-13	OFICINA REGISTRAL DE TENANCINGO	OFICINA REGISTRAL	54101	1134	lare_200@hotmail.com
\.


--
-- Name: unidad_administrativa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rt
--

SELECT pg_catalog.setval('unidad_administrativa_id_seq', 9, true);


--
-- Data for Name: usuario_unidad_administrativa; Type: TABLE DATA; Schema: public; Owner: rt
--

COPY usuario_unidad_administrativa (usuario_id, unidad_id) FROM stdin;
10	5
11	5
12	5
9	4
19	1
20	1
21	1
22	6
23	3
24	2
25	8
26	9
28	2
29	4
\.


--
-- Data for Name: valor_dato_requerido; Type: TABLE DATA; Schema: public; Owner: rt
--

COPY valor_dato_requerido (id_valor_dato_requerido, version, caso_id, dato_requerido_id, valor) FROM stdin;
68	0	36	4	wqwqw343333333333333333
69	0	36	5	43434
70	0	37	4	sfs22434432432543534565
71	0	37	5	2343434
72	0	38	6	ALELARA_25
73	0	38	7	IKSASASBABS@GMAIL.COM
74	0	39	1	7878
75	0	39	3	787878
76	0	39	2	787878
77	0	40	4	212121
78	0	40	5	1212121212
79	0	41	5	2333333333333333
80	0	41	4	233333333333333333
81	0	42	3	87878
82	0	42	2	
83	0	42	1	7877
84	0	43	5	21212
85	0	43	4	21212
86	0	44	5	2222
87	0	44	4	22222222222222222222222
88	0	45	5	1111111111
89	0	45	4	11111111111111111111111
90	0	46	5	1212
91	0	46	4	qqqqqqqqqqqqqqqqqqqqqqq
92	0	47	5	4444
93	0	47	4	44444444444444444444444
94	0	48	3	212121
95	0	48	2	21212121
96	0	48	1	1212
97	0	49	5	11111
98	0	49	4	11111111111111111111111
99	0	50	5	78787878
100	0	50	4	77777777777777777777777
101	0	51	3	4564564
102	0	51	2	4545545454
103	0	51	1	4546
104	0	57	3	245871
105	0	57	2	245870
106	0	57	1	12548
107	0	60	3	21212
108	0	60	2	212121
109	0	60	1	21212
110	0	61	5	3232
111	0	61	4	2323232
112	0	62	5	7878
113	0	62	4	wewewew
114	0	63	5	21212212
115	0	63	4	21212121222222222222222
116	0	65	7	wqwqwq@kdsajkdnasjda.com
117	0	65	6	wqwqwq
118	0	66	5	2121
119	0	66	4	qwqwwwwwwwwwwwwwwwwwwww
120	0	67	5	222
121	0	67	4	22222222222222222222222
122	0	68	3	212
123	0	68	2	2121
124	0	68	1	21
125	0	69	5	2121
126	0	69	4	2222222222222222222222222
127	0	69	14	21212
128	0	70	3	21212122121
129	0	70	2	21212
130	0	70	1	212121
131	0	71	7	21212@gmmo.com
132	0	71	6	21212
133	0	73	8	lalal@gamil.com
134	0	74	5	21212
135	0	74	4	212121
136	0	74	14	21212
137	0	76	8	alela@gamil.com
138	0	77	5	2121
139	0	77	4	2122222222222222222222222
140	0	77	14	21212
141	0	78	16	212121
142	0	78	15	2121
143	0	79	8	alela@gamil.com
144	0	80	21	31312321
145	0	81	21	312312321
146	0	82	21	5423324
147	0	83	21	534543
148	0	84	21	54534543
149	0	85	5	23132
150	0	85	4	3232333333333333333333333
151	0	85	14	323232
152	0	86	3	32323
153	0	86	2	32323
154	0	86	1	323232
155	0	87	23	458455
156	0	88	23	123456789
157	0	88	24	SCANNER-EPSON-EPSON2077
158	0	89	5	2121
159	0	89	4	2222222222222222222222222
160	0	89	14	212121
161	0	90	5	2121
162	0	90	4	2111111111111111111111111
163	0	90	14	2222
164	0	93	22	452168
165	0	94	8	lare@jumj.com
166	0	95	8	lare@jumj.com
167	0	96	5	2121
168	0	96	4	2121111111111111111111111
169	0	96	14	21212
170	0	99	16	12548
171	0	99	15	78541
172	0	100	16	212121
173	0	100	15	21212
174	0	102	16	8789789
175	0	102	15	788
176	0	103	5	7878
177	0	103	4	7777777777778888888888888
178	0	103	14	787897
179	0	104	5	7878
180	0	104	4	7777777777778888888888888
181	0	104	14	787897
182	0	105	5	2121
183	0	105	4	2222222222222222222222222
184	0	105	14	21212222
185	0	106	5	111
186	0	106	4	2222222222222222222222222
187	0	106	14	212121
188	0	107	22	212121
\.


--
-- Name: valor_dato_requerido_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rt
--

SELECT pg_catalog.setval('valor_dato_requerido_id_seq', 188, true);


--
-- Data for Name: valor_de_pregunta; Type: TABLE DATA; Schema: public; Owner: rt
--

COPY valor_de_pregunta (id_valor_pregunta, version, caso_id, fecha, pregunta_id, valor) FROM stdin;
6	0	87	2015-11-30 14:17:27.605	10	4
7	0	87	2015-11-30 14:17:27.635	11	4
8	0	87	2015-11-30 14:17:27.65	12	4
9	0	87	2015-11-30 14:17:27.658	13	4
10	0	87	2015-11-30 14:17:27.666	14	3
24	0	89	2015-12-01 09:52:54.106	8	5
25	0	89	2015-12-01 09:52:54.15	9	5
26	0	89	2015-12-01 09:52:54.158	15	4
27	0	89	2015-12-01 09:52:54.166	16	4
28	0	89	2015-12-01 09:52:54.174	17	3
29	0	89	2015-12-01 09:52:54.183	19	3
30	0	89	2015-12-01 09:52:54.191	20	5
31	0	89	2015-12-01 09:52:54.199	21	5
32	0	89	2015-12-01 09:52:54.208	22	4
33	0	89	2015-12-01 09:52:54.25	23	3
34	0	89	2015-12-01 09:52:54.258	24	2
35	0	103	2015-12-01 10:48:02.151	8	5
36	0	103	2015-12-01 10:48:02.173	9	5
37	0	103	2015-12-01 10:48:02.181	15	4
38	0	103	2015-12-01 10:48:02.189	16	4
39	0	103	2015-12-01 10:48:02.197	17	5
40	0	103	2015-12-01 10:48:02.206	19	4
41	0	103	2015-12-01 10:48:02.214	20	3
42	0	103	2015-12-01 10:48:02.222	21	2
43	0	103	2015-12-01 10:48:02.231	22	4
44	0	103	2015-12-01 10:48:02.239	23	3
45	0	103	2015-12-01 10:48:02.247	24	4
46	0	104	2015-12-01 10:48:23.014	8	4
47	0	104	2015-12-01 10:48:23.042	9	3
48	0	104	2015-12-01 10:48:23.108	15	4
49	0	104	2015-12-01 10:48:23.21	16	4
50	0	104	2015-12-01 10:48:23.25	17	4
51	0	104	2015-12-01 10:48:23.308	19	4
52	0	104	2015-12-01 10:48:23.376	20	5
53	0	104	2015-12-01 10:48:23.434	21	4
54	0	104	2015-12-01 10:48:23.45	22	4
55	0	104	2015-12-01 10:48:23.458	23	5
56	0	104	2015-12-01 10:48:23.467	24	4
57	0	86	2015-12-01 10:48:43.223	8	2
58	0	86	2015-12-01 10:48:43.252	9	5
59	0	86	2015-12-01 10:48:43.26	15	5
60	0	86	2015-12-01 10:48:43.268	16	5
61	0	86	2015-12-01 10:48:43.277	17	5
62	0	86	2015-12-01 10:48:43.285	19	2
63	0	86	2015-12-01 10:48:43.293	20	2
64	0	86	2015-12-01 10:48:43.302	21	3
65	0	86	2015-12-01 10:48:43.31	22	3
66	0	86	2015-12-01 10:48:43.318	23	3
67	0	86	2015-12-01 10:48:43.327	24	3
68	0	73	2015-12-01 10:49:03.295	8	3
69	0	73	2015-12-01 10:49:03.304	9	2
70	0	73	2015-12-01 10:49:03.313	15	3
71	0	73	2015-12-01 10:49:03.321	16	4
72	0	73	2015-12-01 10:49:03.33	17	4
73	0	73	2015-12-01 10:49:03.337	19	2
74	0	73	2015-12-01 10:49:03.346	20	3
75	0	73	2015-12-01 10:49:03.354	21	2
76	0	73	2015-12-01 10:49:03.363	22	3
77	0	73	2015-12-01 10:49:03.371	23	4
78	0	73	2015-12-01 10:49:03.379	24	2
79	0	80	2015-12-01 12:50:20.97	10	2
80	0	80	2015-12-01 12:50:21.015	11	2
81	0	80	2015-12-01 12:50:21.023	12	2
82	0	80	2015-12-01 12:50:21.032	13	2
83	0	80	2015-12-01 12:50:21.041	14	2
84	0	81	2015-12-01 12:50:33.027	10	3
85	0	81	2015-12-01 12:50:33.059	11	3
86	0	81	2015-12-01 12:50:33.1	12	3
87	0	81	2015-12-01 12:50:33.108	13	3
88	0	81	2015-12-01 12:50:33.116	14	3
89	0	82	2015-12-01 12:50:52.234	10	4
90	0	82	2015-12-01 12:50:52.244	11	4
91	0	82	2015-12-01 12:50:52.252	12	4
92	0	82	2015-12-01 12:50:52.261	13	4
93	0	82	2015-12-01 12:50:52.269	14	4
94	0	83	2015-12-01 12:51:09.035	10	5
95	0	83	2015-12-01 12:51:09.063	11	5
96	0	83	2015-12-01 12:51:09.079	12	5
97	0	83	2015-12-01 12:51:09.087	13	5
98	0	83	2015-12-01 12:51:09.095	14	5
99	0	84	2015-12-01 12:51:29.571	10	5
100	0	84	2015-12-01 12:51:29.718	11	4
101	0	84	2015-12-01 12:51:29.781	12	3
102	0	84	2015-12-01 12:51:29.875	13	2
103	0	84	2015-12-01 12:51:29.94	14	5
104	0	105	2015-12-01 13:59:00.027	9	5
105	0	105	2015-12-01 13:59:00.041	15	5
106	0	105	2015-12-01 13:59:00.042	16	5
107	0	105	2015-12-01 13:59:00.044	17	5
108	0	105	2015-12-01 13:59:00.045	19	5
109	0	105	2015-12-01 13:59:00.047	20	5
110	0	105	2015-12-01 13:59:00.049	21	5
111	0	105	2015-12-01 13:59:00.05	22	5
112	0	105	2015-12-01 13:59:00.052	23	5
113	0	105	2015-12-01 13:59:00.053	24	5
114	0	105	2015-12-01 13:59:00.055	8	5
115	0	107	2015-12-01 13:59:00.063	10	5
116	0	107	2015-12-01 13:59:00.066	11	5
117	0	107	2015-12-01 13:59:00.069	12	5
118	0	107	2015-12-01 13:59:00.071	13	5
119	0	107	2015-12-01 13:59:00.073	14	5
120	0	97	2015-12-01 16:33:25.108	9	5
121	0	97	2015-12-01 16:33:25.183	15	3
122	0	97	2015-12-01 16:33:25.191	16	4
123	0	97	2015-12-01 16:33:25.199	17	5
124	0	97	2015-12-01 16:33:25.208	19	5
125	0	97	2015-12-01 16:33:25.216	20	3
126	0	97	2015-12-01 16:33:25.267	21	5
127	0	97	2015-12-01 16:33:25.275	22	2
128	0	97	2015-12-01 16:33:25.284	23	5
129	0	97	2015-12-01 16:33:25.3	24	2
130	0	97	2015-12-01 16:33:25.308	8	2
131	0	98	2015-12-01 16:33:54.033	9	5
132	0	98	2015-12-01 16:33:54.062	15	2
133	0	98	2015-12-01 16:33:54.07	16	3
134	0	98	2015-12-01 16:33:54.078	17	5
135	0	98	2015-12-01 16:33:54.086	19	5
136	0	98	2015-12-01 16:33:54.095	20	5
137	0	98	2015-12-01 16:33:54.103	21	5
138	0	98	2015-12-01 16:33:54.111	22	4
139	0	98	2015-12-01 16:33:54.12	23	3
140	0	98	2015-12-01 16:33:54.128	24	2
141	0	98	2015-12-01 16:33:54.136	8	5
142	0	101	2015-12-01 16:34:32.072	9	5
143	0	101	2015-12-01 16:34:32.091	15	2
144	0	101	2015-12-01 16:34:32.099	16	3
145	0	101	2015-12-01 16:34:32.108	17	4
146	0	101	2015-12-01 16:34:32.116	19	5
147	0	101	2015-12-01 16:34:32.124	20	4
148	0	101	2015-12-01 16:34:32.132	21	2
149	0	101	2015-12-01 16:34:32.141	22	5
150	0	101	2015-12-01 16:34:32.149	23	2
151	0	101	2015-12-01 16:34:32.157	24	3
152	0	101	2015-12-01 16:34:32.166	8	3
153	0	109	2016-01-13 17:43:52.031	9	5
154	0	109	2016-01-13 17:43:52.088	15	5
155	0	109	2016-01-13 17:43:52.096	16	5
156	0	109	2016-01-13 17:43:52.104	17	5
157	0	109	2016-01-13 17:43:52.112	19	2
158	0	109	2016-01-13 17:43:52.121	20	3
159	0	109	2016-01-13 17:43:52.129	21	2
160	0	109	2016-01-13 17:43:52.138	22	2
161	0	109	2016-01-13 17:43:52.146	23	4
162	0	109	2016-01-13 17:43:52.154	24	3
163	0	109	2016-01-13 17:43:52.163	8	2
\.


--
-- Name: valor_de_pregunta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rt
--

SELECT pg_catalog.setval('valor_de_pregunta_id_seq', 163, true);


--
-- Data for Name: wiki_categoria_del_probema; Type: TABLE DATA; Schema: public; Owner: rt
--

COPY wiki_categoria_del_probema (id, version, categoria_id, texto) FROM stdin;
15	0	28	<p><table class="table table-bordered"><tbody><tr><td>folioRersl</td><td>impreso</td><td>datos</td></tr><tr><td>dsadsahdbsah</td><td>hbsjhbdsah</td><td>bhsabdashdb</td></tr></tbody></table><br></p>
17	0	1	<p><br></p>
14	3	2	<p><ol><li><span style="line-height: 1.42857;">rs are responsive meta components</span><br></li><li><span style="line-height: 1.42857;"> that s<span style="font-weight: bold; font-style: italic; text-decoration: underline;">erve as n</span>avigation h<span style="color: rgb(255, 156, 0);">eaders for your application or site. They b</span></span><br></li><li><span style="line-height: 1.42857;">egin collapsed (and are toggleable) in mobile views and become horizontal </span><br></li><li><span style="line-height: 1.42857;">as the available viewport width increases. We ars are responsive meta components that serve as navigation he</span><br></li><li><span style="line-height: 1.42857; background-color: rgb(255, 0, 0);">aders for your application or site. They begin collapsed (and are toggleable) in mobil</span><br></li></ol></p><p><span style="font-weight: bold; line-height: 1.42857;">e views and become horizontal as th<span style="color: rgb(107, 165, 74);">e available viewport width increases. We</span> a</span><br></p>
18	0	3	<p><ol><li><span style="line-height: 1.42857; color: rgb(49, 24, 115);"> meta components that se</span><span style="line-height: 1.42857;">rve as navigation headers for your application or site. They begin collapsed (and are toggleable) in mobile views and become horizontal as the available viewpo</span><br></li><li><span style="line-height: 1.42857;"> meta components that serve as navigation head</span><span style="line-height: 1.42857; font-weight: bold;">ers for your appl</span><span style="line-height: 1.42857;">ication or site. They begin collapsed (and are toggleable) in mobile views and become horizontal as the available viewpo</span><br></li></ol></p><p> meta components that serve as navigation headers for your application or site. They begin collapsed (and are <span style="background-color: rgb(255, 255, 0);">toggleable) in mobile views and become horizontal as the available v</span>iewpo<br></p>
27	0	8	<p><ul><li><span style="color: rgb(255, 0, 0); line-height: 18.5714px;">SE instala equipo de computo</span></li></ul></p>
16	1	27	<h5><span style="font-weight: normal;"> </span><ul><li style="line-height: 1.8;"><span style="font-weight: normal; line-height: 1.42857;">Verificar el estado del tramite, si este se encuentra calificado como </span><span style="line-height: 1.42857;">rechazado</span><span style="font-weight: normal; line-height: 1.42857;"> y firmado como </span><span style="line-height: 1.42857;">rechazado</span><span style="font-weight: normal; line-height: 1.42857;">, debera ingresar la linea de captura de </span><span style="line-height: 1.42857;">"Salida sin Registro"</span></li></ul><ul><li><span style="line-height: 1.42857; font-weight: normal;">Si el tramite ya cuenta con la linea de captura de </span><span style="line-height: 1.42857;">"Salida sin Registro"</span><span style="font-weight: normal; line-height: 1.42857;">, y aun asi la linea no se puede ocupar en algun otro tramite, se </span><span style="font-weight: normal; line-height: 22.2222px;">procederá</span><span style="font-weight: normal; line-height: 1.42857;"> a levantar el </span><span style="line-height: 1.42857;">Ticket</span></li></ul><ul><li style="line-height: 1.8;"><span style="font-weight: normal; line-height: 1.42857;">Si la linea fue inhabilitada </span><span style="line-height: 1.42857;">MANUALMENTE</span><span style="font-weight: normal; line-height: 1.42857;">, deberá </span><span style="line-height: 1.42857;">ingresar su oficio </span><span style="font-weight: normal; line-height: 1.42857;">a la Dirección de Control y Supervision de Oficinas Registrales </span><span style="line-height: 1.42857;">justificando</span><span style="font-weight: normal; line-height: 1.42857;"> el porque se </span><span style="font-weight: normal; line-height: 1.42857;">Inhabilito</span><span style="font-weight: normal; line-height: 1.42857;"> la Linea de captura y el porqué se quiere </span><span style="font-weight: normal; line-height: 1.42857;">habilitar</span></li></ul></h5><p><span style="font-weight: bold;"><br></span></p>
30	0	15	<p>Obtener IP del equipo</p><p><ol><li><span style="line-height: 1.42857;">Presionar Inicio</span><br></li><li><span style="line-height: 1.42857;">escribir "cmd"</span><br></li><li><span style="line-height: 1.42857;">Una vez abieta la terminal (pantalla negra) ingresar el comando </span><span style="line-height: 1.42857; font-weight: bold;">ipconfig</span><br></li><li><span style="line-height: 1.42857;">anotar la ipv4 </span><span style="line-height: 1.42857; font-weight: bold;">numero.numero.numero.numero</span><br></li></ol><span></span></p>
\.


--
-- Name: adjuntos_de_caso_pkey; Type: CONSTRAINT; Schema: public; Owner: rt; Tablespace: 
--

ALTER TABLE ONLY adjuntos_de_caso
    ADD CONSTRAINT adjuntos_de_caso_pkey PRIMARY KEY (id_adjunto);


--
-- Name: atencion_directa_pkey; Type: CONSTRAINT; Schema: public; Owner: rt; Tablespace: 
--

ALTER TABLE ONLY atencion_directa
    ADD CONSTRAINT atencion_directa_pkey PRIMARY KEY (id_atencion_directa);


--
-- Name: bitacora_de_caso_pkey; Type: CONSTRAINT; Schema: public; Owner: rt; Tablespace: 
--

ALTER TABLE ONLY bitacora_de_caso
    ADD CONSTRAINT bitacora_de_caso_pkey PRIMARY KEY (id_bitacora_de_caso);


--
-- Name: cargo_pkey; Type: CONSTRAINT; Schema: public; Owner: rt; Tablespace: 
--

ALTER TABLE ONLY cargo
    ADD CONSTRAINT cargo_pkey PRIMARY KEY (id_cargo);


--
-- Name: caso_categoria_del_problema_pkey; Type: CONSTRAINT; Schema: public; Owner: rt; Tablespace: 
--

ALTER TABLE ONLY caso_categoria_del_problema
    ADD CONSTRAINT caso_categoria_del_problema_pkey PRIMARY KEY (caso_id, categoria_id);


--
-- Name: caso_pkey; Type: CONSTRAINT; Schema: public; Owner: rt; Tablespace: 
--

ALTER TABLE ONLY caso
    ADD CONSTRAINT caso_pkey PRIMARY KEY (id_caso);


--
-- Name: categoria_del_problema_pkey; Type: CONSTRAINT; Schema: public; Owner: rt; Tablespace: 
--

ALTER TABLE ONLY categoria_del_problema
    ADD CONSTRAINT categoria_del_problema_pkey PRIMARY KEY (id_categoria);


--
-- Name: comentario_pkey; Type: CONSTRAINT; Schema: public; Owner: rt; Tablespace: 
--

ALTER TABLE ONLY comentario
    ADD CONSTRAINT comentario_pkey PRIMARY KEY (id_comentario);


--
-- Name: configuracion_de_mesa_de_ayuda_pkey; Type: CONSTRAINT; Schema: public; Owner: rt; Tablespace: 
--

ALTER TABLE ONLY configuracion_de_mesa_de_ayuda
    ADD CONSTRAINT configuracion_de_mesa_de_ayuda_pkey PRIMARY KEY (id_configuracion);


--
-- Name: datos_requeridos_pkey; Type: CONSTRAINT; Schema: public; Owner: rt; Tablespace: 
--

ALTER TABLE ONLY datos_requeridos
    ADD CONSTRAINT datos_requeridos_pkey PRIMARY KEY (id_dato_requerido);


--
-- Name: encuesta_del_area_pkey; Type: CONSTRAINT; Schema: public; Owner: rt; Tablespace: 
--

ALTER TABLE ONLY encuesta_del_area
    ADD CONSTRAINT encuesta_del_area_pkey PRIMARY KEY (id_encuesta_unidad);


--
-- Name: encuesta_pkey; Type: CONSTRAINT; Schema: public; Owner: rt; Tablespace: 
--

ALTER TABLE ONLY encuesta
    ADD CONSTRAINT encuesta_pkey PRIMARY KEY (id_encuesta);


--
-- Name: estado_del_caso_pkey; Type: CONSTRAINT; Schema: public; Owner: rt; Tablespace: 
--

ALTER TABLE ONLY estado_del_caso
    ADD CONSTRAINT estado_del_caso_pkey PRIMARY KEY (id_estado_del_caso);


--
-- Name: observaciones_de_encuesta_pkey; Type: CONSTRAINT; Schema: public; Owner: rt; Tablespace: 
--

ALTER TABLE ONLY observaciones_de_encuesta
    ADD CONSTRAINT observaciones_de_encuesta_pkey PRIMARY KEY (id_observacion);


--
-- Name: preguntas_de_encuesta_pkey; Type: CONSTRAINT; Schema: public; Owner: rt; Tablespace: 
--

ALTER TABLE ONLY preguntas_de_encuesta
    ADD CONSTRAINT preguntas_de_encuesta_pkey PRIMARY KEY (id_pregunta_encuesta);


--
-- Name: prioridad_del_problema_pkey; Type: CONSTRAINT; Schema: public; Owner: rt; Tablespace: 
--

ALTER TABLE ONLY prioridad_del_problema
    ADD CONSTRAINT prioridad_del_problema_pkey PRIMARY KEY (id_prioridad);


--
-- Name: rubros_de_encuesta_pkey; Type: CONSTRAINT; Schema: public; Owner: rt; Tablespace: 
--

ALTER TABLE ONLY rubros_de_encuesta
    ADD CONSTRAINT rubros_de_encuesta_pkey PRIMARY KEY (id_rubro);


--
-- Name: sec_role_pkey; Type: CONSTRAINT; Schema: public; Owner: rt; Tablespace: 
--

ALTER TABLE ONLY sec_role
    ADD CONSTRAINT sec_role_pkey PRIMARY KEY (id);


--
-- Name: sec_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: rt; Tablespace: 
--

ALTER TABLE ONLY sec_usuario
    ADD CONSTRAINT sec_usuario_pkey PRIMARY KEY (id);


--
-- Name: sec_usuario_sec_role_pkey; Type: CONSTRAINT; Schema: public; Owner: rt; Tablespace: 
--

ALTER TABLE ONLY sec_usuario_sec_role
    ADD CONSTRAINT sec_usuario_sec_role_pkey PRIMARY KEY (sec_usuario_id, sec_role_id);


--
-- Name: tipo_de_caso_pkey; Type: CONSTRAINT; Schema: public; Owner: rt; Tablespace: 
--

ALTER TABLE ONLY tipo_de_caso
    ADD CONSTRAINT tipo_de_caso_pkey PRIMARY KEY (id_tipo_de_caso);


--
-- Name: topico_de_impresoras_pkey; Type: CONSTRAINT; Schema: public; Owner: rt; Tablespace: 
--

ALTER TABLE ONLY topico_de_impresoras
    ADD CONSTRAINT topico_de_impresoras_pkey PRIMARY KEY (id_impresora);


--
-- Name: uk_8bjg9yksja3u7jo6odxrgoxfn; Type: CONSTRAINT; Schema: public; Owner: rt; Tablespace: 
--

ALTER TABLE ONLY categoria_del_problema
    ADD CONSTRAINT uk_8bjg9yksja3u7jo6odxrgoxfn UNIQUE (nombre);


--
-- Name: uk_8k7ft6m8eb8ntcmxke4gt7j07; Type: CONSTRAINT; Schema: public; Owner: rt; Tablespace: 
--

ALTER TABLE ONLY prioridad_del_problema
    ADD CONSTRAINT uk_8k7ft6m8eb8ntcmxke4gt7j07 UNIQUE (nombre);


--
-- Name: uk_9w6jex4u5m3kwfy4kwhud7r17; Type: CONSTRAINT; Schema: public; Owner: rt; Tablespace: 
--

ALTER TABLE ONLY estado_del_caso
    ADD CONSTRAINT uk_9w6jex4u5m3kwfy4kwhud7r17 UNIQUE (nombre);


--
-- Name: uk_ajdj1q254skhgc8efatac20tx; Type: CONSTRAINT; Schema: public; Owner: rt; Tablespace: 
--

ALTER TABLE ONLY cargo
    ADD CONSTRAINT uk_ajdj1q254skhgc8efatac20tx UNIQUE (nombre);


--
-- Name: uk_cv97e04gtgrg55qthg9ngxnnq; Type: CONSTRAINT; Schema: public; Owner: rt; Tablespace: 
--

ALTER TABLE ONLY sec_usuario
    ADD CONSTRAINT uk_cv97e04gtgrg55qthg9ngxnnq UNIQUE (username);


--
-- Name: uk_oah023x2ltqw09mdue7w0mcxb; Type: CONSTRAINT; Schema: public; Owner: rt; Tablespace: 
--

ALTER TABLE ONLY sec_role
    ADD CONSTRAINT uk_oah023x2ltqw09mdue7w0mcxb UNIQUE (authority);


--
-- Name: uk_plgg3arnk3tktaomxw0bif7o; Type: CONSTRAINT; Schema: public; Owner: rt; Tablespace: 
--

ALTER TABLE ONLY tipo_de_caso
    ADD CONSTRAINT uk_plgg3arnk3tktaomxw0bif7o UNIQUE (nombre);


--
-- Name: uk_sxktvk3ougfcohnrk4gq7yw1d; Type: CONSTRAINT; Schema: public; Owner: rt; Tablespace: 
--

ALTER TABLE ONLY wiki_categoria_del_probema
    ADD CONSTRAINT uk_sxktvk3ougfcohnrk4gq7yw1d UNIQUE (categoria_id);


--
-- Name: unidad_administrativa_pkey; Type: CONSTRAINT; Schema: public; Owner: rt; Tablespace: 
--

ALTER TABLE ONLY unidad_administrativa
    ADD CONSTRAINT unidad_administrativa_pkey PRIMARY KEY (id_unidad_administrativa);


--
-- Name: usuario_unidad_administrativa_pkey; Type: CONSTRAINT; Schema: public; Owner: rt; Tablespace: 
--

ALTER TABLE ONLY usuario_unidad_administrativa
    ADD CONSTRAINT usuario_unidad_administrativa_pkey PRIMARY KEY (usuario_id, unidad_id);


--
-- Name: valor_dato_requerido_pkey; Type: CONSTRAINT; Schema: public; Owner: rt; Tablespace: 
--

ALTER TABLE ONLY valor_dato_requerido
    ADD CONSTRAINT valor_dato_requerido_pkey PRIMARY KEY (id_valor_dato_requerido);


--
-- Name: valor_de_pregunta_pkey; Type: CONSTRAINT; Schema: public; Owner: rt; Tablespace: 
--

ALTER TABLE ONLY valor_de_pregunta
    ADD CONSTRAINT valor_de_pregunta_pkey PRIMARY KEY (id_valor_pregunta);


--
-- Name: wiki_categoria_del_probema_pkey; Type: CONSTRAINT; Schema: public; Owner: rt; Tablespace: 
--

ALTER TABLE ONLY wiki_categoria_del_probema
    ADD CONSTRAINT wiki_categoria_del_probema_pkey PRIMARY KEY (id);


--
-- Name: fk_109jywfygdh67q9qvug1uenhm; Type: FK CONSTRAINT; Schema: public; Owner: rt
--

ALTER TABLE ONLY preguntas_de_encuesta
    ADD CONSTRAINT fk_109jywfygdh67q9qvug1uenhm FOREIGN KEY (encuesta_id) REFERENCES encuesta_del_area(id_encuesta_unidad);


--
-- Name: fk_1491snwo0ottqs0avycp8suyd; Type: FK CONSTRAINT; Schema: public; Owner: rt
--

ALTER TABLE ONLY rubros_de_encuesta
    ADD CONSTRAINT fk_1491snwo0ottqs0avycp8suyd FOREIGN KEY (encuesta_id) REFERENCES encuesta_del_area(id_encuesta_unidad);


--
-- Name: fk_256sa5ifsaw53c7wr85mltfi9; Type: FK CONSTRAINT; Schema: public; Owner: rt
--

ALTER TABLE ONLY atencion_directa
    ADD CONSTRAINT fk_256sa5ifsaw53c7wr85mltfi9 FOREIGN KEY (usuario_de_atencion_id) REFERENCES sec_usuario(id);


--
-- Name: fk_2u3shljb4fjneodrf1oibg5fb; Type: FK CONSTRAINT; Schema: public; Owner: rt
--

ALTER TABLE ONLY datos_requeridos
    ADD CONSTRAINT fk_2u3shljb4fjneodrf1oibg5fb FOREIGN KEY (categoria_id) REFERENCES categoria_del_problema(id_categoria);


--
-- Name: fk_3klmmi84so01fdqqsy8v7fl5u; Type: FK CONSTRAINT; Schema: public; Owner: rt
--

ALTER TABLE ONLY caso_categoria_del_problema
    ADD CONSTRAINT fk_3klmmi84so01fdqqsy8v7fl5u FOREIGN KEY (caso_id) REFERENCES caso(id_caso);


--
-- Name: fk_45a9flx3n6btliecyp9ndukky; Type: FK CONSTRAINT; Schema: public; Owner: rt
--

ALTER TABLE ONLY usuario_unidad_administrativa
    ADD CONSTRAINT fk_45a9flx3n6btliecyp9ndukky FOREIGN KEY (unidad_id) REFERENCES unidad_administrativa(id_unidad_administrativa);


--
-- Name: fk_4vqn24fccnuy054b5b4d26rp7; Type: FK CONSTRAINT; Schema: public; Owner: rt
--

ALTER TABLE ONLY observaciones_de_encuesta
    ADD CONSTRAINT fk_4vqn24fccnuy054b5b4d26rp7 FOREIGN KEY (unidad_id) REFERENCES encuesta_del_area(id_encuesta_unidad);


--
-- Name: fk_5s5weikotckeesxgx6btyqggx; Type: FK CONSTRAINT; Schema: public; Owner: rt
--

ALTER TABLE ONLY caso
    ADD CONSTRAINT fk_5s5weikotckeesxgx6btyqggx FOREIGN KEY (tipo_de_caso_id) REFERENCES tipo_de_caso(id_tipo_de_caso);


--
-- Name: fk_5xoe4jkc75mds04s04gkapa11; Type: FK CONSTRAINT; Schema: public; Owner: rt
--

ALTER TABLE ONLY caso
    ADD CONSTRAINT fk_5xoe4jkc75mds04s04gkapa11 FOREIGN KEY (estado_id) REFERENCES estado_del_caso(id_estado_del_caso);


--
-- Name: fk_6bpoba8unscwb9ndakr20ac8x; Type: FK CONSTRAINT; Schema: public; Owner: rt
--

ALTER TABLE ONLY valor_dato_requerido
    ADD CONSTRAINT fk_6bpoba8unscwb9ndakr20ac8x FOREIGN KEY (caso_id) REFERENCES caso(id_caso);


--
-- Name: fk_6qoeq432hepegk9e3xoi27eca; Type: FK CONSTRAINT; Schema: public; Owner: rt
--

ALTER TABLE ONLY caso
    ADD CONSTRAINT fk_6qoeq432hepegk9e3xoi27eca FOREIGN KEY (responsable_id) REFERENCES sec_usuario(id);


--
-- Name: fk_8qmtnsuvd8j8j8nfoejx0j1i7; Type: FK CONSTRAINT; Schema: public; Owner: rt
--

ALTER TABLE ONLY preguntas_de_encuesta
    ADD CONSTRAINT fk_8qmtnsuvd8j8j8nfoejx0j1i7 FOREIGN KEY (rubro_id) REFERENCES rubros_de_encuesta(id_rubro);


--
-- Name: fk_94ooweom0k9mf3ye04f6sh5sb; Type: FK CONSTRAINT; Schema: public; Owner: rt
--

ALTER TABLE ONLY atencion_directa
    ADD CONSTRAINT fk_94ooweom0k9mf3ye04f6sh5sb FOREIGN KEY (categoria_id) REFERENCES categoria_del_problema(id_categoria);


--
-- Name: fk_a24gjhwy7o7j4mfawhvu1u3cv; Type: FK CONSTRAINT; Schema: public; Owner: rt
--

ALTER TABLE ONLY adjuntos_de_caso
    ADD CONSTRAINT fk_a24gjhwy7o7j4mfawhvu1u3cv FOREIGN KEY (caso_id) REFERENCES caso(id_caso);


--
-- Name: fk_a2dy8sg7hbhb5xxkmkvyh9yhy; Type: FK CONSTRAINT; Schema: public; Owner: rt
--

ALTER TABLE ONLY comentario
    ADD CONSTRAINT fk_a2dy8sg7hbhb5xxkmkvyh9yhy FOREIGN KEY (usuario_id) REFERENCES sec_usuario(id);


--
-- Name: fk_ahpjdkxtqo315w5msgmlmcb2a; Type: FK CONSTRAINT; Schema: public; Owner: rt
--

ALTER TABLE ONLY sec_usuario_sec_role
    ADD CONSTRAINT fk_ahpjdkxtqo315w5msgmlmcb2a FOREIGN KEY (sec_usuario_id) REFERENCES sec_usuario(id);


--
-- Name: fk_e8bkjfg9a8q2m80hesdb2r5mx; Type: FK CONSTRAINT; Schema: public; Owner: rt
--

ALTER TABLE ONLY observaciones_de_encuesta
    ADD CONSTRAINT fk_e8bkjfg9a8q2m80hesdb2r5mx FOREIGN KEY (caso_id) REFERENCES caso(id_caso);


--
-- Name: fk_e9gsi109nqmwqa49c2357qidv; Type: FK CONSTRAINT; Schema: public; Owner: rt
--

ALTER TABLE ONLY caso_categoria_del_problema
    ADD CONSTRAINT fk_e9gsi109nqmwqa49c2357qidv FOREIGN KEY (categoria_id) REFERENCES categoria_del_problema(id_categoria);


--
-- Name: fk_gbttibmf4qto3y4pf54j33jb7; Type: FK CONSTRAINT; Schema: public; Owner: rt
--

ALTER TABLE ONLY valor_de_pregunta
    ADD CONSTRAINT fk_gbttibmf4qto3y4pf54j33jb7 FOREIGN KEY (caso_id) REFERENCES caso(id_caso);


--
-- Name: fk_ibnkbf9icudfsmpe5y43d1qyg; Type: FK CONSTRAINT; Schema: public; Owner: rt
--

ALTER TABLE ONLY caso
    ADD CONSTRAINT fk_ibnkbf9icudfsmpe5y43d1qyg FOREIGN KEY (propietario_actual_id) REFERENCES sec_usuario(id);


--
-- Name: fk_iqsxh61egw6werlyk8uq89vtu; Type: FK CONSTRAINT; Schema: public; Owner: rt
--

ALTER TABLE ONLY valor_dato_requerido
    ADD CONSTRAINT fk_iqsxh61egw6werlyk8uq89vtu FOREIGN KEY (dato_requerido_id) REFERENCES datos_requeridos(id_dato_requerido);


--
-- Name: fk_iqwb4rxx1rac5m17mna94rb9y; Type: FK CONSTRAINT; Schema: public; Owner: rt
--

ALTER TABLE ONLY comentario
    ADD CONSTRAINT fk_iqwb4rxx1rac5m17mna94rb9y FOREIGN KEY (caso_id) REFERENCES caso(id_caso);


--
-- Name: fk_jyaumn8fjaqc1d9puqgrel72v; Type: FK CONSTRAINT; Schema: public; Owner: rt
--

ALTER TABLE ONLY valor_de_pregunta
    ADD CONSTRAINT fk_jyaumn8fjaqc1d9puqgrel72v FOREIGN KEY (pregunta_id) REFERENCES preguntas_de_encuesta(id_pregunta_encuesta);


--
-- Name: fk_k9g9hc042ie59qwxxy5rnp0f9; Type: FK CONSTRAINT; Schema: public; Owner: rt
--

ALTER TABLE ONLY sec_usuario
    ADD CONSTRAINT fk_k9g9hc042ie59qwxxy5rnp0f9 FOREIGN KEY (cargo_id) REFERENCES cargo(id_cargo);


--
-- Name: fk_nlqfy4fd283vc8hk9elf4lwdb; Type: FK CONSTRAINT; Schema: public; Owner: rt
--

ALTER TABLE ONLY encuesta_del_area
    ADD CONSTRAINT fk_nlqfy4fd283vc8hk9elf4lwdb FOREIGN KEY (unidad_id) REFERENCES unidad_administrativa(id_unidad_administrativa);


--
-- Name: fk_nnundarqmxwilku175wp14irq; Type: FK CONSTRAINT; Schema: public; Owner: rt
--

ALTER TABLE ONLY categoria_del_problema
    ADD CONSTRAINT fk_nnundarqmxwilku175wp14irq FOREIGN KEY (unidad_administrativa_responsable_id) REFERENCES unidad_administrativa(id_unidad_administrativa);


--
-- Name: fk_nwhkxs56p9e27lyrqdocwdbcr; Type: FK CONSTRAINT; Schema: public; Owner: rt
--

ALTER TABLE ONLY usuario_unidad_administrativa
    ADD CONSTRAINT fk_nwhkxs56p9e27lyrqdocwdbcr FOREIGN KEY (usuario_id) REFERENCES sec_usuario(id);


--
-- Name: fk_pdp3llb3mayk4xol9u7q8r2lo; Type: FK CONSTRAINT; Schema: public; Owner: rt
--

ALTER TABLE ONLY categoria_del_problema
    ADD CONSTRAINT fk_pdp3llb3mayk4xol9u7q8r2lo FOREIGN KEY (prioridad_id) REFERENCES prioridad_del_problema(id_prioridad);


--
-- Name: fk_q2m9484m13w8kgg5a5vrh6ii4; Type: FK CONSTRAINT; Schema: public; Owner: rt
--

ALTER TABLE ONLY encuesta
    ADD CONSTRAINT fk_q2m9484m13w8kgg5a5vrh6ii4 FOREIGN KEY (caso_id) REFERENCES caso(id_caso);


--
-- Name: fk_sgdct0r0ripj2vrnvnigj6nbt; Type: FK CONSTRAINT; Schema: public; Owner: rt
--

ALTER TABLE ONLY sec_usuario_sec_role
    ADD CONSTRAINT fk_sgdct0r0ripj2vrnvnigj6nbt FOREIGN KEY (sec_role_id) REFERENCES sec_role(id);


--
-- Name: fk_snynutookq4dg53eitj3p82hu; Type: FK CONSTRAINT; Schema: public; Owner: rt
--

ALTER TABLE ONLY caso
    ADD CONSTRAINT fk_snynutookq4dg53eitj3p82hu FOREIGN KEY (creador_id) REFERENCES sec_usuario(id);


--
-- Name: fk_sxktvk3ougfcohnrk4gq7yw1d; Type: FK CONSTRAINT; Schema: public; Owner: rt
--

ALTER TABLE ONLY wiki_categoria_del_probema
    ADD CONSTRAINT fk_sxktvk3ougfcohnrk4gq7yw1d FOREIGN KEY (categoria_id) REFERENCES categoria_del_problema(id_categoria);


--
-- Name: fk_tnglat3qh19cqnbfjn396b1hh; Type: FK CONSTRAINT; Schema: public; Owner: rt
--

ALTER TABLE ONLY atencion_directa
    ADD CONSTRAINT fk_tnglat3qh19cqnbfjn396b1hh FOREIGN KEY (unidad_id) REFERENCES unidad_administrativa(id_unidad_administrativa);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

