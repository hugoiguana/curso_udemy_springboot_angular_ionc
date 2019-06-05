--
-- PostgreSQL database dump
--

-- Dumped from database version 10.8 (Ubuntu 10.8-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.8 (Ubuntu 10.8-0ubuntu0.18.04.1)

-- Started on 2019-06-04 20:59:20 -03

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
-- TOC entry 1 (class 3079 OID 13043)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3042 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 197 (class 1259 OID 24579)
-- Name: categoria; Type: TABLE; Schema: public; Owner: hugoiguana
--

CREATE TABLE public.categoria (
    id integer NOT NULL,
    nome character varying(255)
);


ALTER TABLE public.categoria OWNER TO hugoiguana;

--
-- TOC entry 196 (class 1259 OID 24577)
-- Name: categoria_id_seq; Type: SEQUENCE; Schema: public; Owner: hugoiguana
--

CREATE SEQUENCE public.categoria_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categoria_id_seq OWNER TO hugoiguana;

--
-- TOC entry 3043 (class 0 OID 0)
-- Dependencies: 196
-- Name: categoria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hugoiguana
--

ALTER SEQUENCE public.categoria_id_seq OWNED BY public.categoria.id;


--
-- TOC entry 199 (class 1259 OID 24587)
-- Name: cidade; Type: TABLE; Schema: public; Owner: hugoiguana
--

CREATE TABLE public.cidade (
    id integer NOT NULL,
    nome character varying(255),
    estado_id integer
);


ALTER TABLE public.cidade OWNER TO hugoiguana;

--
-- TOC entry 198 (class 1259 OID 24585)
-- Name: cidade_id_seq; Type: SEQUENCE; Schema: public; Owner: hugoiguana
--

CREATE SEQUENCE public.cidade_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cidade_id_seq OWNER TO hugoiguana;

--
-- TOC entry 3044 (class 0 OID 0)
-- Dependencies: 198
-- Name: cidade_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hugoiguana
--

ALTER SEQUENCE public.cidade_id_seq OWNED BY public.cidade.id;


--
-- TOC entry 201 (class 1259 OID 24595)
-- Name: cliente; Type: TABLE; Schema: public; Owner: hugoiguana
--

CREATE TABLE public.cliente (
    id integer NOT NULL,
    cpf_ou_cnpj character varying(255),
    email character varying(255),
    nome character varying(255),
    tipo integer
);


ALTER TABLE public.cliente OWNER TO hugoiguana;

--
-- TOC entry 200 (class 1259 OID 24593)
-- Name: cliente_id_seq; Type: SEQUENCE; Schema: public; Owner: hugoiguana
--

CREATE SEQUENCE public.cliente_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cliente_id_seq OWNER TO hugoiguana;

--
-- TOC entry 3045 (class 0 OID 0)
-- Dependencies: 200
-- Name: cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hugoiguana
--

ALTER SEQUENCE public.cliente_id_seq OWNED BY public.cliente.id;


--
-- TOC entry 203 (class 1259 OID 24606)
-- Name: endereco; Type: TABLE; Schema: public; Owner: hugoiguana
--

CREATE TABLE public.endereco (
    id integer NOT NULL,
    bairro character varying(255),
    cep character varying(255),
    complemento character varying(255),
    logradouro character varying(255),
    numero character varying(255),
    cidade_id integer,
    cliente_id integer
);


ALTER TABLE public.endereco OWNER TO hugoiguana;

--
-- TOC entry 202 (class 1259 OID 24604)
-- Name: endereco_id_seq; Type: SEQUENCE; Schema: public; Owner: hugoiguana
--

CREATE SEQUENCE public.endereco_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.endereco_id_seq OWNER TO hugoiguana;

--
-- TOC entry 3046 (class 0 OID 0)
-- Dependencies: 202
-- Name: endereco_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hugoiguana
--

ALTER SEQUENCE public.endereco_id_seq OWNED BY public.endereco.id;


--
-- TOC entry 205 (class 1259 OID 24617)
-- Name: estado; Type: TABLE; Schema: public; Owner: hugoiguana
--

CREATE TABLE public.estado (
    id integer NOT NULL,
    nome character varying(255)
);


ALTER TABLE public.estado OWNER TO hugoiguana;

--
-- TOC entry 204 (class 1259 OID 24615)
-- Name: estado_id_seq; Type: SEQUENCE; Schema: public; Owner: hugoiguana
--

CREATE SEQUENCE public.estado_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.estado_id_seq OWNER TO hugoiguana;

--
-- TOC entry 3047 (class 0 OID 0)
-- Dependencies: 204
-- Name: estado_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hugoiguana
--

ALTER SEQUENCE public.estado_id_seq OWNED BY public.estado.id;


--
-- TOC entry 206 (class 1259 OID 24623)
-- Name: item_pedido; Type: TABLE; Schema: public; Owner: hugoiguana
--

CREATE TABLE public.item_pedido (
    desconto double precision,
    preco double precision,
    quantidade integer,
    pedido_id integer NOT NULL,
    produto_id integer NOT NULL
);


ALTER TABLE public.item_pedido OWNER TO hugoiguana;

--
-- TOC entry 207 (class 1259 OID 24628)
-- Name: pagamento; Type: TABLE; Schema: public; Owner: hugoiguana
--

CREATE TABLE public.pagamento (
    pedido_id integer NOT NULL,
    estado integer
);


ALTER TABLE public.pagamento OWNER TO hugoiguana;

--
-- TOC entry 208 (class 1259 OID 24633)
-- Name: pagamento_com_boleto; Type: TABLE; Schema: public; Owner: hugoiguana
--

CREATE TABLE public.pagamento_com_boleto (
    data_pagamento timestamp without time zone,
    data_vencimento timestamp without time zone,
    pedido_id integer NOT NULL
);


ALTER TABLE public.pagamento_com_boleto OWNER TO hugoiguana;

--
-- TOC entry 209 (class 1259 OID 24638)
-- Name: pagamento_com_cartao; Type: TABLE; Schema: public; Owner: hugoiguana
--

CREATE TABLE public.pagamento_com_cartao (
    numero_de_parcelas integer,
    pedido_id integer NOT NULL
);


ALTER TABLE public.pagamento_com_cartao OWNER TO hugoiguana;

--
-- TOC entry 211 (class 1259 OID 24645)
-- Name: pedido; Type: TABLE; Schema: public; Owner: hugoiguana
--

CREATE TABLE public.pedido (
    id integer NOT NULL,
    instante timestamp without time zone,
    cliente_id integer,
    endereco_de_entrega_id integer
);


ALTER TABLE public.pedido OWNER TO hugoiguana;

--
-- TOC entry 210 (class 1259 OID 24643)
-- Name: pedido_id_seq; Type: SEQUENCE; Schema: public; Owner: hugoiguana
--

CREATE SEQUENCE public.pedido_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pedido_id_seq OWNER TO hugoiguana;

--
-- TOC entry 3048 (class 0 OID 0)
-- Dependencies: 210
-- Name: pedido_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hugoiguana
--

ALTER SEQUENCE public.pedido_id_seq OWNED BY public.pedido.id;


--
-- TOC entry 213 (class 1259 OID 24653)
-- Name: produto; Type: TABLE; Schema: public; Owner: hugoiguana
--

CREATE TABLE public.produto (
    id integer NOT NULL,
    nome character varying(255),
    preco double precision
);


ALTER TABLE public.produto OWNER TO hugoiguana;

--
-- TOC entry 214 (class 1259 OID 24659)
-- Name: produto_categoria; Type: TABLE; Schema: public; Owner: hugoiguana
--

CREATE TABLE public.produto_categoria (
    produto_id integer NOT NULL,
    categoria_id integer NOT NULL
);


ALTER TABLE public.produto_categoria OWNER TO hugoiguana;

--
-- TOC entry 212 (class 1259 OID 24651)
-- Name: produto_id_seq; Type: SEQUENCE; Schema: public; Owner: hugoiguana
--

CREATE SEQUENCE public.produto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.produto_id_seq OWNER TO hugoiguana;

--
-- TOC entry 3049 (class 0 OID 0)
-- Dependencies: 212
-- Name: produto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hugoiguana
--

ALTER SEQUENCE public.produto_id_seq OWNED BY public.produto.id;


--
-- TOC entry 215 (class 1259 OID 24662)
-- Name: telefone; Type: TABLE; Schema: public; Owner: hugoiguana
--

CREATE TABLE public.telefone (
    cliente_id integer NOT NULL,
    telefones character varying(255)
);


ALTER TABLE public.telefone OWNER TO hugoiguana;

--
-- TOC entry 2850 (class 2604 OID 24582)
-- Name: categoria id; Type: DEFAULT; Schema: public; Owner: hugoiguana
--

ALTER TABLE ONLY public.categoria ALTER COLUMN id SET DEFAULT nextval('public.categoria_id_seq'::regclass);


--
-- TOC entry 2851 (class 2604 OID 24590)
-- Name: cidade id; Type: DEFAULT; Schema: public; Owner: hugoiguana
--

ALTER TABLE ONLY public.cidade ALTER COLUMN id SET DEFAULT nextval('public.cidade_id_seq'::regclass);


--
-- TOC entry 2852 (class 2604 OID 24598)
-- Name: cliente id; Type: DEFAULT; Schema: public; Owner: hugoiguana
--

ALTER TABLE ONLY public.cliente ALTER COLUMN id SET DEFAULT nextval('public.cliente_id_seq'::regclass);


--
-- TOC entry 2853 (class 2604 OID 24609)
-- Name: endereco id; Type: DEFAULT; Schema: public; Owner: hugoiguana
--

ALTER TABLE ONLY public.endereco ALTER COLUMN id SET DEFAULT nextval('public.endereco_id_seq'::regclass);


--
-- TOC entry 2854 (class 2604 OID 24620)
-- Name: estado id; Type: DEFAULT; Schema: public; Owner: hugoiguana
--

ALTER TABLE ONLY public.estado ALTER COLUMN id SET DEFAULT nextval('public.estado_id_seq'::regclass);


--
-- TOC entry 2855 (class 2604 OID 24648)
-- Name: pedido id; Type: DEFAULT; Schema: public; Owner: hugoiguana
--

ALTER TABLE ONLY public.pedido ALTER COLUMN id SET DEFAULT nextval('public.pedido_id_seq'::regclass);


--
-- TOC entry 2856 (class 2604 OID 24656)
-- Name: produto id; Type: DEFAULT; Schema: public; Owner: hugoiguana
--

ALTER TABLE ONLY public.produto ALTER COLUMN id SET DEFAULT nextval('public.produto_id_seq'::regclass);


--
-- TOC entry 3016 (class 0 OID 24579)
-- Dependencies: 197
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: hugoiguana
--

COPY public.categoria (id, nome) FROM stdin;
1	Informática
2	Escritório
3	Cama mesa e banho
4	Eletrônicos
5	Jardinagem
6	Decoração
7	Perfumaria
\.


--
-- TOC entry 3018 (class 0 OID 24587)
-- Dependencies: 199
-- Data for Name: cidade; Type: TABLE DATA; Schema: public; Owner: hugoiguana
--

COPY public.cidade (id, nome, estado_id) FROM stdin;
1	Uberlândia	1
2	São Paulo	2
3	Campinas	2
4	Uberlândia	3
5	São Paulo	4
6	Campinas	4
\.


--
-- TOC entry 3020 (class 0 OID 24595)
-- Dependencies: 201
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: hugoiguana
--

COPY public.cliente (id, cpf_ou_cnpj, email, nome, tipo) FROM stdin;
1	36378912377	maria@gmail.com	Maria Silva	1
\.


--
-- TOC entry 3022 (class 0 OID 24606)
-- Dependencies: 203
-- Data for Name: endereco; Type: TABLE DATA; Schema: public; Owner: hugoiguana
--

COPY public.endereco (id, bairro, cep, complemento, logradouro, numero, cidade_id, cliente_id) FROM stdin;
1	Jardim	38220834	Apto 303	Rua Flores	300	1	1
2	Centro	38777012	Sala 800	Avenida Matos	105	2	1
\.


--
-- TOC entry 3024 (class 0 OID 24617)
-- Dependencies: 205
-- Data for Name: estado; Type: TABLE DATA; Schema: public; Owner: hugoiguana
--

COPY public.estado (id, nome) FROM stdin;
1	Minas Gerais
2	São Paulo
3	Minas Gerais
4	São Paulo
\.


--
-- TOC entry 3025 (class 0 OID 24623)
-- Dependencies: 206
-- Data for Name: item_pedido; Type: TABLE DATA; Schema: public; Owner: hugoiguana
--

COPY public.item_pedido (desconto, preco, quantidade, pedido_id, produto_id) FROM stdin;
0	2000	1	1	1
0	80	2	1	3
100	800	1	2	2
\.


--
-- TOC entry 3026 (class 0 OID 24628)
-- Dependencies: 207
-- Data for Name: pagamento; Type: TABLE DATA; Schema: public; Owner: hugoiguana
--

COPY public.pagamento (pedido_id, estado) FROM stdin;
1	2
2	1
\.


--
-- TOC entry 3027 (class 0 OID 24633)
-- Dependencies: 208
-- Data for Name: pagamento_com_boleto; Type: TABLE DATA; Schema: public; Owner: hugoiguana
--

COPY public.pagamento_com_boleto (data_pagamento, data_vencimento, pedido_id) FROM stdin;
\N	2017-10-20 00:00:00	2
\.


--
-- TOC entry 3028 (class 0 OID 24638)
-- Dependencies: 209
-- Data for Name: pagamento_com_cartao; Type: TABLE DATA; Schema: public; Owner: hugoiguana
--

COPY public.pagamento_com_cartao (numero_de_parcelas, pedido_id) FROM stdin;
6	1
\.


--
-- TOC entry 3030 (class 0 OID 24645)
-- Dependencies: 211
-- Data for Name: pedido; Type: TABLE DATA; Schema: public; Owner: hugoiguana
--

COPY public.pedido (id, instante, cliente_id, endereco_de_entrega_id) FROM stdin;
1	2017-09-30 10:32:00	1	1
2	2017-10-10 19:35:00	1	2
\.


--
-- TOC entry 3032 (class 0 OID 24653)
-- Dependencies: 213
-- Data for Name: produto; Type: TABLE DATA; Schema: public; Owner: hugoiguana
--

COPY public.produto (id, nome, preco) FROM stdin;
1	Computador	2000
2	Impressora	800
3	Mouse	80
4	Mesa de escritório	300
5	Toalha	50
6	Colcha	200
7	TV true color	1200
8	Roçadeira	800
9	Abajour	100
10	Pendente	180
11	Shampoo	90
\.


--
-- TOC entry 3033 (class 0 OID 24659)
-- Dependencies: 214
-- Data for Name: produto_categoria; Type: TABLE DATA; Schema: public; Owner: hugoiguana
--

COPY public.produto_categoria (produto_id, categoria_id) FROM stdin;
1	1
1	4
2	1
2	2
2	4
3	1
3	4
4	2
5	3
6	3
7	4
8	5
9	6
10	6
11	7
\.


--
-- TOC entry 3034 (class 0 OID 24662)
-- Dependencies: 215
-- Data for Name: telefone; Type: TABLE DATA; Schema: public; Owner: hugoiguana
--

COPY public.telefone (cliente_id, telefones) FROM stdin;
1	27363323
1	93838393
\.


--
-- TOC entry 3050 (class 0 OID 0)
-- Dependencies: 196
-- Name: categoria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hugoiguana
--

SELECT pg_catalog.setval('public.categoria_id_seq', 7, true);


--
-- TOC entry 3051 (class 0 OID 0)
-- Dependencies: 198
-- Name: cidade_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hugoiguana
--

SELECT pg_catalog.setval('public.cidade_id_seq', 6, true);


--
-- TOC entry 3052 (class 0 OID 0)
-- Dependencies: 200
-- Name: cliente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hugoiguana
--

SELECT pg_catalog.setval('public.cliente_id_seq', 1, true);


--
-- TOC entry 3053 (class 0 OID 0)
-- Dependencies: 202
-- Name: endereco_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hugoiguana
--

SELECT pg_catalog.setval('public.endereco_id_seq', 2, true);


--
-- TOC entry 3054 (class 0 OID 0)
-- Dependencies: 204
-- Name: estado_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hugoiguana
--

SELECT pg_catalog.setval('public.estado_id_seq', 4, true);


--
-- TOC entry 3055 (class 0 OID 0)
-- Dependencies: 210
-- Name: pedido_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hugoiguana
--

SELECT pg_catalog.setval('public.pedido_id_seq', 2, true);


--
-- TOC entry 3056 (class 0 OID 0)
-- Dependencies: 212
-- Name: produto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hugoiguana
--

SELECT pg_catalog.setval('public.produto_id_seq', 11, true);


--
-- TOC entry 2858 (class 2606 OID 24584)
-- Name: categoria categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: hugoiguana
--

ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 24592)
-- Name: cidade cidade_pkey; Type: CONSTRAINT; Schema: public; Owner: hugoiguana
--

