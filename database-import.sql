--
-- PostgreSQL database dump
--

-- Dumped from database version 12.6 (Ubuntu 12.6-0ubuntu0.20.10.1)
-- Dumped by pg_dump version 12.6 (Ubuntu 12.6-0ubuntu0.20.10.1)

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

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: customer; Type: TABLE; Schema: public; Owner: webstore
--

CREATE TABLE public.customer (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    roles json NOT NULL,
    address character varying(255) NOT NULL
);


ALTER TABLE public.customer OWNER TO webstore;

--
-- Name: customer_id_seq; Type: SEQUENCE; Schema: public; Owner: webstore
--

CREATE SEQUENCE public.customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_id_seq OWNER TO webstore;

--
-- Name: doctrine_migration_versions; Type: TABLE; Schema: public; Owner: webstore
--

CREATE TABLE public.doctrine_migration_versions (
    version character varying(191) NOT NULL,
    executed_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    execution_time integer
);


ALTER TABLE public.doctrine_migration_versions OWNER TO webstore;

--
-- Name: employee; Type: TABLE; Schema: public; Owner: webstore
--

CREATE TABLE public.employee (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    roles json NOT NULL,
    password character varying(255) NOT NULL
);


ALTER TABLE public.employee OWNER TO webstore;

--
-- Name: employee_id_seq; Type: SEQUENCE; Schema: public; Owner: webstore
--

CREATE SEQUENCE public.employee_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employee_id_seq OWNER TO webstore;

--
-- Name: offer; Type: TABLE; Schema: public; Owner: webstore
--

CREATE TABLE public.offer (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255) DEFAULT NULL::character varying,
    value character varying(255) DEFAULT NULL::character varying,
    description character varying(255) DEFAULT NULL::character varying,
    valid_from timestamp(0) with time zone DEFAULT NULL::timestamp with time zone,
    valid_through timestamp(0) with time zone DEFAULT NULL::timestamp with time zone
);


ALTER TABLE public.offer OWNER TO webstore;

--
-- Name: offer_id_seq; Type: SEQUENCE; Schema: public; Owner: webstore
--

CREATE SEQUENCE public.offer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.offer_id_seq OWNER TO webstore;

--
-- Name: offer_product; Type: TABLE; Schema: public; Owner: webstore
--

