--
-- PostgreSQL database dump
--

-- Dumped from database version 15.14
-- Dumped by pg_dump version 16.0

-- Started on 2026-03-09 10:26:51 EDT

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
-- TOC entry 7 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

-- *not* creating schema, since initdb creates it


--
-- TOC entry 2 (class 3079 OID 336009)
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA public;


--
-- TOC entry 4582 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


--
-- TOC entry 3 (class 3079 OID 336040)
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- TOC entry 4583 (class 0 OID 0)
-- Dependencies: 3
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 220 (class 1259 OID 336051)
-- Name: alter_moods; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.alter_moods (
    alt_id uuid NOT NULL,
    "timestamp" timestamp with time zone,
    mood bigint,
    reason text,
    intensity smallint DEFAULT 1
);


--
-- TOC entry 221 (class 1259 OID 336063)
-- Name: alters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.alters (
    alt_id uuid DEFAULT gen_random_uuid() NOT NULL,
    sys_id uuid,
    name text,
    triggers_pos text,
    triggers_neg text,
    age bigint DEFAULT 0,
    likes text,
    dislikes text,
    job text,
    safe_place text,
    wants text,
    acc text,
    notes text,
    "type-OLD" bigint,
    img_url text DEFAULT 'aHR0cHM6Ly93d3cud3JpdGVsaWdodGhvdXNlLmNvbS9pbWcvYXZhdGFyLWRlZmF1bHQuanBn'::text,
    type text,
    pronouns text,
    agetext text,
    birthday text,
    first_noted text,
    gender text,
    sexuality text,
    source text,
    fronttells text,
    relationships text,
    is_archived boolean DEFAULT false NOT NULL,
    hobbies text,
    appearance text,
    img_blob bytea,
    blob_mimetype text,
    colour text DEFAULT '#000000'::text,
    outline_enabled boolean DEFAULT false NOT NULL,
    outline text DEFAULT '#000000'::text NOT NULL,
    sig text,
    species text,
    nickname text,
    sp_id text,
    pk_id character varying,
    subsys_id1 text,
    subsys_id2 text,
    subsys_id3 text,
    subsys_id4 text,
    subsys_id5 text,
    header_blob bytea,
    header_mimetype text,
    colour_enabled boolean DEFAULT false
);


--
-- TOC entry 4584 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN alters.triggers_pos; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.alters.triggers_pos IS 'Positive triggers for this alter.';


--
-- TOC entry 4585 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN alters.triggers_neg; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.alters.triggers_neg IS 'Negative Triggers';


--
-- TOC entry 4586 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN alters.job; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.alters.job IS 'Role, Internal Job, etc.';


--
-- TOC entry 4587 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN alters.safe_place; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.alters.safe_place IS 'Where this alter feels safest';


--
-- TOC entry 4588 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN alters.wants; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.alters.wants IS 'Wants & Wishes';


--
-- TOC entry 4589 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN alters.acc; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.alters.acc IS 'Accommodations this alter needs from the system';


--
-- TOC entry 4590 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN alters.notes; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.alters.notes IS 'Other information';


--
-- TOC entry 4591 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN alters."type-OLD"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.alters."type-OLD" IS 'human, non-human, creature, introject, etc. Use numbers to expand on this later?';


--
-- TOC entry 4592 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN alters.img_url; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.alters.img_url IS 'Until I can figure out image uploading.';


--
-- TOC entry 4593 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN alters.pronouns; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.alters.pronouns IS 'What pronouns does this alter use?';


--
-- TOC entry 4594 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN alters.birthday; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.alters.birthday IS 'Not a time stamp so things can be general';


--
-- TOC entry 4595 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN alters.first_noted; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.alters.first_noted IS 'When this alter was first spotted';


--
-- TOC entry 4596 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN alters.source; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.alters.source IS 'Source, if introject';


--
-- TOC entry 4597 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN alters.fronttells; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.alters.fronttells IS 'How can one tell when this alter is out?';


--
-- TOC entry 4598 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN alters.relationships; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.alters.relationships IS 'Their relations to other alters.';


--
-- TOC entry 222 (class 1259 OID 336089)
-- Name: bda_plans; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bda_plans (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    u_id uuid NOT NULL,
    before text,
    during text,
    after text,
    is_active boolean DEFAULT true NOT NULL,
    alias text,
    "timestamp" timestamp with time zone
);


