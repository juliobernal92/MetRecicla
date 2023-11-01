--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-10-27 13:58:11

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
-- TOC entry 3365 (class 1262 OID 180963)
-- Name: metrecicla; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE metrecicla WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Paraguay.1252';


ALTER DATABASE metrecicla OWNER TO postgres;

\connect metrecicla

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
-- TOC entry 3351 (class 0 OID 197357)
-- Dependencies: 215
-- Data for Name: chatarra; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.chatarra VALUES (4, 'Desodorante', 6500.00);
INSERT INTO public.chatarra VALUES (5, 'Chapa', 6500.00);
INSERT INTO public.chatarra VALUES (6, 'Cabo', 9000.00);
INSERT INTO public.chatarra VALUES (7, 'Perfil', 11000.00);
INSERT INTO public.chatarra VALUES (8, 'TIPO 2', 8000.00);
INSERT INTO public.chatarra VALUES (9, 'PESADO', 3000.00);
INSERT INTO public.chatarra VALUES (10, 'PC', 15000.00);
INSERT INTO public.chatarra VALUES (11, 'MARRON', 2000.00);
INSERT INTO public.chatarra VALUES (13, 'Bateria', 4000.00);
INSERT INTO public.chatarra VALUES (15, 'Aluminio-Radiador', 3000.00);
INSERT INTO public.chatarra VALUES (16, 'viruta', 3000.00);
INSERT INTO public.chatarra VALUES (17, 'Celular Entero', 20000.00);
INSERT INTO public.chatarra VALUES (19, 'Aluminio Sucio', 3000.00);
INSERT INTO public.chatarra VALUES (1, 'Cobre', 45000.00);
INSERT INTO public.chatarra VALUES (2, 'Bronce', 25000.00);
INSERT INTO public.chatarra VALUES (12, 'Latita', 7000.00);
INSERT INTO public.chatarra VALUES (14, 'Mixto-Radiador', 14000.00);
INSERT INTO public.chatarra VALUES (20, 'Perfil C', 11000.00);
INSERT INTO public.chatarra VALUES (3, 'Duro - Aluminio', 7500.00);
INSERT INTO public.chatarra VALUES (18, 'Blando - Aluminio', 6500.00);


--
-- TOC entry 3353 (class 0 OID 230290)
-- Dependencies: 217
-- Data for Name: vendedores; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.vendedores VALUES (1, 'Sin Nombre', 'n/a', 'n/a');
INSERT INTO public.vendedores VALUES (2, 'Jorge', 'n/a', 'n/a');


--
-- TOC entry 3355 (class 0 OID 230299)
-- Dependencies: 219
-- Data for Name: ticket; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ticket VALUES (9, '2023-09-22', 1);
INSERT INTO public.ticket VALUES (10, '2023-09-22', 2);
INSERT INTO public.ticket VALUES (11, '2023-09-23', 1);
INSERT INTO public.ticket VALUES (12, '2023-09-23', 2);
INSERT INTO public.ticket VALUES (13, '2023-09-25', 1);
INSERT INTO public.ticket VALUES (14, '2023-09-26', 1);
INSERT INTO public.ticket VALUES (15, '2023-09-27', 1);
INSERT INTO public.ticket VALUES (16, '2023-09-28', 1);
INSERT INTO public.ticket VALUES (17, '2023-09-28', 1);
INSERT INTO public.ticket VALUES (18, '2023-09-30', 1);
INSERT INTO public.ticket VALUES (19, '2023-09-30', 2);
INSERT INTO public.ticket VALUES (20, '2023-10-02', 1);
INSERT INTO public.ticket VALUES (21, '2023-10-03', 1);
INSERT INTO public.ticket VALUES (22, '2023-10-04', 1);
INSERT INTO public.ticket VALUES (23, '2023-10-05', 1);
INSERT INTO public.ticket VALUES (24, '2023-10-06', 1);
INSERT INTO public.ticket VALUES (25, '2023-10-07', 1);
INSERT INTO public.ticket VALUES (26, '2023-10-09', 1);
INSERT INTO public.ticket VALUES (27, '2023-10-09', 1);
INSERT INTO public.ticket VALUES (28, '2023-10-10', 1);
INSERT INTO public.ticket VALUES (29, '2023-10-11', 1);
INSERT INTO public.ticket VALUES (30, '2023-10-12', 1);
INSERT INTO public.ticket VALUES (31, '2023-10-12', 1);
INSERT INTO public.ticket VALUES (32, '2023-10-12', 2);
INSERT INTO public.ticket VALUES (33, '2023-10-13', 1);
INSERT INTO public.ticket VALUES (34, '2023-10-13', 1);
INSERT INTO public.ticket VALUES (35, '2023-10-13', 1);
INSERT INTO public.ticket VALUES (36, '2023-10-13', 1);
INSERT INTO public.ticket VALUES (37, '2023-10-13', 1);
INSERT INTO public.ticket VALUES (38, '2023-10-13', 1);
INSERT INTO public.ticket VALUES (39, '2023-10-13', 1);
INSERT INTO public.ticket VALUES (40, '2023-10-13', 1);
INSERT INTO public.ticket VALUES (41, '2023-10-14', 1);
INSERT INTO public.ticket VALUES (42, '2023-10-14', 1);
INSERT INTO public.ticket VALUES (43, '2023-10-14', 1);
INSERT INTO public.ticket VALUES (44, '2023-10-14', 1);
INSERT INTO public.ticket VALUES (45, '2023-10-16', 1);
INSERT INTO public.ticket VALUES (46, '2023-10-16', 1);
INSERT INTO public.ticket VALUES (47, '2023-10-17', 1);
INSERT INTO public.ticket VALUES (48, '2023-10-17', 1);
INSERT INTO public.ticket VALUES (49, '2023-10-18', 1);
INSERT INTO public.ticket VALUES (50, '2023-10-18', 1);
INSERT INTO public.ticket VALUES (51, '2023-10-18', 1);
INSERT INTO public.ticket VALUES (52, '2023-10-19', 1);
INSERT INTO public.ticket VALUES (53, '2023-10-19', 1);
INSERT INTO public.ticket VALUES (54, '2023-10-19', 1);
INSERT INTO public.ticket VALUES (55, '2023-10-19', 1);
INSERT INTO public.ticket VALUES (56, '2023-10-20', 1);
INSERT INTO public.ticket VALUES (57, '2023-10-20', 1);
INSERT INTO public.ticket VALUES (58, '2023-10-21', 2);
INSERT INTO public.ticket VALUES (59, '2023-10-21', 1);
INSERT INTO public.ticket VALUES (60, '2023-10-21', 1);
INSERT INTO public.ticket VALUES (61, '2023-10-20', 1);
INSERT INTO public.ticket VALUES (63, '2023-10-21', 1);
INSERT INTO public.ticket VALUES (64, '2023-10-21', 1);
INSERT INTO public.ticket VALUES (65, '2023-10-21', 1);
INSERT INTO public.ticket VALUES (66, '2023-10-21', 1);
INSERT INTO public.ticket VALUES (67, '2023-10-23', 1);
INSERT INTO public.ticket VALUES (68, '2023-10-23', 1);
INSERT INTO public.ticket VALUES (69, '2023-10-24', 1);
INSERT INTO public.ticket VALUES (70, '2023-10-24', 1);
INSERT INTO public.ticket VALUES (71, '2023-10-24', 1);
INSERT INTO public.ticket VALUES (72, '2023-10-25', 1);
INSERT INTO public.ticket VALUES (73, '2023-10-25', 1);
INSERT INTO public.ticket VALUES (74, '2023-10-25', 1);
INSERT INTO public.ticket VALUES (75, '2023-10-25', 1);
INSERT INTO public.ticket VALUES (76, '2023-10-25', 1);
INSERT INTO public.ticket VALUES (77, '2023-10-25', 1);
INSERT INTO public.ticket VALUES (78, '2023-10-26', 1);
INSERT INTO public.ticket VALUES (79, '2023-10-26', 1);
INSERT INTO public.ticket VALUES (80, '2023-10-27', 1);
INSERT INTO public.ticket VALUES (81, '2023-10-27', 1);
INSERT INTO public.ticket VALUES (82, '2023-10-27', 1);
INSERT INTO public.ticket VALUES (83, '2023-10-27', 1);


