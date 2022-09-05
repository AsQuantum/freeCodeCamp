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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(25) DEFAULT 'username'::character varying NOT NULL,
    games_played integer DEFAULT 0 NOT NULL,
    best_game integer
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
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (3, 'user_1662377122394', 2, 63);
INSERT INTO public.users VALUES (13, 'user_1662377377221', 2, 735);
INSERT INTO public.users VALUES (2, 'user_1662377122395', 5, 148);
INSERT INTO public.users VALUES (27, 'user_1662377614292', 2, 49);
INSERT INTO public.users VALUES (53, 'user_1662377771518', 2, 295);
INSERT INTO public.users VALUES (12, 'user_1662377377222', 5, 361);
INSERT INTO public.users VALUES (26, 'user_1662377614293', 5, 451);
INSERT INTO public.users VALUES (5, 'user_1662377208926', 2, 343);
INSERT INTO public.users VALUES (1, 'test', 2, 12);
INSERT INTO public.users VALUES (4, 'user_1662377208927', 5, 602);
INSERT INTO public.users VALUES (41, 'user_1662377748926', 2, 396);
INSERT INTO public.users VALUES (7, 'user_1662377235494', 2, 473);
INSERT INTO public.users VALUES (52, 'user_1662377771519', 5, 430);
INSERT INTO public.users VALUES (15, 'user_1662377492065', 2, 62);
INSERT INTO public.users VALUES (6, 'user_1662377235495', 5, 250);
INSERT INTO public.users VALUES (40, 'user_1662377748927', 5, 10);
INSERT INTO public.users VALUES (29, 'user_1662377650463', 2, 328);
INSERT INTO public.users VALUES (14, 'user_1662377492066', 5, 245);
INSERT INTO public.users VALUES (9, 'user_1662377286091', 2, 542);
INSERT INTO public.users VALUES (8, 'user_1662377286092', 5, 130);
INSERT INTO public.users VALUES (28, 'user_1662377650464', 5, 283);
INSERT INTO public.users VALUES (17, 'user_1662377508048', 2, 535);
INSERT INTO public.users VALUES (11, 'user_1662377304606', 2, 140);
INSERT INTO public.users VALUES (16, 'user_1662377508049', 5, 113);
INSERT INTO public.users VALUES (10, 'user_1662377304607', 5, 258);
INSERT INTO public.users VALUES (43, 'user_1662377753191', 2, 2);
INSERT INTO public.users VALUES (31, 'user_1662377660494', 2, 32);
INSERT INTO public.users VALUES (19, 'user_1662377544904', 2, 383);
INSERT INTO public.users VALUES (42, 'user_1662377753192', 5, 358);
INSERT INTO public.users VALUES (30, 'user_1662377660495', 5, 189);
INSERT INTO public.users VALUES (18, 'user_1662377544905', 5, 309);
INSERT INTO public.users VALUES (55, 'user_1662377774348', 2, 814);
INSERT INTO public.users VALUES (21, 'user_1662377564264', 2, 366);
INSERT INTO public.users VALUES (33, 'user_1662377666580', 2, 331);
INSERT INTO public.users VALUES (45, 'user_1662377756753', 2, 306);
INSERT INTO public.users VALUES (54, 'user_1662377774349', 5, 16);
INSERT INTO public.users VALUES (20, 'user_1662377564265', 5, 339);
INSERT INTO public.users VALUES (32, 'user_1662377666581', 5, 473);
INSERT INTO public.users VALUES (44, 'user_1662377756754', 5, 219);
INSERT INTO public.users VALUES (23, 'user_1662377589699', 2, 32);
INSERT INTO public.users VALUES (22, 'user_1662377589700', 5, 167);
INSERT INTO public.users VALUES (35, 'user_1662377669215', 2, 196);
INSERT INTO public.users VALUES (25, 'user_1662377596983', 2, 746);
INSERT INTO public.users VALUES (34, 'user_1662377669216', 5, 607);
INSERT INTO public.users VALUES (47, 'user_1662377760231', 2, 155);
INSERT INTO public.users VALUES (24, 'user_1662377596984', 5, 134);
INSERT INTO public.users VALUES (57, 'user_1662377777113', 2, 186);
INSERT INTO public.users VALUES (46, 'user_1662377760232', 5, 181);
INSERT INTO public.users VALUES (37, 'user_1662377671996', 2, 157);
INSERT INTO public.users VALUES (36, 'user_1662377671997', 5, 550);
INSERT INTO public.users VALUES (56, 'user_1662377777114', 5, 584);
INSERT INTO public.users VALUES (49, 'user_1662377763859', 2, 328);
INSERT INTO public.users VALUES (39, 'user_1662377677195', 2, 500);
INSERT INTO public.users VALUES (38, 'user_1662377677196', 5, 13);
INSERT INTO public.users VALUES (48, 'user_1662377763860', 5, 178);
INSERT INTO public.users VALUES (59, 'user_1662377780079', 2, 427);
INSERT INTO public.users VALUES (51, 'user_1662377767880', 2, 787);
INSERT INTO public.users VALUES (58, 'user_1662377780080', 5, 371);
INSERT INTO public.users VALUES (50, 'user_1662377767881', 5, 311);
INSERT INTO public.users VALUES (61, 'user_1662377782909', 2, 323);
INSERT INTO public.users VALUES (60, 'user_1662377782910', 5, 425);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 61, true);


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
-- PostgreSQL database dump complete
--