--
-- TOC entry 223 (class 1259 OID 336103)
-- Name: blacklisted_emails; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.blacklisted_emails (
    email text NOT NULL
);


--
-- TOC entry 4599 (class 0 OID 0)
-- Dependencies: 223
-- Name: TABLE blacklisted_emails; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.blacklisted_emails IS 'These are emails that have requested to not be on Lighthouse.';


--
-- TOC entry 224 (class 1259 OID 336113)
-- Name: categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.categories (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    u_id uuid NOT NULL,
    name text,
    description text,
    icon text,
    last_post_id uuid,
    last_post_date date,
    last_post_alt uuid,
    created_on timestamp with time zone DEFAULT now() NOT NULL,
    f_order bigint DEFAULT 1 NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 336129)
-- Name: changelog; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.changelog (
    log_id bigint NOT NULL,
    date date DEFAULT now() NOT NULL,
    title character varying(128),
    body text
);


--
-- TOC entry 226 (class 1259 OID 336142)
-- Name: changelog_log_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.changelog_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4600 (class 0 OID 0)
-- Dependencies: 226
-- Name: changelog_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.changelog_log_id_seq OWNED BY public.changelog.log_id;


--
-- TOC entry 227 (class 1259 OID 336143)
-- Name: comm_posts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.comm_posts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    u_id uuid,
    created_on timestamp without time zone DEFAULT now(),
    title text,
    body text,
    is_pinned boolean DEFAULT false NOT NULL,
    system_id text,
    feeling text
);


--
-- TOC entry 228 (class 1259 OID 336159)
-- Name: donators; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.donators (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    nickname text DEFAULT 'Anonymous Donor'::text
);


--
-- TOC entry 4601 (class 0 OID 0)
-- Dependencies: 228
-- Name: TABLE donators; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.donators IS 'For the homepage';


--
-- TOC entry 229 (class 1259 OID 336173)
-- Name: forums; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.forums (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    u_id uuid,
    topic text,
    description text,
    cat_id uuid,
    f_order bigint DEFAULT 1 NOT NULL
);


--
-- TOC entry 230 (class 1259 OID 336187)
-- Name: glossary; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.glossary (
    id bigint NOT NULL,
    term text,
    definition text,
    start_letter character varying(1),
    essential boolean DEFAULT false NOT NULL,
    type text,
    linkalias text
);


--
-- TOC entry 4602 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN glossary.start_letter; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.glossary.start_letter IS 'First letter of term';


--
-- TOC entry 4603 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN glossary.essential; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.glossary.essential IS 'Is this a term that NEEDS to be known to understand the rest of the glossary? (Default: no)';


--
-- TOC entry 4604 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN glossary.type; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.glossary.type IS 'n= noun. v= verb. adj= adjective. adv= adverb, etc.';


--
-- TOC entry 231 (class 1259 OID 336200)
-- Name: glossary_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.glossary_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4605 (class 0 OID 0)
-- Dependencies: 231
-- Name: glossary_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.glossary_id_seq OWNED BY public.glossary.id;


--
-- TOC entry 232 (class 1259 OID 336201)
-- Name: inner_worlds; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.inner_worlds (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    u_id uuid,
    key text,
    value text
);


--
-- TOC entry 233 (class 1259 OID 336213)
-- Name: journal_skins; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.journal_skins (
    uu_id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    filename bigint,
    name text,
    "group" bigint DEFAULT 2,
    ext text DEFAULT 'png'::text
);


--
-- TOC entry 234 (class 1259 OID 336229)
-- Name: journals; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.journals (
    j_id uuid DEFAULT gen_random_uuid() NOT NULL,
    alt_id uuid,
    is_private boolean,
    password text,
    skin text DEFAULT '1'::text,
    sys_id uuid,
    skin_blob bytea,
    skin_mimetype text,
    img_url text,
    is_pixelart boolean DEFAULT false
);


--
-- TOC entry 235 (class 1259 OID 336245)
-- Name: posts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.posts (
    p_id uuid DEFAULT gen_random_uuid() NOT NULL,
    j_id uuid,
    created_on timestamp without time zone,
    title text,
    body text,
    is_pinned boolean DEFAULT false NOT NULL,
    feeling text
);


--
-- TOC entry 236 (class 1259 OID 336259)
-- Name: safetyplans; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.safetyplans (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    u_id uuid,
    symptoms text,
    safepeople text,
    distractions text,
    keepsafe text,
    gethelp text,
    grounding text
);