--
-- TOC entry 3359 (class 0 OID 230345)
-- Dependencies: 223
-- Data for Name: detallesticket; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.detallesticket VALUES (3, 12, 9, 1.00, 7000.00, 1);
INSERT INTO public.detallesticket VALUES (4, 1, 9, 15.70, 753600.00, 1);
INSERT INTO public.detallesticket VALUES (5, 12, 9, 4.70, 32900.00, 1);
INSERT INTO public.detallesticket VALUES (6, 1, 9, 7.20, 345600.00, 1);
INSERT INTO public.detallesticket VALUES (7, 2, 10, 1.20, 31200.00, 2);
INSERT INTO public.detallesticket VALUES (8, 1, 10, 2.20, 105600.00, 2);
INSERT INTO public.detallesticket VALUES (9, 3, 10, 25.30, 189750.00, 2);
INSERT INTO public.detallesticket VALUES (10, 4, 10, 2.50, 16250.00, 2);
INSERT INTO public.detallesticket VALUES (11, 5, 10, 4.10, 26650.00, 2);
INSERT INTO public.detallesticket VALUES (12, 5, 10, 2.30, 14950.00, 2);
INSERT INTO public.detallesticket VALUES (13, 6, 10, 3.80, 34200.00, 2);
INSERT INTO public.detallesticket VALUES (14, 7, 10, 5.20, 57200.00, 2);
INSERT INTO public.detallesticket VALUES (15, 8, 10, 0.90, 7200.00, 2);
INSERT INTO public.detallesticket VALUES (16, 9, 10, 4.50, 13500.00, 2);
INSERT INTO public.detallesticket VALUES (17, 10, 10, 1.30, 19500.00, 2);
INSERT INTO public.detallesticket VALUES (18, 11, 10, 59.00, 118000.00, 2);
INSERT INTO public.detallesticket VALUES (19, 1, 11, 7.20, 345600.00, 1);
INSERT INTO public.detallesticket VALUES (20, 1, 11, 5.30, 254400.00, 1);
INSERT INTO public.detallesticket VALUES (21, 3, 11, 1.60, 12000.00, 1);
INSERT INTO public.detallesticket VALUES (22, 1, 11, 1.40, 67200.00, 1);
INSERT INTO public.detallesticket VALUES (23, 1, 11, 1.10, 52800.00, 1);
INSERT INTO public.detallesticket VALUES (24, 1, 11, 1.00, 48000.00, 1);
INSERT INTO public.detallesticket VALUES (25, 1, 12, 18.70, 897600.00, 2);
INSERT INTO public.detallesticket VALUES (26, 14, 12, 33.70, 572900.00, 2);
INSERT INTO public.detallesticket VALUES (27, 2, 12, 1.40, 36400.00, 2);
INSERT INTO public.detallesticket VALUES (28, 1, 13, 0.50, 24000.00, 1);
INSERT INTO public.detallesticket VALUES (29, 12, 13, 1.80, 12600.00, 1);
INSERT INTO public.detallesticket VALUES (30, 15, 13, 4.00, 12000.00, 1);
INSERT INTO public.detallesticket VALUES (31, 1, 13, 10.00, 480000.00, 1);
INSERT INTO public.detallesticket VALUES (32, 1, 13, 0.50, 24000.00, 1);
INSERT INTO public.detallesticket VALUES (33, 2, 13, 1.00, 26000.00, 1);
INSERT INTO public.detallesticket VALUES (34, 3, 13, 1.00, 7500.00, 1);
INSERT INTO public.detallesticket VALUES (35, 1, 13, 1.90, 91200.00, 1);
INSERT INTO public.detallesticket VALUES (36, 2, 13, 1.20, 31200.00, 1);
INSERT INTO public.detallesticket VALUES (37, 1, 13, 4.80, 230400.00, 1);
INSERT INTO public.detallesticket VALUES (38, 1, 13, 9.60, 460800.00, 1);
INSERT INTO public.detallesticket VALUES (39, 12, 14, 8.90, 62300.00, 1);
INSERT INTO public.detallesticket VALUES (40, 13, 14, 2.70, 10800.00, 1);
INSERT INTO public.detallesticket VALUES (41, 2, 14, 2.30, 59800.00, 1);
INSERT INTO public.detallesticket VALUES (42, 1, 14, 7.20, 345600.00, 1);
INSERT INTO public.detallesticket VALUES (43, 12, 14, 3.30, 23100.00, 1);
INSERT INTO public.detallesticket VALUES (44, 1, 14, 8.10, 388800.00, 1);
INSERT INTO public.detallesticket VALUES (45, 3, 14, 4.70, 35250.00, 1);
INSERT INTO public.detallesticket VALUES (46, 1, 14, 2.90, 139200.00, 1);
INSERT INTO public.detallesticket VALUES (47, 1, 14, 1.90, 91200.00, 1);
INSERT INTO public.detallesticket VALUES (48, 1, 14, 0.09, 4320.00, 1);
INSERT INTO public.detallesticket VALUES (49, 1, 15, 14.60, 700800.00, 1);
INSERT INTO public.detallesticket VALUES (50, 12, 15, 1.50, 10500.00, 1);
INSERT INTO public.detallesticket VALUES (51, 1, 15, 2.00, 96000.00, 1);
INSERT INTO public.detallesticket VALUES (52, 1, 15, 6.70, 321600.00, 1);
INSERT INTO public.detallesticket VALUES (53, 3, 15, 6.80, 51000.00, 1);
INSERT INTO public.detallesticket VALUES (54, 2, 15, 0.60, 15600.00, 1);
INSERT INTO public.detallesticket VALUES (55, 1, 15, 0.80, 38400.00, 1);
INSERT INTO public.detallesticket VALUES (56, 1, 15, 0.20, 9600.00, 1);
INSERT INTO public.detallesticket VALUES (57, 12, 15, 3.70, 25900.00, 1);
INSERT INTO public.detallesticket VALUES (58, 1, 15, 22.60, 1084800.00, 1);
INSERT INTO public.detallesticket VALUES (59, 1, 15, 1.30, 62400.00, 1);
INSERT INTO public.detallesticket VALUES (60, 12, 15, 1.30, 9100.00, 1);
INSERT INTO public.detallesticket VALUES (61, 1, 15, 1.30, 62400.00, 1);
INSERT INTO public.detallesticket VALUES (62, 12, 16, 11.80, 82600.00, 1);
INSERT INTO public.detallesticket VALUES (63, 12, 16, 0.80, 5600.00, 1);
INSERT INTO public.detallesticket VALUES (64, 1, 16, 2.00, 96000.00, 1);
INSERT INTO public.detallesticket VALUES (65, 1, 16, 4.10, 196800.00, 1);
INSERT INTO public.detallesticket VALUES (66, 1, 16, 6.00, 288000.00, 1);
INSERT INTO public.detallesticket VALUES (67, 1, 16, 5.50, 264000.00, 1);
INSERT INTO public.detallesticket VALUES (68, 2, 16, 0.30, 7800.00, 1);
INSERT INTO public.detallesticket VALUES (69, 12, 16, 7.50, 52500.00, 1);
INSERT INTO public.detallesticket VALUES (70, 1, 16, 2.00, 96000.00, 1);
INSERT INTO public.detallesticket VALUES (71, 16, 17, 3.60, 10800.00, 1);
INSERT INTO public.detallesticket VALUES (72, 7, 17, 9.40, 103400.00, 1);
INSERT INTO public.detallesticket VALUES (73, 1, 17, 1.90, 91200.00, 1);
INSERT INTO public.detallesticket VALUES (74, 2, 17, 2.10, 54600.00, 1);
INSERT INTO public.detallesticket VALUES (75, 1, 18, 1.40, 67200.00, 1);
INSERT INTO public.detallesticket VALUES (76, 12, 18, 3.60, 25200.00, 1);
INSERT INTO public.detallesticket VALUES (77, 1, 18, 10.50, 504000.00, 1);
INSERT INTO public.detallesticket VALUES (78, 1, 18, 2.40, 115200.00, 1);
INSERT INTO public.detallesticket VALUES (79, 1, 18, 2.10, 100800.00, 1);
INSERT INTO public.detallesticket VALUES (80, 1, 18, 0.40, 19200.00, 1);
INSERT INTO public.detallesticket VALUES (81, 1, 18, 2.60, 124800.00, 1);
INSERT INTO public.detallesticket VALUES (82, 1, 18, 2.30, 110400.00, 1);
INSERT INTO public.detallesticket VALUES (83, 1, 18, 1.40, 67200.00, 1);
INSERT INTO public.detallesticket VALUES (84, 1, 18, 4.80, 230400.00, 1);
INSERT INTO public.detallesticket VALUES (85, 14, 18, 17.40, 295800.00, 1);
INSERT INTO public.detallesticket VALUES (86, 1, 18, 1.20, 57600.00, 1);
INSERT INTO public.detallesticket VALUES (87, 1, 18, 4.90, 235200.00, 1);
INSERT INTO public.detallesticket VALUES (88, 1, 18, 5.40, 259200.00, 1);
INSERT INTO public.detallesticket VALUES (89, 12, 18, 1.00, 7000.00, 1);
INSERT INTO public.detallesticket VALUES (90, 12, 18, 6.70, 46900.00, 1);
INSERT INTO public.detallesticket VALUES (91, 7, 19, 3.70, 40700.00, 2);
INSERT INTO public.detallesticket VALUES (92, 3, 19, 9.10, 68250.00, 2);
INSERT INTO public.detallesticket VALUES (93, 1, 19, 11.00, 528000.00, 2);
INSERT INTO public.detallesticket VALUES (94, 5, 19, 1.00, 6500.00, 2);
INSERT INTO public.detallesticket VALUES (95, 2, 19, 2.80, 72800.00, 2);
INSERT INTO public.detallesticket VALUES (96, 6, 19, 0.70, 6300.00, 2);
INSERT INTO public.detallesticket VALUES (97, 5, 19, 4.10, 26650.00, 2);
INSERT INTO public.detallesticket VALUES (98, 4, 19, 1.50, 9750.00, 2);
INSERT INTO public.detallesticket VALUES (99, 2, 20, 13.60, 353600.00, 1);
INSERT INTO public.detallesticket VALUES (100, 1, 20, 0.50, 24000.00, 1);
INSERT INTO public.detallesticket VALUES (101, 11, 20, 20.30, 40600.00, 1);
INSERT INTO public.detallesticket VALUES (102, 1, 20, 2.10, 100800.00, 1);
INSERT INTO public.detallesticket VALUES (103, 12, 20, 7.30, 51100.00, 1);
INSERT INTO public.detallesticket VALUES (104, 12, 20, 1.80, 12600.00, 1);
INSERT INTO public.detallesticket VALUES (105, 12, 20, 10.40, 72800.00, 1);
INSERT INTO public.detallesticket VALUES (106, 1, 20, 0.20, 9600.00, 1);
INSERT INTO public.detallesticket VALUES (107, 2, 20, 0.30, 7800.00, 1);
INSERT INTO public.detallesticket VALUES (108, 15, 20, 7.60, 22800.00, 1);
INSERT INTO public.detallesticket VALUES (109, 12, 20, 3.10, 21700.00, 1);
INSERT INTO public.detallesticket VALUES (110, 5, 20, 4.00, 26000.00, 1);
INSERT INTO public.detallesticket VALUES (111, 3, 20, 1.50, 11250.00, 1);
INSERT INTO public.detallesticket VALUES (112, 12, 20, 11.20, 78400.00, 1);
INSERT INTO public.detallesticket VALUES (113, 12, 20, 1.00, 7000.00, 1);
INSERT INTO public.detallesticket VALUES (114, 12, 20, 2.40, 16800.00, 1);
INSERT INTO public.detallesticket VALUES (115, 1, 20, 0.50, 24000.00, 1);
INSERT INTO public.detallesticket VALUES (116, 1, 20, 0.20, 9600.00, 1);
INSERT INTO public.detallesticket VALUES (117, 12, 20, 0.20, 1400.00, 1);
INSERT INTO public.detallesticket VALUES (118, 13, 20, 13.60, 54400.00, 1);
INSERT INTO public.detallesticket VALUES (119, 1, 20, 1.20, 57600.00, 1);
INSERT INTO public.detallesticket VALUES (120, 12, 20, 1.90, 13300.00, 1);
INSERT INTO public.detallesticket VALUES (121, 12, 20, 5.10, 35700.00, 1);
INSERT INTO public.detallesticket VALUES (122, 1, 20, 0.50, 24000.00, 1);
INSERT INTO public.detallesticket VALUES (123, 1, 20, 5.60, 268800.00, 1);
INSERT INTO public.detallesticket VALUES (124, 1, 20, 2.80, 134400.00, 1);
INSERT INTO public.detallesticket VALUES (125, 12, 20, 1.40, 9800.00, 1);
INSERT INTO public.detallesticket VALUES (126, 13, 21, 10.90, 43600.00, 1);
INSERT INTO public.detallesticket VALUES (127, 12, 21, 10.30, 72100.00, 1);
INSERT INTO public.detallesticket VALUES (128, 12, 21, 6.80, 47600.00, 1);
INSERT INTO public.detallesticket VALUES (129, 1, 21, 9.30, 446400.00, 1);
INSERT INTO public.detallesticket VALUES (130, 3, 21, 14.00, 105000.00, 1);
INSERT INTO public.detallesticket VALUES (131, 1, 21, 21.50, 1032000.00, 1);
INSERT INTO public.detallesticket VALUES (132, 3, 21, 2.50, 18750.00, 1);
INSERT INTO public.detallesticket VALUES (133, 5, 21, 0.70, 4550.00, 1);
INSERT INTO public.detallesticket VALUES (134, 1, 21, 14.40, 691200.00, 1);
INSERT INTO public.detallesticket VALUES (135, 1, 21, 1.10, 52800.00, 1);
INSERT INTO public.detallesticket VALUES (136, 2, 21, 8.40, 218400.00, 1);
INSERT INTO public.detallesticket VALUES (137, 2, 21, 3.70, 85100.00, 1);
INSERT INTO public.detallesticket VALUES (138, 5, 21, 4.60, 29900.00, 1);
INSERT INTO public.detallesticket VALUES (139, 12, 21, 1.40, 9800.00, 1);
INSERT INTO public.detallesticket VALUES (141, 1, 21, 2.10, 100800.00, 1);
INSERT INTO public.detallesticket VALUES (143, 1, 22, 4.50, 216000.00, 1);
INSERT INTO public.detallesticket VALUES (145, 1, 22, 16.60, 796800.00, 1);
INSERT INTO public.detallesticket VALUES (147, 1, 22, 3.20, 153600.00, 1);
INSERT INTO public.detallesticket VALUES (149, 3, 22, 1.60, 12000.00, 1);
INSERT INTO public.detallesticket VALUES (151, 1, 22, 0.20, 9600.00, 1);
INSERT INTO public.detallesticket VALUES (153, 1, 22, 0.70, 33600.00, 1);
INSERT INTO public.detallesticket VALUES (155, 12, 22, 5.70, 39900.00, 1);
INSERT INTO public.detallesticket VALUES (157, 12, 22, 11.60, 81200.00, 1);
INSERT INTO public.detallesticket VALUES (159, 13, 22, 12.80, 51200.00, 1);
INSERT INTO public.detallesticket VALUES (161, 1, 22, 1.50, 72000.00, 1);
INSERT INTO public.detallesticket VALUES (163, 7, 22, 1.80, 19800.00, 1);
INSERT INTO public.detallesticket VALUES (165, 1, 22, 1.00, 48000.00, 1);
INSERT INTO public.detallesticket VALUES (167, 3, 22, 46.00, 345000.00, 1);
INSERT INTO public.detallesticket VALUES (169, 7, 22, 2.00, 22000.00, 1);
INSERT INTO public.detallesticket VALUES (171, 1, 22, 4.30, 206400.00, 1);
INSERT INTO public.detallesticket VALUES (173, 1, 23, 5.70, 273600.00, 1);
INSERT INTO public.detallesticket VALUES (140, 1, 21, 2.40, 115200.00, 1);
INSERT INTO public.detallesticket VALUES (142, 1, 22, 0.30, 14400.00, 1);
INSERT INTO public.detallesticket VALUES (144, 1, 22, 17.70, 849600.00, 1);
INSERT INTO public.detallesticket VALUES (146, 1, 22, 2.00, 96000.00, 1);
INSERT INTO public.detallesticket VALUES (148, 1, 22, 4.50, 216000.00, 1);
INSERT INTO public.detallesticket VALUES (150, 1, 22, 3.30, 158400.00, 1);
INSERT INTO public.detallesticket VALUES (152, 1, 22, 2.40, 115200.00, 1);
INSERT INTO public.detallesticket VALUES (154, 2, 22, 0.60, 15600.00, 1);
INSERT INTO public.detallesticket VALUES (156, 12, 22, 7.00, 49000.00, 1);
INSERT INTO public.detallesticket VALUES (158, 12, 22, 5.10, 35700.00, 1);
INSERT INTO public.detallesticket VALUES (160, 12, 22, 12.90, 90300.00, 1);
INSERT INTO public.detallesticket VALUES (162, 5, 22, 1.00, 6500.00, 1);
INSERT INTO public.detallesticket VALUES (164, 3, 22, 0.80, 6000.00, 1);
INSERT INTO public.detallesticket VALUES (166, 1, 22, 4.20, 201600.00, 1);
INSERT INTO public.detallesticket VALUES (168, 3, 22, 17.40, 130500.00, 1);
INSERT INTO public.detallesticket VALUES (170, 2, 22, 2.50, 65000.00, 1);
INSERT INTO public.detallesticket VALUES (172, 1, 23, 0.45, 21600.00, 1);
INSERT INTO public.detallesticket VALUES (174, 1, 23, 4.10, 196800.00, 1);
INSERT INTO public.detallesticket VALUES (175, 1, 23, 1.00, 48000.00, 1);
INSERT INTO public.detallesticket VALUES (176, 1, 23, 0.90, 43200.00, 1);
INSERT INTO public.detallesticket VALUES (177, 2, 23, 0.50, 13000.00, 1);
INSERT INTO public.detallesticket VALUES (178, 1, 23, 1.00, 48000.00, 1);
INSERT INTO public.detallesticket VALUES (179, 5, 23, 2.20, 14300.00, 1);
INSERT INTO public.detallesticket VALUES (180, 1, 23, 0.70, 33600.00, 1);
INSERT INTO public.detallesticket VALUES (181, 12, 23, 11.40, 79800.00, 1);
INSERT INTO public.detallesticket VALUES (182, 1, 23, 0.80, 38400.00, 1);
INSERT INTO public.detallesticket VALUES (183, 1, 23, 1.50, 72000.00, 1);
INSERT INTO public.detallesticket VALUES (184, 12, 23, 8.40, 58800.00, 1);
INSERT INTO public.detallesticket VALUES (185, 12, 23, 1.70, 11900.00, 1);
INSERT INTO public.detallesticket VALUES (186, 12, 23, 9.80, 68600.00, 1);
INSERT INTO public.detallesticket VALUES (187, 12, 23, 18.50, 129500.00, 1);
INSERT INTO public.detallesticket VALUES (188, 12, 23, 3.20, 22400.00, 1);
INSERT INTO public.detallesticket VALUES (189, 12, 23, 1.60, 11200.00, 1);
INSERT INTO public.detallesticket VALUES (190, 1, 23, 2.20, 105600.00, 1);
INSERT INTO public.detallesticket VALUES (191, 2, 23, 0.90, 23400.00, 1);
INSERT INTO public.detallesticket VALUES (192, 1, 24, 23.10, 1108800.00, 1);
INSERT INTO public.detallesticket VALUES (193, 1, 24, 3.90, 187200.00, 1);
INSERT INTO public.detallesticket VALUES (194, 2, 24, 1.30, 33800.00, 1);
INSERT INTO public.detallesticket VALUES (195, 1, 24, 2.20, 105600.00, 1);
INSERT INTO public.detallesticket VALUES (196, 1, 24, 0.70, 33600.00, 1);
INSERT INTO public.detallesticket VALUES (197, 12, 24, 42.40, 296800.00, 1);
INSERT INTO public.detallesticket VALUES (198, 1, 24, 1.80, 86400.00, 1);
INSERT INTO public.detallesticket VALUES (199, 12, 24, 5.10, 35700.00, 1);
INSERT INTO public.detallesticket VALUES (200, 1, 24, 5.00, 240000.00, 1);
INSERT INTO public.detallesticket VALUES (201, 5, 24, 3.00, 19500.00, 1);
INSERT INTO public.detallesticket VALUES (202, 1, 24, 0.60, 28800.00, 1);
INSERT INTO public.detallesticket VALUES (203, 1, 24, 1.10, 52800.00, 1);
INSERT INTO public.detallesticket VALUES (204, 13, 24, 80.00, 320000.00, 1);
INSERT INTO public.detallesticket VALUES (205, 1, 24, 0.70, 33600.00, 1);
INSERT INTO public.detallesticket VALUES (206, 1, 24, 1.80, 86400.00, 1);
INSERT INTO public.detallesticket VALUES (207, 2, 24, 1.00, 26000.00, 1);
INSERT INTO public.detallesticket VALUES (208, 3, 24, 3.90, 29250.00, 1);
INSERT INTO public.detallesticket VALUES (209, 12, 25, 19.10, 133700.00, 1);
INSERT INTO public.detallesticket VALUES (210, 12, 25, 1.10, 7700.00, 1);
INSERT INTO public.detallesticket VALUES (211, 1, 25, 0.40, 19200.00, 1);
INSERT INTO public.detallesticket VALUES (212, 1, 25, 10.10, 484800.00, 1);
INSERT INTO public.detallesticket VALUES (213, 2, 25, 2.80, 72800.00, 1);
INSERT INTO public.detallesticket VALUES (214, 3, 25, 5.10, 38250.00, 1);
INSERT INTO public.detallesticket VALUES (215, 1, 25, 0.30, 14400.00, 1);
INSERT INTO public.detallesticket VALUES (216, 1, 25, 1.90, 91200.00, 1);
INSERT INTO public.detallesticket VALUES (217, 1, 25, 5.80, 278400.00, 1);
INSERT INTO public.detallesticket VALUES (218, 1, 25, 7.20, 345600.00, 1);
INSERT INTO public.detallesticket VALUES (219, 1, 25, 0.70, 33600.00, 1);
INSERT INTO public.detallesticket VALUES (220, 1, 25, 0.70, 33600.00, 1);
INSERT INTO public.detallesticket VALUES (221, 1, 25, 5.30, 254400.00, 1);
INSERT INTO public.detallesticket VALUES (222, 12, 25, 4.60, 32200.00, 1);
INSERT INTO public.detallesticket VALUES (223, 1, 25, 0.70, 33600.00, 1);
INSERT INTO public.detallesticket VALUES (224, 2, 25, 1.00, 26000.00, 1);
INSERT INTO public.detallesticket VALUES (225, 5, 25, 0.10, 650.00, 1);
INSERT INTO public.detallesticket VALUES (226, 1, 25, 0.30, 14400.00, 1);
INSERT INTO public.detallesticket VALUES (227, 11, 25, 23.90, 47800.00, 1);
INSERT INTO public.detallesticket VALUES (228, 10, 25, 0.30, 4500.00, 1);
INSERT INTO public.detallesticket VALUES (229, 9, 25, 8.50, 25500.00, 1);
INSERT INTO public.detallesticket VALUES (230, 8, 25, 1.60, 12800.00, 1);
INSERT INTO public.detallesticket VALUES (231, 12, 26, 9.20, 64400.00, 1);
INSERT INTO public.detallesticket VALUES (232, 13, 26, 5.20, 20800.00, 1);
INSERT INTO public.detallesticket VALUES (233, 12, 26, 9.10, 63700.00, 1);
INSERT INTO public.detallesticket VALUES (234, 1, 26, 2.80, 134400.00, 1);
INSERT INTO public.detallesticket VALUES (235, 1, 26, 1.80, 86400.00, 1);
INSERT INTO public.detallesticket VALUES (236, 1, 26, 1.80, 86400.00, 1);
INSERT INTO public.detallesticket VALUES (237, 1, 26, 2.00, 96000.00, 1);
INSERT INTO public.detallesticket VALUES (238, 16, 26, 3.00, 9000.00, 1);
INSERT INTO public.detallesticket VALUES (239, 1, 26, 6.10, 292800.00, 1);
INSERT INTO public.detallesticket VALUES (240, 12, 26, 0.70, 4900.00, 1);
INSERT INTO public.detallesticket VALUES (241, 1, 26, 0.40, 19200.00, 1);
INSERT INTO public.detallesticket VALUES (242, 1, 26, 0.20, 9600.00, 1);
INSERT INTO public.detallesticket VALUES (243, 17, 27, 0.60, 12000.00, 1);
INSERT INTO public.detallesticket VALUES (244, 18, 27, 4.30, 27950.00, 1);
INSERT INTO public.detallesticket VALUES (245, 2, 27, 0.60, 15600.00, 1);
INSERT INTO public.detallesticket VALUES (246, 1, 27, 1.30, 62400.00, 1);
INSERT INTO public.detallesticket VALUES (247, 13, 27, 26.90, 107600.00, 1);
INSERT INTO public.detallesticket VALUES (248, 1, 27, 4.40, 211200.00, 1);
INSERT INTO public.detallesticket VALUES (249, 1, 27, 0.80, 38400.00, 1);
INSERT INTO public.detallesticket VALUES (250, 12, 27, 1.70, 11900.00, 1);
INSERT INTO public.detallesticket VALUES (251, 13, 27, 3.90, 15600.00, 1);
INSERT INTO public.detallesticket VALUES (252, 1, 27, 7.60, 364800.00, 1);
INSERT INTO public.detallesticket VALUES (253, 1, 27, 1.00, 48000.00, 1);
INSERT INTO public.detallesticket VALUES (254, 2, 27, 0.10, 2600.00, 1);
INSERT INTO public.detallesticket VALUES (255, 12, 27, 3.80, 26600.00, 1);
INSERT INTO public.detallesticket VALUES (256, 1, 27, 0.20, 9600.00, 1);
INSERT INTO public.detallesticket VALUES (257, 2, 27, 0.30, 7800.00, 1);
INSERT INTO public.detallesticket VALUES (258, 11, 27, 11.90, 23800.00, 1);
INSERT INTO public.detallesticket VALUES (259, 1, 27, 0.80, 38400.00, 1);
INSERT INTO public.detallesticket VALUES (260, 2, 27, 1.90, 49400.00, 1);
INSERT INTO public.detallesticket VALUES (261, 1, 27, 0.80, 38400.00, 1);
INSERT INTO public.detallesticket VALUES (262, 1, 27, 1.20, 57600.00, 1);
INSERT INTO public.detallesticket VALUES (263, 1, 27, 1.30, 62400.00, 1);
INSERT INTO public.detallesticket VALUES (264, 2, 27, 1.80, 46800.00, 1);
INSERT INTO public.detallesticket VALUES (265, 1, 27, 8.20, 393600.00, 1);
INSERT INTO public.detallesticket VALUES (266, 12, 28, 3.90, 27300.00, 1);
INSERT INTO public.detallesticket VALUES (267, 2, 28, 5.80, 150800.00, 1);
INSERT INTO public.detallesticket VALUES (268, 1, 28, 3.00, 144000.00, 1);
INSERT INTO public.detallesticket VALUES (269, 1, 28, 1.60, 76800.00, 1);
INSERT INTO public.detallesticket VALUES (270, 1, 28, 3.80, 182400.00, 1);
INSERT INTO public.detallesticket VALUES (271, 18, 28, 8.20, 53300.00, 1);
INSERT INTO public.detallesticket VALUES (272, 12, 28, 9.80, 68600.00, 1);
INSERT INTO public.detallesticket VALUES (273, 1, 28, 2.70, 129600.00, 1);
INSERT INTO public.detallesticket VALUES (274, 13, 28, 2.10, 8400.00, 1);
INSERT INTO public.detallesticket VALUES (275, 2, 28, 0.60, 15600.00, 1);
INSERT INTO public.detallesticket VALUES (276, 1, 28, 0.30, 14400.00, 1);
INSERT INTO public.detallesticket VALUES (277, 12, 28, 1.60, 11200.00, 1);
INSERT INTO public.detallesticket VALUES (278, 1, 28, 10.00, 480000.00, 1);
INSERT INTO public.detallesticket VALUES (279, 1, 28, 2.00, 96000.00, 1);
INSERT INTO public.detallesticket VALUES (280, 1, 29, 2.60, 124800.00, 1);
INSERT INTO public.detallesticket VALUES (281, 2, 29, 3.30, 85800.00, 1);
INSERT INTO public.detallesticket VALUES (282, 1, 29, 1.10, 52800.00, 1);
INSERT INTO public.detallesticket VALUES (283, 1, 29, 29.50, 1416000.00, 1);
INSERT INTO public.detallesticket VALUES (284, 3, 29, 8.70, 65250.00, 1);
INSERT INTO public.detallesticket VALUES (285, 18, 29, 2.20, 14300.00, 1);
INSERT INTO public.detallesticket VALUES (286, 2, 29, 1.00, 26000.00, 1);
INSERT INTO public.detallesticket VALUES (287, 1, 29, 0.30, 14400.00, 1);
INSERT INTO public.detallesticket VALUES (288, 17, 29, 1.00, 20000.00, 1);
INSERT INTO public.detallesticket VALUES (289, 1, 29, 1.40, 67200.00, 1);
INSERT INTO public.detallesticket VALUES (290, 1, 29, 26.60, 1276800.00, 1);
INSERT INTO public.detallesticket VALUES (291, 1, 29, 10.50, 504000.00, 1);
INSERT INTO public.detallesticket VALUES (292, 1, 29, 5.40, 259200.00, 1);
INSERT INTO public.detallesticket VALUES (293, 18, 29, 4.60, 29900.00, 1);
INSERT INTO public.detallesticket VALUES (295, 1, 29, 8.60, 412800.00, 1);
INSERT INTO public.detallesticket VALUES (297, 1, 29, 7.60, 364800.00, 1);
INSERT INTO public.detallesticket VALUES (299, 1, 29, 7.80, 374400.00, 1);
INSERT INTO public.detallesticket VALUES (301, 18, 29, 0.20, 1300.00, 1);
INSERT INTO public.detallesticket VALUES (303, 10, 30, 2.60, 39000.00, 1);
INSERT INTO public.detallesticket VALUES (305, 18, 30, 0.60, 3900.00, 1);
INSERT INTO public.detallesticket VALUES (307, 1, 30, 0.10, 4800.00, 1);
INSERT INTO public.detallesticket VALUES (309, 2, 30, 0.10, 2600.00, 1);
INSERT INTO public.detallesticket VALUES (311, 18, 30, 0.40, 2600.00, 1);
INSERT INTO public.detallesticket VALUES (313, 3, 30, 0.60, 4500.00, 1);
INSERT INTO public.detallesticket VALUES (294, 1, 29, 0.30, 14400.00, 1);
INSERT INTO public.detallesticket VALUES (296, 1, 29, 1.40, 67200.00, 1);
INSERT INTO public.detallesticket VALUES (298, 2, 29, 0.50, 13000.00, 1);
INSERT INTO public.detallesticket VALUES (300, 1, 29, 5.00, 240000.00, 1);
INSERT INTO public.detallesticket VALUES (302, 1, 30, 3.60, 172800.00, 1);
INSERT INTO public.detallesticket VALUES (304, 7, 30, 0.70, 7700.00, 1);
INSERT INTO public.detallesticket VALUES (306, 2, 30, 3.10, 80600.00, 1);
INSERT INTO public.detallesticket VALUES (308, 1, 30, 3.00, 144000.00, 1);
INSERT INTO public.detallesticket VALUES (310, 1, 30, 0.50, 24000.00, 1);
INSERT INTO public.detallesticket VALUES (312, 1, 30, 0.80, 38400.00, 1);
INSERT INTO public.detallesticket VALUES (314, 12, 30, 0.10, 700.00, 1);
INSERT INTO public.detallesticket VALUES (315, 19, 31, 4.00, 12000.00, 1);
INSERT INTO public.detallesticket VALUES (316, 1, 31, 0.90, 43200.00, 1);
INSERT INTO public.detallesticket VALUES (317, 12, 31, 4.10, 28700.00, 1);
INSERT INTO public.detallesticket VALUES (318, 12, 31, 0.80, 5600.00, 1);
INSERT INTO public.detallesticket VALUES (319, 1, 31, 2.60, 124800.00, 1);
INSERT INTO public.detallesticket VALUES (320, 18, 31, 0.90, 5850.00, 1);
INSERT INTO public.detallesticket VALUES (321, 3, 31, 1.90, 14250.00, 1);
INSERT INTO public.detallesticket VALUES (322, 1, 31, 0.50, 24000.00, 1);
INSERT INTO public.detallesticket VALUES (323, 3, 31, 0.40, 3000.00, 1);
INSERT INTO public.detallesticket VALUES (324, 12, 31, 8.10, 56700.00, 1);
INSERT INTO public.detallesticket VALUES (325, 12, 31, 5.40, 37800.00, 1);
INSERT INTO public.detallesticket VALUES (326, 1, 31, 1.10, 52800.00, 1);
INSERT INTO public.detallesticket VALUES (327, 12, 31, 7.20, 50400.00, 1);
INSERT INTO public.detallesticket VALUES (328, 18, 31, 2.00, 13000.00, 1);
INSERT INTO public.detallesticket VALUES (329, 1, 31, 0.70, 33600.00, 1);
INSERT INTO public.detallesticket VALUES (330, 2, 31, 4.00, 104000.00, 1);
INSERT INTO public.detallesticket VALUES (331, 13, 31, 19.40, 77600.00, 1);
INSERT INTO public.detallesticket VALUES (332, 1, 31, 4.40, 211200.00, 1);
INSERT INTO public.detallesticket VALUES (333, 2, 31, 8.60, 223600.00, 1);
INSERT INTO public.detallesticket VALUES (334, 1, 31, 1.00, 48000.00, 1);
INSERT INTO public.detallesticket VALUES (335, 2, 32, 1.60, 41600.00, 2);
INSERT INTO public.detallesticket VALUES (336, 1, 32, 5.30, 254400.00, 2);
INSERT INTO public.detallesticket VALUES (337, 13, 32, 1.90, 7600.00, 2);
INSERT INTO public.detallesticket VALUES (338, 17, 32, 0.30, 6000.00, 2);
INSERT INTO public.detallesticket VALUES (339, 7, 32, 4.60, 50600.00, 2);
INSERT INTO public.detallesticket VALUES (340, 5, 32, 3.50, 22750.00, 2);
INSERT INTO public.detallesticket VALUES (341, 6, 32, 1.40, 12600.00, 2);
INSERT INTO public.detallesticket VALUES (342, 5, 32, 1.30, 8450.00, 2);
INSERT INTO public.detallesticket VALUES (343, 5, 32, 3.40, 22100.00, 2);
INSERT INTO public.detallesticket VALUES (344, 9, 32, 0.40, 1200.00, 2);
INSERT INTO public.detallesticket VALUES (345, 10, 32, 0.50, 7500.00, 2);
INSERT INTO public.detallesticket VALUES (346, 8, 32, 0.30, 2400.00, 2);
INSERT INTO public.detallesticket VALUES (347, 3, 32, 3.50, 26250.00, 2);
INSERT INTO public.detallesticket VALUES (348, 1, 33, 1.50, 72000.00, 1);
INSERT INTO public.detallesticket VALUES (349, 1, 33, 1.90, 91200.00, 1);
INSERT INTO public.detallesticket VALUES (350, 13, 33, 11.40, 45600.00, 1);
INSERT INTO public.detallesticket VALUES (351, 18, 33, 3.20, 20800.00, 1);
INSERT INTO public.detallesticket VALUES (352, 1, 33, 3.50, 168000.00, 1);
INSERT INTO public.detallesticket VALUES (353, 1, 33, 6.10, 292800.00, 1);
INSERT INTO public.detallesticket VALUES (354, 1, 33, 2.60, 124800.00, 1);
INSERT INTO public.detallesticket VALUES (355, 12, 33, 10.00, 70000.00, 1);
INSERT INTO public.detallesticket VALUES (356, 1, 33, 2.90, 139200.00, 1);
INSERT INTO public.detallesticket VALUES (357, 12, 33, 4.60, 32200.00, 1);
INSERT INTO public.detallesticket VALUES (358, 1, 33, 1.00, 48000.00, 1);
INSERT INTO public.detallesticket VALUES (359, 1, 33, 4.90, 235200.00, 1);
INSERT INTO public.detallesticket VALUES (360, 1, 33, 12.20, 585600.00, 1);
INSERT INTO public.detallesticket VALUES (361, 1, 33, 12.20, 585600.00, 1);
INSERT INTO public.detallesticket VALUES (362, 1, 33, 8.50, 408000.00, 1);
INSERT INTO public.detallesticket VALUES (363, 1, 33, 6.30, 302400.00, 1);
INSERT INTO public.detallesticket VALUES (364, 2, 33, 1.20, 31200.00, 1);
INSERT INTO public.detallesticket VALUES (365, 1, 33, 0.60, 28800.00, 1);
INSERT INTO public.detallesticket VALUES (366, 1, 33, 0.60, 28800.00, 1);
INSERT INTO public.detallesticket VALUES (367, 1, 33, 1.30, 62400.00, 1);
INSERT INTO public.detallesticket VALUES (368, 1, 33, 1.60, 76800.00, 1);
INSERT INTO public.detallesticket VALUES (369, 1, 33, 4.30, 206400.00, 1);
INSERT INTO public.detallesticket VALUES (370, 12, 33, 0.80, 5600.00, 1);
INSERT INTO public.detallesticket VALUES (371, 12, 33, 1.70, 11900.00, 1);
INSERT INTO public.detallesticket VALUES (372, 13, 33, 27.30, 109200.00, 1);
INSERT INTO public.detallesticket VALUES (373, 1, 33, 18.05, 866400.00, 1);
INSERT INTO public.detallesticket VALUES (374, 1, 34, 0.70, 33600.00, 1);
INSERT INTO public.detallesticket VALUES (375, 1, 35, 3.10, 148800.00, 1);
INSERT INTO public.detallesticket VALUES (376, 1, 35, 14.70, 705600.00, 1);
INSERT INTO public.detallesticket VALUES (377, 1, 36, 0.90, 43200.00, 1);
INSERT INTO public.detallesticket VALUES (378, 1, 37, 18.30, 878400.00, 1);
INSERT INTO public.detallesticket VALUES (379, 1, 38, 4.80, 230400.00, 1);
INSERT INTO public.detallesticket VALUES (380, 1, 39, 24.50, 1176000.00, 1);
INSERT INTO public.detallesticket VALUES (381, 1, 39, 7.00, 336000.00, 1);
INSERT INTO public.detallesticket VALUES (382, 2, 40, 10.10, 262600.00, 1);
INSERT INTO public.detallesticket VALUES (383, 18, 40, 9.30, 60450.00, 1);
INSERT INTO public.detallesticket VALUES (384, 1, 41, 1.20, 54000.00, 1);
INSERT INTO public.detallesticket VALUES (385, 1, 41, 1.40, 63000.00, 1);
INSERT INTO public.detallesticket VALUES (386, 1, 41, 43.40, 1953000.00, 1);
INSERT INTO public.detallesticket VALUES (387, 2, 41, 0.30, 7500.00, 1);
INSERT INTO public.detallesticket VALUES (388, 2, 41, 13.00, 325000.00, 1);
INSERT INTO public.detallesticket VALUES (389, 1, 41, 2.00, 90000.00, 1);
INSERT INTO public.detallesticket VALUES (390, 13, 42, 4.20, 16800.00, 1);
INSERT INTO public.detallesticket VALUES (391, 1, 42, 3.20, 144000.00, 1);
INSERT INTO public.detallesticket VALUES (392, 18, 42, 2.40, 15600.00, 1);
INSERT INTO public.detallesticket VALUES (393, 12, 43, 8.50, 59500.00, 1);
INSERT INTO public.detallesticket VALUES (394, 1, 44, 1.40, 63000.00, 1);
INSERT INTO public.detallesticket VALUES (395, 1, 44, 12.00, 540000.00, 1);
INSERT INTO public.detallesticket VALUES (396, 1, 44, 9.40, 423000.00, 1);
INSERT INTO public.detallesticket VALUES (397, 1, 44, 3.70, 166500.00, 1);
INSERT INTO public.detallesticket VALUES (398, 1, 44, 1.10, 49500.00, 1);
INSERT INTO public.detallesticket VALUES (399, 2, 44, 1.10, 27500.00, 1);
INSERT INTO public.detallesticket VALUES (400, 18, 44, 0.60, 3900.00, 1);
INSERT INTO public.detallesticket VALUES (401, 1, 45, 3.70, 166500.00, 1);
INSERT INTO public.detallesticket VALUES (402, 1, 45, 1.40, 63000.00, 1);
INSERT INTO public.detallesticket VALUES (403, 7, 45, 0.70, 7700.00, 1);
INSERT INTO public.detallesticket VALUES (404, 3, 45, 3.70, 27750.00, 1);
INSERT INTO public.detallesticket VALUES (405, 2, 45, 0.80, 20000.00, 1);
INSERT INTO public.detallesticket VALUES (406, 1, 45, 1.50, 67500.00, 1);
INSERT INTO public.detallesticket VALUES (407, 1, 45, 12.10, 544500.00, 1);
INSERT INTO public.detallesticket VALUES (408, 12, 45, 2.00, 14000.00, 1);
INSERT INTO public.detallesticket VALUES (409, 12, 45, 3.40, 23800.00, 1);
INSERT INTO public.detallesticket VALUES (410, 12, 45, 5.20, 36400.00, 1);
INSERT INTO public.detallesticket VALUES (411, 1, 45, 2.30, 103500.00, 1);
INSERT INTO public.detallesticket VALUES (412, 2, 45, 1.30, 32500.00, 1);
INSERT INTO public.detallesticket VALUES (413, 1, 45, 1.10, 49500.00, 1);
INSERT INTO public.detallesticket VALUES (414, 12, 45, 0.50, 3500.00, 1);
INSERT INTO public.detallesticket VALUES (415, 1, 45, 5.50, 247500.00, 1);
INSERT INTO public.detallesticket VALUES (416, 12, 45, 5.50, 38500.00, 1);
INSERT INTO public.detallesticket VALUES (417, 13, 45, 44.30, 177200.00, 1);
INSERT INTO public.detallesticket VALUES (418, 1, 45, 2.50, 112500.00, 1);
INSERT INTO public.detallesticket VALUES (419, 12, 45, 0.50, 3500.00, 1);
INSERT INTO public.detallesticket VALUES (420, 1, 45, 8.40, 378000.00, 1);
INSERT INTO public.detallesticket VALUES (421, 1, 45, 2.10, 94500.00, 1);
INSERT INTO public.detallesticket VALUES (422, 12, 45, 6.70, 46900.00, 1);
INSERT INTO public.detallesticket VALUES (423, 13, 45, 9.90, 39600.00, 1);
INSERT INTO public.detallesticket VALUES (424, 1, 46, 1.50, 67500.00, 1);
INSERT INTO public.detallesticket VALUES (425, 12, 46, 0.80, 5600.00, 1);
INSERT INTO public.detallesticket VALUES (426, 6, 46, 21.80, 196200.00, 1);
INSERT INTO public.detallesticket VALUES (427, 12, 46, 7.00, 49000.00, 1);
INSERT INTO public.detallesticket VALUES (428, 1, 46, 1.70, 76500.00, 1);
INSERT INTO public.detallesticket VALUES (429, 12, 47, 0.60, 4200.00, 1);
INSERT INTO public.detallesticket VALUES (430, 1, 47, 40.10, 1804500.00, 1);
INSERT INTO public.detallesticket VALUES (431, 12, 47, 3.30, 23100.00, 1);
INSERT INTO public.detallesticket VALUES (432, 1, 47, 16.50, 742500.00, 1);
INSERT INTO public.detallesticket VALUES (433, 1, 47, 16.00, 720000.00, 1);
INSERT INTO public.detallesticket VALUES (434, 1, 47, 10.00, 450000.00, 1);
INSERT INTO public.detallesticket VALUES (435, 1, 47, 4.60, 207000.00, 1);
INSERT INTO public.detallesticket VALUES (436, 6, 47, 9.10, 81900.00, 1);
INSERT INTO public.detallesticket VALUES (437, 1, 47, 2.00, 90000.00, 1);
INSERT INTO public.detallesticket VALUES (438, 12, 47, 3.90, 27300.00, 1);
INSERT INTO public.detallesticket VALUES (439, 1, 47, 1.80, 81000.00, 1);
INSERT INTO public.detallesticket VALUES (440, 1, 47, 4.90, 220500.00, 1);
INSERT INTO public.detallesticket VALUES (441, 1, 47, 0.70, 31500.00, 1);
INSERT INTO public.detallesticket VALUES (442, 1, 48, 8.90, 400500.00, 1);
INSERT INTO public.detallesticket VALUES (443, 12, 48, 16.20, 113400.00, 1);
INSERT INTO public.detallesticket VALUES (444, 1, 48, 1.00, 45000.00, 1);
INSERT INTO public.detallesticket VALUES (445, 12, 49, 2.80, 19600.00, 1);
INSERT INTO public.detallesticket VALUES (446, 13, 49, 1.80, 7200.00, 1);
INSERT INTO public.detallesticket VALUES (447, 1, 49, 7.60, 342000.00, 1);
INSERT INTO public.detallesticket VALUES (448, 13, 49, 9.50, 38000.00, 1);
INSERT INTO public.detallesticket VALUES (449, 12, 49, 8.40, 58800.00, 1);
INSERT INTO public.detallesticket VALUES (450, 1, 49, 1.60, 72000.00, 1);
INSERT INTO public.detallesticket VALUES (451, 1, 49, 1.00, 45000.00, 1);
INSERT INTO public.detallesticket VALUES (452, 2, 49, 12.10, 302500.00, 1);
INSERT INTO public.detallesticket VALUES (453, 1, 49, 5.20, 234000.00, 1);
INSERT INTO public.detallesticket VALUES (454, 3, 49, 3.60, 27000.00, 1);
INSERT INTO public.detallesticket VALUES (455, 17, 49, 0.20, 4000.00, 1);
INSERT INTO public.detallesticket VALUES (456, 9, 49, 0.30, 900.00, 1);
INSERT INTO public.detallesticket VALUES (457, 12, 49, 3.40, 23800.00, 1);
INSERT INTO public.detallesticket VALUES (458, 1, 49, 2.50, 112500.00, 1);
INSERT INTO public.detallesticket VALUES (459, 13, 50, 26.20, 104800.00, 1);
INSERT INTO public.detallesticket VALUES (460, 1, 51, 1.50, 67500.00, 1);
INSERT INTO public.detallesticket VALUES (461, 12, 51, 1.20, 8400.00, 1);
INSERT INTO public.detallesticket VALUES (462, 3, 52, 7.40, 55500.00, 1);
INSERT INTO public.detallesticket VALUES (463, 17, 52, 0.50, 10000.00, 1);
INSERT INTO public.detallesticket VALUES (464, 1, 52, 1.70, 76500.00, 1);
INSERT INTO public.detallesticket VALUES (465, 1, 52, 21.90, 985500.00, 1);
INSERT INTO public.detallesticket VALUES (466, 12, 52, 3.80, 26600.00, 1);
INSERT INTO public.detallesticket VALUES (467, 6, 52, 14.50, 130500.00, 1);
INSERT INTO public.detallesticket VALUES (468, 1, 52, 0.60, 27000.00, 1);
INSERT INTO public.detallesticket VALUES (469, 18, 52, 0.30, 1950.00, 1);
INSERT INTO public.detallesticket VALUES (470, 12, 52, 1.20, 8400.00, 1);
INSERT INTO public.detallesticket VALUES (471, 1, 52, 2.20, 99000.00, 1);
INSERT INTO public.detallesticket VALUES (472, 1, 52, 1.60, 72000.00, 1);
INSERT INTO public.detallesticket VALUES (473, 1, 53, 18.50, 832500.00, 1);
INSERT INTO public.detallesticket VALUES (474, 1, 54, 1.40, 63000.00, 1);
INSERT INTO public.detallesticket VALUES (475, 7, 54, 1.10, 12100.00, 1);
INSERT INTO public.detallesticket VALUES (476, 18, 54, 5.90, 38350.00, 1);
INSERT INTO public.detallesticket VALUES (477, 6, 54, 1.50, 13500.00, 1);
INSERT INTO public.detallesticket VALUES (478, 1, 54, 1.30, 58500.00, 1);
INSERT INTO public.detallesticket VALUES (479, 1, 54, 16.60, 747000.00, 1);
INSERT INTO public.detallesticket VALUES (480, 18, 54, 1.30, 8450.00, 1);
INSERT INTO public.detallesticket VALUES (481, 12, 54, 4.50, 31500.00, 1);
INSERT INTO public.detallesticket VALUES (482, 3, 54, 2.20, 16500.00, 1);
INSERT INTO public.detallesticket VALUES (483, 18, 54, 1.20, 7800.00, 1);
INSERT INTO public.detallesticket VALUES (484, 1, 55, 2.30, 103500.00, 1);
INSERT INTO public.detallesticket VALUES (485, 2, 56, 7.90, 197500.00, 1);
INSERT INTO public.detallesticket VALUES (486, 1, 56, 13.40, 603000.00, 1);
INSERT INTO public.detallesticket VALUES (487, 14, 57, 5.50, 77000.00, 1);
INSERT INTO public.detallesticket VALUES (488, 15, 57, 5.50, 16500.00, 1);
INSERT INTO public.detallesticket VALUES (489, 2, 57, 3.95, 98750.00, 1);
INSERT INTO public.detallesticket VALUES (490, 1, 58, 13.90, 625500.00, 2);
INSERT INTO public.detallesticket VALUES (491, 2, 58, 2.90, 72500.00, 2);
INSERT INTO public.detallesticket VALUES (492, 17, 58, 1.20, 24000.00, 2);
INSERT INTO public.detallesticket VALUES (493, 3, 58, 27.20, 204000.00, 2);
INSERT INTO public.detallesticket VALUES (494, 7, 58, 3.00, 33000.00, 2);
INSERT INTO public.detallesticket VALUES (495, 6, 58, 0.70, 6300.00, 2);
INSERT INTO public.detallesticket VALUES (496, 11, 59, 2.70, 5400.00, 1);
INSERT INTO public.detallesticket VALUES (497, 12, 59, 2.50, 17500.00, 1);
INSERT INTO public.detallesticket VALUES (498, 1, 59, 0.50, 22500.00, 1);
INSERT INTO public.detallesticket VALUES (499, 18, 60, 0.20, 1300.00, 1);
INSERT INTO public.detallesticket VALUES (500, 13, 61, 10.80, 43200.00, 1);
INSERT INTO public.detallesticket VALUES (501, 3, 61, 9.40, 70500.00, 1);
INSERT INTO public.detallesticket VALUES (502, 1, 61, 0.70, 31500.00, 1);
INSERT INTO public.detallesticket VALUES (503, 1, 61, 1.90, 85500.00, 1);
INSERT INTO public.detallesticket VALUES (504, 12, 61, 1.10, 7700.00, 1);
INSERT INTO public.detallesticket VALUES (505, 2, 61, 3.10, 77500.00, 1);
INSERT INTO public.detallesticket VALUES (506, 1, 61, 4.70, 211500.00, 1);
INSERT INTO public.detallesticket VALUES (507, 3, 63, 4.30, 32250.00, 1);
INSERT INTO public.detallesticket VALUES (508, 12, 63, 0.10, 700.00, 1);
INSERT INTO public.detallesticket VALUES (509, 12, 63, 1.50, 10500.00, 1);
INSERT INTO public.detallesticket VALUES (510, 1, 63, 32.40, 1458000.00, 1);
INSERT INTO public.detallesticket VALUES (511, 1, 64, 4.80, 216000.00, 1);
INSERT INTO public.detallesticket VALUES (512, 7, 64, 3.00, 33000.00, 1);
INSERT INTO public.detallesticket VALUES (513, 1, 64, 4.00, 180000.00, 1);
INSERT INTO public.detallesticket VALUES (514, 1, 64, 6.30, 283500.00, 1);
INSERT INTO public.detallesticket VALUES (515, 1, 65, 0.50, 22500.00, 1);
INSERT INTO public.detallesticket VALUES (516, 3, 65, 15.60, 117000.00, 1);
INSERT INTO public.detallesticket VALUES (517, 17, 65, 0.20, 4000.00, 1);
INSERT INTO public.detallesticket VALUES (518, 1, 65, 6.30, 283500.00, 1);
INSERT INTO public.detallesticket VALUES (519, 13, 65, 161.00, 644000.00, 1);
INSERT INTO public.detallesticket VALUES (520, 13, 65, 148.60, 594400.00, 1);
INSERT INTO public.detallesticket VALUES (521, 12, 65, 15.80, 110600.00, 1);
INSERT INTO public.detallesticket VALUES (522, 1, 65, 5.30, 238500.00, 1);
INSERT INTO public.detallesticket VALUES (523, 1, 65, 0.65, 29250.00, 1);
INSERT INTO public.detallesticket VALUES (524, 1, 65, 1.60, 72000.00, 1);
INSERT INTO public.detallesticket VALUES (525, 18, 65, 0.10, 650.00, 1);
INSERT INTO public.detallesticket VALUES (526, 1, 65, 2.60, 117000.00, 1);
INSERT INTO public.detallesticket VALUES (527, 12, 66, 0.20, 1400.00, 1);
INSERT INTO public.detallesticket VALUES (528, 1, 67, 1.30, 58500.00, 1);
INSERT INTO public.detallesticket VALUES (529, 12, 67, 7.40, 51800.00, 1);
INSERT INTO public.detallesticket VALUES (530, 1, 67, 0.50, 22500.00, 1);
INSERT INTO public.detallesticket VALUES (531, 2, 67, 1.70, 42500.00, 1);
INSERT INTO public.detallesticket VALUES (532, 1, 67, 5.40, 243000.00, 1);
INSERT INTO public.detallesticket VALUES (533, 12, 67, 7.60, 53200.00, 1);
INSERT INTO public.detallesticket VALUES (534, 17, 67, 0.10, 2000.00, 1);
INSERT INTO public.detallesticket VALUES (535, 1, 67, 31.60, 1422000.00, 1);
INSERT INTO public.detallesticket VALUES (536, 1, 67, 1.20, 54000.00, 1);
INSERT INTO public.detallesticket VALUES (537, 12, 67, 0.90, 6300.00, 1);
INSERT INTO public.detallesticket VALUES (538, 2, 67, 3.20, 80000.00, 1);
INSERT INTO public.detallesticket VALUES (539, 1, 67, 0.60, 27000.00, 1);
INSERT INTO public.detallesticket VALUES (540, 1, 67, 2.30, 103500.00, 1);
INSERT INTO public.detallesticket VALUES (541, 2, 67, 2.70, 67500.00, 1);
INSERT INTO public.detallesticket VALUES (542, 1, 67, 0.10, 4500.00, 1);
INSERT INTO public.detallesticket VALUES (543, 3, 67, 8.10, 60750.00, 1);
INSERT INTO public.detallesticket VALUES (544, 7, 67, 17.80, 195800.00, 1);
INSERT INTO public.detallesticket VALUES (545, 18, 67, 4.60, 29900.00, 1);
INSERT INTO public.detallesticket VALUES (546, 1, 67, 3.10, 139500.00, 1);
INSERT INTO public.detallesticket VALUES (547, 12, 67, 9.10, 63700.00, 1);
INSERT INTO public.detallesticket VALUES (548, 11, 67, 3.30, 6600.00, 1);
INSERT INTO public.detallesticket VALUES (549, 1, 67, 15.80, 711000.00, 1);
INSERT INTO public.detallesticket VALUES (550, 1, 67, 2.50, 112500.00, 1);
INSERT INTO public.detallesticket VALUES (551, 12, 67, 16.00, 112000.00, 1);
INSERT INTO public.detallesticket VALUES (552, 1, 67, 1.00, 45000.00, 1);
INSERT INTO public.detallesticket VALUES (553, 12, 67, 1.70, 11900.00, 1);
INSERT INTO public.detallesticket VALUES (554, 12, 67, 4.00, 28000.00, 1);
INSERT INTO public.detallesticket VALUES (555, 1, 67, 0.90, 40500.00, 1);
INSERT INTO public.detallesticket VALUES (556, 18, 67, 0.10, 650.00, 1);
INSERT INTO public.detallesticket VALUES (557, 13, 67, 20.10, 80400.00, 1);
INSERT INTO public.detallesticket VALUES (558, 2, 68, 4.20, 105000.00, 1);
INSERT INTO public.detallesticket VALUES (559, 12, 68, 3.90, 27300.00, 1);
INSERT INTO public.detallesticket VALUES (560, 1, 69, 58.60, 2637000.00, 1);
INSERT INTO public.detallesticket VALUES (561, 1, 69, 0.80, 36000.00, 1);
INSERT INTO public.detallesticket VALUES (562, 1, 69, 6.70, 301500.00, 1);
INSERT INTO public.detallesticket VALUES (563, 3, 69, 2.00, 15000.00, 1);
INSERT INTO public.detallesticket VALUES (564, 19, 69, 1.60, 4800.00, 1);
INSERT INTO public.detallesticket VALUES (565, 12, 69, 8.00, 56000.00, 1);
INSERT INTO public.detallesticket VALUES (566, 1, 69, 1.70, 76500.00, 1);
INSERT INTO public.detallesticket VALUES (567, 1, 69, 3.70, 166500.00, 1);
INSERT INTO public.detallesticket VALUES (568, 1, 70, 1.20, 54000.00, 1);
INSERT INTO public.detallesticket VALUES (569, 12, 70, 2.00, 14000.00, 1);
INSERT INTO public.detallesticket VALUES (570, 1, 70, 0.20, 9000.00, 1);
INSERT INTO public.detallesticket VALUES (571, 12, 70, 4.40, 30800.00, 1);
INSERT INTO public.detallesticket VALUES (572, 1, 70, 3.30, 148500.00, 1);
INSERT INTO public.detallesticket VALUES (573, 12, 70, 1.60, 11200.00, 1);
INSERT INTO public.detallesticket VALUES (574, 1, 70, 0.10, 4500.00, 1);
INSERT INTO public.detallesticket VALUES (575, 1, 70, 3.40, 153000.00, 1);
INSERT INTO public.detallesticket VALUES (576, 12, 70, 13.00, 91000.00, 1);
INSERT INTO public.detallesticket VALUES (578, 13, 70, 4.30, 17200.00, 1);
INSERT INTO public.detallesticket VALUES (577, 12, 70, 1.40, 9800.00, 1);
INSERT INTO public.detallesticket VALUES (579, 2, 70, 1.00, 25000.00, 1);
INSERT INTO public.detallesticket VALUES (580, 1, 71, 2.80, 126000.00, 1);
INSERT INTO public.detallesticket VALUES (581, 1, 71, 0.20, 9000.00, 1);
INSERT INTO public.detallesticket VALUES (582, 13, 71, 21.50, 86000.00, 1);
INSERT INTO public.detallesticket VALUES (583, 12, 71, 7.10, 49700.00, 1);
INSERT INTO public.detallesticket VALUES (584, 1, 71, 1.60, 72000.00, 1);
INSERT INTO public.detallesticket VALUES (585, 2, 71, 0.50, 12500.00, 1);
INSERT INTO public.detallesticket VALUES (586, 1, 71, 3.10, 139500.00, 1);
INSERT INTO public.detallesticket VALUES (587, 12, 71, 2.90, 20300.00, 1);
INSERT INTO public.detallesticket VALUES (588, 12, 71, 1.00, 7000.00, 1);
INSERT INTO public.detallesticket VALUES (589, 1, 71, 1.30, 58500.00, 1);
INSERT INTO public.detallesticket VALUES (590, 12, 71, 1.00, 7000.00, 1);
INSERT INTO public.detallesticket VALUES (591, 1, 71, 8.10, 364500.00, 1);
INSERT INTO public.detallesticket VALUES (592, 1, 71, 18.00, 810000.00, 1);
INSERT INTO public.detallesticket VALUES (593, 1, 72, 7.10, 319500.00, 1);
INSERT INTO public.detallesticket VALUES (594, 7, 72, 3.80, 41800.00, 1);
INSERT INTO public.detallesticket VALUES (595, 2, 72, 3.00, 75000.00, 1);
INSERT INTO public.detallesticket VALUES (596, 1, 72, 11.30, 508500.00, 1);
INSERT INTO public.detallesticket VALUES (597, 1, 72, 0.90, 40500.00, 1);
INSERT INTO public.detallesticket VALUES (598, 12, 72, 4.20, 29400.00, 1);
INSERT INTO public.detallesticket VALUES (599, 1, 72, 5.20, 234000.00, 1);
INSERT INTO public.detallesticket VALUES (600, 1, 72, 2.40, 108000.00, 1);
INSERT INTO public.detallesticket VALUES (601, 12, 72, 1.40, 9800.00, 1);
INSERT INTO public.detallesticket VALUES (602, 1, 73, 34.10, 1534500.00, 1);
INSERT INTO public.detallesticket VALUES (603, 1, 73, 3.90, 175500.00, 1);
INSERT INTO public.detallesticket VALUES (604, 1, 73, 6.00, 270000.00, 1);
INSERT INTO public.detallesticket VALUES (605, 1, 73, 24.40, 1098000.00, 1);
INSERT INTO public.detallesticket VALUES (606, 1, 73, 7.10, 319500.00, 1);
INSERT INTO public.detallesticket VALUES (607, 1, 74, 4.30, 193500.00, 1);
INSERT INTO public.detallesticket VALUES (608, 18, 74, 0.30, 1950.00, 1);
INSERT INTO public.detallesticket VALUES (609, 1, 75, 0.80, 36000.00, 1);
INSERT INTO public.detallesticket VALUES (610, 3, 75, 5.40, 40500.00, 1);
INSERT INTO public.detallesticket VALUES (611, 4, 75, 1.00, 6500.00, 1);
INSERT INTO public.detallesticket VALUES (612, 7, 75, 1.20, 13200.00, 1);
INSERT INTO public.detallesticket VALUES (613, 1, 75, 1.00, 45000.00, 1);
INSERT INTO public.detallesticket VALUES (614, 12, 75, 11.50, 80500.00, 1);
INSERT INTO public.detallesticket VALUES (615, 12, 76, 2.70, 18900.00, 1);
INSERT INTO public.detallesticket VALUES (616, 1, 76, 1.90, 85500.00, 1);
INSERT INTO public.detallesticket VALUES (617, 12, 76, 3.60, 25200.00, 1);
INSERT INTO public.detallesticket VALUES (618, 1, 76, 1.30, 58500.00, 1);
INSERT INTO public.detallesticket VALUES (619, 13, 76, 162.40, 649600.00, 1);
INSERT INTO public.detallesticket VALUES (620, 13, 76, 191.30, 765200.00, 1);
INSERT INTO public.detallesticket VALUES (621, 12, 76, 8.20, 57400.00, 1);
INSERT INTO public.detallesticket VALUES (622, 1, 76, 2.90, 130500.00, 1);
INSERT INTO public.detallesticket VALUES (623, 12, 77, 0.40, 2800.00, 1);
INSERT INTO public.detallesticket VALUES (624, 1, 77, 0.20, 9000.00, 1);
INSERT INTO public.detallesticket VALUES (625, 1, 78, 0.50, 22500.00, 1);
INSERT INTO public.detallesticket VALUES (626, 3, 78, 1.70, 12750.00, 1);
INSERT INTO public.detallesticket VALUES (627, 2, 78, 0.60, 15000.00, 1);
INSERT INTO public.detallesticket VALUES (628, 1, 78, 0.30, 13500.00, 1);
INSERT INTO public.detallesticket VALUES (629, 12, 78, 7.10, 49700.00, 1);
INSERT INTO public.detallesticket VALUES (630, 13, 78, 4.10, 16400.00, 1);
INSERT INTO public.detallesticket VALUES (631, 1, 79, 5.80, 261000.00, 1);
INSERT INTO public.detallesticket VALUES (632, 2, 79, 3.90, 97500.00, 1);
INSERT INTO public.detallesticket VALUES (633, 18, 79, 2.30, 14950.00, 1);
INSERT INTO public.detallesticket VALUES (634, 16, 79, 4.40, 13200.00, 1);
INSERT INTO public.detallesticket VALUES (635, 1, 79, 2.50, 112500.00, 1);
INSERT INTO public.detallesticket VALUES (636, 1, 80, 6.70, 301500.00, 1);
INSERT INTO public.detallesticket VALUES (637, 1, 80, 8.00, 360000.00, 1);
INSERT INTO public.detallesticket VALUES (638, 1, 80, 6.30, 283500.00, 1);
INSERT INTO public.detallesticket VALUES (639, 1, 80, 6.00, 270000.00, 1);
INSERT INTO public.detallesticket VALUES (640, 12, 80, 0.50, 3500.00, 1);
INSERT INTO public.detallesticket VALUES (641, 12, 80, 3.00, 21000.00, 1);
INSERT INTO public.detallesticket VALUES (642, 1, 80, 25.20, 1134000.00, 1);
INSERT INTO public.detallesticket VALUES (643, 1, 81, 20.20, 909000.00, 1);
INSERT INTO public.detallesticket VALUES (644, 1, 82, 4.00, 180000.00, 1);
INSERT INTO public.detallesticket VALUES (645, 1, 83, 2.90, 130500.00, 1);