ALTER TABLE ONLY public.cidade
    ADD CONSTRAINT cidade_pkey PRIMARY KEY (id);


--
-- TOC entry 2862 (class 2606 OID 24603)
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: hugoiguana
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id);


--
-- TOC entry 2866 (class 2606 OID 24614)
-- Name: endereco endereco_pkey; Type: CONSTRAINT; Schema: public; Owner: hugoiguana
--

ALTER TABLE ONLY public.endereco
    ADD CONSTRAINT endereco_pkey PRIMARY KEY (id);


--
-- TOC entry 2868 (class 2606 OID 24622)
-- Name: estado estado_pkey; Type: CONSTRAINT; Schema: public; Owner: hugoiguana
--

ALTER TABLE ONLY public.estado
    ADD CONSTRAINT estado_pkey PRIMARY KEY (id);


--
-- TOC entry 2870 (class 2606 OID 24627)
-- Name: item_pedido item_pedido_pkey; Type: CONSTRAINT; Schema: public; Owner: hugoiguana
--

ALTER TABLE ONLY public.item_pedido
    ADD CONSTRAINT item_pedido_pkey PRIMARY KEY (pedido_id, produto_id);


--
-- TOC entry 2874 (class 2606 OID 24637)
-- Name: pagamento_com_boleto pagamento_com_boleto_pkey; Type: CONSTRAINT; Schema: public; Owner: hugoiguana
--