--
-- TOC entry 4606 (class 0 OID 0)
-- Dependencies: 236
-- Name: TABLE safetyplans; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.safetyplans IS 'ENCRYPT **EVERYTHING**!! Extremely sensitive information!!';


--
-- TOC entry 237 (class 1259 OID 336271)
-- Name: session; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.session (
    sid character varying NOT NULL,
    sess json NOT NULL,
    expire timestamp without time zone NOT NULL
);


--
-- TOC entry 238 (class 1259 OID 336281)
-- Name: skin_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.skin_groups (
    u_id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    groupnum bigint NOT NULL,
    groupname text
);


--
-- TOC entry 239 (class 1259 OID 336294)
-- Name: skin_groups_groupnum_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.skin_groups_groupnum_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4607 (class 0 OID 0)
-- Dependencies: 239
-- Name: skin_groups_groupnum_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.skin_groups_groupnum_seq OWNED BY public.skin_groups.groupnum;


--
-- TOC entry 240 (class 1259 OID 336295)
-- Name: sys_rules; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sys_rules (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    u_id uuid,
    rule text,
    created timestamp without time zone DEFAULT now() NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 336309)
-- Name: systems; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.systems (
    sys_id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid,
    sys_alias text DEFAULT 'VW50aXRsZWQ='::text,
    icon text,
    subsys_id text,
    description text
);


--
-- TOC entry 4608 (class 0 OID 0)
-- Dependencies: 241
-- Name: COLUMN systems.icon; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.systems.icon IS 'No encryption needed; nothing sensitive stored here.';


--
-- TOC entry 242 (class 1259 OID 336323)
-- Name: thread_posts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thread_posts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    alt_id uuid,
    body text,
    created_on timestamp with time zone DEFAULT now(),
    thread_id uuid NOT NULL
);


--
-- TOC entry 243 (class 1259 OID 336337)
-- Name: threads; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.threads (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    u_id uuid NOT NULL,
    alt_id uuid,
    topic_id uuid NOT NULL,
    title text,
    body text,
    created_on timestamp without time zone DEFAULT now() NOT NULL,
    is_sticky boolean DEFAULT false NOT NULL,
    is_locked boolean DEFAULT false NOT NULL,
    is_popular boolean DEFAULT false NOT NULL
);


--
-- TOC entry 244 (class 1259 OID 336357)
-- Name: tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tokens (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    u_id uuid,
    read boolean DEFAULT true NOT NULL,
    write boolean DEFAULT false NOT NULL,
    name text,
    alters boolean DEFAULT false NOT NULL,
    systems boolean DEFAULT false NOT NULL,
    journals boolean DEFAULT false NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 336379)
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    username text,
    email text,
    pass text,
    email_link text,
    is_active boolean DEFAULT false,
    email_pin text,
    alter_term text DEFAULT 'alter'::text NOT NULL,
    system_term text DEFAULT 'system'::text NOT NULL,
    verified boolean DEFAULT false NOT NULL,
    is_legacy boolean DEFAULT false NOT NULL,
    skin text DEFAULT 'lighthouse'::text NOT NULL,
    subsystem_term text DEFAULT 'subsystem'::text,
    inner_worlds boolean DEFAULT true NOT NULL,
    innerworld_term text DEFAULT 'inner world'::text NOT NULL,
    plural_term text DEFAULT 'plural'::text NOT NULL,
    token text DEFAULT substr((gen_random_uuid())::text, 3, 16) NOT NULL,
    language text DEFAULT 'en'::text NOT NULL,
    textsize double precision DEFAULT 1,
    worksheets_enabled boolean DEFAULT true NOT NULL,
    font text DEFAULT 'Lexend'::text NOT NULL,
    sp_id text,
    pk_id text,
    sp_tok text,
    pk_token text,
    glossary_enabled boolean DEFAULT false NOT NULL,
    altupnum bigint DEFAULT 15,
    jwt uuid DEFAULT gen_random_uuid(),
    expires timestamp with time zone DEFAULT (now() + '14 days'::interval),
    notes text,
    salt text,
    new_user boolean DEFAULT false
);


--
-- TOC entry 4609 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN users.is_legacy; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.users.is_legacy IS 'Were they among the first 100 members?';


--
-- TOC entry 4610 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN users.skin; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.users.skin IS 'which skin are they using?';


--
-- TOC entry 4611 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN users.token; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.users.token IS 'Lighthouse Token. This should be read-only permissions.';


