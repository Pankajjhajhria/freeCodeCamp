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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: stats; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.stats (
    user_id integer NOT NULL,
    name character varying(22) NOT NULL,
    attempts integer DEFAULT 0,
    best_score integer DEFAULT 0
);


ALTER TABLE public.stats OWNER TO freecodecamp;

--
-- Name: stats_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.stats_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stats_user_id_seq OWNER TO freecodecamp;

--
-- Name: stats_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.stats_user_id_seq OWNED BY public.stats.user_id;


--
-- Name: stats user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stats ALTER COLUMN user_id SET DEFAULT nextval('public.stats_user_id_seq'::regclass);


--
-- Data for Name: stats; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.stats VALUES (2, 'user_1676040064609', 2, 215);
INSERT INTO public.stats VALUES (1, 'user_1676040064610', 5, 804);
INSERT INTO public.stats VALUES (4, 'user_1676040458557', 2, 439);
INSERT INTO public.stats VALUES (3, 'user_1676040458558', 5, 204);
INSERT INTO public.stats VALUES (5, 'Adam', 3, 10);


--
-- Name: stats_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.stats_user_id_seq', 5, true);


--
-- Name: stats stats_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stats
    ADD CONSTRAINT stats_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

