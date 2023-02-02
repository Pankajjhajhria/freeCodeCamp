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
-- Name: celestial_events; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.celestial_events (
    celestial_events_id integer NOT NULL,
    date date,
    name character varying(30) NOT NULL
);


ALTER TABLE public.celestial_events OWNER TO freecodecamp;

--
-- Name: celestial_events_event_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.celestial_events_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.celestial_events_event_id_seq OWNER TO freecodecamp;

--
-- Name: celestial_events_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.celestial_events_event_id_seq OWNED BY public.celestial_events.celestial_events_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    distance integer,
    has_life boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    spherical boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    spherical boolean,
    distance numeric(5,2),
    star_id integer,
    has_life boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    age_in_mil_years integer,
    galaxy_id integer,
    has_life boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: celestial_events celestial_events_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_events ALTER COLUMN celestial_events_id SET DEFAULT nextval('public.celestial_events_event_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: celestial_events; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.celestial_events VALUES (1, '2023-05-05', 'Lunar Eclipse');
INSERT INTO public.celestial_events VALUES (2, '2023-10-28', 'Lunar Eclipse 2');
INSERT INTO public.celestial_events VALUES (3, '2023-04-20', 'Solar Eclipse');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'It is the galaxy we are in. It will merge into Andromeda Galaxy 4.5 billion years from now.', 0, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'It is the nearset galaxy to ours. Its a spiral galaxy.', 765, true);
INSERT INTO public.galaxy VALUES (3, 'Sagittarius Galaxy', 'Its the closest galaxy to earth but sadly its dead.', 20, false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool Galaxy', 'Its the first galaxy to be classified as Spiral galaxy. Its 31 million light years from us.', 9504, true);
INSERT INTO public.galaxy VALUES (5, 'Centaurus A', 'It is one of the closest radio galaxies to the earth.', 3100, true);
INSERT INTO public.galaxy VALUES (6, 'Canis Major Dwarf Galaxy', 'This small galaxy contains over a billion stars and red giants.', 8, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'The only natural satellite of our planet.', true, 1);
INSERT INTO public.moon VALUES (2, 'Deimos', 'Its a very small moon of Mars.', false, 4);
INSERT INTO public.moon VALUES (3, 'Phobos', 'It is the larger of the two moons of Mars.', false, 4);
INSERT INTO public.moon VALUES (4, 'Ganymede', 'The largest and most massive moon in the solar system.', true, 5);
INSERT INTO public.moon VALUES (5, 'Callisto', 'The second largest moon of Jupiter and third largest in Solar system.', true, 5);
INSERT INTO public.moon VALUES (6, 'Io', 'The moon with highest surface density and gravity.', true, 5);
INSERT INTO public.moon VALUES (7, 'Europa', 'The smallest of the four galilien moons orbiting Jupiter.', true, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 'The second largest moon of solar system and largest of Saturn.', true, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'Along with Titan it shows signs of geological activities.', true, 6);
INSERT INTO public.moon VALUES (10, 'Iapetus', 'It is the third largest moon of Saturn.', true, 6);
INSERT INTO public.moon VALUES (11, 'Rhea', 'It is the second largest moon of Saturn.', true, 6);
INSERT INTO public.moon VALUES (12, 'Dione', 'Moon of Saturn also known as Saturn IV.', true, 6);
INSERT INTO public.moon VALUES (13, 'Tethys', 'Aka Saturn III is a mid sized moon of Saturn.', true, 6);
INSERT INTO public.moon VALUES (14, 'Mimas', 'Aka Saturn I is a moon of Saturn.', true, 6);
INSERT INTO public.moon VALUES (15, 'Titania', 'Largest moon of Uranus and eighth largest in solar system.', true, 7);
INSERT INTO public.moon VALUES (16, 'Oberon', 'Aka Uranus IV is the ninth largest moon in solar system.', true, 7);
INSERT INTO public.moon VALUES (17, 'Umbriel', 'Moon of Uranus, mainly consists of ice and some rock.', true, 7);
INSERT INTO public.moon VALUES (18, 'Ariel', 'Fourth largest moon of Uranus.', true, 7);
INSERT INTO public.moon VALUES (19, 'Miranda', 'Aka Uranus V is the smallest of the round moons of Uranus.', false, 7);
INSERT INTO public.moon VALUES (20, 'Triton', 'The largest natural satellite of the planet Neptune.', true, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'This is our home, so far the only planet with confirmed life.', true, 0.00, 1, true);
INSERT INTO public.planet VALUES (2, 'Mercury', 'The closest planet to the sun and the smallest in the solar system.', true, 0.51, 1, false);
INSERT INTO public.planet VALUES (3, 'Venus', 'The hottest planet in the solar system with surface temp of 400 C.', true, 1.49, 1, false);
INSERT INTO public.planet VALUES (4, 'Mars', 'The planet where Elon Musk hopes to inhibit human colonies.', true, 0.90, 1, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'The largest and heaviest planet in the solar system.', true, 5.47, 1, false);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Similar to Jupiter its extinguished by its ring system.', true, 10.77, 1, false);
INSERT INTO public.planet VALUES (7, 'Uranus', 'It has the coldest planetary atmosphere in the solar system.', true, 19.60, 1, false);
INSERT INTO public.planet VALUES (8, 'Neptune', 'It is the farthest planet from the sun and similar to uranus.', true, 30.65, 1, false);
INSERT INTO public.planet VALUES (9, 'Kepler-452b', 'It is the most earth-like planet discovered by humans.', true, 18.00, 4, true);
INSERT INTO public.planet VALUES (10, 'Kepler-62f', 'This might be the other earth we are looking for the doomsday.', true, 99.00, 4, true);
INSERT INTO public.planet VALUES (11, 'Kepler-90i', 'It orbits its star every 14.45 days.', true, 284.05, 4, false);
INSERT INTO public.planet VALUES (12, 'Kepler-1649c', 'Its in the habitable zone of its star and earth-sized.', true, 183.49, 4, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Sun is the center of our solar system. The most essential source of energy on earth.', 4600, 1, true);
INSERT INTO public.star VALUES (2, 'Sirius', 'Its the brightest star in the night sky also known as the Dog Star.', 242, 1, true);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 'Its the nearest multiplanetary star to the Sun with two planets.', 4850, 1, false);
INSERT INTO public.star VALUES (4, 'Kepler-90', 'This is the only other discovered star with 8 planets orbiting it.', 2000, 1, true);
INSERT INTO public.star VALUES (5, 'Alpheratz', 'It is the brightest star in the constellation of Andromeda.', 60, 2, true);
INSERT INTO public.star VALUES (6, 'Aldura', 'It is also known as Eta Canis Majoris. Its a blue-white supergiant.', 8, 6, false);


--
-- Name: celestial_events_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.celestial_events_event_id_seq', 3, true);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


--
-- Name: celestial_events celestial_events_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_events
    ADD CONSTRAINT celestial_events_name_key UNIQUE (name);


--
-- Name: celestial_events celestial_events_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_events
    ADD CONSTRAINT celestial_events_pkey PRIMARY KEY (celestial_events_id);


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