--
-- TOC entry 4612 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN users.language; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.users.language IS 'The language the user uses.';


--
-- TOC entry 4613 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN users.sp_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.users.sp_id IS 'Simply Plural ID';


--
-- TOC entry 4614 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN users.pk_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.users.pk_id IS 'Pluralkit ID';


--
-- TOC entry 4615 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN users.sp_tok; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.users.sp_tok IS 'Simply Plural Token';


--
-- TOC entry 4616 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN users.pk_token; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.users.pk_token IS 'Pluralkit Token';


--
-- TOC entry 4617 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN users.notes; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.users.notes IS 'Just notes';


--
-- TOC entry 4618 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN users.new_user; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.users.new_user IS 'Are they new here?';


--
-- TOC entry 246 (class 1259 OID 336429)
-- Name: wishlist; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wishlist (
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL,
    wish text NOT NULL,
    is_filled boolean DEFAULT false NOT NULL
);


--
-- TOC entry 4282 (class 2604 OID 336443)
-- Name: changelog log_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.changelog ALTER COLUMN log_id SET DEFAULT nextval('public.changelog_log_id_seq'::regclass);


--
-- TOC entry 4291 (class 2604 OID 336445)
-- Name: glossary id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.glossary ALTER COLUMN id SET DEFAULT nextval('public.glossary_id_seq'::regclass);


--
-- TOC entry 4304 (class 2604 OID 336447)
-- Name: skin_groups groupnum; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.skin_groups ALTER COLUMN groupnum SET DEFAULT nextval('public.skin_groups_groupnum_seq'::regclass);


--
-- TOC entry 4346 (class 2606 OID 344245)
-- Name: alter_moods alter_moods_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alter_moods
    ADD CONSTRAINT alter_moods_pkey PRIMARY KEY (alt_id);


--
-- TOC entry 4348 (class 2606 OID 385494)
-- Name: alters alters_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alters
    ADD CONSTRAINT alters_pkey PRIMARY KEY (alt_id);


--
-- TOC entry 4350 (class 2606 OID 344351)
-- Name: bda_plans bda_plans_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bda_plans
    ADD CONSTRAINT bda_plans_pkey PRIMARY KEY (id);


--
-- TOC entry 4352 (class 2606 OID 344287)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- TOC entry 4354 (class 2606 OID 344321)
-- Name: changelog changelog_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.changelog
    ADD CONSTRAINT changelog_pkey PRIMARY KEY (log_id);


--
-- TOC entry 4356 (class 2606 OID 342081)
-- Name: comm_posts comm_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comm_posts
    ADD CONSTRAINT comm_posts_pkey PRIMARY KEY (id);


--
-- TOC entry 4358 (class 2606 OID 344497)
-- Name: donators donators_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.donators
    ADD CONSTRAINT donators_pkey PRIMARY KEY (id);


--
-- TOC entry 4360 (class 2606 OID 344150)
-- Name: forums forums_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.forums
    ADD CONSTRAINT forums_pkey PRIMARY KEY (id);


--
-- TOC entry 4362 (class 2606 OID 344452)
-- Name: glossary glossary_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.glossary
    ADD CONSTRAINT glossary_pkey PRIMARY KEY (id);


--
-- TOC entry 4378 (class 2606 OID 341260)
-- Name: thread_posts id; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thread_posts
    ADD CONSTRAINT id PRIMARY KEY (id);


--
-- TOC entry 4364 (class 2606 OID 344505)
-- Name: journal_skins journal_skins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.journal_skins
    ADD CONSTRAINT journal_skins_pkey PRIMARY KEY (uu_id);


--
-- TOC entry 4366 (class 2606 OID 345275)
-- Name: journals journals_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.journals
    ADD CONSTRAINT journals_pkey PRIMARY KEY (j_id);


--
-- TOC entry 4368 (class 2606 OID 344116)
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (p_id);


--
-- TOC entry 4370 (class 2606 OID 344259)
-- Name: safetyplans safetyplans_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.safetyplans
    ADD CONSTRAINT safetyplans_pkey PRIMARY KEY (id);


--
-- TOC entry 4372 (class 2606 OID 344541)
-- Name: session session_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT session_pkey PRIMARY KEY (sid);


--
-- TOC entry 4374 (class 2606 OID 344528)
-- Name: skin_groups skin_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.skin_groups
    ADD CONSTRAINT skin_groups_pkey PRIMARY KEY (u_id);


