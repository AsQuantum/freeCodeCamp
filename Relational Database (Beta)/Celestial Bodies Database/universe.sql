--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    magnitude_in_m numeric(5,2),
    group_membership character varying(40),
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40) NOT NULL,
    has_liquid_water boolean,
    planet_id integer,
    description text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    num_of_moon integer,
    mass_in_earth numeric(8,4),
    has_liquid_water boolean,
    star_id integer,
    description text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_habitable; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_habitable (
    planet_habitable_id integer NOT NULL,
    name character varying(40) NOT NULL,
    distance_ly numeric(8,4),
    planet_id integer NOT NULL
);


ALTER TABLE public.planet_habitable OWNER TO freecodecamp;

--
-- Name: planet_habitable_planet_habitable_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_habitable_planet_habitable_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_habitable_planet_habitable_id_seq OWNER TO freecodecamp;

--
-- Name: planet_habitable_planet_habitable_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_habitable_planet_habitable_id_seq OWNED BY public.planet_habitable.planet_habitable_id;


--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    num_of_planet integer,
    galaxy_id integer,
    description text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_habitable planet_habitable_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_habitable ALTER COLUMN planet_habitable_id SET DEFAULT nextval('public.planet_habitable_planet_habitable_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', NULL, 'Local Group', 'Home galaxy of Earth. Barred spiral galaxy.');
INSERT INTO public.galaxy VALUES (2, 'Sagittarius Dwarf Sphr', 4.50, 'Local Group', 'Satellite of Milky Way (partial accretion by Milky Way)');
INSERT INTO public.galaxy VALUES (3, 'Triangulum II', 15.60, 'Local Group', 'Satellite of Milky Way (accretion by Milky Way)');
INSERT INTO public.galaxy VALUES (4, 'Ursa Major II Dwarf', 14.30, 'Local Group', 'Satellite of Milky Way (accretion by Milky Way)');
INSERT INTO public.galaxy VALUES (5, 'Reticulum II', 14.40, 'Local Group', 'Satellite of Milky Way');
INSERT INTO public.galaxy VALUES (6, 'Segue 2', NULL, 'Local Group', 'Satellite of Milky Way, one of the smallest known galaxies');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', false, 1, 'Synchronous rotation');
INSERT INTO public.moon VALUES (2, 'Phobos', false, 2, '-');
INSERT INTO public.moon VALUES (3, 'Deimos', false, 2, '-');
INSERT INTO public.moon VALUES (4, 'Io', false, 5, 'Main-group moon (Galilean)');
INSERT INTO public.moon VALUES (5, 'Europa', true, 5, 'Main-group moon (Galilean)');
INSERT INTO public.moon VALUES (6, 'Ganymede', true, 5, 'Main-group moon (Galilean)');
INSERT INTO public.moon VALUES (7, 'Callisto', true, 5, 'Main-group moon (Galilean)');
INSERT INTO public.moon VALUES (8, 'Mimas', false, 6, 'Main-group moon');
INSERT INTO public.moon VALUES (9, 'Enceladus', true, 6, 'Main-group moon');
INSERT INTO public.moon VALUES (10, 'Tethys', false, 6, 'Main-group moon (Sidera Lodoicea)');
INSERT INTO public.moon VALUES (11, 'Dione', false, 6, 'Main-group moon (Sidera Lodoicea)');
INSERT INTO public.moon VALUES (12, 'Rhea', false, 6, 'Main-group moon (Sidera Lodoicea)');
INSERT INTO public.moon VALUES (13, 'Titan', true, 6, 'Main-group moon');
INSERT INTO public.moon VALUES (14, 'Iapetus', true, 6, 'Main-group moon (Sidera Lodoicea)');
INSERT INTO public.moon VALUES (15, 'Ariel', false, 7, 'Main-group moon');
INSERT INTO public.moon VALUES (16, 'Umbriel', false, 7, 'Main-group moon');
INSERT INTO public.moon VALUES (17, 'Titania', false, 7, 'Main-group moon');
INSERT INTO public.moon VALUES (18, 'Oberon', false, 7, 'Main-group moon');
INSERT INTO public.moon VALUES (19, 'Miranda', false, 7, 'Main-group moon');
INSERT INTO public.moon VALUES (20, 'Triton', false, 8, 'Retrograde irregular');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 1.0000, true, 1, '-');
INSERT INTO public.planet VALUES (2, 'MARS', 2, 0.1070, false, 1, '-');
INSERT INTO public.planet VALUES (3, 'VENUS', 0, 0.8150, false, 1, '-');
INSERT INTO public.planet VALUES (4, 'MERCURY', 0, 0.0553, false, 1, '-');
INSERT INTO public.planet VALUES (5, 'JUPITER', 79, 317.8000, false, 1, '-');
INSERT INTO public.planet VALUES (6, 'SATURN', 82, 95.2000, false, 1, '-');
INSERT INTO public.planet VALUES (7, 'URANUS', 27, 14.5000, false, 1, '-');
INSERT INTO public.planet VALUES (8, 'NEPTUNE', 14, 17.1000, false, 1, '-');
INSERT INTO public.planet VALUES (9, 'd', 0, 0.2600, false, 2, 'Proxima c disputed');
INSERT INTO public.planet VALUES (10, 'b', 0, 1.2000, true, 2, 'Proxima c disputed');
INSERT INTO public.planet VALUES (11, 'c', 0, 7.0000, false, 2, 'Proxima c disputed');
INSERT INTO public.planet VALUES (12, 'b', 0, 2.7000, false, 3, '-');
INSERT INTO public.planet VALUES (13, 'f', 0, 0.7800, false, 7, '4 candidates');