CREATE TABLE public.offer_product (
    offer_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.offer_product OWNER TO webstore;

--
-- Name: order; Type: TABLE; Schema: public; Owner: webstore
--

CREATE TABLE public."order" (
    id integer NOT NULL,
    customer_id integer NOT NULL
);


ALTER TABLE public."order" OWNER TO webstore;

--
-- Name: order_id_seq; Type: SEQUENCE; Schema: public; Owner: webstore
--

CREATE SEQUENCE public.order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_id_seq OWNER TO webstore;

--
-- Name: order_product; Type: TABLE; Schema: public; Owner: webstore
--

CREATE TABLE public.order_product (
    order_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.order_product OWNER TO webstore;

--
-- Name: product; Type: TABLE; Schema: public; Owner: webstore
--

CREATE TABLE public.product (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255) DEFAULT NULL::character varying,
    price double precision,
    stock integer,
    image text,
    updated_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE public.product OWNER TO webstore;

--
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: webstore
--

CREATE SEQUENCE public.product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_id_seq OWNER TO webstore;

--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: webstore
--

INSERT INTO public.customer VALUES (1, 'customer1', 'customer1@webstore.com', '$argon2id$v=19$m=65536,t=4,p=1$eUWtMLu8VUFJUFNJk3uy+Q$OIA0yGyA+R0jvfJCHYzBfkWSROv94JsiameHHMZ86hs', '["ROLE_CUSTOMER"]', 'address1');
INSERT INTO public.customer VALUES (2, 'customer2', 'customer2@webstore.com', '$argon2id$v=19$m=65536,t=4,p=1$Li/wZgjw7ut4szcjqsshqw$Y9tjJr/jAI5t8YMPHNAsETsz0UqCQ/WIrP8weA4Ykug', '["ROLE_CUSTOMER"]', 'address2');
INSERT INTO public.customer VALUES (3, 'customer3', 'customer3@webstore.com', '$argon2id$v=19$m=65536,t=4,p=1$i3pcQOHz9mlXjzST5iMqLg$2siJBewpKvqUPoFb8Ttn3pbeAjnv4EuyS1mwsWQ92Nc', '["ROLE_CUSTOMER"]', 'address3');
INSERT INTO public.customer VALUES (4, 'customer4', 'customer4@webstore.com', '$argon2id$v=19$m=65536,t=4,p=1$V9q8wwesxC4BebQRFvICbw$NpSq/cHAZ33DzrQvKwFqVTSMx8Wg0YCRU+I4yn/vTUo', '["ROLE_CUSTOMER"]', 'address4');
INSERT INTO public.customer VALUES (5, 'customer5', 'customer5@webstore.com', '$argon2id$v=19$m=65536,t=4,p=1$2LZxS2f9E64nVNGJT5O6Xg$EK3L37zXaeDgFlezFjDhmCkKAzU7LBgA7c/To6wnh3E', '["ROLE_CUSTOMER"]', 'address5');


--
-- Data for Name: doctrine_migration_versions; Type: TABLE DATA; Schema: public; Owner: webstore
--

INSERT INTO public.doctrine_migration_versions VALUES ('DoctrineMigrations\Version20210418111540', '2021-04-18 13:15:43', 75);


--
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: webstore
--

INSERT INTO public.employee VALUES (1, 'admin', 'admin@admin.com', '["ROLE_ADMIN"]', '$argon2id$v=19$m=65536,t=4,p=1$lH8HM0JIpORMUc1vb9DNzg$2IXZJwjpJRzvm7sVAeNxls6bgPqBWA226dkd+tuxa+w');


--
-- Data for Name: offer; Type: TABLE DATA; Schema: public; Owner: webstore
--

INSERT INTO public.offer VALUES (1, 'Offer 1', 'type 1', '10', 'This is Description 1', '2021-04-18 13:15:46+02', '2021-05-18 13:15:46+02');
INSERT INTO public.offer VALUES (2, 'Offer 2', 'type 2', '20', 'This is Description 2', '2021-04-18 13:15:46+02', '2021-05-18 13:15:46+02');
INSERT INTO public.offer VALUES (3, 'Offer 3', 'type 3', '30', 'This is Description 3', '2021-04-18 13:15:46+02', '2021-05-18 13:15:46+02');
INSERT INTO public.offer VALUES (4, 'Offer 4', 'type 4', '40', 'This is Description 4', '2021-04-18 13:15:46+02', '2021-05-18 13:15:46+02');
INSERT INTO public.offer VALUES (5, 'Offer 5', 'type 5', '50', 'This is Description 5', '2021-04-18 13:15:46+02', '2021-05-18 13:15:46+02');


--
-- Data for Name: offer_product; Type: TABLE DATA; Schema: public; Owner: webstore
--



--
-- Data for Name: order; Type: TABLE DATA; Schema: public; Owner: webstore
--

INSERT INTO public."order" VALUES (1, 1);
INSERT INTO public."order" VALUES (2, 2);
INSERT INTO public."order" VALUES (3, 3);
INSERT INTO public."order" VALUES (4, 4);
INSERT INTO public."order" VALUES (5, 5);


--
-- Data for Name: order_product; Type: TABLE DATA; Schema: public; Owner: webstore
--



--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: webstore
--

INSERT INTO public.product VALUES (2, 'Product2', 'This product description 2', 22.22, 4, NULL, NULL);
INSERT INTO public.product VALUES (3, 'Product3', 'This product description 3', 33.33, 6, NULL, NULL);
INSERT INTO public.product VALUES (4, 'Product4', 'This product description 4', 44.44, 8, NULL, NULL);
INSERT INTO public.product VALUES (5, 'Product5', 'This product description 5', 55.55, 10, NULL, NULL);
INSERT INTO public.product VALUES (1, 'Product1', 'This product description 1', 11.11, 2, 'customLogo.jpg', NULL);


--
-- Name: customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: webstore
--

SELECT pg_catalog.setval('public.customer_id_seq', 5, true);


--
-- Name: employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: webstore
--

SELECT pg_catalog.setval('public.employee_id_seq', 1, true);


--
-- Name: offer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: webstore
--

SELECT pg_catalog.setval('public.offer_id_seq', 5, true);


--
-- Name: order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: webstore
--

SELECT pg_catalog.setval('public.order_id_seq', 5, true);


--
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: webstore
--

SELECT pg_catalog.setval('public.product_id_seq', 5, true);


--
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: webstore
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id);


--
-- Name: doctrine_migration_versions doctrine_migration_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: webstore
--

ALTER TABLE ONLY public.doctrine_migration_versions
    ADD CONSTRAINT doctrine_migration_versions_pkey PRIMARY KEY (version);


--
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: public; Owner: webstore
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (id);


--
-- Name: offer offer_pkey; Type: CONSTRAINT; Schema: public; Owner: webstore
--

ALTER TABLE ONLY public.offer
    ADD CONSTRAINT offer_pkey PRIMARY KEY (id);


--
-- Name: offer_product offer_product_pkey; Type: CONSTRAINT; Schema: public; Owner: webstore
--

ALTER TABLE ONLY public.offer_product
    ADD CONSTRAINT offer_product_pkey PRIMARY KEY (offer_id, product_id);


--
-- Name: order order_pkey; Type: CONSTRAINT; Schema: public; Owner: webstore
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (id);


--
-- Name: order_product order_product_pkey; Type: CONSTRAINT; Schema: public; Owner: webstore
--

ALTER TABLE ONLY public.order_product
    ADD CONSTRAINT order_product_pkey PRIMARY KEY (order_id, product_id);


--
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: webstore
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- Name: idx_2530ade64584665a; Type: INDEX; Schema: public; Owner: webstore
--

CREATE INDEX idx_2530ade64584665a ON public.order_product USING btree (product_id);


--
-- Name: idx_2530ade68d9f6d38; Type: INDEX; Schema: public; Owner: webstore
--

CREATE INDEX idx_2530ade68d9f6d38 ON public.order_product USING btree (order_id);


--
-- Name: idx_7242c2a44584665a; Type: INDEX; Schema: public; Owner: webstore
--

CREATE INDEX idx_7242c2a44584665a ON public.offer_product USING btree (product_id);


--
-- Name: idx_7242c2a453c674ee; Type: INDEX; Schema: public; Owner: webstore
--

CREATE INDEX idx_7242c2a453c674ee ON public.offer_product USING btree (offer_id);


--
-- Name: idx_f52993989395c3f3; Type: INDEX; Schema: public; Owner: webstore
--

CREATE INDEX idx_f52993989395c3f3 ON public."order" USING btree (customer_id);


--
-- Name: order_product fk_2530ade64584665a; Type: FK CONSTRAINT; Schema: public; Owner: webstore
--

ALTER TABLE ONLY public.order_product
    ADD CONSTRAINT fk_2530ade64584665a FOREIGN KEY (product_id) REFERENCES public.product(id) ON DELETE CASCADE;


--
-- Name: order_product fk_2530ade68d9f6d38; Type: FK CONSTRAINT; Schema: public; Owner: webstore
--

ALTER TABLE ONLY public.order_product
    ADD CONSTRAINT fk_2530ade68d9f6d38 FOREIGN KEY (order_id) REFERENCES public."order"(id) ON DELETE CASCADE;


--
-- Name: offer_product fk_7242c2a44584665a; Type: FK CONSTRAINT; Schema: public; Owner: webstore
--

ALTER TABLE ONLY public.offer_product
    ADD CONSTRAINT fk_7242c2a44584665a FOREIGN KEY (product_id) REFERENCES public.product(id) ON DELETE CASCADE;


--
-- Name: offer_product fk_7242c2a453c674ee; Type: FK CONSTRAINT; Schema: public; Owner: webstore
--

ALTER TABLE ONLY public.offer_product
    ADD CONSTRAINT fk_7242c2a453c674ee FOREIGN KEY (offer_id) REFERENCES public.offer(id) ON DELETE CASCADE;


--
-- Name: order fk_f52993989395c3f3; Type: FK CONSTRAINT; Schema: public; Owner: webstore
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT fk_f52993989395c3f3 FOREIGN KEY (customer_id) REFERENCES public.customer(id);


--
-- PostgreSQL database dump complete
--