--
-- TOC entry 4376 (class 2606 OID 344203)
-- Name: systems systems_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.systems
    ADD CONSTRAINT systems_pkey PRIMARY KEY (sys_id);


--
-- TOC entry 4382 (class 2606 OID 344418)
-- Name: tokens tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 4380 (class 2606 OID 344068)
-- Name: threads unique_id; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.threads
    ADD CONSTRAINT unique_id PRIMARY KEY (id);


--
-- TOC entry 4384 (class 2606 OID 342863)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4386 (class 2606 OID 344369)
-- Name: wishlist wishlist_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT wishlist_pkey PRIMARY KEY (uuid);


--
-- TOC entry 4401 (class 2606 OID 385495)
-- Name: threads alter; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.threads
    ADD CONSTRAINT alter FOREIGN KEY (alt_id) REFERENCES public.alters(alt_id) ON DELETE CASCADE;


--
-- TOC entry 4392 (class 2606 OID 385505)
-- Name: forums cat_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.forums
    ADD CONSTRAINT cat_id FOREIGN KEY (cat_id) REFERENCES public.categories(id) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4388 (class 2606 OID 385515)
-- Name: alters fk_alter; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alters
    ADD CONSTRAINT fk_alter FOREIGN KEY (sys_id) REFERENCES public.systems(sys_id) ON DELETE CASCADE;


--
-- TOC entry 4395 (class 2606 OID 385525)
-- Name: journals fk_journal; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.journals
    ADD CONSTRAINT fk_journal FOREIGN KEY (alt_id) REFERENCES public.alters(alt_id) ON DELETE CASCADE;


--
-- TOC entry 4396 (class 2606 OID 385535)
-- Name: posts fk_op; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT fk_op FOREIGN KEY (j_id) REFERENCES public.journals(j_id) ON DELETE CASCADE;


--
-- TOC entry 4399 (class 2606 OID 385545)
-- Name: systems fk_user; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.systems
    ADD CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4387 (class 2606 OID 385555)
-- Name: alter_moods mood; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alter_moods
    ADD CONSTRAINT mood FOREIGN KEY (alt_id) REFERENCES public.alters(alt_id) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4400 (class 2606 OID 385565)
-- Name: thread_posts thread_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thread_posts
    ADD CONSTRAINT thread_id FOREIGN KEY (thread_id) REFERENCES public.threads(id) ON DELETE CASCADE;


--
-- TOC entry 4404 (class 2606 OID 385575)
-- Name: tokens token_users; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT token_users FOREIGN KEY (u_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4402 (class 2606 OID 385585)
-- Name: threads topic_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.threads
    ADD CONSTRAINT topic_id FOREIGN KEY (topic_id) REFERENCES public.forums(id) ON DELETE CASCADE;


--
-- TOC entry 4398 (class 2606 OID 385595)
-- Name: sys_rules u_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sys_rules
    ADD CONSTRAINT u_id FOREIGN KEY (u_id) REFERENCES public.users(id) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4390 (class 2606 OID 385600)
-- Name: categories u_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT u_id FOREIGN KEY (u_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4389 (class 2606 OID 385615)
-- Name: bda_plans user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bda_plans
    ADD CONSTRAINT user_id FOREIGN KEY (u_id) REFERENCES public.users(id) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4391 (class 2606 OID 385620)
-- Name: comm_posts user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comm_posts
    ADD CONSTRAINT user_id FOREIGN KEY (u_id) REFERENCES public.users(id) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4394 (class 2606 OID 385625)
-- Name: inner_worlds user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inner_worlds
    ADD CONSTRAINT user_id FOREIGN KEY (u_id) REFERENCES public.users(id) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4397 (class 2606 OID 385630)
-- Name: safetyplans user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.safetyplans
    ADD CONSTRAINT user_id FOREIGN KEY (u_id) REFERENCES public.users(id) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4405 (class 2606 OID 385635)
-- Name: wishlist user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4393 (class 2606 OID 385640)
-- Name: forums user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.forums
    ADD CONSTRAINT user_id FOREIGN KEY (u_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4403 (class 2606 OID 385645)
-- Name: threads user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.threads
    ADD CONSTRAINT user_id FOREIGN KEY (u_id) REFERENCES public.users(id) ON DELETE CASCADE;


-- Completed on 2026-03-09 10:26:54 EDT

--
-- PostgreSQL database dump complete
--
