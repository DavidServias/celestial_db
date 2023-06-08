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
-- Name: astronaut; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.astronaut (
    astronaut_id integer NOT NULL,
    name character varying(40) NOT NULL,
    age integer,
    quote text,
    favorite_animal character varying(40) NOT NULL
);


ALTER TABLE public.astronaut OWNER TO freecodecamp;

--
-- Name: astronaut_astronaut_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.astronaut_astronaut_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.astronaut_astronaut_id_seq OWNER TO freecodecamp;

--
-- Name: astronaut_astronaut_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.astronaut_astronaut_id_seq OWNED BY public.astronaut.astronaut_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40),
    description text NOT NULL,
    diameter_ly integer,
    distance_from_earth_in_ly integer,
    type character varying(40)
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
    name character varying(40),
    planet_id integer,
    diameter_in_km integer,
    description text NOT NULL,
    orbit_period_in_earth_days numeric(6,3)
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
    name character varying(40),
    description text NOT NULL,
    has_rings boolean,
    diameter_km integer,
    star_id integer,
    has_moons boolean
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
    name character varying(40) NOT NULL,
    star_type character varying(40) NOT NULL,
    description text,
    age_in_billions numeric(6,3),
    galaxy_id integer,
    star_id integer NOT NULL
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
-- Name: astronaut astronaut_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronaut ALTER COLUMN astronaut_id SET DEFAULT nextval('public.astronaut_astronaut_id_seq'::regclass);


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
-- Data for Name: astronaut; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.astronaut VALUES (1, 'Tom Hanks', 35, 'Show me da money!', 'whale');
INSERT INTO public.astronaut VALUES (2, 'Neil Armstrong', 39, 'One large step for me.', 'ostrich');
INSERT INTO public.astronaut VALUES (3, 'Louie Armstrong', 39, 'It dont mean a thing...', 'goldfish');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'placeholder', 100000, 0, 'spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'placeholder', 220000, 2500000, 'spiral');
INSERT INTO public.galaxy VALUES (3, 'Cigar Galaxy', 'placeholder', 37000, 11500000, 'starburst');
INSERT INTO public.galaxy VALUES (4, 'Pinwheel Galaxy', 'placeholder', 170000, 20870000, 'spiral');
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', 'placeholder', 50000, 29350000, 'spiral');
INSERT INTO public.galaxy VALUES (6, 'Whirlpool Galaxy', 'placeholder', 60000, 30000000, 'spiral');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Metis', 1, 43, 'placeholder', 0.295);
INSERT INTO public.moon VALUES (2, 'Adrastea', 5, 16, 'placeholder', 0.299);
INSERT INTO public.moon VALUES (3, 'Amalthea', 5, 167, 'placeholder', 0.500);
INSERT INTO public.moon VALUES (4, 'Fake Moon 4', 5, 234, 'placeholder', 2.000);
INSERT INTO public.moon VALUES (5, 'Fake Moon 5', 9, 12, 'placeholder', 0.870);
INSERT INTO public.moon VALUES (6, 'Fake Moon 6', 2, 177, 'placeholder', 1.400);
INSERT INTO public.moon VALUES (7, 'Fake Moon 7', 2, 3, 'placeholder', 1.990);
INSERT INTO public.moon VALUES (8, 'Fake Moon 8', 4, 355, 'placeholder', 14.000);
INSERT INTO public.moon VALUES (9, 'Fake Moon 9', 4, 5, 'placeholder', 0.910);
INSERT INTO public.moon VALUES (10, 'Fake Moon 10', 5, 136, 'placeholder', 0.123);
INSERT INTO public.moon VALUES (11, 'Fake Moon 11', 7, 799, 'placeholder', 0.456);
INSERT INTO public.moon VALUES (12, 'Fake Moon 12', 9, 899, 'placeholder', 0.567);
INSERT INTO public.moon VALUES (13, 'Fake Moon 13', 10, 234, 'placeholder', 0.678);
INSERT INTO public.moon VALUES (14, 'Fake Moon 14', 11, 345, 'placeholder', 0.789);
INSERT INTO public.moon VALUES (15, 'Fake Moon 15', 3, 456, 'placeholder', 0.321);
INSERT INTO public.moon VALUES (16, 'Fake Moon 16', 4, 654, 'placeholder', 0.432);
INSERT INTO public.moon VALUES (17, 'Fake Moon 17', 5, 765, 'placeholder', 0.543);
INSERT INTO public.moon VALUES (18, 'Fake Moon 18', 6, 876, 'placeholder', 0.654);
INSERT INTO public.moon VALUES (19, 'Fake Moon 19', 7, 987, 'placeholder', 0.765);
INSERT INTO public.moon VALUES (20, 'Fake Moon 20', 7, 135, 'placeholder', 0.251);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'placeholder', false, 7818, 1, NULL);
INSERT INTO public.planet VALUES (2, 'Mercury', 'placeholder', false, 3032, 1, NULL);
INSERT INTO public.planet VALUES (3, 'Venus', 'placeholder', false, 7521, 1, NULL);
INSERT INTO public.planet VALUES (4, 'Mars', 'placeholder', false, 4212, 1, NULL);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'placeholder', true, 86881, 1, NULL);
INSERT INTO public.planet VALUES (6, 'Saturn', 'placeholder', true, 72367, 1, NULL);
INSERT INTO public.planet VALUES (7, 'Uranus', 'placeholder', true, 31518, 1, NULL);
INSERT INTO public.planet VALUES (8, 'Neptune', 'placeholder', true, 30599, 1, NULL);
INSERT INTO public.planet VALUES (9, 'Fake Planet 1', 'placeholder', false, 30000, 2, NULL);
INSERT INTO public.planet VALUES (10, 'Fake Planet 2', 'placeholder', true, 45, 3, NULL);
INSERT INTO public.planet VALUES (11, 'Fake Planet 3', 'placeholder', false, 65000, 4, NULL);
INSERT INTO public.planet VALUES (12, 'Fake Planet 4', 'placeholder', true, 300, 5, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Proxima Centauri', 'red dwarf', 'placeholder', 4.900, 1, 2);
INSERT INTO public.star VALUES ('Barnards Star', 'red dwarf', 'placeholder', 10.000, 1, 3);
INSERT INTO public.star VALUES ('Beta Tauri', 'mercury manganese', 'placeholder', 100.100, 1, 4);
INSERT INTO public.star VALUES ('Zeta Tauri', 'binary star', 'placeholder', 0.025, 1, 5);
INSERT INTO public.star VALUES ('PSR B1257+12', 'pulsar', 'placeholder', 1.000, 1, 6);
INSERT INTO public.star VALUES ('Sun', 'yellow dwarf', 'placeholder', 4.600, 1, 1);


--
-- Name: astronaut_astronaut_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.astronaut_astronaut_id_seq', 3, true);


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

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: astronaut astronaut_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronaut
    ADD CONSTRAINT astronaut_name_key UNIQUE (name);


--
-- Name: astronaut astronaut_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronaut
    ADD CONSTRAINT astronaut_pkey PRIMARY KEY (astronaut_id);


--
-- Name: galaxy galaxy_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_unique UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: star name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT name_unique UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star fk_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