ALTER TABLE ONLY public.pagamento_com_boleto
    ADD CONSTRAINT pagamento_com_boleto_pkey PRIMARY KEY (pedido_id);


--
-- TOC entry 2876 (class 2606 OID 24642)
-- Name: pagamento_com_cartao pagamento_com_cartao_pkey; Type: CONSTRAINT; Schema: public; Owner: hugoiguana
--

ALTER TABLE ONLY public.pagamento_com_cartao
    ADD CONSTRAINT pagamento_com_cartao_pkey PRIMARY KEY (pedido_id);


--
-- TOC entry 2872 (class 2606 OID 24632)
-- Name: pagamento pagamento_pkey; Type: CONSTRAINT; Schema: public; Owner: hugoiguana
--

ALTER TABLE ONLY public.pagamento
    ADD CONSTRAINT pagamento_pkey PRIMARY KEY (pedido_id);


--
-- TOC entry 2878 (class 2606 OID 24650)
-- Name: pedido pedido_pkey; Type: CONSTRAINT; Schema: public; Owner: hugoiguana
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (id);


--
-- TOC entry 2880 (class 2606 OID 24658)
-- Name: produto produto_pkey; Type: CONSTRAINT; Schema: public; Owner: hugoiguana
--

ALTER TABLE ONLY public.produto
    ADD CONSTRAINT produto_pkey PRIMARY KEY (id);


