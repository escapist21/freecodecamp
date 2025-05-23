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
-- Name: game_stats; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.game_stats (
    user_id integer NOT NULL,
    stat_id integer NOT NULL,
    games_played integer DEFAULT 0 NOT NULL,
    best_game integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.game_stats OWNER TO freecodecamp;

--
-- Name: game_stats_stat_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.game_stats_stat_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_stats_stat_id_seq OWNER TO freecodecamp;

--
-- Name: game_stats_stat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.game_stats_stat_id_seq OWNED BY public.game_stats.stat_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: game_stats stat_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game_stats ALTER COLUMN stat_id SET DEFAULT nextval('public.game_stats_stat_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: game_stats; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.game_stats VALUES (7, 2, 0, 0);
INSERT INTO public.game_stats VALUES (8, 3, 0, 0);
INSERT INTO public.game_stats VALUES (9, 4, 0, 0);
INSERT INTO public.game_stats VALUES (10, 5, 0, 0);
INSERT INTO public.game_stats VALUES (11, 6, 0, 0);
INSERT INTO public.game_stats VALUES (12, 7, 0, 0);
INSERT INTO public.game_stats VALUES (13, 8, 0, 0);
INSERT INTO public.game_stats VALUES (14, 9, 0, 0);
INSERT INTO public.game_stats VALUES (15, 10, 0, 0);
INSERT INTO public.game_stats VALUES (16, 11, 0, 0);
INSERT INTO public.game_stats VALUES (17, 12, 0, 0);
INSERT INTO public.game_stats VALUES (18, 13, 1, 10);
INSERT INTO public.game_stats VALUES (1, 1, 5, 6);
INSERT INTO public.game_stats VALUES (20, 15, 2, 40);
INSERT INTO public.game_stats VALUES (19, 14, 5, 93);
INSERT INTO public.game_stats VALUES (22, 17, 2, 217);
INSERT INTO public.game_stats VALUES (21, 16, 5, 328);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'player1');
INSERT INTO public.users VALUES (2, 'player2');
INSERT INTO public.users VALUES (6, 'player3');
INSERT INTO public.users VALUES (7, 'player4');
INSERT INTO public.users VALUES (8, 'player5');
INSERT INTO public.users VALUES (9, 'player6');
INSERT INTO public.users VALUES (10, 'player7');
INSERT INTO public.users VALUES (11, 'player8');
INSERT INTO public.users VALUES (12, 'player9');
INSERT INTO public.users VALUES (13, 'player10');
INSERT INTO public.users VALUES (14, 'player11');
INSERT INTO public.users VALUES (15, 'player12');
INSERT INTO public.users VALUES (16, 'player13');
INSERT INTO public.users VALUES (17, 'player14');
INSERT INTO public.users VALUES (18, 'player20');
INSERT INTO public.users VALUES (19, 'user_1744347686601');
INSERT INTO public.users VALUES (20, 'user_1744347686600');
INSERT INTO public.users VALUES (21, 'user_1744347769468');
INSERT INTO public.users VALUES (22, 'user_1744347769467');


--
-- Name: game_stats_stat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.game_stats_stat_id_seq', 17, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 22, true);


--
-- Name: game_stats game_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game_stats
    ADD CONSTRAINT game_stats_pkey PRIMARY KEY (stat_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: game_stats game_stats_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game_stats
    ADD CONSTRAINT game_stats_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

