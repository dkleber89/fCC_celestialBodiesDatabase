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
    description text,
    has_life boolean NOT NULL,
    age_in_millions_of_years numeric(4,1),
    distance_from_earth_in_million_km integer
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
    description text,
    planet_id integer NOT NULL,
    age_in_millions_of_years numeric(4,1),
    distance_from_earth_in_million_km integer
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
    description text,
    star_id integer NOT NULL,
    has_life boolean NOT NULL,
    age_in_millions_of_years numeric(4,1),
    distance_from_earth_in_million_km integer,
    planet_type_id integer NOT NULL
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
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(40) NOT NULL,
    type character varying(50) NOT NULL
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text,
    galaxy_id integer NOT NULL,
    age_in_millions_of_years numeric(4,1),
    distance_from_earth_in_million_km integer
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
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'fish', 'Water Galaxy', true, 45.3, 999);
INSERT INTO public.galaxy VALUES (2, 'birds', 'Air Galaxy', true, 900.2, 123);
INSERT INTO public.galaxy VALUES (3, 'stone', 'Rock Galaxy', false, 456.2, 444);
INSERT INTO public.galaxy VALUES (4, 'fire', 'Hot Galaxy', false, 23.1, 3901);
INSERT INTO public.galaxy VALUES (5, 'wood', 'Green Galaxy', true, 1.4, 12);
INSERT INTO public.galaxy VALUES (6, 'oil', 'Dirty Galaxy', false, 673.4, 5843);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'fish water moon', 'The water planet moon', 1, 4.0, NULL);
INSERT INTO public.moon VALUES (2, 'big fish moon', 'The big fish planet moon', 2, 6.0, NULL);
INSERT INTO public.moon VALUES (3, 'birds air moon', 'The air planet moon', 3, 2.0, NULL);
INSERT INTO public.moon VALUES (4, 'big birds moon', 'The big birds planet moon', 4, 5.0, NULL);
INSERT INTO public.moon VALUES (5, 'stone rock moon', 'The rock planet moon', 5, 1.0, NULL);
INSERT INTO public.moon VALUES (6, 'big stone moon', 'The big stone planet moon', 6, 5.0, NULL);
INSERT INTO public.moon VALUES (7, 'fire burn moon', 'The burning planet moon', 7, 1.0, NULL);
INSERT INTO public.moon VALUES (8, 'fire moon', 'The burning planet fire moon', 7, 21.0, NULL);
INSERT INTO public.moon VALUES (9, 'wood green moon', 'The green planet moon', 9, 2.0, NULL);
INSERT INTO public.moon VALUES (10, 'big wood moon', 'The big wood planet moon', 10, 3.0, NULL);
INSERT INTO public.moon VALUES (11, 'oil dirty moon', 'The dirty planet moon', 11, 995.0, NULL);
INSERT INTO public.moon VALUES (12, 'big dirty moon', 'The big dirty planet moon', 12, 6.0, NULL);
INSERT INTO public.moon VALUES (13, 'water moon', 'The water moon', 1, 4.0, NULL);
INSERT INTO public.moon VALUES (14, 'fish moon', 'The big fish moon', 2, 6.0, NULL);
INSERT INTO public.moon VALUES (15, 'air moon', 'The air moon', 3, 2.0, NULL);
INSERT INTO public.moon VALUES (16, 'birds moon', 'The big birds moon', 4, 5.0, NULL);
INSERT INTO public.moon VALUES (17, 'rock moon', 'The rock moon', 5, 1.0, NULL);
INSERT INTO public.moon VALUES (18, 'stone moon', 'The big stone moon', 6, 5.0, NULL);
INSERT INTO public.moon VALUES (19, 'burn moon', 'The burning  moon', 7, 1.0, NULL);
INSERT INTO public.moon VALUES (20, 'firework moon', 'The firework moon', 7, 21.0, NULL);
INSERT INTO public.moon VALUES (21, 'green moon', 'The green moon', 9, 2.0, NULL);
INSERT INTO public.moon VALUES (22, 'wood moon', 'The big wood moon', 10, 3.0, NULL);
INSERT INTO public.moon VALUES (23, 'oil moon', 'The oil moon', 11, 995.0, NULL);
INSERT INTO public.moon VALUES (24, 'dirty moon', 'The dirty moon', 12, 6.0, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'fish water', 'The water plaanet', 2, true, NULL, NULL, 4);
INSERT INTO public.planet VALUES (2, 'big fish', 'The big fish planet', 2, false, NULL, NULL, 6);
INSERT INTO public.planet VALUES (3, 'birds air', 'The air planet', 3, true, NULL, NULL, 2);
INSERT INTO public.planet VALUES (4, 'big birds', 'The big birds planet', 3, true, NULL, NULL, 5);
INSERT INTO public.planet VALUES (5, 'stone rock', 'The rock planet', 4, false, NULL, NULL, 1);
INSERT INTO public.planet VALUES (6, 'big stone', 'The big stone planet', 4, false, NULL, NULL, 5);
INSERT INTO public.planet VALUES (7, 'fire burn', 'The burning planet', 5, false, NULL, NULL, 1);
INSERT INTO public.planet VALUES (8, 'little fire', 'The hot planet', 6, false, NULL, NULL, 1);
INSERT INTO public.planet VALUES (9, 'wood green', 'The green planet', 7, true, NULL, NULL, 2);
INSERT INTO public.planet VALUES (10, 'big wood', 'The big wood planet', 7, true, NULL, NULL, 3);
INSERT INTO public.planet VALUES (11, 'oil dirty', 'The dirty planet', 8, false, NULL, NULL, 5);
INSERT INTO public.planet VALUES (12, 'big dirty', 'The big dirty planet', 8, false, NULL, NULL, 6);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Miniterran', 'MT');
INSERT INTO public.planet_type VALUES (2, 'Subterran', 'ST');
INSERT INTO public.planet_type VALUES (3, 'Terran', 'T');
INSERT INTO public.planet_type VALUES (4, 'Superterrans', 'SUT');
INSERT INTO public.planet_type VALUES (5, 'Neptunians', 'NT');
INSERT INTO public.planet_type VALUES (6, 'Jovians', 'J');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'fish sun', 'Sun from the water galaxy', 1, 45.0, 989);
INSERT INTO public.star VALUES (3, 'birds sun', 'Sun from the air galaxy', 2, 900.0, 128);
INSERT INTO public.star VALUES (4, 'stone sun', 'Sun from the rock galaxy', 3, 456.0, 440);
INSERT INTO public.star VALUES (5, 'fire sun', 'Main sun from the fire galaxy', 4, 23.0, 3956);
INSERT INTO public.star VALUES (6, 'fire star', 'Secondary sun from the fire galaxy', 4, 23.0, 3955);
INSERT INTO public.star VALUES (7, 'wood', 'Sun from the green galaxy', 5, 1.0, 10);
INSERT INTO public.star VALUES (8, 'oil', 'Sun from the dirty galaxy', 6, 673.0, 5873);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 6, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


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
-- Name: planet_type planet_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_name_key UNIQUE (name);


--
-- Name: planet_type planet_type_type_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_type_key UNIQUE (type);


--
-- Name: planet_type planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_type_id);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_planet_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_type_id_fkey FOREIGN KEY (planet_type_id) REFERENCES public.planet_type(planet_type_id);


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

