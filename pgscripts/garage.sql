--
-- PostgreSQL database dump
--


SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 334 (class 2612 OID 16386)
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: postgres
--

CREATE PROCEDURAL LANGUAGE plpgsql;


ALTER PROCEDURAL LANGUAGE plpgsql OWNER TO postgres;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 1524 (class 1259 OID 16410)
-- Dependencies: 1823 1824 1825 1826 1827 1828 1829 3
-- Name: tblclients; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tblclients (
    numclient integer NOT NULL,
    civ character varying(3) DEFAULT NULL::character varying,
    prenom character varying(20) DEFAULT NULL::character varying,
    nom character varying(30) DEFAULT NULL::character varying,
    datenaissance date,
    adresse character varying(30) DEFAULT NULL::character varying,
    numville integer,
    telprof character varying(10) DEFAULT NULL::character varying,
    telpriv character varying(10) DEFAULT NULL::character varying,
    fax character varying(10) DEFAULT NULL::character varying,
    test integer NOT NULL
);


ALTER TABLE public.tblclients OWNER TO postgres;

--
-- TOC entry 1523 (class 1259 OID 16408)
-- Dependencies: 1524 3
-- Name: tblclients_numclient_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tblclients_numclient_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.tblclients_numclient_seq OWNER TO postgres;

--
-- TOC entry 1916 (class 0 OID 0)
-- Dependencies: 1523
-- Name: tblclients_numclient_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tblclients_numclient_seq OWNED BY tblclients.numclient;


--
-- TOC entry 1917 (class 0 OID 0)
-- Dependencies: 1523
-- Name: tblclients_numclient_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tblclients_numclient_seq', 1, false);


--
-- TOC entry 1541 (class 1259 OID 16999)
-- Dependencies: 1524 3
-- Name: tblclients_test_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tblclients_test_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.tblclients_test_seq OWNER TO postgres;

--
-- TOC entry 1918 (class 0 OID 0)
-- Dependencies: 1541
-- Name: tblclients_test_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tblclients_test_seq OWNED BY tblclients.test;


--
-- TOC entry 1919 (class 0 OID 0)
-- Dependencies: 1541
-- Name: tblclients_test_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tblclients_test_seq', 22, true);


