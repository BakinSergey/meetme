--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5 (Ubuntu 11.5-3.pgdg18.04+1)
-- Dumped by pg_dump version 12.0 (Ubuntu 12.0-2.pgdg18.04+1)

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

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: meet_user
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO meet_user;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: meet_user
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO meet_user;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meet_user
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: meet_user
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO meet_user;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: meet_user
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO meet_user;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meet_user
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: meet_user
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO meet_user;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: meet_user
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO meet_user;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meet_user
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: meet_user
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO meet_user;

--
-- Name: core_activity; Type: TABLE; Schema: public; Owner: meet_user
--

CREATE TABLE public.core_activity (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    is_active boolean NOT NULL,
    category_id integer NOT NULL,
    image character varying(127) NOT NULL
);


ALTER TABLE public.core_activity OWNER TO meet_user;

--
-- Name: core_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: meet_user
--

CREATE SEQUENCE public.core_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_activity_id_seq OWNER TO meet_user;

--
-- Name: core_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meet_user
--

ALTER SEQUENCE public.core_activity_id_seq OWNED BY public.core_activity.id;


--
-- Name: core_event; Type: TABLE; Schema: public; Owner: meet_user
--

CREATE TABLE public.core_event (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    dt timestamp with time zone NOT NULL,
    is_active boolean NOT NULL,
    category_id integer NOT NULL,
    image character varying(127) NOT NULL
);


ALTER TABLE public.core_event OWNER TO meet_user;

--
-- Name: core_event_id_seq; Type: SEQUENCE; Schema: public; Owner: meet_user
--

CREATE SEQUENCE public.core_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_event_id_seq OWNER TO meet_user;

--
-- Name: core_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meet_user
--

ALTER SEQUENCE public.core_event_id_seq OWNED BY public.core_event.id;


--
-- Name: core_eventcategory; Type: TABLE; Schema: public; Owner: meet_user
--