--
-- TOC entry 2864 (class 2606 OID 24666)
-- Name: cliente uk_cmxo70m08n43599l3h0h07cc6; Type: CONSTRAINT; Schema: public; Owner: hugoiguana
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT uk_cmxo70m08n43599l3h0h07cc6 UNIQUE (email);


--
-- TOC entry 2892 (class 2606 OID 24722)
-- Name: produto_categoria fk1c0y58d3n6x3m6euv2j3h64vt; Type: FK CONSTRAINT; Schema: public; Owner: hugoiguana
--

ALTER TABLE ONLY public.produto_categoria
    ADD CONSTRAINT fk1c0y58d3n6x3m6euv2j3h64vt FOREIGN KEY (produto_id) REFERENCES public.produto(id);


--
-- TOC entry 2890 (class 2606 OID 24712)
-- Name: pedido fk1fihyy2fnocpuwc74674qmfkv; Type: FK CONSTRAINT; Schema: public; Owner: hugoiguana
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT fk1fihyy2fnocpuwc74674qmfkv FOREIGN KEY (endereco_de_entrega_id) REFERENCES public.endereco(id);


--
-- TOC entry 2889 (class 2606 OID 24707)
-- Name: pedido fk30s8j2ktpay6of18lbyqn3632; Type: FK CONSTRAINT; Schema: public; Owner: hugoiguana
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT fk30s8j2ktpay6of18lbyqn3632 FOREIGN KEY (cliente_id) REFERENCES public.cliente(id);


