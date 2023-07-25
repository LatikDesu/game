PGDMP             	            {            game_db    15.3 (Debian 15.3-1.pgdg120+1)    15.3 (Debian 15.3-0+deb12u1)     (           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            )           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            *           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            +           1262    16384    game_db    DATABASE     r   CREATE DATABASE game_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';
    DROP DATABASE game_db;
                postgres    false            �            1259    16385    alembic_version    TABLE     X   CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);
 #   DROP TABLE public.alembic_version;
       public         heap    postgres    false            �            1259    16391    scene    TABLE     �   CREATE TABLE public.scene (
    id integer NOT NULL,
    scene_id integer,
    name character varying(100),
    path_img character varying(100)
);
    DROP TABLE public.scene;
       public         heap    postgres    false            �            1259    16390    scene_id_seq    SEQUENCE     �   CREATE SEQUENCE public.scene_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.scene_id_seq;
       public          postgres    false    216            ,           0    0    scene_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.scene_id_seq OWNED BY public.scene.id;
          public          postgres    false    215            �            1259    16400    window    TABLE     �   CREATE TABLE public."window" (
    id integer NOT NULL,
    window_id integer,
    scene_id integer,
    text character varying(100),
    "character" character varying(100),
    path_img character varying(100),
    "position" character varying(100)
);
    DROP TABLE public."window";
       public         heap    postgres    false            �            1259    16399    window_id_seq    SEQUENCE     �   CREATE SEQUENCE public.window_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.window_id_seq;
       public          postgres    false    218            -           0    0    window_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.window_id_seq OWNED BY public."window".id;
          public          postgres    false    217            �           2604    40967    scene id    DEFAULT     d   ALTER TABLE ONLY public.scene ALTER COLUMN id SET DEFAULT nextval('public.scene_id_seq'::regclass);
 7   ALTER TABLE public.scene ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216            �           2604    40968 	   window id    DEFAULT     h   ALTER TABLE ONLY public."window" ALTER COLUMN id SET DEFAULT nextval('public.window_id_seq'::regclass);
 :   ALTER TABLE public."window" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218            !          0    16385    alembic_version 
   TABLE DATA           6   COPY public.alembic_version (version_num) FROM stdin;
    public          postgres    false    214   7       #          0    16391    scene 
   TABLE DATA           =   COPY public.scene (id, scene_id, name, path_img) FROM stdin;
    public          postgres    false    216   n       %          0    16400    window 
   TABLE DATA           d   COPY public."window" (id, window_id, scene_id, text, "character", path_img, "position") FROM stdin;
    public          postgres    false    218   �       .           0    0    scene_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.scene_id_seq', 10, true);
          public          postgres    false    215            /           0    0    window_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.window_id_seq', 1, true);
          public          postgres    false    217            �           2606    16389 #   alembic_version alembic_version_pkc 
   CONSTRAINT     j   ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);
 M   ALTER TABLE ONLY public.alembic_version DROP CONSTRAINT alembic_version_pkc;
       public            postgres    false    214            �           2606    16396    scene scene_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.scene
    ADD CONSTRAINT scene_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.scene DROP CONSTRAINT scene_pkey;
       public            postgres    false    216            �           2606    16398    scene scene_scene_id_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.scene
    ADD CONSTRAINT scene_scene_id_key UNIQUE (scene_id);
 B   ALTER TABLE ONLY public.scene DROP CONSTRAINT scene_scene_id_key;
       public            postgres    false    216            �           2606    16405    window window_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."window"
    ADD CONSTRAINT window_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."window" DROP CONSTRAINT window_pkey;
       public            postgres    false    218            �           2606    16406    window window_scene_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."window"
    ADD CONSTRAINT window_scene_id_fkey FOREIGN KEY (scene_id) REFERENCES public.scene(scene_id);
 G   ALTER TABLE ONLY public."window" DROP CONSTRAINT window_scene_id_fkey;
       public          postgres    false    3215    218    216            !   '   x�3IILJKIK164��2N345L5ON5�������� ���      #   *  x����J�@����*r5��"���v3!��ڂ(.ą�J7�2H#��k���3Ǵ�*��;aflf1,��P�������5�e�T�I9J2�=&B�����<�u�]ʙ������{|�XQi��L�U������R���r��+�xA���F���B\���\=�Q�{���1��EQ�th+�3O�~�:ǭ�l�|�=����!t�}�s��\�Ѭ��~ŋj��s�#�8RӑѾ��4o�C/0��E�)�H�1�E������ޚ��<�]޶X���X��x����7g�0~ �/�      %   �  x���_N�@���S�X��G�7�G_R��4��h	�Q|��@$x����b"`R"iڴ��~�ffGSqГ��FܦM��pC�74䦜����;r���B��O���L��V�kT}���G�U5O�mf���b��Z HS���|/��-w}Ҍ�8� ,<֧) �q�W�h܈&	�ӱ��k��Z1��3�J�%�4�ف����H ��nj��@������q脤Дb�wn��	��/�@/���F��\�-=} �u��Q߷�&3��+̭p���!���*�G�8�A���Ʊa7�r@v*̌0���%��IG�
�"�N.q�iy���&W�s�䊩�cM$��d')mUhWgu˹��ڂV	��N{mcꖨ�z��T��=�R*���x$�d;��pCK�E�5�3��~�b۔     