CREATE TABLE public.core_eventcategory (
    id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.core_eventcategory OWNER TO meet_user;

--
-- Name: core_eventcategory_id_seq; Type: SEQUENCE; Schema: public; Owner: meet_user
--

CREATE SEQUENCE public.core_eventcategory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_eventcategory_id_seq OWNER TO meet_user;

--
-- Name: core_eventcategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meet_user
--

ALTER SEQUENCE public.core_eventcategory_id_seq OWNED BY public.core_eventcategory.id;


--
-- Name: core_meetuser; Type: TABLE; Schema: public; Owner: meet_user
--

CREATE TABLE public.core_meetuser (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    sex character varying(6) NOT NULL,
    is_subscriber boolean NOT NULL,
    avatar character varying(127) NOT NULL,
    symp_with integer[] NOT NULL,
    unsymp_with integer[] NOT NULL,
    liked_activities integer[] NOT NULL,
    liked_actual_events integer[] NOT NULL,
    liked_recent_events integer[] NOT NULL
);


ALTER TABLE public.core_meetuser OWNER TO meet_user;

--
-- Name: core_meetuser_groups; Type: TABLE; Schema: public; Owner: meet_user
--

CREATE TABLE public.core_meetuser_groups (
    id integer NOT NULL,
    meetuser_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.core_meetuser_groups OWNER TO meet_user;

--
-- Name: core_meetuser_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: meet_user
--

CREATE SEQUENCE public.core_meetuser_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_meetuser_groups_id_seq OWNER TO meet_user;

--
-- Name: core_meetuser_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meet_user
--

ALTER SEQUENCE public.core_meetuser_groups_id_seq OWNED BY public.core_meetuser_groups.id;


--
-- Name: core_meetuser_id_seq; Type: SEQUENCE; Schema: public; Owner: meet_user
--

CREATE SEQUENCE public.core_meetuser_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_meetuser_id_seq OWNER TO meet_user;

--
-- Name: core_meetuser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meet_user
--

ALTER SEQUENCE public.core_meetuser_id_seq OWNED BY public.core_meetuser.id;


--
-- Name: core_meetuser_user_permissions; Type: TABLE; Schema: public; Owner: meet_user
--

CREATE TABLE public.core_meetuser_user_permissions (
    id integer NOT NULL,
    meetuser_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.core_meetuser_user_permissions OWNER TO meet_user;

--
-- Name: core_meetuser_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: meet_user
--

CREATE SEQUENCE public.core_meetuser_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_meetuser_user_permissions_id_seq OWNER TO meet_user;

--
-- Name: core_meetuser_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meet_user
--

ALTER SEQUENCE public.core_meetuser_user_permissions_id_seq OWNED BY public.core_meetuser_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: meet_user
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO meet_user;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: meet_user
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO meet_user;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meet_user
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: meet_user
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO meet_user;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: meet_user
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO meet_user;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meet_user
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: meet_user
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO meet_user;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: meet_user
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO meet_user;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meet_user
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: meet_user
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO meet_user;

--
-- Name: social_auth_association; Type: TABLE; Schema: public; Owner: meet_user
--

CREATE TABLE public.social_auth_association (
    id integer NOT NULL,
    server_url character varying(255) NOT NULL,
    handle character varying(255) NOT NULL,
    secret character varying(255) NOT NULL,
    issued integer NOT NULL,
    lifetime integer NOT NULL,
    assoc_type character varying(64) NOT NULL
);


ALTER TABLE public.social_auth_association OWNER TO meet_user;

--
-- Name: social_auth_association_id_seq; Type: SEQUENCE; Schema: public; Owner: meet_user
--

CREATE SEQUENCE public.social_auth_association_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_association_id_seq OWNER TO meet_user;

--
-- Name: social_auth_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meet_user
--

ALTER SEQUENCE public.social_auth_association_id_seq OWNED BY public.social_auth_association.id;


--
-- Name: social_auth_code; Type: TABLE; Schema: public; Owner: meet_user
--

CREATE TABLE public.social_auth_code (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    code character varying(32) NOT NULL,
    verified boolean NOT NULL,
    "timestamp" timestamp with time zone NOT NULL
);


ALTER TABLE public.social_auth_code OWNER TO meet_user;

--
-- Name: social_auth_code_id_seq; Type: SEQUENCE; Schema: public; Owner: meet_user
--

CREATE SEQUENCE public.social_auth_code_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_code_id_seq OWNER TO meet_user;

--
-- Name: social_auth_code_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meet_user
--

ALTER SEQUENCE public.social_auth_code_id_seq OWNED BY public.social_auth_code.id;


--
-- Name: social_auth_nonce; Type: TABLE; Schema: public; Owner: meet_user
--

CREATE TABLE public.social_auth_nonce (
    id integer NOT NULL,
    server_url character varying(255) NOT NULL,
    "timestamp" integer NOT NULL,
    salt character varying(65) NOT NULL
);


ALTER TABLE public.social_auth_nonce OWNER TO meet_user;

--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE; Schema: public; Owner: meet_user
--

CREATE SEQUENCE public.social_auth_nonce_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_nonce_id_seq OWNER TO meet_user;

--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meet_user
--

ALTER SEQUENCE public.social_auth_nonce_id_seq OWNED BY public.social_auth_nonce.id;


--
-- Name: social_auth_partial; Type: TABLE; Schema: public; Owner: meet_user
--

CREATE TABLE public.social_auth_partial (
    id integer NOT NULL,
    token character varying(32) NOT NULL,
    next_step smallint NOT NULL,
    backend character varying(32) NOT NULL,
    data jsonb NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    CONSTRAINT social_auth_partial_next_step_check CHECK ((next_step >= 0))
);


ALTER TABLE public.social_auth_partial OWNER TO meet_user;

--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE; Schema: public; Owner: meet_user
--

CREATE SEQUENCE public.social_auth_partial_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_partial_id_seq OWNER TO meet_user;

--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meet_user
--

ALTER SEQUENCE public.social_auth_partial_id_seq OWNED BY public.social_auth_partial.id;


--
-- Name: social_auth_usersocialauth; Type: TABLE; Schema: public; Owner: meet_user
--

CREATE TABLE public.social_auth_usersocialauth (
    id integer NOT NULL,
    provider character varying(32) NOT NULL,
    uid character varying(255) NOT NULL,
    extra_data jsonb NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.social_auth_usersocialauth OWNER TO meet_user;

--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE; Schema: public; Owner: meet_user
--

CREATE SEQUENCE public.social_auth_usersocialauth_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_usersocialauth_id_seq OWNER TO meet_user;

--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meet_user
--

ALTER SEQUENCE public.social_auth_usersocialauth_id_seq OWNED BY public.social_auth_usersocialauth.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: meet_user
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: meet_user
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: meet_user
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: core_activity id; Type: DEFAULT; Schema: public; Owner: meet_user
--

ALTER TABLE ONLY public.core_activity ALTER COLUMN id SET DEFAULT nextval('public.core_activity_id_seq'::regclass);


--
-- Name: core_event id; Type: DEFAULT; Schema: public; Owner: meet_user
--

ALTER TABLE ONLY public.core_event ALTER COLUMN id SET DEFAULT nextval('public.core_event_id_seq'::regclass);


--
-- Name: core_eventcategory id; Type: DEFAULT; Schema: public; Owner: meet_user
--

ALTER TABLE ONLY public.core_eventcategory ALTER COLUMN id SET DEFAULT nextval('public.core_eventcategory_id_seq'::regclass);


--
-- Name: core_meetuser id; Type: DEFAULT; Schema: public; Owner: meet_user
--

ALTER TABLE ONLY public.core_meetuser ALTER COLUMN id SET DEFAULT nextval('public.core_meetuser_id_seq'::regclass);


--
-- Name: core_meetuser_groups id; Type: DEFAULT; Schema: public; Owner: meet_user
--

ALTER TABLE ONLY public.core_meetuser_groups ALTER COLUMN id SET DEFAULT nextval('public.core_meetuser_groups_id_seq'::regclass);


--
-- Name: core_meetuser_user_permissions id; Type: DEFAULT; Schema: public; Owner: meet_user
--

ALTER TABLE ONLY public.core_meetuser_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.core_meetuser_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: meet_user
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: meet_user
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: meet_user
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: social_auth_association id; Type: DEFAULT; Schema: public; Owner: meet_user
--

ALTER TABLE ONLY public.social_auth_association ALTER COLUMN id SET DEFAULT nextval('public.social_auth_association_id_seq'::regclass);


--
-- Name: social_auth_code id; Type: DEFAULT; Schema: public; Owner: meet_user
--

ALTER TABLE ONLY public.social_auth_code ALTER COLUMN id SET DEFAULT nextval('public.social_auth_code_id_seq'::regclass);


--
-- Name: social_auth_nonce id; Type: DEFAULT; Schema: public; Owner: meet_user
--

ALTER TABLE ONLY public.social_auth_nonce ALTER COLUMN id SET DEFAULT nextval('public.social_auth_nonce_id_seq'::regclass);


--
-- Name: social_auth_partial id; Type: DEFAULT; Schema: public; Owner: meet_user
--

ALTER TABLE ONLY public.social_auth_partial ALTER COLUMN id SET DEFAULT nextval('public.social_auth_partial_id_seq'::regclass);


--
-- Name: social_auth_usersocialauth id; Type: DEFAULT; Schema: public; Owner: meet_user
--

ALTER TABLE ONLY public.social_auth_usersocialauth ALTER COLUMN id SET DEFAULT nextval('public.social_auth_usersocialauth_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: meet_user
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: meet_user
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: meet_user
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add Token	6	add_token
22	Can change Token	6	change_token
23	Can delete Token	6	delete_token
24	Can view Token	6	view_token
25	Can add association	7	add_association
26	Can change association	7	change_association
27	Can delete association	7	delete_association
28	Can view association	7	view_association
29	Can add code	8	add_code
30	Can change code	8	change_code
31	Can delete code	8	delete_code
32	Can view code	8	view_code
33	Can add nonce	9	add_nonce
34	Can change nonce	9	change_nonce
35	Can delete nonce	9	delete_nonce
36	Can view nonce	9	view_nonce
37	Can add user social auth	10	add_usersocialauth
38	Can change user social auth	10	change_usersocialauth
39	Can delete user social auth	10	delete_usersocialauth
40	Can view user social auth	10	view_usersocialauth
41	Can add partial	11	add_partial
42	Can change partial	11	change_partial
43	Can delete partial	11	delete_partial
44	Can view partial	11	view_partial
45	Can add Категория	12	add_eventcategory
46	Can change Категория	12	change_eventcategory
47	Can delete Категория	12	delete_eventcategory
48	Can view Категория	12	view_eventcategory
49	Can add Активность	13	add_activity
50	Can change Активность	13	change_activity
51	Can delete Активность	13	delete_activity
52	Can view Активность	13	view_activity
53	Can add Пользователь	14	add_meetuser
54	Can change Пользователь	14	change_meetuser
55	Can delete Пользователь	14	delete_meetuser
56	Can view Пользователь	14	view_meetuser
57	Can add Событие	15	add_event
58	Can change Событие	15	change_event
59	Can delete Событие	15	delete_event
60	Can view Событие	15	view_event
\.


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: meet_user
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
06822a553d4d5be5a62261dd36b402670f0af723	2019-11-07 20:22:11.13986+03	1
c6a12ec616cec67fad8683777562c150363a7c50	2019-11-08 12:01:07.043051+03	2
\.


--
-- Data for Name: core_activity; Type: TABLE DATA; Schema: public; Owner: meet_user
--

COPY public.core_activity (id, name, is_active, category_id, image) FROM stdin;
1	Флэшмоб	t	1	./activity/image/default_activity.jpg
2	nnnn	t	2	./activity/image/default_activity.jpg
3	trtrt	t	3	./activity/image/default_activity.jpg
4	Флэшмобwew	f	1	./activity/image/default_activity.jpg
5	Фwwww	t	2	./activity/image/default_activity.jpg
6	езда на влосипеде	t	1	./activity/image/default_activity.jpg
\.


--
-- Data for Name: core_event; Type: TABLE DATA; Schema: public; Owner: meet_user
--

COPY public.core_event (id, name, dt, is_active, category_id, image) FROM stdin;
1	Сабантуй	2019-11-05 18:54:57+03	t	1	./event/image/default_event.jpg
4	Новый год	2019-11-15 18:55:36+03	t	1	./event/image/default_event.jpg
6	сон	2019-11-05 18:56:04+03	t	2	./event/image/default_event.jpg
5	8марта	2020-03-08 18:55:49+03	f	1	./event/image/default_event.jpg
2	Завтра	2019-11-07 16:55:08+03	t	2	./event/image/default_event.jpg
7	Праздник	2019-11-11 20:33:16+03	t	2	./event/image/default_event.jpg
3	Вчера	2019-11-05 16:55:25+03	t	3	event/image/Selection_011.png
\.


--
-- Data for Name: core_eventcategory; Type: TABLE DATA; Schema: public; Owner: meet_user
--

COPY public.core_eventcategory (id, name) FROM stdin;
1	sport
2	relax
3	volonteer
4	other
\.


--
-- Data for Name: core_meetuser; Type: TABLE DATA; Schema: public; Owner: meet_user
--

COPY public.core_meetuser (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, sex, is_subscriber, avatar, symp_with, unsymp_with, liked_activities, liked_actual_events, liked_recent_events) FROM stdin;
7	wordpass	\N	f	ng_3				f	t	2019-11-06 20:14:06+03	empty	f	./user/logo/default.png	{}	{}	{}	{}	{}
5	wordpass	\N	f	ng_1				f	t	2019-11-06 20:13:30+03	empty	f	./user/logo/default.png	{}	{}	{}	{4,7,2}	{}
8	wordpass	\N	f	nt_1				f	t	2019-11-06 20:14:20+03	empty	f	./user/logo/default.png	{}	{}	{1,3}	{4}	{3,6,5}
4	wordpass	\N	f	pz_2				f	t	2019-11-06 20:13:07+03	empty	f	./user/logo/default.png	{1}	{}	{}	{}	{}
6	wordpass	\N	f	ng_2				f	t	2019-11-06 20:13:52+03	empty	f	./user/logo/default.png	{}	{1}	{}	{}	{}
10	wordpass	\N	f	nt_3				f	t	2019-11-06 20:15:01+03	empty	f	./user/logo/default.png	{}	{}	{2}	{}	{1,3,5,2}
11	pbkdf2_sha256$150000$4vWUPC1SlB5h$yCayYoXer1qiI2kPEeE2wJ3hqwCUGB0w9bujcxZEWDU=	2019-11-10 20:38:55.252759+03	t	admin			admin@meet.ru	t	t	2019-11-10 20:29:02.69809+03	empty	f	./user/logo/default.png	{}	{}	{}	{}	{}
9	wordpass	\N	f	nt_2				f	t	2019-11-06 20:14:39+03	empty	f	./user/logo/default.png	{}	{}	{1,3}	{4,7}	{3,6,2}
3	wordpass	\N	f	pz_1				f	t	2019-11-06 20:12:00+03	empty	f	./user/logo/default.png	{}	{}	{}	{}	{}
2	pbkdf2_sha256$150000$IxQhuFqfF6Ah$G5sd7rU8/PI3q0I8pCxm6D4PRR2Mk9m383LofUFAleQ=	2019-11-10 21:42:45.056327+03	f	string	string	string	sergstd@yandex.ru	f	t	2019-11-06 18:53:15.558418+03	empty	f	./user/logo/default.png	{}	{}	{1}	{}	{}
1	pbkdf2_sha256$150000$4SbTtG8ne6vf$wPXE3gdpgnlIrSwHcNOFe9DNwqUZlT4iHG37JNuHqBY=	2019-11-10 21:57:00.574958+03	t	meet2	string	string	22@22.ru	t	t	2019-11-06 18:52:12.455586+03	empty	f	./user/logo/default.png	{4,3}	{5,7,6}	{1,3}	{4,7}	{5,3,6}
\.


--
-- Data for Name: core_meetuser_groups; Type: TABLE DATA; Schema: public; Owner: meet_user
--

COPY public.core_meetuser_groups (id, meetuser_id, group_id) FROM stdin;
\.


--
-- Data for Name: core_meetuser_user_permissions; Type: TABLE DATA; Schema: public; Owner: meet_user
--

COPY public.core_meetuser_user_permissions (id, meetuser_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: meet_user
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2019-11-06 18:53:47.858504+03	1	sport	1	[{"added": {}}]	12	1
2	2019-11-06 18:53:54.675009+03	2	relax	1	[{"added": {}}]	12	1
3	2019-11-06 18:53:59.470517+03	3	volonteer	1	[{"added": {}}]	12	1
4	2019-11-06 18:54:08.515096+03	1	Activity object (1)	1	[{"added": {}}]	13	1
5	2019-11-06 18:54:18.670908+03	2	Activity object (2)	1	[{"added": {}}]	13	1
6	2019-11-06 18:54:27.242174+03	3	Activity object (3)	1	[{"added": {}}]	13	1
7	2019-11-06 18:54:34.246256+03	4	Activity object (4)	1	[{"added": {}}]	13	1
8	2019-11-06 18:54:45.269704+03	5	Activity object (5)	1	[{"added": {}}]	13	1
9	2019-11-06 18:55:03.836103+03	1	Event object (1)	1	[{"added": {}}]	15	1
10	2019-11-06 18:55:22.956711+03	2	Event object (2)	1	[{"added": {}}]	15	1
11	2019-11-06 18:55:34.922082+03	3	Event object (3)	1	[{"added": {}}]	15	1
12	2019-11-06 18:55:48.166696+03	4	Event object (4)	1	[{"added": {}}]	15	1
13	2019-11-06 18:56:02.383768+03	5	Event object (5)	1	[{"added": {}}]	15	1
14	2019-11-06 18:56:20.179402+03	6	Event object (6)	1	[{"added": {}}]	15	1
15	2019-11-06 20:03:44.953786+03	5	Activity object (5)	2	[{"changed": {"fields": ["is_active"]}}]	13	1
16	2019-11-06 20:03:51.124807+03	4	Activity object (4)	2	[{"changed": {"fields": ["is_active"]}}]	13	1
17	2019-11-06 20:07:25.457453+03	5	Event object (5)	2	[{"changed": {"fields": ["is_active"]}}]	15	1
18	2019-11-06 20:12:56.055369+03	3	pz_1	1	[{"added": {}}]	14	1
19	2019-11-06 20:13:27.392451+03	4	pz_2	1	[{"added": {}}]	14	1
20	2019-11-06 20:13:50.356407+03	5	ng_1	1	[{"added": {}}]	14	1
21	2019-11-06 20:14:02.680031+03	6	ng_2	1	[{"added": {}}]	14	1
22	2019-11-06 20:14:17.708754+03	7	ng_3	1	[{"added": {}}]	14	1
23	2019-11-06 20:14:34.89135+03	8	nt_1	1	[{"added": {}}]	14	1
24	2019-11-06 20:14:57.857708+03	9	nt_2	1	[{"added": {}}]	14	1
25	2019-11-06 20:15:10.131668+03	10	nt_3	1	[{"added": {}}]	14	1
26	2019-11-10 20:29:36.230215+03	4	other	1	[{"added": {}}]	12	11
27	2019-11-10 20:30:51.111806+03	6	Activity object (6)	1	[{"added": {}}]	13	11
28	2019-11-10 20:31:17.287179+03	6	Activity object (6)	2	[]	13	11
29	2019-11-10 20:32:35.86023+03	5	Activity object (5)	2	[{"changed": {"fields": ["is_active"]}}]	13	11
30	2019-11-10 20:33:18.697016+03	7	Event object (7)	1	[{"added": {}}]	15	11
31	2019-11-10 21:53:24.591417+03	6	Activity object (6)	2	[]	13	1
32	2019-11-10 21:54:27.956592+03	6	Activity object (6)	2	[]	13	1
33	2019-11-10 21:57:36.389408+03	3	Event object (3)	2	[{"changed": {"fields": ["image"]}}]	15	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: meet_user
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	authtoken	token
7	social_django	association
8	social_django	code
9	social_django	nonce
10	social_django	usersocialauth
11	social_django	partial
12	core	eventcategory
13	core	activity
14	core	meetuser
15	core	event
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: meet_user
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2019-11-06 18:51:48.527524+03
2	contenttypes	0002_remove_content_type_name	2019-11-06 18:51:48.576384+03
3	auth	0001_initial	2019-11-06 18:51:48.766872+03
4	auth	0002_alter_permission_name_max_length	2019-11-06 18:51:49.04136+03
5	auth	0003_alter_user_email_max_length	2019-11-06 18:51:49.07269+03
6	auth	0004_alter_user_username_opts	2019-11-06 18:51:49.094748+03
7	auth	0005_alter_user_last_login_null	2019-11-06 18:51:49.125716+03
8	auth	0006_require_contenttypes_0002	2019-11-06 18:51:49.145735+03
9	auth	0007_alter_validators_add_error_messages	2019-11-06 18:51:49.176964+03
10	auth	0008_alter_user_username_max_length	2019-11-06 18:51:49.205871+03
11	auth	0009_alter_user_last_name_max_length	2019-11-06 18:51:49.238775+03
12	auth	0010_alter_group_name_max_length	2019-11-06 18:51:49.275802+03
13	auth	0011_update_proxy_permissions	2019-11-06 18:51:49.305833+03
14	core	0001_initial	2019-11-06 18:51:49.766914+03
15	admin	0001_initial	2019-11-06 18:51:50.577374+03
16	admin	0002_logentry_remove_auto_add	2019-11-06 18:51:50.709068+03
17	admin	0003_logentry_add_action_flag_choices	2019-11-06 18:51:50.742665+03
18	authtoken	0001_initial	2019-11-06 18:51:50.853239+03
19	authtoken	0002_auto_20160226_1747	2019-11-06 18:51:50.977712+03
20	sessions	0001_initial	2019-11-06 18:51:51.087726+03
21	default	0001_initial	2019-11-06 18:51:51.598715+03
22	social_auth	0001_initial	2019-11-06 18:51:51.601641+03
23	default	0002_add_related_name	2019-11-06 18:51:51.769126+03
24	social_auth	0002_add_related_name	2019-11-06 18:51:51.770765+03
25	default	0003_alter_email_max_length	2019-11-06 18:51:51.795539+03
26	social_auth	0003_alter_email_max_length	2019-11-06 18:51:51.797794+03
27	default	0004_auto_20160423_0400	2019-11-06 18:51:51.839821+03
28	social_auth	0004_auto_20160423_0400	2019-11-06 18:51:51.843009+03
29	social_auth	0005_auto_20160727_2333	2019-11-06 18:51:51.900008+03
30	social_django	0006_partial	2019-11-06 18:51:52.007116+03
31	social_django	0007_code_timestamp	2019-11-06 18:51:52.112768+03
32	social_django	0008_partial_timestamp	2019-11-06 18:51:52.184983+03
33	social_django	0001_initial	2019-11-06 18:51:52.247244+03
34	social_django	0003_alter_email_max_length	2019-11-06 18:51:52.265598+03
35	social_django	0004_auto_20160423_0400	2019-11-06 18:51:52.289348+03
36	social_django	0002_add_related_name	2019-11-06 18:51:52.31219+03
37	social_django	0005_auto_20160727_2333	2019-11-06 18:51:52.335508+03
38	core	0002_auto_20191110_2142	2019-11-10 21:42:26.359248+03
39	core	0003_auto_20191110_2152	2019-11-10 21:53:00.037556+03
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: meet_user
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
l652sjn6vc8p4d167s03rhk7moznh9j9	NmEwYWM0YWViYmE4OGVhZTY5NWVjZWZkNjE0Y2YzOWJmOTc5Njc0NTp7ImZhY2Vib29rX3N0YXRlIjoiQldWUHJ5RnlDMzBibkg5UnAyZXBsaDFJUklOaGpYWWUifQ==	2019-11-24 20:36:59.934916+03
e9cabfd3yp8ts5f0dcuzo6xpj7iydxja	NGVlNmQwY2NhODdmZmY4Njc4ODAzMGRiMWJhNDk2ZDRkYTE2ZDRjYzp7ImZhY2Vib29rX3N0YXRlIjoiNmpVbkRKZ1BCS1cyUk1rMUhUbldRNWxHc3BDYVZXa2kifQ==	2019-11-21 17:41:28.072461+03
0d48ndde9moabwc9m3ed4ch797nsrbkx	N2VjYmYzMWFlNjRmNmMxNDQ3NWUzYTJhMWMxN2M1NzVjNjNjZmM2NDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyNzE3Yzg4MTNiNmZkNjc5MTAzODdjY2I0MDEwNjI5NWRlNTQxNTg0In0=	2019-11-24 21:43:00.319817+03
n8hx51zmb40p2ugxz4hd1x8kr37i4pwj	M2NkNWU1NzY4YmNhZDgzZDhiMGM5MGViZmQ1OTY3ZmYyNjExOWE5ODp7ImZhY2Vib29rX3N0YXRlIjoiS1M2YnRoUEl5b0RHaU5kYUxnTXMwMEE2Y21uZDJLRXUifQ==	2019-11-25 15:00:34.705491+03
\.


--
-- Data for Name: social_auth_association; Type: TABLE DATA; Schema: public; Owner: meet_user
--

COPY public.social_auth_association (id, server_url, handle, secret, issued, lifetime, assoc_type) FROM stdin;
\.


--
-- Data for Name: social_auth_code; Type: TABLE DATA; Schema: public; Owner: meet_user
--

COPY public.social_auth_code (id, email, code, verified, "timestamp") FROM stdin;
\.


--
-- Data for Name: social_auth_nonce; Type: TABLE DATA; Schema: public; Owner: meet_user
--

COPY public.social_auth_nonce (id, server_url, "timestamp", salt) FROM stdin;
\.


--
-- Data for Name: social_auth_partial; Type: TABLE DATA; Schema: public; Owner: meet_user
--

COPY public.social_auth_partial (id, token, next_step, backend, data, "timestamp") FROM stdin;
\.


--
-- Data for Name: social_auth_usersocialauth; Type: TABLE DATA; Schema: public; Owner: meet_user
--

COPY public.social_auth_usersocialauth (id, provider, uid, extra_data, user_id) FROM stdin;
1	facebook	100538538071220	{"id": "100538538071220", "name": "Сергей Бакин", "email": "sergstd@yandex.ru", "gender": null, "expires": 5179324, "picture": {"data": {"url": "https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=100538538071220&height=200&width=200&ext=1576003364&hash=AeR0SKgSJVmxznem", "width": 200, "height": 200, "is_silhouette": false}}, "birthday": null, "auth_time": 1573411364, "token_type": null, "profile_url": "https://www.facebook.com/app_scoped_user_id/YXNpZADpBWEViVWRTazVYcjI3VDh1djgtU0FRWTNvVGJ6SHZAlWU5VYVlnQVN0QkJZAeFZADVlVDY2s3N2FCUW44cTBiUUF1NUIzQXcxQmJJT3ZAVdXZALQWJHSzRGa29UNVZAfM1NleHYzZAk9udWtEcG82a1Jwa24w/", "access_token": "EAAGN2LlwB70BAI8fLnbOcfM1ZAZA2ZB4pg8BOu8ZBSMZB8TzpZBZANonZCe1b7F6ueI6n08rZBbziJungZCfEvBMIMGZAkqf8C9iEwkqtRZCykKTxemZBF7foQqMJen0bZAzaygWlICbbWvqybZCLoZBWljFogKcrkn2xuMU6pYIpfS3K4ILTD0Jj3IaLW1r", "denied_scopes": null, "granted_scopes": ["user_link", "email", "public_profile"]}	2
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: meet_user
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: meet_user
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: meet_user
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 60, true);


--
-- Name: core_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: meet_user
--

SELECT pg_catalog.setval('public.core_activity_id_seq', 6, true);


--
-- Name: core_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: meet_user
--

SELECT pg_catalog.setval('public.core_event_id_seq', 7, true);


--
-- Name: core_eventcategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: meet_user
--

SELECT pg_catalog.setval('public.core_eventcategory_id_seq', 4, true);


--
-- Name: core_meetuser_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: meet_user
--

SELECT pg_catalog.setval('public.core_meetuser_groups_id_seq', 1, false);


--
-- Name: core_meetuser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: meet_user
--

SELECT pg_catalog.setval('public.core_meetuser_id_seq', 11, true);


--
-- Name: core_meetuser_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: meet_user
--

SELECT pg_catalog.setval('public.core_meetuser_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: meet_user
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 33, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: meet_user
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 15, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: meet_user
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 39, true);


--
-- Name: social_auth_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: meet_user
--

SELECT pg_catalog.setval('public.social_auth_association_id_seq', 1, false);


--
-- Name: social_auth_code_id_seq; Type: SEQUENCE SET; Schema: public; Owner: meet_user
--

SELECT pg_catalog.setval('public.social_auth_code_id_seq', 1, false);


--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE SET; Schema: public; Owner: meet_user
--

SELECT pg_catalog.setval('public.social_auth_nonce_id_seq', 1, false);


--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: meet_user
--

SELECT pg_catalog.setval('public.social_auth_partial_id_seq', 1, false);


--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: meet_user
--

SELECT pg_catalog.setval('public.social_auth_usersocialauth_id_seq', 1, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: meet_user
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: meet_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: meet_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: meet_user
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: meet_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: meet_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: meet_user
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: meet_user
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: core_activity core_activity_name_key; Type: CONSTRAINT; Schema: public; Owner: meet_user
--

ALTER TABLE ONLY public.core_activity
    ADD CONSTRAINT core_activity_name_key UNIQUE (name);


--
-- Name: core_activity core_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: meet_user
--

ALTER TABLE ONLY public.core_activity
    ADD CONSTRAINT core_activity_pkey PRIMARY KEY (id);


--
-- Name: core_event core_event_name_dt_c30ab317_uniq; Type: CONSTRAINT; Schema: public; Owner: meet_user
--

ALTER TABLE ONLY public.core_event
    ADD CONSTRAINT core_event_name_dt_c30ab317_uniq UNIQUE (name, dt);


--
-- Name: core_event core_event_pkey; Type: CONSTRAINT; Schema: public; Owner: meet_user
--

ALTER TABLE ONLY public.core_event
    ADD CONSTRAINT core_event_pkey PRIMARY KEY (id);


--
-- Name: core_eventcategory core_eventcategory_name_key; Type: CONSTRAINT; Schema: public; Owner: meet_user
--

ALTER TABLE ONLY public.core_eventcategory
    ADD CONSTRAINT core_eventcategory_name_key UNIQUE (name);


--
-- Name: core_eventcategory core_eventcategory_pkey; Type: CONSTRAINT; Schema: public; Owner: meet_user
--

ALTER TABLE ONLY public.core_eventcategory
    ADD CONSTRAINT core_eventcategory_pkey PRIMARY KEY (id);


--
-- Name: core_meetuser_groups core_meetuser_groups_meetuser_id_group_id_e4f9f5c7_uniq; Type: CONSTRAINT; Schema: public; Owner: meet_user
--

ALTER TABLE ONLY public.core_meetuser_groups
    ADD CONSTRAINT core_meetuser_groups_meetuser_id_group_id_e4f9f5c7_uniq UNIQUE (meetuser_id, group_id);


--
-- Name: core_meetuser_groups core_meetuser_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: meet_user
--

ALTER TABLE ONLY public.core_meetuser_groups
    ADD CONSTRAINT core_meetuser_groups_pkey PRIMARY KEY (id);


--
-- Name: core_meetuser core_meetuser_pkey; Type: CONSTRAINT; Schema: public; Owner: meet_user
--

ALTER TABLE ONLY public.core_meetuser
    ADD CONSTRAINT core_meetuser_pkey PRIMARY KEY (id);


--
-- Name: core_meetuser_user_permissions core_meetuser_user_permi_meetuser_id_permission_i_b9e42a0b_uniq; Type: CONSTRAINT; Schema: public; Owner: meet_user
--

ALTER TABLE ONLY public.core_meetuser_user_permissions
    ADD CONSTRAINT core_meetuser_user_permi_meetuser_id_permission_i_b9e42a0b_uniq UNIQUE (meetuser_id, permission_id);


--
-- Name: core_meetuser_user_permissions core_meetuser_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: meet_user
--

ALTER TABLE ONLY public.core_meetuser_user_permissions
    ADD CONSTRAINT core_meetuser_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: core_meetuser core_meetuser_username_key; Type: CONSTRAINT; Schema: public; Owner: meet_user
--

ALTER TABLE ONLY public.core_meetuser
    ADD CONSTRAINT core_meetuser_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: meet_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: meet_user
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: meet_user
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: meet_user
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: meet_user
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: social_auth_association social_auth_association_pkey; Type: CONSTRAINT; Schema: public; Owner: meet_user
--

ALTER TABLE ONLY public.social_auth_association
    ADD CONSTRAINT social_auth_association_pkey PRIMARY KEY (id);


--
-- Name: social_auth_association social_auth_association_server_url_handle_078befa2_uniq; Type: CONSTRAINT; Schema: public; Owner: meet_user
--

ALTER TABLE ONLY public.social_auth_association
    ADD CONSTRAINT social_auth_association_server_url_handle_078befa2_uniq UNIQUE (server_url, handle);


--
-- Name: social_auth_code social_auth_code_email_code_801b2d02_uniq; Type: CONSTRAINT; Schema: public; Owner: meet_user
--

ALTER TABLE ONLY public.social_auth_code
    ADD CONSTRAINT social_auth_code_email_code_801b2d02_uniq UNIQUE (email, code);


--
-- Name: social_auth_code social_auth_code_pkey; Type: CONSTRAINT; Schema: public; Owner: meet_user
--

ALTER TABLE ONLY public.social_auth_code
    ADD CONSTRAINT social_auth_code_pkey PRIMARY KEY (id);


--
-- Name: social_auth_nonce social_auth_nonce_pkey; Type: CONSTRAINT; Schema: public; Owner: meet_user
--

ALTER TABLE ONLY public.social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_pkey PRIMARY KEY (id);


--
-- Name: social_auth_nonce social_auth_nonce_server_url_timestamp_salt_f6284463_uniq; Type: CONSTRAINT; Schema: public; Owner: meet_user
--

ALTER TABLE ONLY public.social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_server_url_timestamp_salt_f6284463_uniq UNIQUE (server_url, "timestamp", salt);


--
-- Name: social_auth_partial social_auth_partial_pkey; Type: CONSTRAINT; Schema: public; Owner: meet_user
--

ALTER TABLE ONLY public.social_auth_partial
    ADD CONSTRAINT social_auth_partial_pkey PRIMARY KEY (id);


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_pkey; Type: CONSTRAINT; Schema: public; Owner: meet_user
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_pkey PRIMARY KEY (id);


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_provider_uid_e6b5e668_uniq; Type: CONSTRAINT; Schema: public; Owner: meet_user
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_provider_uid_e6b5e668_uniq UNIQUE (provider, uid);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: meet_user
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: meet_user
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: meet_user
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: meet_user
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: meet_user
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: core_activity_category_id_a204b47c; Type: INDEX; Schema: public; Owner: meet_user
--

CREATE INDEX core_activity_category_id_a204b47c ON public.core_activity USING btree (category_id);


--
-- Name: core_activity_is_active_d41c1be5; Type: INDEX; Schema: public; Owner: meet_user
--

CREATE INDEX core_activity_is_active_d41c1be5 ON public.core_activity USING btree (is_active);


--
-- Name: core_activity_name_2d7d30e2_like; Type: INDEX; Schema: public; Owner: meet_user
--

CREATE INDEX core_activity_name_2d7d30e2_like ON public.core_activity USING btree (name varchar_pattern_ops);


--
-- Name: core_event_category_id_16086cb1; Type: INDEX; Schema: public; Owner: meet_user
--

CREATE INDEX core_event_category_id_16086cb1 ON public.core_event USING btree (category_id);


--
-- Name: core_event_is_active_a1158539; Type: INDEX; Schema: public; Owner: meet_user
--

CREATE INDEX core_event_is_active_a1158539 ON public.core_event USING btree (is_active);


--
-- Name: core_eventcategory_name_eed424d2_like; Type: INDEX; Schema: public; Owner: meet_user
--

CREATE INDEX core_eventcategory_name_eed424d2_like ON public.core_eventcategory USING btree (name varchar_pattern_ops);


--
-- Name: core_meetuser_groups_group_id_afee96ae; Type: INDEX; Schema: public; Owner: meet_user
--

CREATE INDEX core_meetuser_groups_group_id_afee96ae ON public.core_meetuser_groups USING btree (group_id);


--
-- Name: core_meetuser_groups_meetuser_id_ab9afcb2; Type: INDEX; Schema: public; Owner: meet_user
--

CREATE INDEX core_meetuser_groups_meetuser_id_ab9afcb2 ON public.core_meetuser_groups USING btree (meetuser_id);


--
-- Name: core_meetuser_user_permissions_meetuser_id_c42fca9b; Type: INDEX; Schema: public; Owner: meet_user
--

CREATE INDEX core_meetuser_user_permissions_meetuser_id_c42fca9b ON public.core_meetuser_user_permissions USING btree (meetuser_id);


--
-- Name: core_meetuser_user_permissions_permission_id_dddf4648; Type: INDEX; Schema: public; Owner: meet_user
--

CREATE INDEX core_meetuser_user_permissions_permission_id_dddf4648 ON public.core_meetuser_user_permissions USING btree (permission_id);


--
-- Name: core_meetuser_username_95eb3e41_like; Type: INDEX; Schema: public; Owner: meet_user
--

CREATE INDEX core_meetuser_username_95eb3e41_like ON public.core_meetuser USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: meet_user
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: meet_user
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: meet_user
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: meet_user
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: social_auth_code_code_a2393167; Type: INDEX; Schema: public; Owner: meet_user
--

CREATE INDEX social_auth_code_code_a2393167 ON public.social_auth_code USING btree (code);


--
-- Name: social_auth_code_code_a2393167_like; Type: INDEX; Schema: public; Owner: meet_user
--

CREATE INDEX social_auth_code_code_a2393167_like ON public.social_auth_code USING btree (code varchar_pattern_ops);


--
-- Name: social_auth_code_timestamp_176b341f; Type: INDEX; Schema: public; Owner: meet_user
--

CREATE INDEX social_auth_code_timestamp_176b341f ON public.social_auth_code USING btree ("timestamp");


--
-- Name: social_auth_partial_timestamp_50f2119f; Type: INDEX; Schema: public; Owner: meet_user
--

CREATE INDEX social_auth_partial_timestamp_50f2119f ON public.social_auth_partial USING btree ("timestamp");


--
-- Name: social_auth_partial_token_3017fea3; Type: INDEX; Schema: public; Owner: meet_user
--

CREATE INDEX social_auth_partial_token_3017fea3 ON public.social_auth_partial USING btree (token);


--
-- Name: social_auth_partial_token_3017fea3_like; Type: INDEX; Schema: public; Owner: meet_user
--

CREATE INDEX social_auth_partial_token_3017fea3_like ON public.social_auth_partial USING btree (token varchar_pattern_ops);


--
-- Name: social_auth_usersocialauth_user_id_17d28448; Type: INDEX; Schema: public; Owner: meet_user
--

CREATE INDEX social_auth_usersocialauth_user_id_17d28448 ON public.social_auth_usersocialauth USING btree (user_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: meet_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: meet_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: meet_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_core_meetuser_id; Type: FK CONSTRAINT; Schema: public; Owner: meet_user
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_core_meetuser_id FOREIGN KEY (user_id) REFERENCES public.core_meetuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_activity core_activity_category_id_a204b47c_fk_core_eventcategory_id; Type: FK CONSTRAINT; Schema: public; Owner: meet_user
--

ALTER TABLE ONLY public.core_activity
    ADD CONSTRAINT core_activity_category_id_a204b47c_fk_core_eventcategory_id FOREIGN KEY (category_id) REFERENCES public.core_eventcategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_event core_event_category_id_16086cb1_fk_core_eventcategory_id; Type: FK CONSTRAINT; Schema: public; Owner: meet_user
--

ALTER TABLE ONLY public.core_event
    ADD CONSTRAINT core_event_category_id_16086cb1_fk_core_eventcategory_id FOREIGN KEY (category_id) REFERENCES public.core_eventcategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_meetuser_groups core_meetuser_groups_group_id_afee96ae_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: meet_user
--

ALTER TABLE ONLY public.core_meetuser_groups
    ADD CONSTRAINT core_meetuser_groups_group_id_afee96ae_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_meetuser_groups core_meetuser_groups_meetuser_id_ab9afcb2_fk_core_meetuser_id; Type: FK CONSTRAINT; Schema: public; Owner: meet_user
--

ALTER TABLE ONLY public.core_meetuser_groups
    ADD CONSTRAINT core_meetuser_groups_meetuser_id_ab9afcb2_fk_core_meetuser_id FOREIGN KEY (meetuser_id) REFERENCES public.core_meetuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_meetuser_user_permissions core_meetuser_user_p_meetuser_id_c42fca9b_fk_core_meet; Type: FK CONSTRAINT; Schema: public; Owner: meet_user
--

ALTER TABLE ONLY public.core_meetuser_user_permissions
    ADD CONSTRAINT core_meetuser_user_p_meetuser_id_c42fca9b_fk_core_meet FOREIGN KEY (meetuser_id) REFERENCES public.core_meetuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_meetuser_user_permissions core_meetuser_user_p_permission_id_dddf4648_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: meet_user
--

ALTER TABLE ONLY public.core_meetuser_user_permissions
    ADD CONSTRAINT core_meetuser_user_p_permission_id_dddf4648_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: meet_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_core_meetuser_id; Type: FK CONSTRAINT; Schema: public; Owner: meet_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_core_meetuser_id FOREIGN KEY (user_id) REFERENCES public.core_meetuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_user_id_17d28448_fk_core_meetuser_id; Type: FK CONSTRAINT; Schema: public; Owner: meet_user
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_user_id_17d28448_fk_core_meetuser_id FOREIGN KEY (user_id) REFERENCES public.core_meetuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