--
-- TOC entry 3357 (class 0 OID 230311)
-- Dependencies: 221
-- Data for Name: total; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.total VALUES (3, 9, 1139100);
INSERT INTO public.total VALUES (4, 10, 634000);
INSERT INTO public.total VALUES (5, 11, 780000);
INSERT INTO public.total VALUES (6, 12, 1506900);
INSERT INTO public.total VALUES (7, 13, 1399700);
INSERT INTO public.total VALUES (8, 14, 1160370);
INSERT INTO public.total VALUES (9, 15, 2488100);
INSERT INTO public.total VALUES (10, 16, 1089300);
INSERT INTO public.total VALUES (11, 17, 260000);
INSERT INTO public.total VALUES (12, 18, 2266100);
INSERT INTO public.total VALUES (13, 19, 758950);
INSERT INTO public.total VALUES (14, 20, 1489850);
INSERT INTO public.total VALUES (15, 21, 3084300);
INSERT INTO public.total VALUES (16, 22, 4156900);
INSERT INTO public.total VALUES (17, 23, 1313700);
INSERT INTO public.total VALUES (18, 24, 2724250);
INSERT INTO public.total VALUES (19, 25, 2005100);
INSERT INTO public.total VALUES (20, 26, 887600);
INSERT INTO public.total VALUES (21, 27, 1672450);
INSERT INTO public.total VALUES (22, 28, 1458400);
INSERT INTO public.total VALUES (23, 29, 5444350);
INSERT INTO public.total VALUES (24, 30, 525600);
INSERT INTO public.total VALUES (25, 31, 1170100);
INSERT INTO public.total VALUES (26, 32, 463450);
INSERT INTO public.total VALUES (27, 33, 4648900);
INSERT INTO public.total VALUES (28, 34, 33600);
INSERT INTO public.total VALUES (29, 35, 854400);
INSERT INTO public.total VALUES (30, 36, 43200);
INSERT INTO public.total VALUES (31, 37, 878400);
INSERT INTO public.total VALUES (32, 38, 230400);
INSERT INTO public.total VALUES (33, 39, 1512000);
INSERT INTO public.total VALUES (34, 40, 323050);
INSERT INTO public.total VALUES (35, 41, 2492500);
INSERT INTO public.total VALUES (36, 42, 176400);
INSERT INTO public.total VALUES (37, 43, 59500);
INSERT INTO public.total VALUES (38, 44, 1273400);
INSERT INTO public.total VALUES (39, 45, 2298350);
INSERT INTO public.total VALUES (40, 46, 394800);
INSERT INTO public.total VALUES (41, 47, 4483500);
INSERT INTO public.total VALUES (42, 48, 558900);
INSERT INTO public.total VALUES (43, 49, 1287300);
INSERT INTO public.total VALUES (44, 50, 104800);
INSERT INTO public.total VALUES (45, 51, 75900);
INSERT INTO public.total VALUES (46, 52, 1492950);
INSERT INTO public.total VALUES (47, 53, 832500);
INSERT INTO public.total VALUES (48, 54, 996700);
INSERT INTO public.total VALUES (49, 55, 103500);
INSERT INTO public.total VALUES (50, 56, 800500);
INSERT INTO public.total VALUES (51, 57, 192250);
INSERT INTO public.total VALUES (52, 58, 965300);
INSERT INTO public.total VALUES (53, 59, 45400);
INSERT INTO public.total VALUES (54, 60, 1300);
INSERT INTO public.total VALUES (55, 61, 527400);
INSERT INTO public.total VALUES (56, 63, 1501450);
INSERT INTO public.total VALUES (57, 64, 712500);
INSERT INTO public.total VALUES (58, 65, 2233400);
INSERT INTO public.total VALUES (59, 66, 1400);
INSERT INTO public.total VALUES (60, 67, 3876500);
INSERT INTO public.total VALUES (61, 68, 132300);
INSERT INTO public.total VALUES (62, 69, 3293300);
INSERT INTO public.total VALUES (63, 70, 568000);
INSERT INTO public.total VALUES (64, 71, 1762000);
INSERT INTO public.total VALUES (65, 72, 1366500);
INSERT INTO public.total VALUES (66, 73, 3397500);
INSERT INTO public.total VALUES (67, 74, 195450);
INSERT INTO public.total VALUES (68, 75, 221700);
INSERT INTO public.total VALUES (69, 76, 1790800);
INSERT INTO public.total VALUES (70, 77, 11800);
INSERT INTO public.total VALUES (71, 78, 129850);
INSERT INTO public.total VALUES (72, 79, 499150);
INSERT INTO public.total VALUES (73, 80, 2373500);
INSERT INTO public.total VALUES (74, 81, 909000);
INSERT INTO public.total VALUES (75, 82, 180000);
INSERT INTO public.total VALUES (76, 83, 130500);


--
-- TOC entry 3366 (class 0 OID 0)
-- Dependencies: 214
-- Name: chatarra_idchatarra_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.chatarra_idchatarra_seq', 20, true);


--
-- TOC entry 3367 (class 0 OID 0)
-- Dependencies: 222
-- Name: detallesticket_iddetalle_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.detallesticket_iddetalle_seq', 645, true);


--
-- TOC entry 3368 (class 0 OID 0)
-- Dependencies: 218
-- Name: ticket_idticket_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ticket_idticket_seq', 83, true);


--
-- TOC entry 3369 (class 0 OID 0)
-- Dependencies: 220
-- Name: total_idtotal_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.total_idtotal_seq', 76, true);


--
-- TOC entry 3370 (class 0 OID 0)
-- Dependencies: 216
-- Name: vendedores_idvendedor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendedores_idvendedor_seq', 2, true);


-- Completed on 2023-10-27 13:58:12

--
-- PostgreSQL database dump complete
--