--
-- Data for Name: planet_habitable; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_habitable VALUES (1, 'Earth', 0.0000, 1);
INSERT INTO public.planet_habitable VALUES (2, 'Proxima Centauri b', 4.2465, 10);
INSERT INTO public.planet_habitable VALUES (3, 'Tau Ceti f', 11.9120, 13);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 8, 1, 'Pluto was considered as the ninth planet from its discovery in 1930 to 2006, but is now considered to be a dwarf planet instead, along with Ceres, Haumea, Makemake and Eris. The hypothesised Planet Nine remains unconfirmed.');
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 3, 1, 'Closest star to the Sun and closest star to the Sun with a multiplanetary system. Planet b is potentially habitable.[4] Planet c unconfirmed by RV data, but nonetheless undisputed by astrometry');
INSERT INTO public.star VALUES (3, 'Lalande 21185', 2, 1, '-');
INSERT INTO public.star VALUES (4, 'Lacaille 9352', 2, 1, 'The unconfirmed planet d is potentially habitable.');
INSERT INTO public.star VALUES (5, 'Luyten''s Star', 2, 1, 'Stellar activity level and rotational rate suggest an age higher than 8 billion years.[6] Planet b is potentially habitable.[7]');
INSERT INTO public.star VALUES (6, 'YZ Ceti', 3, 1, 'Flare star');
INSERT INTO public.star VALUES (7, 'Tau Ceti', 4, 1, 'Were planets b, c, d, i, PxP-4 and PxP-5 confirmed, would have a total of 10 planets. [9]Planets e and f are potentially habitable, but the habitability of e is disputed.[10][11][12][13] Closest system to the Sun with exactly four confirmed planets, and closest G-type star to the Sun with confirmed exoplanets.');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_habitable_planet_habitable_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_habitable_planet_habitable_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet_habitable planet_habitable_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_habitable
    ADD CONSTRAINT planet_habitable_pkey PRIMARY KEY (planet_habitable_id);


--
-- Name: planet_habitable planet_habitable_planet_habitable_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_habitable
    ADD CONSTRAINT planet_habitable_planet_habitable_id_key UNIQUE (planet_habitable_id);


--
-- Name: planet_habitable planet_habitable_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_habitable
    ADD CONSTRAINT planet_habitable_planet_id_key UNIQUE (planet_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet_habitable planet_habitable_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_habitable
    ADD CONSTRAINT planet_habitable_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