--
-- TOC entry 1540 (class 1259 OID 16547)
-- Dependencies: 1852 3
-- Name: tblcompetences; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tblcompetences (
    nummodele integer NOT NULL,
    numemploye integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.tblcompetences OWNER TO postgres;

--
-- TOC entry 1539 (class 1259 OID 16545)
-- Dependencies: 1540 3
-- Name: tblcompetences_nummodele_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tblcompetences_nummodele_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.tblcompetences_nummodele_seq OWNER TO postgres;

--
-- TOC entry 1920 (class 0 OID 0)
-- Dependencies: 1539
-- Name: tblcompetences_nummodele_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tblcompetences_nummodele_seq OWNED BY tblcompetences.nummodele;


--
-- TOC entry 1921 (class 0 OID 0)
-- Dependencies: 1539
-- Name: tblcompetences_nummodele_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tblcompetences_nummodele_seq', 1, false);


--
-- TOC entry 1526 (class 1259 OID 16431)
-- Dependencies: 1832 1833 1834 1835 3
-- Name: tblemployes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tblemployes (
    numemploye integer NOT NULL,
    civ character varying(5) DEFAULT NULL::character varying,
    nom character varying(25) DEFAULT NULL::character varying,
    prenom character varying(25) DEFAULT NULL::character varying,
    categorie character varying(10) DEFAULT NULL::character varying,
    salaire numeric
);


ALTER TABLE public.tblemployes OWNER TO postgres;

--
-- TOC entry 1525 (class 1259 OID 16429)
-- Dependencies: 1526 3
-- Name: tblemployes_numemploye_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tblemployes_numemploye_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.tblemployes_numemploye_seq OWNER TO postgres;

--
-- TOC entry 1922 (class 0 OID 0)
-- Dependencies: 1525
-- Name: tblemployes_numemploye_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tblemployes_numemploye_seq OWNED BY tblemployes.numemploye;


--
-- TOC entry 1923 (class 0 OID 0)
-- Dependencies: 1525
-- Name: tblemployes_numemploye_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tblemployes_numemploye_seq', 7, true);


--
-- TOC entry 1528 (class 1259 OID 16447)
-- Dependencies: 1837 3
-- Name: tblindisponibilites; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tblindisponibilites (
    numindispo integer NOT NULL,
    numemploye integer,
    typeindispo character varying(20) DEFAULT NULL::character varying,
    debindispo date,
    finindispo date
);


ALTER TABLE public.tblindisponibilites OWNER TO postgres;

--
-- TOC entry 1527 (class 1259 OID 16445)
-- Dependencies: 1528 3
-- Name: tblindisponibilites_numindispo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tblindisponibilites_numindispo_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.tblindisponibilites_numindispo_seq OWNER TO postgres;

--
-- TOC entry 1924 (class 0 OID 0)
-- Dependencies: 1527
-- Name: tblindisponibilites_numindispo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tblindisponibilites_numindispo_seq OWNED BY tblindisponibilites.numindispo;


--
-- TOC entry 1925 (class 0 OID 0)
-- Dependencies: 1527
-- Name: tblindisponibilites_numindispo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tblindisponibilites_numindispo_seq', 1, false);


--
-- TOC entry 1538 (class 1259 OID 16524)
-- Dependencies: 1850 3
-- Name: tblintervenants; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tblintervenants (
    numintervention integer NOT NULL,
    numemploye integer DEFAULT 0 NOT NULL,
    debut date,
    fin date
);


ALTER TABLE public.tblintervenants OWNER TO postgres;

--
-- TOC entry 1537 (class 1259 OID 16522)
-- Dependencies: 3 1538
-- Name: tblintervenants_numintervention_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tblintervenants_numintervention_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.tblintervenants_numintervention_seq OWNER TO postgres;

--
-- TOC entry 1926 (class 0 OID 0)
-- Dependencies: 1537
-- Name: tblintervenants_numintervention_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tblintervenants_numintervention_seq OWNED BY tblintervenants.numintervention;


--
-- TOC entry 1927 (class 0 OID 0)
-- Dependencies: 1537
-- Name: tblintervenants_numintervention_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tblintervenants_numintervention_seq', 1, false);


--
-- TOC entry 1536 (class 1259 OID 16509)
-- Dependencies: 1848 3
-- Name: tblinterventions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tblinterventions (
    numintervention integer NOT NULL,
    numvehicule integer,
    typeintervention character(3) DEFAULT NULL::bpchar,
    debinterv date,
    fininterv date,
    kmvehicule integer
);


ALTER TABLE public.tblinterventions OWNER TO postgres;

--
-- TOC entry 1535 (class 1259 OID 16507)
-- Dependencies: 1536 3
-- Name: tblinterventions_numintervention_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tblinterventions_numintervention_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.tblinterventions_numintervention_seq OWNER TO postgres;

--
-- TOC entry 1928 (class 0 OID 0)
-- Dependencies: 1535
-- Name: tblinterventions_numintervention_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tblinterventions_numintervention_seq OWNED BY tblinterventions.numintervention;


--
-- TOC entry 1929 (class 0 OID 0)
-- Dependencies: 1535
-- Name: tblinterventions_numintervention_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tblinterventions_numintervention_seq', 1, false);


--
-- TOC entry 1530 (class 1259 OID 16456)
-- Dependencies: 1839 1840 3
-- Name: tblmarques; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tblmarques (
    nummarque integer NOT NULL,
    marque character varying(20) DEFAULT NULL::character varying,
    nationalite character varying(15) DEFAULT NULL::character varying
);


ALTER TABLE public.tblmarques OWNER TO postgres;

--
-- TOC entry 1529 (class 1259 OID 16454)
-- Dependencies: 3 1530
-- Name: tblmarques_nummarque_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tblmarques_nummarque_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.tblmarques_nummarque_seq OWNER TO postgres;

--
-- TOC entry 1930 (class 0 OID 0)
-- Dependencies: 1529
-- Name: tblmarques_nummarque_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tblmarques_nummarque_seq OWNED BY tblmarques.nummarque;


--
-- TOC entry 1931 (class 0 OID 0)
-- Dependencies: 1529
-- Name: tblmarques_nummarque_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tblmarques_nummarque_seq', 1, false);


--
-- TOC entry 1532 (class 1259 OID 16468)
-- Dependencies: 1842 3
-- Name: tblmodeles; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tblmodeles (
    nummodele integer NOT NULL,
    nummarque integer,
    modele character varying(25) DEFAULT NULL::character varying
);


ALTER TABLE public.tblmodeles OWNER TO postgres;

--
-- TOC entry 1531 (class 1259 OID 16466)
-- Dependencies: 3 1532
-- Name: tblmodeles_nummodele_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tblmodeles_nummodele_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.tblmodeles_nummodele_seq OWNER TO postgres;

--
-- TOC entry 1932 (class 0 OID 0)
-- Dependencies: 1531
-- Name: tblmodeles_nummodele_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tblmodeles_nummodele_seq OWNED BY tblmodeles.nummodele;


--
-- TOC entry 1933 (class 0 OID 0)
-- Dependencies: 1531
-- Name: tblmodeles_nummodele_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tblmodeles_nummodele_seq', 1, false);


--
-- TOC entry 1534 (class 1259 OID 16484)
-- Dependencies: 1844 1845 1846 3
-- Name: tblvehicules; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tblvehicules (
    numvehicule integer NOT NULL,
    numclient integer DEFAULT 0,
    nummodele integer DEFAULT 0,
    numimmat character varying(9) DEFAULT NULL::character varying,
    annee integer
);


ALTER TABLE public.tblvehicules OWNER TO postgres;

--
-- TOC entry 1533 (class 1259 OID 16482)
-- Dependencies: 1534 3
-- Name: tblvehicules_numvehicule_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tblvehicules_numvehicule_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.tblvehicules_numvehicule_seq OWNER TO postgres;

--
-- TOC entry 1934 (class 0 OID 0)
-- Dependencies: 1533
-- Name: tblvehicules_numvehicule_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tblvehicules_numvehicule_seq OWNED BY tblvehicules.numvehicule;


--
-- TOC entry 1935 (class 0 OID 0)
-- Dependencies: 1533
-- Name: tblvehicules_numvehicule_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tblvehicules_numvehicule_seq', 1, false);


--
-- TOC entry 1522 (class 1259 OID 16398)
-- Dependencies: 1820 1821 3
-- Name: tblvilles; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tblvilles (
    numville integer NOT NULL,
    codpost character varying(5) DEFAULT NULL::character varying,
    ville character varying(25) DEFAULT NULL::character varying
);


ALTER TABLE public.tblvilles OWNER TO postgres;

--
-- TOC entry 1521 (class 1259 OID 16396)
-- Dependencies: 1522 3
-- Name: tblvilles_numville_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tblvilles_numville_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.tblvilles_numville_seq OWNER TO postgres;

--
-- TOC entry 1936 (class 0 OID 0)
-- Dependencies: 1521
-- Name: tblvilles_numville_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tblvilles_numville_seq OWNED BY tblvilles.numville;


--
-- TOC entry 1937 (class 0 OID 0)
-- Dependencies: 1521
-- Name: tblvilles_numville_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tblvilles_numville_seq', 1, false);


--
-- TOC entry 1822 (class 2604 OID 16413)
-- Dependencies: 1524 1523 1524
-- Name: numclient; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE tblclients ALTER COLUMN numclient SET DEFAULT nextval('tblclients_numclient_seq'::regclass);


--
-- TOC entry 1830 (class 2604 OID 17001)
-- Dependencies: 1541 1524
-- Name: test; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE tblclients ALTER COLUMN test SET DEFAULT nextval('tblclients_test_seq'::regclass);


--
-- TOC entry 1851 (class 2604 OID 16550)
-- Dependencies: 1539 1540 1540
-- Name: nummodele; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE tblcompetences ALTER COLUMN nummodele SET DEFAULT nextval('tblcompetences_nummodele_seq'::regclass);


--
-- TOC entry 1831 (class 2604 OID 16434)
-- Dependencies: 1525 1526 1526
-- Name: numemploye; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE tblemployes ALTER COLUMN numemploye SET DEFAULT nextval('tblemployes_numemploye_seq'::regclass);


--
-- TOC entry 1836 (class 2604 OID 16450)
-- Dependencies: 1527 1528 1528
-- Name: numindispo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE tblindisponibilites ALTER COLUMN numindispo SET DEFAULT nextval('tblindisponibilites_numindispo_seq'::regclass);


--
-- TOC entry 1849 (class 2604 OID 16527)
-- Dependencies: 1538 1537 1538
-- Name: numintervention; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE tblintervenants ALTER COLUMN numintervention SET DEFAULT nextval('tblintervenants_numintervention_seq'::regclass);


--
-- TOC entry 1847 (class 2604 OID 16512)
-- Dependencies: 1535 1536 1536
-- Name: numintervention; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE tblinterventions ALTER COLUMN numintervention SET DEFAULT nextval('tblinterventions_numintervention_seq'::regclass);


--
-- TOC entry 1838 (class 2604 OID 16459)
-- Dependencies: 1530 1529 1530
-- Name: nummarque; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE tblmarques ALTER COLUMN nummarque SET DEFAULT nextval('tblmarques_nummarque_seq'::regclass);


--
-- TOC entry 1841 (class 2604 OID 16471)
-- Dependencies: 1531 1532 1532
-- Name: nummodele; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE tblmodeles ALTER COLUMN nummodele SET DEFAULT nextval('tblmodeles_nummodele_seq'::regclass);


--
-- TOC entry 1843 (class 2604 OID 16487)
-- Dependencies: 1533 1534 1534
-- Name: numvehicule; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE tblvehicules ALTER COLUMN numvehicule SET DEFAULT nextval('tblvehicules_numvehicule_seq'::regclass);


--
-- TOC entry 1819 (class 2604 OID 16401)
-- Dependencies: 1521 1522 1522
-- Name: numville; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE tblvilles ALTER COLUMN numville SET DEFAULT nextval('tblvilles_numville_seq'::regclass);


--
-- TOC entry 1902 (class 0 OID 16410)
-- Dependencies: 1524
-- Data for Name: tblclients; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tblclients (numclient, civ, prenom, nom, datenaissance, adresse, numville, telprof, telpriv, fax, test) VALUES (2, 'Mme', 'Josianne', 'BALASKO', '1955-12-31', '307, rue Calme', 3, '0562467849', '0561392487', NULL, 1);
INSERT INTO tblclients (numclient, civ, prenom, nom, datenaissance, adresse, numville, telprof, telpriv, fax, test) VALUES (3, 'Mle', 'Juliette', 'BINOCHE', '1955-12-31', '148, Av  des Planches', 8, '0523894562', '0619430945', '0562784254', 2);
INSERT INTO tblclients (numclient, civ, prenom, nom, datenaissance, adresse, numville, telprof, telpriv, fax, test) VALUES (4, 'Mle', 'Isabelle', 'ADJANI', '1955-06-27', '23, rue du Port', 10, '0634613493', '0562529463', NULL, 3);
INSERT INTO tblclients (numclient, civ, prenom, nom, datenaissance, adresse, numville, telprof, telpriv, fax, test) VALUES (7, 'Mle', 'Julia', 'ROBERTS', '1967-10-28', '92, chemin du Touch', 1, '0562935427', '0561486203', NULL, 4);
INSERT INTO tblclients (numclient, civ, prenom, nom, datenaissance, adresse, numville, telprof, telpriv, fax, test) VALUES (11, 'Mle', 'Romane', 'BOHRINGER', NULL, '66, rue Descartes', 20, '0645983165', '0562014784', NULL, 5);
INSERT INTO tblclients (numclient, civ, prenom, nom, datenaissance, adresse, numville, telprof, telpriv, fax, test) VALUES (12, 'Mme', 'Sophie', 'MARCEAU', '1966-11-17', '13, av de Provence', 8, '0561374812', '0561277013', NULL, 6);
INSERT INTO tblclients (numclient, civ, prenom, nom, datenaissance, adresse, numville, telprof, telpriv, fax, test) VALUES (14, 'M.', 'Jean-Hugues', 'ANGLADE', NULL, '10, place Jeanne D''Arc', 2, '0561033663', '0561484259', NULL, 7);
INSERT INTO tblclients (numclient, civ, prenom, nom, datenaissance, adresse, numville, telprof, telpriv, fax, test) VALUES (15, 'M.', 'Daniel', 'AUTEUIL', '1950-06-24', '1, rue de la Sauvegarde', 19, '0561390288', NULL, '0562375849', 8);
INSERT INTO tblclients (numclient, civ, prenom, nom, datenaissance, adresse, numville, telprof, telpriv, fax, test) VALUES (16, 'M.', 'Michel', 'BLANC', NULL, '89, place de la Nation', 1, '0639939410', '0561255412', NULL, 9);
INSERT INTO tblclients (numclient, civ, prenom, nom, datenaissance, adresse, numville, telprof, telpriv, fax, test) VALUES (17, 'M.', 'Alain', 'CHABAT', '1958-11-24', '33, route des sciences', 5, '0561439256', '0561473625', NULL, 10);
INSERT INTO tblclients (numclient, civ, prenom, nom, datenaissance, adresse, numville, telprof, telpriv, fax, test) VALUES (18, 'M.', 'Georges', 'CLOONEY', '1961-05-06', '15, place Dupuy', 4, '0562349254', '0561294268', NULL, 11);
INSERT INTO tblclients (numclient, civ, prenom, nom, datenaissance, adresse, numville, telprof, telpriv, fax, test) VALUES (19, 'Mme', 'Marie-Anne', 'CHAZEL', NULL, '94, rue des saltimbanques', 2, '0506271459', '0506294186', NULL, 12);
INSERT INTO tblclients (numclient, civ, prenom, nom, datenaissance, adresse, numville, telprof, telpriv, fax, test) VALUES (21, 'M.', 'Alain', 'DELON', '1935-11-08', '5, rue d''Indochine', 14, '0561824538', '0561326179', NULL, 13);
INSERT INTO tblclients (numclient, civ, prenom, nom, datenaissance, adresse, numville, telprof, telpriv, fax, test) VALUES (22, 'M.', 'Gérard', 'DEPARDIEU', NULL, '77, chemin du Touch', 10, '0562379513', NULL, '0562493627', 14);
INSERT INTO tblclients (numclient, civ, prenom, nom, datenaissance, adresse, numville, telprof, telpriv, fax, test) VALUES (1, 'Mme', 'Carole', 'BOUQUET', '1957-08-08', '8, Bd de la ramée', 4, '0561381813', '0562458714', NULL, 15);
INSERT INTO tblclients (numclient, civ, prenom, nom, datenaissance, adresse, numville, telprof, telpriv, fax, test) VALUES (5, 'Mme', 'Fanny', 'ARDANT', '1949-03-22', '46, place du marché', 13, '0562757834', NULL, '0562757843', 16);
INSERT INTO tblclients (numclient, civ, prenom, nom, datenaissance, adresse, numville, telprof, telpriv, fax, test) VALUES (6, 'Mme', 'Emmanuelle', 'BÉART', '1965-08-14', '31, Bd de la Ramée', 6, '0561243967', '0561401836', NULL, 17);
INSERT INTO tblclients (numclient, civ, prenom, nom, datenaissance, adresse, numville, telprof, telpriv, fax, test) VALUES (8, 'Mme', 'Kim', 'BASSINGER', '1963-12-08', '27, Bd de la Ramée', 5, '0561038500', NULL, '0562466733', 18);
INSERT INTO tblclients (numclient, civ, prenom, nom, datenaissance, adresse, numville, telprof, telpriv, fax, test) VALUES (9, 'Mle', 'Cameron', 'DIAZ', '1972-08-30', '164, rue du téméraire', 4, '0561024358', NULL, NULL, 19);
INSERT INTO tblclients (numclient, civ, prenom, nom, datenaissance, adresse, numville, telprof, telpriv, fax, test) VALUES (10, 'Mme', 'Miou', 'MIOU', '1950-02-20', '102, rue de la République', 3, '0562939495', '0561218456', NULL, 20);
INSERT INTO tblclients (numclient, civ, prenom, nom, datenaissance, adresse, numville, telprof, telpriv, fax, test) VALUES (13, 'Mme', 'Isabelle', 'HUPPERT', NULL, '36, av de l''église', 23, '0647092453', '0562442700', NULL, 21);
INSERT INTO tblclients (numclient, civ, prenom, nom, datenaissance, adresse, numville, telprof, telpriv, fax, test) VALUES (20, 'M.', 'Christian', 'CLAVIER', NULL, '148, allée du ponant', 24, NULL, '0561358279', NULL, 22);


--
-- TOC entry 1910 (class 0 OID 16547)
-- Dependencies: 1540
-- Data for Name: tblcompetences; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tblcompetences (nummodele, numemploye) VALUES (6, 53);
INSERT INTO tblcompetences (nummodele, numemploye) VALUES (9, 53);
INSERT INTO tblcompetences (nummodele, numemploye) VALUES (19, 53);
INSERT INTO tblcompetences (nummodele, numemploye) VALUES (21, 53);
INSERT INTO tblcompetences (nummodele, numemploye) VALUES (2, 56);
INSERT INTO tblcompetences (nummodele, numemploye) VALUES (6, 56);
INSERT INTO tblcompetences (nummodele, numemploye) VALUES (17, 56);
INSERT INTO tblcompetences (nummodele, numemploye) VALUES (25, 56);
INSERT INTO tblcompetences (nummodele, numemploye) VALUES (4, 58);
INSERT INTO tblcompetences (nummodele, numemploye) VALUES (15, 58);
INSERT INTO tblcompetences (nummodele, numemploye) VALUES (16, 58);
INSERT INTO tblcompetences (nummodele, numemploye) VALUES (24, 58);
INSERT INTO tblcompetences (nummodele, numemploye) VALUES (3, 59);
INSERT INTO tblcompetences (nummodele, numemploye) VALUES (8, 59);
INSERT INTO tblcompetences (nummodele, numemploye) VALUES (12, 59);
INSERT INTO tblcompetences (nummodele, numemploye) VALUES (19, 59);
INSERT INTO tblcompetences (nummodele, numemploye) VALUES (6, 61);
INSERT INTO tblcompetences (nummodele, numemploye) VALUES (10, 61);
INSERT INTO tblcompetences (nummodele, numemploye) VALUES (26, 61);
INSERT INTO tblcompetences (nummodele, numemploye) VALUES (7, 62);
INSERT INTO tblcompetences (nummodele, numemploye) VALUES (11, 62);
INSERT INTO tblcompetences (nummodele, numemploye) VALUES (14, 62);
INSERT INTO tblcompetences (nummodele, numemploye) VALUES (22, 62);
INSERT INTO tblcompetences (nummodele, numemploye) VALUES (28, 62);
INSERT INTO tblcompetences (nummodele, numemploye) VALUES (5, 65);
INSERT INTO tblcompetences (nummodele, numemploye) VALUES (6, 65);
INSERT INTO tblcompetences (nummodele, numemploye) VALUES (13, 65);
INSERT INTO tblcompetences (nummodele, numemploye) VALUES (23, 65);
INSERT INTO tblcompetences (nummodele, numemploye) VALUES (5, 67);
INSERT INTO tblcompetences (nummodele, numemploye) VALUES (9, 67);
INSERT INTO tblcompetences (nummodele, numemploye) VALUES (20, 67);
INSERT INTO tblcompetences (nummodele, numemploye) VALUES (3, 69);
INSERT INTO tblcompetences (nummodele, numemploye) VALUES (23, 69);


--
-- TOC entry 1903 (class 0 OID 16431)
-- Dependencies: 1526
-- Data for Name: tblemployes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tblemployes (numemploye, civ, nom, prenom, categorie, salaire) VALUES (53, 'M.', 'LELAC', 'Clément', 'Mécano', 2500);
INSERT INTO tblemployes (numemploye, civ, nom, prenom, categorie, salaire) VALUES (54, 'M.', 'FAUST-PAZEN', 'Hervé', 'Assistant', 2500);
INSERT INTO tblemployes (numemploye, civ, nom, prenom, categorie, salaire) VALUES (55, 'Mle', 'SURPLACE', 'Cloé', 'Assistant', 1200);
INSERT INTO tblemployes (numemploye, civ, nom, prenom, categorie, salaire) VALUES (56, 'Mme', 'MATELOT', 'Zoé', 'Mécano', 1200);
INSERT INTO tblemployes (numemploye, civ, nom, prenom, categorie, salaire) VALUES (57, 'Mle', 'D''OLERON', 'Marie-Reine', 'Assistant', 1300);
INSERT INTO tblemployes (numemploye, civ, nom, prenom, categorie, salaire) VALUES (58, 'M.', 'TORINQUE', 'Rony', 'Mécano', 2130);
INSERT INTO tblemployes (numemploye, civ, nom, prenom, categorie, salaire) VALUES (60, 'M.', 'OCECOURGE', 'Benoit', 'Assistant', 1500);
INSERT INTO tblemployes (numemploye, civ, nom, prenom, categorie, salaire) VALUES (61, 'M.', 'CISSEULMAN', 'José', 'Mécano', 2310);
INSERT INTO tblemployes (numemploye, civ, nom, prenom, categorie, salaire) VALUES (62, 'M.', 'PATRY', 'Honoré', 'Mécano', 2400);
INSERT INTO tblemployes (numemploye, civ, nom, prenom, categorie, salaire) VALUES (63, 'Mle', 'LAFILO', 'Sophie', 'Assistant', 1300);
INSERT INTO tblemployes (numemploye, civ, nom, prenom, categorie, salaire) VALUES (64, 'Mme', 'SONVIEUPOR', 'Marcelle', 'Assistant', 1400);
INSERT INTO tblemployes (numemploye, civ, nom, prenom, categorie, salaire) VALUES (65, 'Mle', 'SONAYLET', 'Martine', 'Mécano', 2400);
INSERT INTO tblemployes (numemploye, civ, nom, prenom, categorie, salaire) VALUES (66, 'M.', 'VOIDEDON', 'Rémy', 'Assistant', 1350);
INSERT INTO tblemployes (numemploye, civ, nom, prenom, categorie, salaire) VALUES (67, 'Mle', 'OCTET', 'Mégane', 'Mécano', 2500);
INSERT INTO tblemployes (numemploye, civ, nom, prenom, categorie, salaire) VALUES (68, 'M.', 'ONERET', 'Patrick', 'Assistant', 1400);
INSERT INTO tblemployes (numemploye, civ, nom, prenom, categorie, salaire) VALUES (69, 'M.', 'PLASME', 'Hector', 'Mécano', 2600);
INSERT INTO tblemployes (numemploye, civ, nom, prenom, categorie, salaire) VALUES (71, 'M.', 'MENVUSSA', 'Gérard', 'Mécano', 2300);
INSERT INTO tblemployes (numemploye, civ, nom, prenom, categorie, salaire) VALUES (59, 'Mle', 'PECHALA', 'Line', 'Mécano', 2150);
INSERT INTO tblemployes (numemploye, civ, nom, prenom, categorie, salaire) VALUES (72, 'M.', 'Dinissié', 'Denis', 'Assistant', 1700);


--
-- TOC entry 1904 (class 0 OID 16447)
-- Dependencies: 1528
-- Data for Name: tblindisponibilites; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tblindisponibilites (numindispo, numemploye, typeindispo, debindispo, finindispo) VALUES (1, 53, 'Congé', '2010-02-22', '2010-02-26');
INSERT INTO tblindisponibilites (numindispo, numemploye, typeindispo, debindispo, finindispo) VALUES (2, 54, 'Congé', '2010-03-05', '2010-03-05');
INSERT INTO tblindisponibilites (numindispo, numemploye, typeindispo, debindispo, finindispo) VALUES (3, 54, 'Formation', '2010-03-15', '2010-03-17');
INSERT INTO tblindisponibilites (numindispo, numemploye, typeindispo, debindispo, finindispo) VALUES (4, 57, 'Congé', '2010-02-22', '2010-02-23');
INSERT INTO tblindisponibilites (numindispo, numemploye, typeindispo, debindispo, finindispo) VALUES (5, 57, 'Congé', '2010-03-08', '2010-03-09');
INSERT INTO tblindisponibilites (numindispo, numemploye, typeindispo, debindispo, finindispo) VALUES (6, 57, 'Congé', '2010-03-22', '2010-03-23');
INSERT INTO tblindisponibilites (numindispo, numemploye, typeindispo, debindispo, finindispo) VALUES (7, 58, 'Congé', '2010-03-08', '2010-03-12');
INSERT INTO tblindisponibilites (numindispo, numemploye, typeindispo, debindispo, finindispo) VALUES (8, 61, 'Congé', '2010-04-02', '2010-04-02');
INSERT INTO tblindisponibilites (numindispo, numemploye, typeindispo, debindispo, finindispo) VALUES (9, 61, 'Congé', '2010-06-21', '2010-07-02');
INSERT INTO tblindisponibilites (numindispo, numemploye, typeindispo, debindispo, finindispo) VALUES (10, 63, 'Congé', '2010-07-15', '2010-07-30');
INSERT INTO tblindisponibilites (numindispo, numemploye, typeindispo, debindispo, finindispo) VALUES (11, 64, 'Congé', '2010-05-14', '2010-05-14');
INSERT INTO tblindisponibilites (numindispo, numemploye, typeindispo, debindispo, finindispo) VALUES (12, 65, 'Congé', '2010-05-14', '2010-05-14');
INSERT INTO tblindisponibilites (numindispo, numemploye, typeindispo, debindispo, finindispo) VALUES (13, 67, 'Congé', '2010-04-12', '2010-04-16');
INSERT INTO tblindisponibilites (numindispo, numemploye, typeindispo, debindispo, finindispo) VALUES (14, 67, 'Congé', '2010-07-15', '2010-07-16');
INSERT INTO tblindisponibilites (numindispo, numemploye, typeindispo, debindispo, finindispo) VALUES (15, 68, 'Formation', '2010-03-15', '2010-03-17');
INSERT INTO tblindisponibilites (numindispo, numemploye, typeindispo, debindispo, finindispo) VALUES (16, 68, 'Congé', '2010-05-14', '2010-05-21');
INSERT INTO tblindisponibilites (numindispo, numemploye, typeindispo, debindispo, finindispo) VALUES (17, 69, 'Formation', '2010-03-29', '2010-04-02');
INSERT INTO tblindisponibilites (numindispo, numemploye, typeindispo, debindispo, finindispo) VALUES (18, 69, 'Congé', '2010-04-06', '2010-04-09');
INSERT INTO tblindisponibilites (numindispo, numemploye, typeindispo, debindispo, finindispo) VALUES (19, 66, 'Formation', '2010-02-25', '2010-03-03');


--
-- TOC entry 1909 (class 0 OID 16524)
-- Dependencies: 1538
-- Data for Name: tblintervenants; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tblintervenants (numintervention, numemploye, debut, fin) VALUES (1, 54, '2010-02-26', '2010-02-26');
INSERT INTO tblintervenants (numintervention, numemploye, debut, fin) VALUES (1, 59, '2010-02-25', '2010-02-25');
INSERT INTO tblintervenants (numintervention, numemploye, debut, fin) VALUES (2, 57, '2010-02-24', '2010-02-24');
INSERT INTO tblintervenants (numintervention, numemploye, debut, fin) VALUES (3, 60, '2010-04-09', '2010-04-09');
INSERT INTO tblintervenants (numintervention, numemploye, debut, fin) VALUES (3, 65, '2010-04-06', '2010-04-08');
INSERT INTO tblintervenants (numintervention, numemploye, debut, fin) VALUES (4, 62, '2010-05-14', '2010-05-14');
INSERT INTO tblintervenants (numintervention, numemploye, debut, fin) VALUES (4, 66, '2010-02-14', '2010-05-14');
INSERT INTO tblintervenants (numintervention, numemploye, debut, fin) VALUES (5, 56, '2010-02-22', '2010-02-25');
INSERT INTO tblintervenants (numintervention, numemploye, debut, fin) VALUES (5, 60, '2010-02-23', '2010-02-25');
INSERT INTO tblintervenants (numintervention, numemploye, debut, fin) VALUES (6, 53, '2010-03-03', '2010-03-04');
INSERT INTO tblintervenants (numintervention, numemploye, debut, fin) VALUES (6, 57, '2010-03-04', '2010-03-04');
INSERT INTO tblintervenants (numintervention, numemploye, debut, fin) VALUES (7, 55, '2010-04-09', '2010-04-09');
INSERT INTO tblintervenants (numintervention, numemploye, debut, fin) VALUES (7, 65, '2010-04-09', '2010-04-09');
INSERT INTO tblintervenants (numintervention, numemploye, debut, fin) VALUES (8, 54, '2010-05-12', '2010-05-12');
INSERT INTO tblintervenants (numintervention, numemploye, debut, fin) VALUES (8, 62, '2010-05-11', '2010-05-12');
INSERT INTO tblintervenants (numintervention, numemploye, debut, fin) VALUES (9, 59, '2010-02-22', '2010-02-22');
INSERT INTO tblintervenants (numintervention, numemploye, debut, fin) VALUES (9, 60, '2010-02-22', '2010-02-22');
INSERT INTO tblintervenants (numintervention, numemploye, debut, fin) VALUES (10, 63, '2010-04-09', '2010-04-09');
INSERT INTO tblintervenants (numintervention, numemploye, debut, fin) VALUES (10, 67, '2010-04-08', '2010-04-09');
INSERT INTO tblintervenants (numintervention, numemploye, debut, fin) VALUES (11, 59, '2010-03-09', '2010-03-11');
INSERT INTO tblintervenants (numintervention, numemploye, debut, fin) VALUES (11, 64, '2010-03-09', '2010-03-17');
INSERT INTO tblintervenants (numintervention, numemploye, debut, fin) VALUES (11, 53, '2010-03-08', '2010-03-16');
INSERT INTO tblintervenants (numintervention, numemploye, debut, fin) VALUES (12, 55, '2010-05-05', '2010-05-05');
INSERT INTO tblintervenants (numintervention, numemploye, debut, fin) VALUES (12, 56, '2010-05-03', '2010-05-05');
INSERT INTO tblintervenants (numintervention, numemploye, debut, fin) VALUES (13, 64, '2010-05-12', '2010-05-12');
INSERT INTO tblintervenants (numintervention, numemploye, debut, fin) VALUES (2, 60, '2010-02-23', '2010-02-24');


--
-- TOC entry 1908 (class 0 OID 16509)
-- Dependencies: 1536
-- Data for Name: tblinterventions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tblinterventions (numintervention, numvehicule, typeintervention, debinterv, fininterv, kmvehicule) VALUES (1, 3, 'EN ', '2010-02-25', '2010-02-26', 102735);
INSERT INTO tblinterventions (numintervention, numvehicule, typeintervention, debinterv, fininterv, kmvehicule) VALUES (2, 21, 'EN ', '2010-02-23', '2010-02-24', 124682);
INSERT INTO tblinterventions (numintervention, numvehicule, typeintervention, debinterv, fininterv, kmvehicule) VALUES (3, 25, 'RN ', '2010-04-06', '2010-04-09', 13108);
INSERT INTO tblinterventions (numintervention, numvehicule, typeintervention, debinterv, fininterv, kmvehicule) VALUES (4, 10, 'EN ', '2010-05-14', '2010-05-14', 987);
INSERT INTO tblinterventions (numintervention, numvehicule, typeintervention, debinterv, fininterv, kmvehicule) VALUES (5, 6, 'RN ', '2010-02-22', '2010-02-25', 31450);
INSERT INTO tblinterventions (numintervention, numvehicule, typeintervention, debinterv, fininterv, kmvehicule) VALUES (6, 14, 'EN ', '2010-03-03', '2010-03-04', 46721);
INSERT INTO tblinterventions (numintervention, numvehicule, typeintervention, debinterv, fininterv, kmvehicule) VALUES (7, 1, 'EN ', '2010-04-09', '2010-04-09', 55649);
INSERT INTO tblinterventions (numintervention, numvehicule, typeintervention, debinterv, fininterv, kmvehicule) VALUES (8, 17, 'EN ', '2010-05-11', '2010-05-12', 15204);
INSERT INTO tblinterventions (numintervention, numvehicule, typeintervention, debinterv, fininterv, kmvehicule) VALUES (9, 22, 'EN ', '2010-02-22', '2010-02-22', 7960);
INSERT INTO tblinterventions (numintervention, numvehicule, typeintervention, debinterv, fininterv, kmvehicule) VALUES (10, 2, 'ERN', '2010-04-08', '2010-04-09', 83674);
INSERT INTO tblinterventions (numintervention, numvehicule, typeintervention, debinterv, fininterv, kmvehicule) VALUES (11, 28, 'RN ', '2010-03-08', '2010-03-17', 7237);
INSERT INTO tblinterventions (numintervention, numvehicule, typeintervention, debinterv, fininterv, kmvehicule) VALUES (12, 20, 'ERN', '2010-05-03', '2010-05-05', 52582);
INSERT INTO tblinterventions (numintervention, numvehicule, typeintervention, debinterv, fininterv, kmvehicule) VALUES (13, 8, 'NS ', '2010-05-12', '2010-05-12', 17846);
INSERT INTO tblinterventions (numintervention, numvehicule, typeintervention, debinterv, fininterv, kmvehicule) VALUES (14, 1, 'RN ', '2010-05-10', '2010-05-12', 60103);
INSERT INTO tblinterventions (numintervention, numvehicule, typeintervention, debinterv, fininterv, kmvehicule) VALUES (15, 20, 'NS ', '2010-06-25', '2010-06-25', 55948);


--
-- TOC entry 1905 (class 0 OID 16456)
-- Dependencies: 1530
-- Data for Name: tblmarques; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tblmarques (nummarque, marque, nationalite) VALUES (1, 'LAMBORGHINI', 'ITALIE');
INSERT INTO tblmarques (nummarque, marque, nationalite) VALUES (2, 'AUDI', 'ALLEMAGNE');
INSERT INTO tblmarques (nummarque, marque, nationalite) VALUES (3, 'ROLLS-ROYCE', 'GRANDE-BRETAGNE');
INSERT INTO tblmarques (nummarque, marque, nationalite) VALUES (4, 'BMW', 'ALLEMAGNE');
INSERT INTO tblmarques (nummarque, marque, nationalite) VALUES (5, 'CADILLAC', 'ETATS-UNIS');
INSERT INTO tblmarques (nummarque, marque, nationalite) VALUES (6, 'CHRYSLER', 'ETATS-UNIS');
INSERT INTO tblmarques (nummarque, marque, nationalite) VALUES (7, 'FERRARI', 'ITALIE');
INSERT INTO tblmarques (nummarque, marque, nationalite) VALUES (8, 'HONDA', 'JAPON');
INSERT INTO tblmarques (nummarque, marque, nationalite) VALUES (9, 'JAGUAR', 'GRANDE-BRETAGNE');
INSERT INTO tblmarques (nummarque, marque, nationalite) VALUES (10, 'ALFA-ROMEO', 'ITALIE');
INSERT INTO tblmarques (nummarque, marque, nationalite) VALUES (11, 'LEXUS', 'JAPON');
INSERT INTO tblmarques (nummarque, marque, nationalite) VALUES (12, 'LOTUS', 'GRANDE-BRETAGNE');
INSERT INTO tblmarques (nummarque, marque, nationalite) VALUES (13, 'MASERATI', 'ITALIE');
INSERT INTO tblmarques (nummarque, marque, nationalite) VALUES (14, 'MERCEDES', 'ALLEMAGNE');
INSERT INTO tblmarques (nummarque, marque, nationalite) VALUES (15, 'PEUGEOT', 'FRANCE');
INSERT INTO tblmarques (nummarque, marque, nationalite) VALUES (16, 'PORSCHE', 'ALLEMAGNE');
INSERT INTO tblmarques (nummarque, marque, nationalite) VALUES (17, 'RENAULT', 'FRANCE');
INSERT INTO tblmarques (nummarque, marque, nationalite) VALUES (18, 'SAAB', 'SUÈDE');
INSERT INTO tblmarques (nummarque, marque, nationalite) VALUES (19, 'TOYOTA', 'JAPON');
INSERT INTO tblmarques (nummarque, marque, nationalite) VALUES (20, 'VENTURI', 'FRANCE');
INSERT INTO tblmarques (nummarque, marque, nationalite) VALUES (21, 'VOLVO', 'SUÈDE');


--
-- TOC entry 1906 (class 0 OID 16468)
-- Dependencies: 1532
-- Data for Name: tblmodeles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tblmodeles (nummodele, nummarque, modele) VALUES (2, 1, 'Diablo');
INSERT INTO tblmodeles (nummodele, nummarque, modele) VALUES (3, 2, 'Série 5');
INSERT INTO tblmodeles (nummodele, nummarque, modele) VALUES (4, 10, 'NSX');
INSERT INTO tblmodeles (nummodele, nummarque, modele) VALUES (5, 14, 'Classe C');
INSERT INTO tblmodeles (nummodele, nummarque, modele) VALUES (6, 17, 'Safrane');
INSERT INTO tblmodeles (nummodele, nummarque, modele) VALUES (7, 20, '400 GT');
INSERT INTO tblmodeles (nummodele, nummarque, modele) VALUES (8, 12, 'Esprit');
INSERT INTO tblmodeles (nummodele, nummarque, modele) VALUES (9, 15, '605');
INSERT INTO tblmodeles (nummodele, nummarque, modele) VALUES (10, 19, 'Prévia');
INSERT INTO tblmodeles (nummodele, nummarque, modele) VALUES (11, 7, '550 Maranello');
INSERT INTO tblmodeles (nummodele, nummarque, modele) VALUES (12, 3, 'Bentley-Continental');
INSERT INTO tblmodeles (nummodele, nummarque, modele) VALUES (13, 10, 'Spider');
INSERT INTO tblmodeles (nummodele, nummarque, modele) VALUES (14, 13, 'Evoluzione');
INSERT INTO tblmodeles (nummodele, nummarque, modele) VALUES (15, 16, 'Carrera');
INSERT INTO tblmodeles (nummodele, nummarque, modele) VALUES (16, 16, 'Boxter');
INSERT INTO tblmodeles (nummodele, nummarque, modele) VALUES (17, 21, 'S 80');
INSERT INTO tblmodeles (nummodele, nummarque, modele) VALUES (18, 6, '300 M');
INSERT INTO tblmodeles (nummodele, nummarque, modele) VALUES (19, 4, 'M 3');
INSERT INTO tblmodeles (nummodele, nummarque, modele) VALUES (20, 9, 'XJ 8');
INSERT INTO tblmodeles (nummodele, nummarque, modele) VALUES (21, 15, '406 Coupé');
INSERT INTO tblmodeles (nummodele, nummarque, modele) VALUES (22, 20, '300 Atlantic');
INSERT INTO tblmodeles (nummodele, nummarque, modele) VALUES (23, 14, 'Classe E');
INSERT INTO tblmodeles (nummodele, nummarque, modele) VALUES (24, 11, 'GS 300');
INSERT INTO tblmodeles (nummodele, nummarque, modele) VALUES (25, 5, 'Séville');
INSERT INTO tblmodeles (nummodele, nummarque, modele) VALUES (26, 18, '95 Cabriolet');
INSERT INTO tblmodeles (nummodele, nummarque, modele) VALUES (27, 2, 'TT Coupé');
INSERT INTO tblmodeles (nummodele, nummarque, modele) VALUES (28, 7, 'F 355');


--
-- TOC entry 1907 (class 0 OID 16484)
-- Dependencies: 1534
-- Data for Name: tblvehicules; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tblvehicules (numvehicule, numclient, nummodele, numimmat, annee) VALUES (1, 2, 6, '6784XY31', 1992);
INSERT INTO tblvehicules (numvehicule, numclient, nummodele, numimmat, annee) VALUES (2, 9, 20, '659YT31', 1993);
INSERT INTO tblvehicules (numvehicule, numclient, nummodele, numimmat, annee) VALUES (3, 17, 8, '9243VF31', 1987);
INSERT INTO tblvehicules (numvehicule, numclient, nummodele, numimmat, annee) VALUES (4, 6, 12, '398AAH31', 1998);
INSERT INTO tblvehicules (numvehicule, numclient, nummodele, numimmat, annee) VALUES (5, 16, 23, '5307ZZ31', 1998);
INSERT INTO tblvehicules (numvehicule, numclient, nummodele, numimmat, annee) VALUES (6, 20, 6, '3853XF31', 1997);
INSERT INTO tblvehicules (numvehicule, numclient, nummodele, numimmat, annee) VALUES (7, 7, 8, '945AAA31', 1998);
INSERT INTO tblvehicules (numvehicule, numclient, nummodele, numimmat, annee) VALUES (8, 16, 14, '8365VZ31', 1986);
INSERT INTO tblvehicules (numvehicule, numclient, nummodele, numimmat, annee) VALUES (9, 13, 15, '3087YX31', 1992);
INSERT INTO tblvehicules (numvehicule, numclient, nummodele, numimmat, annee) VALUES (10, 20, 22, '941ABA31', 1999);
INSERT INTO tblvehicules (numvehicule, numclient, nummodele, numimmat, annee) VALUES (11, 9, 16, '1572AAL31', 1998);
INSERT INTO tblvehicules (numvehicule, numclient, nummodele, numimmat, annee) VALUES (12, 14, 20, '6025ZS31', 1997);
INSERT INTO tblvehicules (numvehicule, numclient, nummodele, numimmat, annee) VALUES (13, 19, 17, '5205ZA31', 1997);
INSERT INTO tblvehicules (numvehicule, numclient, nummodele, numimmat, annee) VALUES (14, 22, 21, '754XD31', 1992);
INSERT INTO tblvehicules (numvehicule, numclient, nummodele, numimmat, annee) VALUES (15, 4, 19, '6254ABA31', 1999);
INSERT INTO tblvehicules (numvehicule, numclient, nummodele, numimmat, annee) VALUES (16, 16, 21, '98ZF31', 1997);
INSERT INTO tblvehicules (numvehicule, numclient, nummodele, numimmat, annee) VALUES (17, 12, 11, '456RD31', 1976);
INSERT INTO tblvehicules (numvehicule, numclient, nummodele, numimmat, annee) VALUES (18, 1, 2, '7973SJ31', 1982);
INSERT INTO tblvehicules (numvehicule, numclient, nummodele, numimmat, annee) VALUES (19, 18, 21, '3904TT31', 1985);
INSERT INTO tblvehicules (numvehicule, numclient, nummodele, numimmat, annee) VALUES (20, 22, 2, '1234ZA31', 1997);
INSERT INTO tblvehicules (numvehicule, numclient, nummodele, numimmat, annee) VALUES (21, 3, 19, '8429UV31', 1985);
INSERT INTO tblvehicules (numvehicule, numclient, nummodele, numimmat, annee) VALUES (22, 8, 19, '9999ZZ31', 1998);
INSERT INTO tblvehicules (numvehicule, numclient, nummodele, numimmat, annee) VALUES (23, 7, 25, '6824TY31', 1985);
INSERT INTO tblvehicules (numvehicule, numclient, nummodele, numimmat, annee) VALUES (24, 3, 9, '9365ZV31', 1998);
INSERT INTO tblvehicules (numvehicule, numclient, nummodele, numimmat, annee) VALUES (25, 13, 5, '642AAD31', 1998);
INSERT INTO tblvehicules (numvehicule, numclient, nummodele, numimmat, annee) VALUES (26, 3, 10, '5389YA31', 1993);
INSERT INTO tblvehicules (numvehicule, numclient, nummodele, numimmat, annee) VALUES (27, 10, 7, '421AAA31', 1998);
INSERT INTO tblvehicules (numvehicule, numclient, nummodele, numimmat, annee) VALUES (28, 10, 3, '6478AAZ31', 1999);


--
-- TOC entry 1901 (class 0 OID 16398)
-- Dependencies: 1522
-- Data for Name: tblvilles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tblvilles (numville, codpost, ville) VALUES (1, '31170', 'TOURNEFEUILLE');
INSERT INTO tblvilles (numville, codpost, ville) VALUES (2, '31700', 'BLAGNAC');
INSERT INTO tblvilles (numville, codpost, ville) VALUES (3, '31770', 'COLOMIERS');
INSERT INTO tblvilles (numville, codpost, ville) VALUES (4, '31100', 'TOULOUSE');
INSERT INTO tblvilles (numville, codpost, ville) VALUES (5, '31150', 'FENOUILLET');
INSERT INTO tblvilles (numville, codpost, ville) VALUES (6, '31130', 'BALMA');
INSERT INTO tblvilles (numville, codpost, ville) VALUES (7, '31520', 'RAMONVILLE SAINT-AGNE');
INSERT INTO tblvilles (numville, codpost, ville) VALUES (8, '31470', 'FONSORBES');
INSERT INTO tblvilles (numville, codpost, ville) VALUES (9, '31490', 'BRAX');
INSERT INTO tblvilles (numville, codpost, ville) VALUES (10, '31400', 'TOULOUSE');
INSERT INTO tblvilles (numville, codpost, ville) VALUES (11, '31700', 'CORNEBARRIEU');
INSERT INTO tblvilles (numville, codpost, ville) VALUES (12, '31240', 'L''UNION');
INSERT INTO tblvilles (numville, codpost, ville) VALUES (13, '31270', 'CUGNAUX');
INSERT INTO tblvilles (numville, codpost, ville) VALUES (14, '31000', 'TOULOUSE');
INSERT INTO tblvilles (numville, codpost, ville) VALUES (15, '31840', 'AUSSONNE');
INSERT INTO tblvilles (numville, codpost, ville) VALUES (16, '31240', 'SAINT-JEAN');
INSERT INTO tblvilles (numville, codpost, ville) VALUES (17, '31600', 'MURET');
INSERT INTO tblvilles (numville, codpost, ville) VALUES (18, '31200', 'TOULOUSE');
INSERT INTO tblvilles (numville, codpost, ville) VALUES (19, '31500', 'TOULOUSE');
INSERT INTO tblvilles (numville, codpost, ville) VALUES (20, '31840', 'SEILH');
INSERT INTO tblvilles (numville, codpost, ville) VALUES (21, '31880', 'LA SALVETAT SAINT-GILLES');
INSERT INTO tblvilles (numville, codpost, ville) VALUES (22, '31790', 'SAINT-JORY');
INSERT INTO tblvilles (numville, codpost, ville) VALUES (23, '31300', 'TOULOUSE');
INSERT INTO tblvilles (numville, codpost, ville) VALUES (24, '31820', 'PIBRAC');
INSERT INTO tblvilles (numville, codpost, ville) VALUES (25, '31160', 'CASTELBIAGUE');
INSERT INTO tblvilles (numville, codpost, ville) VALUES (26, '31450', 'MONTBRUN LAURAGUAIS');
INSERT INTO tblvilles (numville, codpost, ville) VALUES (27, '31810', 'VERNET');
INSERT INTO tblvilles (numville, codpost, ville) VALUES (28, '31140', 'SAINT-ALBAN');
INSERT INTO tblvilles (numville, codpost, ville) VALUES (29, '31290', 'SAINT-ROME');
INSERT INTO tblvilles (numville, codpost, ville) VALUES (30, '31830', 'PLAISANCE DU TOUCH');
INSERT INTO tblvilles (numville, codpost, ville) VALUES (31, '31620', 'FRONTON');
INSERT INTO tblvilles (numville, codpost, ville) VALUES (32, '31120', 'PORTET SUR GARONNE');
INSERT INTO tblvilles (numville, codpost, ville) VALUES (33, '31330', 'GRENADE');
INSERT INTO tblvilles (numville, codpost, ville) VALUES (34, '31490', 'LEGUEVIN');
INSERT INTO tblvilles (numville, codpost, ville) VALUES (35, '31670', 'LABEGE');


--
-- TOC entry 1862 (class 2606 OID 16443)
-- Dependencies: 1526 1526
-- Name: primary; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tblemployes
    ADD CONSTRAINT "primary" PRIMARY KEY (numemploye);


--
-- TOC entry 1859 (class 2606 OID 16422)
-- Dependencies: 1524 1524
-- Name: tblclients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tblclients
    ADD CONSTRAINT tblclients_pkey PRIMARY KEY (numclient);


--
-- TOC entry 1891 (class 2606 OID 16553)
-- Dependencies: 1540 1540 1540
-- Name: tblcompetences_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tblcompetences
    ADD CONSTRAINT tblcompetences_pkey PRIMARY KEY (numemploye, nummodele);


--
-- TOC entry 1864 (class 2606 OID 16453)
-- Dependencies: 1528 1528
-- Name: tblindisponibilites_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tblindisponibilites
    ADD CONSTRAINT tblindisponibilites_pkey PRIMARY KEY (numindispo);


--
-- TOC entry 1887 (class 2606 OID 16530)
-- Dependencies: 1538 1538 1538
-- Name: tblintervenants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tblintervenants
    ADD CONSTRAINT tblintervenants_pkey PRIMARY KEY (numintervention, numemploye);


--
-- TOC entry 1881 (class 2606 OID 16515)
-- Dependencies: 1536 1536
-- Name: tblinterventions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tblinterventions
    ADD CONSTRAINT tblinterventions_pkey PRIMARY KEY (numintervention);


--
-- TOC entry 1868 (class 2606 OID 16463)
-- Dependencies: 1530 1530
-- Name: tblmarques_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tblmarques
    ADD CONSTRAINT tblmarques_pkey PRIMARY KEY (nummarque);


--
-- TOC entry 1872 (class 2606 OID 16474)
-- Dependencies: 1532 1532
-- Name: tblmodeles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tblmodeles
    ADD CONSTRAINT tblmodeles_pkey PRIMARY KEY (nummodele);


--
-- TOC entry 1878 (class 2606 OID 16492)
-- Dependencies: 1534 1534
-- Name: tblvehicules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tblvehicules
    ADD CONSTRAINT tblvehicules_pkey PRIMARY KEY (numvehicule);


--
-- TOC entry 1856 (class 2606 OID 16405)
-- Dependencies: 1522 1522
-- Name: tblvilles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tblvilles
    ADD CONSTRAINT tblvilles_pkey PRIMARY KEY (numville);


--
-- TOC entry 1873 (class 1259 OID 16503)
-- Dependencies: 1534
-- Name: Annee; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX "Annee" ON tblvehicules USING btree (annee);


--
-- TOC entry 1853 (class 1259 OID 16406)
-- Dependencies: 1522
-- Name: CODPOST; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX "CODPOST" ON tblvilles USING btree (codpost);


--
-- TOC entry 1882 (class 1259 OID 16541)
-- Dependencies: 1538
-- Name: DebutIntervention; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX "DebutIntervention" ON tblintervenants USING btree (debut);


--
-- TOC entry 1883 (class 1259 OID 16542)
-- Dependencies: 1538
-- Name: FinIntervention; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX "FinIntervention" ON tblintervenants USING btree (fin);


--
-- TOC entry 1865 (class 1259 OID 16464)
-- Dependencies: 1530
-- Name: Marque; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX "Marque" ON tblmarques USING btree (marque);


--
-- TOC entry 1869 (class 1259 OID 16480)
-- Dependencies: 1532
-- Name: Modele; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX "Modele" ON tblmodeles USING btree (modele);


--
-- TOC entry 1866 (class 1259 OID 16465)
-- Dependencies: 1530
-- Name: Nationalite; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX "Nationalite" ON tblmarques USING btree (nationalite);


--
-- TOC entry 1874 (class 1259 OID 16504)
-- Dependencies: 1534
-- Name: NumClientVehicule; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX "NumClientVehicule" ON tblvehicules USING btree (numclient);


--
-- TOC entry 1888 (class 1259 OID 16564)
-- Dependencies: 1540
-- Name: NumEmploye; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX "NumEmploye" ON tblcompetences USING btree (numemploye);


--
-- TOC entry 1884 (class 1259 OID 16543)
-- Dependencies: 1538
-- Name: NumEmployeIntervenant; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX "NumEmployeIntervenant" ON tblintervenants USING btree (numemploye);


--
-- TOC entry 1875 (class 1259 OID 16505)
-- Dependencies: 1534
-- Name: NumImmat; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX "NumImmat" ON tblvehicules USING btree (numimmat);


--
-- TOC entry 1885 (class 1259 OID 16544)
-- Dependencies: 1538
-- Name: NumIntervention; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX "NumIntervention" ON tblintervenants USING btree (numintervention);


--
-- TOC entry 1870 (class 1259 OID 16481)
-- Dependencies: 1532
-- Name: NumMarque; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX "NumMarque" ON tblmodeles USING btree (nummarque);


--
-- TOC entry 1889 (class 1259 OID 16565)
-- Dependencies: 1540
-- Name: NumModele; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX "NumModele" ON tblcompetences USING btree (nummodele);


--
-- TOC entry 1876 (class 1259 OID 16506)
-- Dependencies: 1534
-- Name: NumModeleVehicule; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX "NumModeleVehicule" ON tblvehicules USING btree (nummodele);


--
-- TOC entry 1854 (class 1259 OID 16407)
-- Dependencies: 1522
-- Name: VILLE; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX "VILLE" ON tblvilles USING btree (ville);


--
-- TOC entry 1857 (class 1259 OID 16428)
-- Dependencies: 1524
-- Name: fki_client_ville; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_client_ville ON tblclients USING btree (numville);


--
-- TOC entry 1879 (class 1259 OID 16521)
-- Dependencies: 1536
-- Name: fki_intervention_vehicule; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_intervention_vehicule ON tblinterventions USING btree (numvehicule);


--
-- TOC entry 1860 (class 1259 OID 16444)
-- Dependencies: 1526
-- Name: nom; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX nom ON tblemployes USING btree (nom);


--
-- TOC entry 1892 (class 2606 OID 16423)
-- Dependencies: 1522 1855 1524
-- Name: client_ville; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tblclients
    ADD CONSTRAINT client_ville FOREIGN KEY (numville) REFERENCES tblvilles(numville);


--
-- TOC entry 1899 (class 2606 OID 16554)
-- Dependencies: 1540 1861 1526
-- Name: competence_employe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tblcompetences
    ADD CONSTRAINT competence_employe FOREIGN KEY (numemploye) REFERENCES tblemployes(numemploye);


--
-- TOC entry 1900 (class 2606 OID 16559)
-- Dependencies: 1540 1871 1532
-- Name: competence_modele; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tblcompetences
    ADD CONSTRAINT competence_modele FOREIGN KEY (nummodele) REFERENCES tblmodeles(nummodele);


--
-- TOC entry 1897 (class 2606 OID 16531)
-- Dependencies: 1861 1526 1538
-- Name: intervenant_employe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tblintervenants
    ADD CONSTRAINT intervenant_employe FOREIGN KEY (numemploye) REFERENCES tblemployes(numemploye);


--
-- TOC entry 1898 (class 2606 OID 16536)
-- Dependencies: 1880 1538 1536
-- Name: intervenant_intervention; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tblintervenants
    ADD CONSTRAINT intervenant_intervention FOREIGN KEY (numintervention) REFERENCES tblinterventions(numintervention);


--
-- TOC entry 1896 (class 2606 OID 16516)
-- Dependencies: 1536 1534 1877
-- Name: intervention_vehicule; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tblinterventions
    ADD CONSTRAINT intervention_vehicule FOREIGN KEY (numvehicule) REFERENCES tblvehicules(numvehicule);


--
-- TOC entry 1893 (class 2606 OID 16475)
-- Dependencies: 1532 1530 1867
-- Name: modele_marque; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tblmodeles
    ADD CONSTRAINT modele_marque FOREIGN KEY (nummarque) REFERENCES tblmarques(nummarque);


--
-- TOC entry 1894 (class 2606 OID 16493)
-- Dependencies: 1858 1534 1524
-- Name: vehicule_client; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tblvehicules
    ADD CONSTRAINT vehicule_client FOREIGN KEY (numclient) REFERENCES tblclients(numclient);


--
-- TOC entry 1895 (class 2606 OID 16498)
-- Dependencies: 1534 1871 1532
-- Name: vehicule_modele; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tblvehicules
    ADD CONSTRAINT vehicule_modele FOREIGN KEY (nummodele) REFERENCES tblmodeles(nummodele);


--
-- TOC entry 1915 (class 0 OID 0)
-- Dependencies: 3
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2013-06-27 10:44:34

--
-- PostgreSQL database dump complete
--

