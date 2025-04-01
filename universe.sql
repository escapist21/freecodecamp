--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(30) NOT NULL,
    name_meaning text
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    constellation_id integer,
    distance_in_billion_light_years numeric(4,1) NOT NULL,
    galaxy_type character varying(100),
    mass_in_solar_masses character varying(20)
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
    name character varying(50) NOT NULL,
    planet_id integer,
    diameter_km integer NOT NULL,
    orbital_distance_km integer NOT NULL,
    composition character varying(30) NOT NULL
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
    name character varying(50) NOT NULL,
    star_id integer,
    type character varying(30) NOT NULL,
    distance_from_star_au numeric(4,2) NOT NULL,
    has_moon boolean NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

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
    name character varying(50) NOT NULL,
    galaxy_id integer,
    is_binary_star_system boolean NOT NULL,
    distance_from_yeart_light_years integer NOT NULL,
    temperature_in_k integer NOT NULL
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Lynx', 'wild cat lynx');
INSERT INTO public.constellation VALUES (2, 'Andromeda', 'chained maiden of princess');
INSERT INTO public.constellation VALUES (3, 'Sagittarius', 'archer');
INSERT INTO public.constellation VALUES (4, 'Pegasus', 'mythological winged horse');
INSERT INTO public.constellation VALUES (5, 'Hydra', 'Hydra');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (3, 'Paramecium', 4, 0.1, NULL, NULL);
INSERT INTO public.galaxy VALUES (1, 'Alcyoneus', 1, 3.5, 'radio-loud elliptical galaxy', '~1-2 trillion');
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 3, 0.0, 'barred spiral galaxy', '~1.5 trillion');
INSERT INTO public.galaxy VALUES (5, 'Peekaboo', 5, 0.2, 'blue compact dwarf galaxy ', '~0.0001 trillion');
INSERT INTO public.galaxy VALUES (4, 'Little Sombrero', 4, 0.0, 'edge-on spiral galaxy', '~0.01 trillion');
INSERT INTO public.galaxy VALUES (6, 'Porpoise', 5, 0.3, 'distorted spiral galaxy', '~0.1 trillion');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon', 3, 3474, 384400, 'rocky (silicate)');
INSERT INTO public.moon VALUES (2, 'phobos', 4, 22, 9378, 'carbonaceous (type c)');
INSERT INTO public.moon VALUES (3, 'deimos', 4, 12, 23460, 'carbonaceous (type c)');
INSERT INTO public.moon VALUES (4, 'ganymede', 5, 5268, 1070400, 'icy & rocky');
INSERT INTO public.moon VALUES (5, 'callisto', 5, 4821, 1882700, 'icy & rocky');
INSERT INTO public.moon VALUES (6, 'io', 5, 3643, 421700, 'rocky');
INSERT INTO public.moon VALUES (7, 'europa', 5, 3121, 671100, 'icy');
INSERT INTO public.moon VALUES (8, 'amalthea', 5, 167, 181400, 'porous, rocky');
INSERT INTO public.moon VALUES (9, 'himalia', 5, 140, 11460000, 'rocky');
INSERT INTO public.moon VALUES (10, 'elara', 5, 86, 11737000, 'rocky');
INSERT INTO public.moon VALUES (11, 'pasiphae', 5, 58, 23624000, 'rocky');
INSERT INTO public.moon VALUES (12, 'sinope', 5, 38, 23540000, 'rocky');
INSERT INTO public.moon VALUES (13, 'lysithea', 5, 36, 11720000, 'rocky');
INSERT INTO public.moon VALUES (14, 'titan', 6, 5150, 1222000, 'icy with atmosphere');
INSERT INTO public.moon VALUES (15, 'rhea', 6, 1527, 527100, 'icy & rocky');
INSERT INTO public.moon VALUES (16, 'iapetus', 6, 1471, 3560000, 'icy & rocky');
INSERT INTO public.moon VALUES (17, 'dione', 6, 1122, 377400, 'icy (water ice)');
INSERT INTO public.moon VALUES (18, 'tethys', 6, 1062, 294700, 'icy (water ice)');
INSERT INTO public.moon VALUES (19, 'enceladus', 6, 504, 238000, 'icy (water ice)');
INSERT INTO public.moon VALUES (20, 'mimus', 6, 396, 1481100, 'porous ice ');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 3, 'terrestrial', 0.39, false);
INSERT INTO public.planet VALUES (2, 'Venus', 3, 'terrestrial', 0.72, false);
INSERT INTO public.planet VALUES (3, 'Earth', 3, 'terrestrial', 1.00, true);
INSERT INTO public.planet VALUES (4, 'Mars', 3, 'terrestrial', 1.52, true);
INSERT INTO public.planet VALUES (5, 'Jupiter', 3, 'gas giant', 5.20, true);
INSERT INTO public.planet VALUES (6, 'Saturn', 3, 'gas giant', 9.58, true);
INSERT INTO public.planet VALUES (7, 'Uranus', 3, 'ice giant', 19.18, true);
INSERT INTO public.planet VALUES (8, 'Neptune', 3, 'ice giant', 30.07, true);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 9, 'terrestrial', 0.05, false);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri d', 9, 'terrestrial', 0.03, false);
INSERT INTO public.planet VALUES (11, '51 Pegasi b', 7, 'gas giant', 0.05, false);
INSERT INTO public.planet VALUES (12, 'HD 209458 b', 8, 'gas giant', 0.05, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 2, true, 9, 9940);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 2, true, 4, 5778);
INSERT INTO public.star VALUES (3, 'Sun', 2, false, 0, 5778);
INSERT INTO public.star VALUES (4, 'Rigel', 2, false, 860, 11000);
INSERT INTO public.star VALUES (5, 'Polaris', 2, false, 323, 6015);
INSERT INTO public.star VALUES (6, 'Arcturus', 2, false, 37, 4290);
INSERT INTO public.star VALUES (7, '51 Pegasi', 2, false, 50, 5771);
INSERT INTO public.star VALUES (8, 'HD 209458', 2, false, 157, 6130);
INSERT INTO public.star VALUES (9, 'Proxima Centauri', 2, true, 4, 3042);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy galaxy_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