--
-- TOC entry 2884 (class 2606 OID 24682)
-- Name: item_pedido fk60ym08cfoysa17wrn1swyiuda; Type: FK CONSTRAINT; Schema: public; Owner: hugoiguana
--

ALTER TABLE ONLY public.item_pedido
    ADD CONSTRAINT fk60ym08cfoysa17wrn1swyiuda FOREIGN KEY (pedido_id) REFERENCES public.pedido(id);


--
-- TOC entry 2893 (class 2606 OID 24727)
-- Name: telefone fk8aafha0njkoyoe3kvrwsy3g8u; Type: FK CONSTRAINT; Schema: public; Owner: hugoiguana
--

ALTER TABLE ONLY public.telefone
    ADD CONSTRAINT fk8aafha0njkoyoe3kvrwsy3g8u FOREIGN KEY (cliente_id) REFERENCES public.cliente(id);


--
-- TOC entry 2882 (class 2606 OID 24672)
-- Name: endereco fk8b1kcb3wucapb8dejshyn5fsx; Type: FK CONSTRAINT; Schema: public; Owner: hugoiguana
--

ALTER TABLE ONLY public.endereco
    ADD CONSTRAINT fk8b1kcb3wucapb8dejshyn5fsx FOREIGN KEY (cidade_id) REFERENCES public.cidade(id);


