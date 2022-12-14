PGDMP     $                    z           uprint    14.3    14.2 ]    e           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            f           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            g           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            h           1262    91966    uprint    DATABASE     j   CREATE DATABASE uprint WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE uprint;
                postgres    false            ?            1259    92005    Uprint_admin_rateperpage    TABLE        CREATE TABLE public."Uprint_admin_rateperpage" (
    id bigint NOT NULL,
    "rppBW" integer NOT NULL,
    "rppC" integer NOT NULL,
    CONSTRAINT "Uprint_admin_rateperpage_rppBW_check" CHECK (("rppBW" >= 0)),
    CONSTRAINT "Uprint_admin_rateperpage_rppC_check" CHECK (("rppC" >= 0))
);
 .   DROP TABLE public."Uprint_admin_rateperpage";
       public         heap    postgres    false            ?            1259    92004    Uprint_admin_rateperpage_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."Uprint_admin_rateperpage_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public."Uprint_admin_rateperpage_id_seq";
       public          postgres    false    216            i           0    0    Uprint_admin_rateperpage_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public."Uprint_admin_rateperpage_id_seq" OWNED BY public."Uprint_admin_rateperpage".id;
          public          postgres    false    215            ?            1259    91990    accounts_printdocs    TABLE     ?  CREATE TABLE public.accounts_printdocs (
    id bigint NOT NULL,
    document character varying(100) NOT NULL,
    date_uploaded date NOT NULL,
    copies smallint NOT NULL,
    num_pages smallint NOT NULL,
    colour character varying(20) NOT NULL,
    sides character varying(20) NOT NULL,
    price numeric(20,2) NOT NULL,
    order_id character varying(50) NOT NULL,
    customer_id bigint NOT NULL
);
 &   DROP TABLE public.accounts_printdocs;
       public         heap    postgres    false            ?            1259    91989    accounts_printdocs_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.accounts_printdocs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.accounts_printdocs_id_seq;
       public          postgres    false    214            j           0    0    accounts_printdocs_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.accounts_printdocs_id_seq OWNED BY public.accounts_printdocs.id;
          public          postgres    false    213            ?            1259    91977    accounts_user    TABLE     `  CREATE TABLE public.accounts_user (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    email character varying(255),
    username character varying(150),
    first_name character varying(200),
    last_name character varying(200),
    phone character varying(150) NOT NULL,
    accessno character varying(150) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    is_email_verified boolean NOT NULL,
    active boolean NOT NULL,
    staff boolean NOT NULL,
    admin boolean NOT NULL
);
 !   DROP TABLE public.accounts_user;
       public         heap    postgres    false            ?            1259    91976    accounts_user_id_seq    SEQUENCE     }   CREATE SEQUENCE public.accounts_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.accounts_user_id_seq;
       public          postgres    false    212            k           0    0    accounts_user_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.accounts_user_id_seq OWNED BY public.accounts_user.id;
          public          postgres    false    211            ?            1259    92052 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         heap    postgres    false            ?            1259    92051    auth_group_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public          postgres    false    224            l           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
          public          postgres    false    223            ?            1259    92061    auth_group_permissions    TABLE     ?   CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         heap    postgres    false            ?            1259    92060    auth_group_permissions_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public          postgres    false    226            m           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
          public          postgres    false    225            ?            1259    92045    auth_permission    TABLE     ?   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         heap    postgres    false            ?            1259    92044    auth_permission_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public          postgres    false    222            n           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
          public          postgres    false    221            ?            1259    92023    django_admin_log    TABLE     ?  CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);
 $   DROP TABLE public.django_admin_log;
       public         heap    postgres    false            ?            1259    92022    django_admin_log_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public          postgres    false    220            o           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
          public          postgres    false    219            ?            1259    92014    django_content_type    TABLE     ?   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         heap    postgres    false            ?            1259    92013    django_content_type_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public          postgres    false    218            p           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
          public          postgres    false    217            ?            1259    91968    django_migrations    TABLE     ?   CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         heap    postgres    false            ?            1259    91967    django_migrations_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public          postgres    false    210            q           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
          public          postgres    false    209            ?            1259    92093    django_session    TABLE     ?   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    postgres    false            ?           2604    92008    Uprint_admin_rateperpage id    DEFAULT     ?   ALTER TABLE ONLY public."Uprint_admin_rateperpage" ALTER COLUMN id SET DEFAULT nextval('public."Uprint_admin_rateperpage_id_seq"'::regclass);
 L   ALTER TABLE public."Uprint_admin_rateperpage" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216            ?           2604    91993    accounts_printdocs id    DEFAULT     ~   ALTER TABLE ONLY public.accounts_printdocs ALTER COLUMN id SET DEFAULT nextval('public.accounts_printdocs_id_seq'::regclass);
 D   ALTER TABLE public.accounts_printdocs ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    214    214            ?           2604    91980    accounts_user id    DEFAULT     t   ALTER TABLE ONLY public.accounts_user ALTER COLUMN id SET DEFAULT nextval('public.accounts_user_id_seq'::regclass);
 ?   ALTER TABLE public.accounts_user ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    212    212            ?           2604    92055    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    223    224            ?           2604    92064    auth_group_permissions id    DEFAULT     ?   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    226    226            ?           2604    92048    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    222    222            ?           2604    92026    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    220    220            ?           2604    92017    django_content_type id    DEFAULT     ?   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218            ?           2604    91971    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    209    210            W          0    92005    Uprint_admin_rateperpage 
   TABLE DATA           I   COPY public."Uprint_admin_rateperpage" (id, "rppBW", "rppC") FROM stdin;
    public          postgres    false    216   yz       U          0    91990    accounts_printdocs 
   TABLE DATA           ?   COPY public.accounts_printdocs (id, document, date_uploaded, copies, num_pages, colour, sides, price, order_id, customer_id) FROM stdin;
    public          postgres    false    214   ?z       S          0    91977    accounts_user 
   TABLE DATA           ?   COPY public.accounts_user (id, password, last_login, email, username, first_name, last_name, phone, accessno, created_at, updated, is_email_verified, active, staff, admin) FROM stdin;
    public          postgres    false    212   ?{       _          0    92052 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          postgres    false    224   }       a          0    92061    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          postgres    false    226   !}       ]          0    92045    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          postgres    false    222   >}       [          0    92023    django_admin_log 
   TABLE DATA           ?   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          postgres    false    220   ?~       Y          0    92014    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          postgres    false    218   ?~       Q          0    91968    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          postgres    false    210   N       b          0    92093    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          postgres    false    227   +?       r           0    0    Uprint_admin_rateperpage_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public."Uprint_admin_rateperpage_id_seq"', 1, true);
          public          postgres    false    215            s           0    0    accounts_printdocs_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.accounts_printdocs_id_seq', 5, true);
          public          postgres    false    213            t           0    0    accounts_user_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.accounts_user_id_seq', 2, true);
          public          postgres    false    211            u           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
          public          postgres    false    223            v           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
          public          postgres    false    225            w           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 32, true);
          public          postgres    false    221            x           0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);
          public          postgres    false    219            y           0    0    django_content_type_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.django_content_type_id_seq', 8, true);
          public          postgres    false    217            z           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 20, true);
          public          postgres    false    209            ?           2606    92012 6   Uprint_admin_rateperpage Uprint_admin_rateperpage_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public."Uprint_admin_rateperpage"
    ADD CONSTRAINT "Uprint_admin_rateperpage_pkey" PRIMARY KEY (id);
 d   ALTER TABLE ONLY public."Uprint_admin_rateperpage" DROP CONSTRAINT "Uprint_admin_rateperpage_pkey";
       public            postgres    false    216            ?           2606    91995 *   accounts_printdocs accounts_printdocs_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.accounts_printdocs
    ADD CONSTRAINT accounts_printdocs_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.accounts_printdocs DROP CONSTRAINT accounts_printdocs_pkey;
       public            postgres    false    214            ?           2606    91986 %   accounts_user accounts_user_email_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.accounts_user
    ADD CONSTRAINT accounts_user_email_key UNIQUE (email);
 O   ALTER TABLE ONLY public.accounts_user DROP CONSTRAINT accounts_user_email_key;
       public            postgres    false    212            ?           2606    91984     accounts_user accounts_user_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.accounts_user
    ADD CONSTRAINT accounts_user_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.accounts_user DROP CONSTRAINT accounts_user_pkey;
       public            postgres    false    212            ?           2606    91988 (   accounts_user accounts_user_username_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.accounts_user
    ADD CONSTRAINT accounts_user_username_key UNIQUE (username);
 R   ALTER TABLE ONLY public.accounts_user DROP CONSTRAINT accounts_user_username_key;
       public            postgres    false    212            ?           2606    92091    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            postgres    false    224            ?           2606    92077 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     ?   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            postgres    false    226    226            ?           2606    92066 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            postgres    false    226            ?           2606    92057    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            postgres    false    224            ?           2606    92068 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     ?   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            postgres    false    222    222            ?           2606    92050 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            postgres    false    222            ?           2606    92031 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            postgres    false    220            ?           2606    92021 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     ?   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            postgres    false    218    218            ?           2606    92019 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            postgres    false    218            ?           2606    91975 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            postgres    false    210            ?           2606    92099 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            postgres    false    227            ?           1259    92003 '   accounts_printdocs_customer_id_e856ac6a    INDEX     m   CREATE INDEX accounts_printdocs_customer_id_e856ac6a ON public.accounts_printdocs USING btree (customer_id);
 ;   DROP INDEX public.accounts_printdocs_customer_id_e856ac6a;
       public            postgres    false    214            ?           1259    91996 !   accounts_user_email_b2644a56_like    INDEX     p   CREATE INDEX accounts_user_email_b2644a56_like ON public.accounts_user USING btree (email varchar_pattern_ops);
 5   DROP INDEX public.accounts_user_email_b2644a56_like;
       public            postgres    false    212            ?           1259    91997 $   accounts_user_username_6088629e_like    INDEX     v   CREATE INDEX accounts_user_username_6088629e_like ON public.accounts_user USING btree (username varchar_pattern_ops);
 8   DROP INDEX public.accounts_user_username_6088629e_like;
       public            postgres    false    212            ?           1259    92092    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            postgres    false    224            ?           1259    92088 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            postgres    false    226            ?           1259    92089 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            postgres    false    226            ?           1259    92074 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            postgres    false    222            ?           1259    92042 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            postgres    false    220            ?           1259    92043 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            postgres    false    220            ?           1259    92101 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            postgres    false    227            ?           1259    92100 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            postgres    false    227            ?           2606    91998 N   accounts_printdocs accounts_printdocs_customer_id_e856ac6a_fk_accounts_user_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.accounts_printdocs
    ADD CONSTRAINT accounts_printdocs_customer_id_e856ac6a_fk_accounts_user_id FOREIGN KEY (customer_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.accounts_printdocs DROP CONSTRAINT accounts_printdocs_customer_id_e856ac6a_fk_accounts_user_id;
       public          postgres    false    212    3226    214            ?           2606    92083 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     ?   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          postgres    false    3247    226    222            ?           2606    92078 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          postgres    false    224    3252    226            ?           2606    92069 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     ?   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          postgres    false    222    3238    218            ?           2606    92032 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     ?   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          postgres    false    220    218    3238            ?           2606    92037 F   django_admin_log django_admin_log_user_id_c564eba6_fk_accounts_user_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_accounts_user_id;
       public          postgres    false    212    3226    220            W      x?3?420 a?=... .      U     x????n?@????.?ݝU???Z?km?&\%Bj?>?4??X???I?2?2?#?^????\iS7???)???hL?ʔ{?FU??uݮ???2v????????@q?0??=?? ???cH?Y??q?	JmJ???S?u?Oa???T????P?#?[?68?j?`????k]????9S??????x??T/????ܣK??????e?42??w????a??Ǐw??e?5&?|%K?/?8]????R?ld?V?N?K? ?k?ږe ?g?;      S   9  x?m?Yk?P??o~E?&?{?.Y?P?[Ljk??P&??f1&6௯B)E???t?ad?????A*?=???4?8???{?M???????}P??p4?£I?N??Q?"????Zn?_?;V=h	P?.????9?9 ??J?V??d[Q??:H???M?ifeN???aA&xH??X`??1CBMj?)9Iz6UR\gP??L	..7?????pqcҜkp?????i??U???V?W??:aI}?i?YmK?'???????jP?nT?<3/???
,Gچ4?R?_???????G?PnƩ??p]???jkCӴ?}*      _      x?????? ? ?      a      x?????? ? ?      ]   \  x?]?[n?0E??U??j?{?;˨T!?(?L@<Z???????'?(?1??sY7?s3?????:??s?Q???????|D`?`?v???,????????*?-v}M?6?N??F???? ю??,
2?%EA?#???r\?cQ·67.?腈?NADrR	 Xຈ????????XU?FW?M?u?_q??GE??$???+?&Zo??m?8i?rYb?3bw?H?,??A`??ͮ???S???E< ?? *x?5??s??????x?w???ur?0???E?ZN?h9#Cǉdg?o8Q?????&[?Ѫ?쌮D??)????hz ???R?9??????,??      [      x?????? ? ?      Y   w   x?M??
?0??????n/??`??d???s?ۯ????OHH?i?Bo-,a??z????ս???;Ŵ7?)??????.??5?+0R?Y??Sw6\ܬJL?7?o?ܟX
^?[*???M?8?      Q   ?  x???A??0E??s? WQ`;???H?E?iK?cZ?ۏ?$N?FCXx?U??e??}??),c??l?z??!?8b????T$???V?go???y?ӎ?mj?\"%eS?n
f
?:???'?56?i????bY?
	2k?T??Ĳ???ݗQz.??dt?3)?{2?'#????u???E????q?M0?X???????B?7jң?DqɈ?D???3??9??P?!?f?G?,i?TP??[f?į6I???
Xa5wֺ?Ì???V>0P0??IGn??a?????,???1?%??l?m??,Rr??J??Z_?Q?d?6b"7????{???%/???y5?eї?]?8??n??'6???9^U??+$?ã?P]G??(`w?Żu~#?ۭ??? j??EF??}__vr?)?(??,4??Tֿ5?q??j1??;7?jD?:H????p???v?      b     x????B@  ??y?{??
??ԉW?37?de?(i????}|`DT??oP?:~??W?M5??C??ͯ???W n֯}=;?Y???1??\jI?~???t{????^????z~?7ow><?YQ??UDY??)m?%?v??׼}??ć?;??q?r???J'<???Ff??}??kߋI
????f???i??eF#5a?ܬ?YgH??Dc"?G?-??z9??x?r??N?\wu\???d`?@?B?T??s#M?2Х??$I?,j^\     