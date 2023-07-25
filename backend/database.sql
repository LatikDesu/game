PGDMP         -                {            game_db    15.3 (Debian 15.3-1.pgdg120+1)    15.3 (Debian 15.3-0+deb12u1)     (           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
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
    text character varying(1000),
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
          public          postgres    false    217            �           2604    16413    scene id    DEFAULT     d   ALTER TABLE ONLY public.scene ALTER COLUMN id SET DEFAULT nextval('public.scene_id_seq'::regclass);
 7   ALTER TABLE public.scene ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216            �           2604    16414 	   window id    DEFAULT     h   ALTER TABLE ONLY public."window" ALTER COLUMN id SET DEFAULT nextval('public.window_id_seq'::regclass);
 :   ALTER TABLE public."window" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218            !          0    16385    alembic_version 
   TABLE DATA           6   COPY public.alembic_version (version_num) FROM stdin;
    public          postgres    false    214   8       #          0    16391    scene 
   TABLE DATA           =   COPY public.scene (id, scene_id, name, path_img) FROM stdin;
    public          postgres    false    216   �       %          0    16400    window 
   TABLE DATA           d   COPY public."window" (id, window_id, scene_id, text, "character", path_img, "position") FROM stdin;
    public          postgres    false    218   J       .           0    0    scene_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.scene_id_seq', 10, true);
          public          postgres    false    215            /           0    0    window_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.window_id_seq', 6, true);
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
       public            postgres    false    216            �           2606    16407    window window_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."window"
    ADD CONSTRAINT window_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."window" DROP CONSTRAINT window_pkey;
       public            postgres    false    218            �           2606    16408    window window_scene_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."window"
    ADD CONSTRAINT window_scene_id_fkey FOREIGN KEY (scene_id) REFERENCES public.scene(scene_id);
 G   ALTER TABLE ONLY public."window" DROP CONSTRAINT window_scene_id_fkey;
       public          postgres    false    218    216    3215            !   ;   x��� !��c�rm.�A��C��YrMU����S�;\�q:;7��$TvK�� �6      #   �  x����N*A�u��Hu����0�a��d.{�1��<9��Y�e"�P�F���=#.��S��-�[z�	=�D���sbN�1�&�M�(K��^t�M�v�8��á��f|�oH@PЃ9����?�Ҽt!�������+�n\r���\aN��MSA��Ԝ�+���!:O#�y�\LU�V�Z�D�CK�ไ'辬cNx�Dc�d�a�6��M\��KoC�M\��+�@{y�� �͈^��\2W|�M���m� �
��\.@O��Й��Y�Da�˚؂m�i���ŌW�g��'˯h1gD�V������2�Q�!Z����ކ�W���������0^�����7�b��_�ۿ�#� ��jc�=����5W�n�TsV������۠>o���K�/7�d����䱼����a<�Y�5���-��      %   �  x��Z�NY]'_���Ƭ�Q�,{5��d!��`� K��G�Ђ�vO�lY~L�hzguQTRI=!��%�D�|U�*�Z��{�F�8q".�+ޢW��wQ+��:�qt�Ga���aԊ�~t7�N�|<�/�ףv4�O����~|R��?�/��Q7j�х<ۉZ%?�%
d�0��M?��|ї�.d�S_i�RA|(������<֕�ǰA����mً�˫=�Ll�������<{����l}w��7k��|���֋���ok����ʪW�#F����5��qɏe�����ӾQt+eCl���xS��9�gG~s�'�X�����L��O���}������<g`b���NJ�vO\P��m�̑箢A�O��ŊD��ʢ=��K�e�A|�3"51����I�5��g��
�#�̠��rv1^|���}k���ߞon�cs{#{�Eo	���s�$�����M�^��opMɧ#�ٜ��M�^�h$�i�d�S�Bh�hmn���~0����Ҫ��.m1cN5z�������jK�8�覃��� ��&N�X�3X 1B�h��߲�\�q�.w��ɿB��3\���/[��k}�����Ғ��{x }=�#�F���Q�c�]��|��,�|n~�ص�A|͒$5��~�i�;xԺ[@R�5��ʂ��F|��)�^�~�3�ʳ ]]�q�j�]�]H�JիT��'��j�|�<>��3��Y?�{���c�ː�d���J�a��<;"��l�
o�Fݞ��$�sɃ���p�]:��1��.��fF�,{p���|R�	)�1��3�������<G���"�Hh�oE��KVBb_D��L�G��M�|��t��
M��/���� �{!)�-n�2Q�����B�sr$�3��C������-���޳����_?_{)/=�<������s��b'�����I%0�	k��w����\�'���jݴp�x���*��g?��WRԄ��ܓ=�ᵔ7>�E `���ѩ��|@N��pc��ߟ
 nY�c��M��#�s�8��0F4��މ���L��+u���RA6e�?�oo���#�ީF p��RJ*15�N�D5���qDY��t��B_��d2��ڏ�t�tg|��+ޘ,��J�iEbqĖC��g ز%��D�)�`k$;+�y&��G�*E�&i�H���+�O��O��E^��ʣ|vO�xL�ߨ��]Y"�u]�])Q&v��HJ�U��?��M�:��?٢���������G�E���H����n�I���4�>�Kr�a��ƫ���X �h[FD
\*�)c9Łm �:s �E�����jQ�pÕ�ġ)������Θ2u�?(|����
�R���[ �Uoť�%���|�Ȭ^F����@�J	/_�Y�l�{��K��"�]?%�Q��j�r�.>-+�*Ij���*8W�ʪ?r�[�����i#�H��=���PA�͔yW��U�b�g�;e�b���ި|(,�
�W�i)���;tq��Pj�[�%�t�Y��u-�@�d�`�<PJ���c��)Ӻ�*$Mē�}I�I�j�U��.=Q��W������R��} C
��T͘<>�QF���D��k\J�M�_FF�-�ľ��ߥ*�z���mS��U���"X��B=U4_mg�J�>�%�,`?y����DBm(�?m�l�&h\�NE!��]�ڄ�[�
^Eri�l�%���]��:֏�F��h4L��,̗pM���N���R`:�,��!kk@�:ә�Ψ����W��Uݦn?I{�&_�ؠO��z��#aߙF%��UT L����X�b%-�H4��Vʆ	m�(�6�Щ¤��٥TuIJ������B)m�]Id!�gH������a ���A:TR�ю~�W}�s8��X�LI�z�(4]L����$@�L��֗�?��r�[���=\ґ���Cc�Q���6i�'͠2F�H� J*X�8<���z=Yh}�����$�?��Ѐ�� B���ʎ�I�VF��I��w�_����rJ~�Dr2ÉC�J˶��Nهbe�c��q��:�ٯ�7'8ZVÔXE�C�i7��͘EGd��p���e4���S]YZau'� ��PՊ� 3�@�au�E�UW�u�4+�*��Ur$�TH��N�zE�wP⊲��d�z|L׏,����:*�_�!����5
-Z_�s�]�2��������ڿ���0��M�0_�Zc�����'���}����"��ֶ�=N �0]��ǯ'N`���C�1�r҂��Q���U���,��;_g�00��[�y�d��[y��;�Eu_�2E{�������b��CR����s+���럫��0X�az����UW=�H�O�j����S]�^�c�&�qS��7&7�l����>�]K<A�����H�@�@�H���`�Q�#��I��)4Nco�`傰Y��U��q�ͭ��AmWF��UA���2����o�J��9)"�Z�lcw�}7�q�LprB^~|s�?)��^6(L8�Ao�Z�VJ�܇�3�W���J��Qm�\�%D�C�����cn9{�^��ﺼ S�*�ǲ�m����P�m�)��CtH����𘓃)��RQ���a~�~����̯�`�^I�+�|��8���	���5O��^C��6�Vڔ�u�Z�Z���}/)휿�[ͱ]s؝�����0��ȑ!��+"ڬ$י7�0�N�lNʰÔ�ekɍʠ �ϵP������OrW��b�n��N-���VW=���d�4J�ڢ�O����s5���(�U�YAO@�+�n�4*U%Bխ	&����93;t;�i�,���/J�����0ԡ�����5I�pw�ݤٲ�b���.tXY(���� �Lh���A��w����Pg+K�+�/���'�t�곽�H�d��w�ZF��j~�2�I6�K�?���,.ܐ5�I�׏Oٖ�:&�ۮV1Ov�l��*��w�2���]�I���5g�̱��>�T]E\v�d,�(s�j�"R[@b���S�F=��l�(��@���R�$���i_��v�=�̜� �.��qpj�lҜ7�Ǧ���g6G�~D�:�;N*�(cgh-�e�.g�4q2�z�-���CM�C��_��'Ҍ�t9�	�KZ��8�]�kSm�zC�A����#�\9��Ӯ|d����t�U�Te��D�����qYIǕĴ�iÄ�����*Ro�H79������ӗ�w�� _�P�I�W�z�Iynn����9�     