--
-- TOC entry 2883 (class 2606 OID 24677)
-- Name: endereco fk8s7ivtl4foyhrfam9xqom73n9; Type: FK CONSTRAINT; Schema: public; Owner: hugoiguana
--

ALTER TABLE ONLY public.endereco
    ADD CONSTRAINT fk8s7ivtl4foyhrfam9xqom73n9 FOREIGN KEY (cliente_id) REFERENCES public.cliente(id);


--
-- TOC entry 2887 (class 2606 OID 24697)
-- Name: pagamento_com_boleto fkcr74vrxf8nfph0knq2bho8doo; Type: FK CONSTRAINT; Schema: public; Owner: hugoiguana
--

ALTER TABLE ONLY public.pagamento_com_boleto
    ADD CONSTRAINT fkcr74vrxf8nfph0knq2bho8doo FOREIGN KEY (pedido_id) REFERENCES public.pagamento(pedido_id);


--
-- TOC entry 2881 (class 2606 OID 24667)
-- Name: cidade fkkworrwk40xj58kevvh3evi500; Type: FK CONSTRAINT; Schema: public; Owner: hugoiguana
--

ALTER TABLE ONLY public.cidade
    ADD CONSTRAINT fkkworrwk40xj58kevvh3evi500 FOREIGN KEY (estado_id) REFERENCES public.estado(id);


--
-- TOC entry 2891 (class 2606 OID 24717)
-- Name: produto_categoria fkq3g33tp7xk2juh53fbw6y4y57; Type: FK CONSTRAINT; Schema: public; Owner: hugoiguana
--

ALTER TABLE ONLY public.produto_categoria
    ADD CONSTRAINT fkq3g33tp7xk2juh53fbw6y4y57 FOREIGN KEY (categoria_id) REFERENCES public.categoria(id);


--
-- TOC entry 2888 (class 2606 OID 24702)
-- Name: pagamento_com_cartao fkta3cdnuuxclwfh52t4qi432ow; Type: FK CONSTRAINT; Schema: public; Owner: hugoiguana
--

ALTER TABLE ONLY public.pagamento_com_cartao
    ADD CONSTRAINT fkta3cdnuuxclwfh52t4qi432ow FOREIGN KEY (pedido_id) REFERENCES public.pagamento(pedido_id);


--
-- TOC entry 2886 (class 2606 OID 24692)
-- Name: pagamento fkthad9tkw4188hb3qo1lm5ueb0; Type: FK CONSTRAINT; Schema: public; Owner: hugoiguana
--

ALTER TABLE ONLY public.pagamento
    ADD CONSTRAINT fkthad9tkw4188hb3qo1lm5ueb0 FOREIGN KEY (pedido_id) REFERENCES public.pedido(id);


--
-- TOC entry 2885 (class 2606 OID 24687)
-- Name: item_pedido fktk55mn6d6bvl5h0no5uagi3sf; Type: FK CONSTRAINT; Schema: public; Owner: hugoiguana
--

ALTER TABLE ONLY public.item_pedido
    ADD CONSTRAINT fktk55mn6d6bvl5h0no5uagi3sf FOREIGN KEY (produto_id) REFERENCES public.produto(id);


-- Completed on 2019-06-04 20:59:20 -03

--
-- PostgreSQL database dump complete
--

