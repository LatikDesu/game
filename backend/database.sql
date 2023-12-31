PGDMP                         {            game_db    15.3 (Debian 15.3-1.pgdg120+1)    15.3 (Debian 15.3-0+deb12u1)     (           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
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
    public          postgres    false    216   {       %          0    16400    window 
   TABLE DATA           d   COPY public."window" (id, window_id, scene_id, text, "character", path_img, "position") FROM stdin;
    public          postgres    false    218   p       .           0    0    scene_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.scene_id_seq', 1, false);
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
       public            postgres    false    216            �           2606    16407    window window_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."window"
    ADD CONSTRAINT window_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."window" DROP CONSTRAINT window_pkey;
       public            postgres    false    218            �           2606    16408    window window_scene_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."window"
    ADD CONSTRAINT window_scene_id_fkey FOREIGN KEY (scene_id) REFERENCES public.scene(scene_id);
 G   ALTER TABLE ONLY public."window" DROP CONSTRAINT window_scene_id_fkey;
       public          postgres    false    218    216    3215            !   3   x���  ��1��.~���G�n.2ݏi���^����8��ʇ� |��      #   �  x����n�@�ϓ���k;qx$�.EJ��q�J[@�
*BpAЪBB=&mi��W�}#fכ�k��
8D�c����;3k.�x�����8x�׸��x�7�����H�]��$�t��X^�Ҵ��ѿ�g�F����0^[��8�Ky�F�p#)�p���/����ڑ��}?���.��8*����@#}�L�_ q����v��7�ASZv"�{�9�$��Y�"V�[�r^��j9/�mh�r�$���^!�m�[%1�;8�x)���3/��[q?O2'bQ/}���&��y'wXڸ\����0fI$G̅����e�,���1`����1�6ZLm&�rg6�_���1}���z&�N]R��|4����y��֘i@����[Bk�4�KK[���N�P���c#��<���fuI�U�S��jM�B>�	rX]���$˟t��6�L� ��(�5�U�0��:>&���)�Dդ�]�]`VuT�w@-���}F��BCR/�&&{r^�WA��Ԑ��8ZY@�wU10����Re�?���Ig��yLF|��Q'Θ�{�7/e��5�����)L��S{o�̖�m\l��&���8m3N �ȵ�쬢OV��5U-������姃��[-�Թ��=P9�I��(0�	�[�Ǌ����x.�_��*�2�V�5�<�Y���L��5�@ ����?��ҋ2M�,Iv��T�]eͿ�����h4~R���      %      x��]�rW�]C_Q��4�9���,{5���G�V����1���� -ZjO��p��v���a�"	��P��%��d�G=@ˎ��d���7o�̓'����ٻ�8;�n��l���A�ͳi������H��X[[�d�g7���l�y���������G�}�������GO>x�o>y��O��n����:Ϟ�������l�����Ȧ�D��'�W����.?�G�~����=�#�W��{��>֔��"�=��4��-�ً��ӣ�>.,��b_f��Q6�����av�/�&�;�tVxsv++��{��G��0y����{������i6�^{��}*�=�7�֒��:	��;DB��8�ߙc��Y�!~�;I�����<��sK����D~���c/qp�	9�Y�����g�!�Z	���?�$�����&��Ml�G͵�1��D]��7O��lt���o���i"bX�����z����n{$��e[G"���I����f7��e">�<�?��E������$����gW��Ի7=;~j☚HA˹'<��|v$���E��h�/���o�:��Pn��9�.?n&����G����lC<_���a���e���'��%�]>������byP0������'������Gp�|f�G��&�<�.C)���DB���Ryl
�
����.���_���5�?��ly��ћ��ML)�;�y���"�9��%�@���C�ύHy�7��Ї<[^�y���ٓ��j��2.*�ɂe���-���iV ˩��H���yj{��aq��VFtW��V8��;
{�S��
 �}�G������Z�����n�����M�ƴ�s��3Y�iB��km�/�?�����;�A_L�,�'�?���9��B�NM���8Pq�B��qQӔ�u�G��H5�~��h��m��}�ڙ���@�9�:��{�H�ʙ�~�����{��#&&���s�����q�&C4�Z�״�& &�ҙ�{���r'(��Re~���ܧ�H�S����Kdw�@C��P��}V�i�تO�O�'�hv������K&�U��QO&t�>0ڹx�V&~�?H�AQ/��5Gp
�t�����V����ڞ&\-]����1�J�ʸ�J��6�u8�?T|��>�;�����igDZ���Zp���I�B����ksY쁳$��D/
���Y^}����ω ���$���?|x�M$����W5��
���
�WD&�o���>�VN.��x��|�;Ku�z����^[���85�����?}���?��ًG���Ϯ?n�#����䑭�����5���/����o�y���P��� _�r�����L������*��ly�{H�^�ސ@K��a]�`��Z�sZ~��|_ڽۊ���_���`��.��{������T7;�F�g����+�K�e��k��c!�G��K��/�H���Z�_h��7����	�2� ���7(���a�C�
tԩ��(.�y''�IE�nHB�@�i|�/T��=@CV�ٮ��~��u�?��������2�����"���@Dfu�_m��~B�3�?eKr.�2��ξمWoqfGE��=�a���ք�+}���Z�(o�J� �hA�z��_�&�,+zR�N�<��) ��x@|Z�ř�#�*G�V��TU��W���& �n���΍��Ed��(�2@���mE`$����41X2&Rp�`�-YK~�4{��RD��5��pN߸�n�l�fH������c���S*\J��Xg�v�>z�l�<��<������P�&�PEo� ���/4�U�j�d����+q����X8��5�:��(�����ߋ^2�� � �?��-���Vը_]�TQ�||3[R�YU�UZ¤u_���RKd�yن���M~��,[���7����>�Ic�m���[�祣XPP�Ѷ�}�U�e3����|]t��	��j���xWnͶ]"^���U2��b8��b�h�kHU����(�D_s�PF��Ns­�U�/��"�i= )��Ж5Vy�R�儈+���@F�?DP�K���~�<QM�*,"Q�l�g.K�:��5ջ�u���S.��/\9Sj�).��ss���oDQ�_i��*�%����$���<L;/r��p�:���%' Gg �Q{��{�_#�~�������@~Rll�\8�Nh��ȅ�������C�q�����S��w�|�EN�;QĢ� ��\}u�@!�$�VU�߃��'���%��������2P��T�gĎ�3�6y�0�;�0 ����ȭ�~��ǧ</���H7عj��i�Y<`5d[u;�f�߿���J@}���~��@���GE�7.��:í�� �]���j`L̥��H��n��������-q��0>@� '�\�-&��ZF\�Z=�)��!<eG�����y���J���XT�O.�%A���K��csʟ�B9�%�q���=��
�!!��Pv������ ��Gl{���������sl�r�Q2���3u/���>?�6���	��`	߾V�\O37��#�^��<�%S��kb\��$
�]\����%�D�y�q���F�zq����_g�b�A ��0��4 ��|v8�}ɗUY��e%�Z{"}$=�������+L2�d��\�o�Ղ���)����G#��C�s�?ϑ��)*ŵ�O�;�F��g�$��0�S޼�ѫ��ٞ� ��i�@)�e�ȷ�J���4����68Nؓ�������2�~�����H�#n�(X�A���Z��M��y8��;��4ϡ����ǒH��p�0L���XM���v������
q]\XϹSK�����$�3�}�aI_*e��OI��8����m�(��.���!z`hJ��T#FQ�QR�;0F)��N����ę��!v߷�kO�����&̀:,YKid����Ka�`F���i��E��v�Q>�Pb���(#�pf�B���kLӜJ�Zs6�d�wV߉m���n'N�79ѯy�}�;�L�r��=j�����dh�=u)a��ͧK���)�O�e�(ب�m�6��P6�H��xs�	S�E�r��}�\Wڇc��mⶑ9ŚtG1���
ȁ��3sŬ��N%%�J�\!��կ+b.0���ge�J2z#�D�=*9u����\J��yS3R6rWF�,��6�@+l�ZE=�7�-�����Fё"�PPI�}�MiK������ݎr �ݡ�;�Q��/�{1�W>�f�S��v�m�� ��s����1�+�F�J��l��� �=`�ӧVƠд^8�bQs~L���1�O�ܪ�����+6�FO�F�� �J{��j��Us�j�T�����s�yP���z�g��R��J�L�6<�j��t��mǛ"�t����Riխ�u�֧=VJ5�b�E��">M4%�U]86F�9�4�_��[00Vo��P��ݵ��E�P�21��J��8J+�]����xL&g\��+=�}�j��Q�0Rg �8�

���_�]�J8�/�$�1�3=���q�ǜ�BK$����U�\����b��X����Ȍ�R�v�2��V8�U�f�gdV��ڣI��\�BE�l|��zZ���"�����4/�$N���Ǌ�5YK�� ���X�m�T�
FD���4�w����*�y��ZAi=��WO�z3�]��u�< ]�՟�pv��F7G�J���b�b�N�G!�����0��a[d�ɧm���V��(P�ae����v��.���QU��f���E�n%��ֈ���@a�Yk�F([�}�{���fG��U���%����֒��<Y���.���︭D��B �񅯉nNܤ5��ڿ��M�Bg}�|I�F ���9�!K\�`y����TQ:����6� i���c������R%�C`�mT,S]�& �N����^#��y�5�e�֕�����b�b�_;��nSxJq����D�>N§ה���-c�8=Iq��_���7�4))-���ֵ_($8S�Yx��� 9�U��ǵTB�vn�\� =  ��\�A���eܷ�C��>�j5%eU��1ӥ4�R�R����˔�Ҵ��|`1~O�D���U���̸�%�h�����$����5����B�����z��q�Ry�%��zd�:#]Ů����V���L}�R;fR�u�shT�&�Ȃ���x��j�"nN{��(���ȁ�Z�:�la٥[�>¾������l�ȗn;Լ�Ƿ�3�tە�t0X����;*��Ԏz�K��if.�U"�ܗ��*��D�.JL��ר���&e�l�S��Bݿ�t�=L�N!�zU�$����HK��K����鴆7�����e�/����e��G�$�%ã��ݶ�6DY�n��y�u�ʮp8,��R��r�B�1$�Z!�%�F�~xi߄���/����^goՐ�g��[�ӴP�tq��D[��wp)�i��Z����f�+�~��WC�;�T�DSYf=|_���`O�n��EqBU)�1x�����7���}^�l�Y�]��Pد�7���Pɥ������-��O�+L��������R��}��g�C;�*������"�r>�e9�lO�E�Q�ndۘ�'=C��:7ߨ>�-�߆~n��וD�6c"�^�����^@4�I�W�o4��� 5���Y��(�D?�6�k�|ż|6q]DC�����M�+�[O�R6ޏ3�4.9�I�$E{(#�^�Էŀ���]��VV�O��,�6ܗZ� �>]�_�[`��6jM I�e&F�^!��o���{��,U�r]�ϰG��MшsD�P��X�����EU��o.]2K��3ρ JA��;C&�� �aZYa\�I���*h�U1i�OC�`������P^W��ՙ�oH��TH�;�H��M�ܪG�b1tlPCڌ��4��1���|�Bh�el%��N����a���fb����f~�&�G� l����22�۱Tnyc�(�^ڸ����l\9��rFs��Ŗ�C�=�ʃ�-�Z��b��񨶛��*U� �8V�k� h
TW���3s�@��=ԢҘ�n	��+���0F�1xW{��_,H���H��q3��t���U�;�����X�z꟎����o�¹ͻ��MCءk���D
-��=��a�5A�J-�gH�r8��M���"���N���A�U��Ao����Ԅ�	�X6���ti�RyM���94��8$ ��B�7��E;h/��~a�z@A��b)h"p�D��[Z����	]�����G񢰱7��!G�ZI�&*\[C
�c]OJ�hul�G ���+߲��P��L�~��2�4\E�u,ܜ����Q����9	7u�:{�5m�H�*Ԛa �Q�a�É�{�6��֭MC�}Mj���T������g�,���UrQkC�f��y�:x�vE���Q���B�b-;�����?1�Q~p�^���W��@�2��P�A7���j�G@��가���^�&&���/�LO5��o>R8w����b�&�����t��9��;6�f�e�
!���IT�Pl�%�Y;�l�eRk�j:e�Lec�+\���f
AC�j=ŅK'�Q(�n2�,T��!g��̢�RǱ��VO2�Zu2�K�Yg�Q�	�s֡�|�|�I@� �g%��r�ΰ��|娇85�+�y�.�w!5Ӭ���t���l�yNc�3�\��®��%�U��U�.��%�dh��7Y����U���=��9k�N��t)��X,��u���V��"(�-�T]GA��Y)�US�[�*�	<��#��T�J��"����h�)���]6w���:�(8������iV�x�A2���n�0��=�I�Y���g.��]q.2�������l�W���>����k �}ܮ^$?���6n��hM��X��夰K&��9QG��ʜw�$�MZ��~�h>�N@�(�s�Խ��&G�:�w���� ���2pˊ��4��89�k�Ȭ&<T�'A�F>����bfR\�dB���&��HA�~�gknȜϢ���7_�:�X�V���yi2��ɞz�mbƱ��\]�H3�:z浞�y�4�x�l�C��:뱈���7/2?�,^���L�+{��F���+��V�bi�fl&�����nV���3mIzǥ8Zn�+��P��ȧ��]t����w�ʝ�MDf':���r�#k�5��(EP��=�,da�^���Ʋ�yEpv�y��G?B�0�C�Dn�2s0R��,�]�Q�_ pW�3�TK�(��ã�+�@,Vj��������}��zJ����՜��É�j֫m��L���iY�Q�pM�*�`�.91M, ��QK�9:�J� �(�ֽ��|����#g�UL�B9�6PUf
U�C�Y�;�Vb��/��� ��̺@��<�7
sv�Y�_�ޤQN�6����*��j\~��^yf����������Gx5�{����%$X���v*�������^�һ��Q�w,wI�z���<���
�4EW��<1S5�j�F�D��Ȋ�J�Աk�^�0�4|�}&D�hkM�F̦��T���s�
�d�I�x�v}��"]V��U5�%ZS3�iI>S-۷0�ECUmSn(���#K�b,��(C/��6�q�/؞�
[�Vft1��Z	��y��3��^�������Kh<-�}V���H�۟F���M�l��"�vkZ��Э����As�������db��Z S�S�N��m?ɐ�c�	�����X�#����`�ƙ����wZ�_���`~5N���#J���;&�T`v`E�(E$����V�X�L˟�R-j�����^�0�&s5i�$�u���&�p?��,zгڵe/��1��Z`���C:�p&N�*�v[�"��9�/t��:5YW_�{]V�N�� ���&ۄ�gֲ��#Ǫ�t��R�^x�;�d�v=\����FqCm�kD����&�ːO{�qV��O��M���8)�-����*t����Uc�ϡѽ���)
o]R��vT�OC^�`��5�F&���//���>U̿�.���l?P��	��;��,��Z��V�Is��q�o�[�_D��C��m�D�*�>/�I���K� WF^(�2\�e�����R>�)V-g�~��������(     