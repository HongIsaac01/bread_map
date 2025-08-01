PGDMP  '                    }         	   bread_map    17.5    17.5 "    D           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            E           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            F           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            G           1262    16388 	   bread_map    DATABASE     z   CREATE DATABASE bread_map WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Korean_Korea.949';
    DROP DATABASE bread_map;
                     postgres    false            Y           1247    16406    ENUM_Classification    TYPE     h   CREATE TYPE public."ENUM_Classification" AS ENUM (
    'Mixing Ratio',
    'Powder type',
    'None'
);
 (   DROP TYPE public."ENUM_Classification";
       public               postgres    false            _           1247    16429    ENUM_DoughType    TYPE     `   CREATE TYPE public."ENUM_DoughType" AS ENUM (
    'Lean',
    'Rich',
    'Hard',
    'Soft'
);
 #   DROP TYPE public."ENUM_DoughType";
       public               postgres    false            b           1247    16438    ENUM_Fermentation    TYPE       CREATE TYPE public."ENUM_Fermentation" AS ENUM (
    '빵효모',
    '빵효모(장시간)',
    '호밀 사워종',
    '빵효모와 호밀 사워종',
    '무발효',
    '호밀 사워종과 빵효모(소량)',
    '빵효모(단시간)',
    '빵효모와 밀가루 사워종'
);
 &   DROP TYPE public."ENUM_Fermentation";
       public               postgres    false            �            1259    16414    bread    TABLE     �  CREATE TABLE public.bread (
    bread_id integer NOT NULL,
    name_kr character varying(20) NOT NULL,
    name_world character varying(50) NOT NULL,
    classification character varying(15),
    dough_type public."ENUM_DoughType",
    baking_method character varying(20),
    bread_style character varying(20),
    fermentation_method public."ENUM_Fermentation",
    detailed_description json,
    country character varying(50)
);
    DROP TABLE public.bread;
       public         heap r       postgres    false    866    863            �            1259    16413    bread_bread_id_seq    SEQUENCE     �   CREATE SEQUENCE public.bread_bread_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.bread_bread_id_seq;
       public               postgres    false    222            H           0    0    bread_bread_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.bread_bread_id_seq OWNED BY public.bread.bread_id;
          public               postgres    false    221            �            1259    16399    classification    TABLE       CREATE TABLE public.classification (
    classification_id smallint NOT NULL,
    name_kr character varying(50) NOT NULL,
    name_en character varying(50) NOT NULL,
    standard public."ENUM_Classification",
    detailed_description json,
    country_id smallint
);
 "   DROP TABLE public.classification;
       public         heap r       postgres    false    857            �            1259    16398 $   classification_classification_id_seq    SEQUENCE     �   CREATE SEQUENCE public.classification_classification_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.classification_classification_id_seq;
       public               postgres    false    220            I           0    0 $   classification_classification_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.classification_classification_id_seq OWNED BY public.classification.classification_id;
          public               postgres    false    219            �            1259    16390    country    TABLE     �   CREATE TABLE public.country (
    country_id integer NOT NULL,
    country_name_kr character varying(10) NOT NULL,
    country_name_en character varying(20) NOT NULL,
    characteristic text
);
    DROP TABLE public.country;
       public         heap r       postgres    false            �            1259    16389    country_country_id_seq    SEQUENCE     �   CREATE SEQUENCE public.country_country_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.country_country_id_seq;
       public               postgres    false    218            J           0    0    country_country_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.country_country_id_seq OWNED BY public.country.country_id;
          public               postgres    false    217            �           2604    16417    bread bread_id    DEFAULT     p   ALTER TABLE ONLY public.bread ALTER COLUMN bread_id SET DEFAULT nextval('public.bread_bread_id_seq'::regclass);
 =   ALTER TABLE public.bread ALTER COLUMN bread_id DROP DEFAULT;
       public               postgres    false    222    221    222            �           2604    16402     classification classification_id    DEFAULT     �   ALTER TABLE ONLY public.classification ALTER COLUMN classification_id SET DEFAULT nextval('public.classification_classification_id_seq'::regclass);
 O   ALTER TABLE public.classification ALTER COLUMN classification_id DROP DEFAULT;
       public               postgres    false    219    220    220            �           2604    16393    country country_id    DEFAULT     x   ALTER TABLE ONLY public.country ALTER COLUMN country_id SET DEFAULT nextval('public.country_country_id_seq'::regclass);
 A   ALTER TABLE public.country ALTER COLUMN country_id DROP DEFAULT;
       public               postgres    false    217    218    218            A          0    16414    bread 
   TABLE DATA                 public               postgres    false    222   k(       ?          0    16399    classification 
   TABLE DATA                 public               postgres    false    220   >B       =          0    16390    country 
   TABLE DATA                 public               postgres    false    218   �E       K           0    0    bread_bread_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.bread_bread_id_seq', 120, true);
          public               postgres    false    221            L           0    0 $   classification_classification_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.classification_classification_id_seq', 40, true);
          public               postgres    false    219            M           0    0    country_country_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.country_country_id_seq', 16, true);
          public               postgres    false    217            �           2606    16421    bread bread_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.bread
    ADD CONSTRAINT bread_pkey PRIMARY KEY (bread_id);
 :   ALTER TABLE ONLY public.bread DROP CONSTRAINT bread_pkey;
       public                 postgres    false    222            �           2606    16404 "   classification classification_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.classification
    ADD CONSTRAINT classification_pkey PRIMARY KEY (classification_id);
 L   ALTER TABLE ONLY public.classification DROP CONSTRAINT classification_pkey;
       public                 postgres    false    220            �           2606    16489    country country_name 
   CONSTRAINT     t   ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_name UNIQUE (country_name_en) INCLUDE (country_name_en);
 >   ALTER TABLE ONLY public.country DROP CONSTRAINT country_name;
       public                 postgres    false    218            �           2606    16397    country country_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (country_id);
 >   ALTER TABLE ONLY public.country DROP CONSTRAINT country_pkey;
       public                 postgres    false    218            �           2606    16478 
   bread name 
   CONSTRAINT     ]   ALTER TABLE ONLY public.bread
    ADD CONSTRAINT name UNIQUE (name_kr) INCLUDE (name_world);
 4   ALTER TABLE ONLY public.bread DROP CONSTRAINT name;
       public                 postgres    false    222    222            �           2606    16471    classification name_kr 
   CONSTRAINT     f   ALTER TABLE ONLY public.classification
    ADD CONSTRAINT name_kr UNIQUE (name_kr) INCLUDE (name_kr);
 @   ALTER TABLE ONLY public.classification DROP CONSTRAINT name_kr;
       public                 postgres    false    220            �           1259    16456    fki_classification    INDEX     N   CREATE INDEX fki_classification ON public.bread USING btree (classification);
 &   DROP INDEX public.fki_classification;
       public                 postgres    false    222            �           2606    16472    bread classification    FK CONSTRAINT     �   ALTER TABLE ONLY public.bread
    ADD CONSTRAINT classification FOREIGN KEY (classification) REFERENCES public.classification(name_kr) NOT VALID;
 >   ALTER TABLE ONLY public.bread DROP CONSTRAINT classification;
       public               postgres    false    222    4771    220            �           2606    16490    bread country_name    FK CONSTRAINT     �   ALTER TABLE ONLY public.bread
    ADD CONSTRAINT country_name FOREIGN KEY (country) REFERENCES public.country(country_name_en) NOT VALID;
 <   ALTER TABLE ONLY public.bread DROP CONSTRAINT country_name;
       public               postgres    false    4765    218    222            A      x��\[oG�~���F�  ��N�d/X`gv�L&ĳ�C6���Bd9��	���ZJ�"�"��D�-�)��[�!����U��\����M�c'3��1Ů�:��|�R��㫿��Oև��ַw�MO]��k��ɯ�������U+si�����ʲ֕��+��j��{>�<;57wm������tz��|����?es^��z��<��P�mK�O���i���[��/���ߛb}I��փe-yX�;-K��b�l5���k��.����ģ�uib�-x�%�E����9Ϋ�^��y[��p%Ys�Ӟ���+����ò������3;U�U�
,N���BK���vI�Uܔ����@,8V���.��r���N�Y+����Y�Y(��'A��O\�/���q�Yry��p��U�-wA����%�읁�ˡ�Ds�c�m�( <�v�ϋ�|�?�h��.(�J��؁�ù�[ߑ�yq0����\�Ve�Ɵ����bݶ��G����YpI`�%�P�D�(�=܂,�
i�p�z��e��.�~4|\<��QQ�b�o[]�������<��*<������~5����ֆ�ל�۲ܒ��1<��o����AeE/�;�r�Ó�揨����U��Ɓ���}d�B��m̼lg�8��>�=��?���)�q�/k �-<��<�|o>�?WB-��4�;lʦq�,XePq��0�ߓ�׾ӎ8��������/Y^��Eل,���¿�O� �l}�ܝ-�د��{X@��|���_��[�3߿=��o|�bhy��Fn�Mgg^'A��b,���؃��c!�X֛~�,��d��=�D�~� f��a�����ώę��V�[�
�,�@���h��y��N#s����&�eg�@�9�i������Wł���:l����O�
H���]���� zY�Xu�a�q̰��*�K��6<�#���V^��*�K������8R4hg6�Ώ�b"z�|tnB�9m��3�`�D����g��#9�� ��~�'��(|�]���
9q�i?��Uqԥ������"eH�����w��[�
*�j(1 yy�x��u8H�����mp(�ot���w����N�/CX�0Ӏ�Xr�Sr	���\@)���SH����ϋ���P'��*l��gk�=�` ������O �Z�LQx�N4��\��Tp?f$�)J�S�C����FzN��6A��md'Ǒ.��X[%���U�sm̃���(`Թ���X|	�\U"����e��jX�,��!��6|����6��8�w���'NPh�9�*H �~�{�h�*]Wt\9�q�Oo�eg��^��e�noI�@$������p�< ��/ZX���R)́8l�/.�A}B�{TdJ��"H� @� BvIV>\튀�[�\s��ҝGO���b��<�չmqTE�6�
~���!C�(����2���[���cם������3�2�� ���#a����ڗ����@�=Pl�4~m��;�o��אd��!�A�6A��|h���
�q���/�	�U1�q�΁Zq5D+�k\X�����T����|��cٌ�F~�4�ʛERq��;�bZ`��& dL�;���dj�6�s������B�!h@�Rσw����� d����"���=��6�����&gx�(�0r��J ��>�J�U��
z4��SB끀�L޽���!;�R�`���HZ)�(|s�7��1�I�ׅ.Ȝ쥾A�/�ٔ�ϗB�B�!�ĭ:���.�����H�U;��<&sX�l>U	xat���6���� �Y���f�݆�4f�C�,��v[V�gQ�ŶBeX��T�3��{�-\<8
b
 ��
��JQ����ʾ�t�h�B�h�F	���n�52����y�E��d�������A��y�����+_A�~Ĺ�6 �)B��P�|%"�fnC�=L��a�y��5��1b��6�Hҝ�6Ph���n1J�L�z⁦r�U� D��U8�s�n�`��M�-{$���k!@�������jy'X��^2�^18� g6���,M�Kh��l([y;X*�m�!{U��2�^�Z�Á�=�.ř�3����.��oVM��$d��bYV�<|zc��Ү�&h'�?�6�
��S
T�ό��=�M��`�q�z���.O�s�*G��MR�`����r߾-���}˒�9��3�r�a����k��,��[�\�=�w�P��aY�,���BD&(3Nhp�)�;Z_k�iI����P��t��(���
����XV|���j$�w�X��LR����^d){� a����^��:F��JѰ��� �G��`�U�u�}:5=��s';7��X0�!�Wm�3ȁQ:�]�'�tW�q�2��y�՗���
��<��h�)����x�_c� z��$9�QQ	%45@2u2�桮 b`j�j0[$��$C����\�D��T��h	̻[V�cR���	a��2đP�|�w�]!����O��WD��q�N���bh^��*�����ύ鯲���lU!K:�ur�`�;&�q��F:qT�?}�g1��59�՘�
!d�6�����E�U�*�F�3������kCh����M�u�3=��sk��H"�Xu��ǆ���e����K���`5���a 3��:V HY�.<�Ra��ډ<���B�d�y�~��QuN���ٙh՜ҏ`9T�_O�)"+�ZR@g�0���d.�Ub���{�pXNO�ۊ��*	�>Cz\�-��A~��%4�<�[�����qS��TPz"�= N'�q�ͅ�6��f#�dm�@�L�H��IAVEW��	> ���8&�}a��?�5�	 +�g���|�p�_�e�#an��\�#��2���*��󘹍r9��f���0Ľ��� �E�.�F1@?	s�8F��<��(|#���\h�r�� �,4�ַ������yG�#�byh���%�v�1�f�+�f�����Là��C�~a�j����Lx�#�����̈�4s
���i�¶]s�E#�0�S�7ߡYJs�]�X$R�߀�<R���?�Jmة-�C9&z�"��& �gNҙ��Ɋ��qdؠJ8��N���@j��_�@]P6��jN)J�ҍ̻p
6ڡf�Aé���Q�k��\���d�(7'��-��z��������qAf�J��z��W�Mvvzj&;k}49�UH�������y��*ڣw����ιfŲi��Gd A#O4��ic�ꟴTi$��O��TuTH�fq��)�Ю5���Z�A���T���@@Ӹw3H��PÇ'Vi�%��\������)�_K�J�xX���T`F,�)_[�('�Rp:��v����	�Q��b�G����Bq �&�`K��'??����8ga:[����S�X �����K%�pj����!C5��#�!H���v���a2�T�1&�`�M[U'Ex��k�uM��T�s^Y�lK�ߔƵ�6�q��M�����A�s���{����ߠ8˚���<���,`o�W�f�/���k�K���w�n�0�W���[4����)y������VԧI�h��>X��<F��lG�
������;O���6�fJ��8�Un"�IIH��l��L��\)FVw%W&����)Ye��f5�	I� ����)��z�	�Z��3"��v�X��XC4 nG��H�R[����:�K��@�`�H�hJ �ljf���8"��u�J{�ظ�j4���8U}F���G8P������11���ָI2�pL+�S`�V٪���7i�.���H��<m4B;i�J���(���a�!'{4P�a�z�°&�c�
+߱�T����eԶ�����x�RQe�s	�cA�^%����TW���#Eᒴ���mD�m��ں�A��^4�b �	  6�T�Fox�<����ʁJe;Y�c�����N���6
�_��T�����h߫�f�����lNԙ��q���h~�gncq�C�d�q:5���I&M#�\��B̔�a�~Ÿ��"�:��.%�*����/����mS��U�3`�䅙��ޝ�3�}����aID�8����fD�0�p[�͘#�1j��iZ��У��Pa���|������99� �`w3!) ����(�j��e�
�k�fN�`sT^9�@����@�#��Qg#�6 ܢ�6���0�CO��'oM��t��m�6��QjP�*����
�d�Β��/ʈ��H���^`�I(�*��I��sF�[" /,��|&\[�뱷u@͖y��,�rm�4�<���J�gB �'B��:P],��ǻ:��0�	�2X��s'V�|{z��۳3��I4��t4@���Jl:��:��,xCޤ0�d_ͤ���N,��w3��h���;]p�s'�{8}���4��5k�3hj�,M��a�q�7����H^.Puj�<2 c?l�[�O��VP�cQ�ҍXL�K�f�c+���XL��&�N���RH�}~I��:F�#@�����r�i��10�
}Ǧ�߭�hzg-��k=0'rcY5"�88M�{H�t����B+��n�CFKEK���bN�8z�R�J�ՖX�вT��!������'�q����^���:�Xt�ر�t棩?gg�O&��dǾ@�A��N4�
����B�E5��~�K�]8��9�h��.�g\ԤrF��Bݏ��2N�+ x%�9��H��
�E�]��,\�k��GH��~,kQ��AW���o��3S׿Q#r��6c����ը�)W�Z�C�Z���ݑ��̽���L@����5��bY�A�,�b���ܝ�'���afF��lt@c&#��K+/��'��p,c�N��q�I/,	s�].z�[`b8�/�<�a<s�������;Phb�Jb�z�}t/��٢��0����<���qE[ZQ���K&J�CyAZ����f�\8��͗�2���3ز�&/!޸"
W�c�b̼(F���릋h42j��n��h"g���+��Zw4�]�<|Q	;M�+4�F���Ad��+������L+^z}u�.�rK_}�����4�B�3{�٧S�o��~�#��������Npg�4fH/�<�Wk��a|��9I��1�
�㮁��]C�U�<����`6���n�9������S$��yռ��Tx ���"���h�.�1�;��hc���A��\�&��>��2�SO 0����^K�������i�����M�$J�/�q�Å�
�>,��R�@��!�K�RX�ZE�V(��A#�i��9Mz��0�֜�w�L����uuGU�#�Y9���yM>R7�oƤ���%�`�F#0f~G��c\�)����Pm=� �c�	O9G��e5�|T�aۢP5a^��*|�hajT�GL�zLC>w����l��\v�������n��%HLx��`P9��I�|�^65Q�,S�6�1�� �ŊI��he�6q������傘Y�Œ��Sf���� 3����@ڲao4~�~�S.�HC2�����ף�(ܒ�(�B!K��ϠGꡰ�W���3 �<��n� ���1}�5i�2�=���+���鄠X��2�K���ə��0M�?�{��!n`��m+j=�9���ozcc3|Յ^H������j�$bF��P��C�T|���uy
Su�����ko8ė̫t#B���z`�T��a�����>& �\z��{b��L/�ӨU�x�>G��)w���8|Uz�d�8Spe��.��sV]��y8�C���-PO�8�i�]4z����h�,C;�#��4������ �6�d��|�bӵ��l�_0����πo�Q��*�,�Iu��)p#K"�+��G܎z��2�쉺`K�x����C�`��8"z*j󜸛����)-f�����q�-�����z��N�
`����U��&��1)���n��R�Lx[��bX@>e+��⁾mZG�I&�@g��uL�''Tg��S�Z4��R��8[��m�=%w]D|܎�𴪎�)q
ܢk^/�/�n�w�U�76�J���}�5�{��H�C��G�`�\�3^�����V�$���m4M����0C.�S����
��1�XFx-%.yy� ��Y�*��+y������}Z�Љ��8'�K���ib&oéc6��ݹ�_Ϧ�\�9���g�)�DN�L�/v�n3�CꌢF��]d���j$@���\�0V��=��P1�$Ld��RϚ��B5�3Ss7ǌ�B�cf�\��&'���W#L��P��y�ɂ����%��yH���r�6ϵYu���]>�AOw����@�s)S�j�VzϾ�I=șw��(O%LIIM�x�����־�x���o�?M�%;      ?   C  x����OAǟ寘41j�HA�'1<�@|0>�,땔<�RNR������kL��R�����v�p�
HUjr�����|�;3���C=����?|&�F�Z�r8�LNj�����b:�ܺs�g.�w�p���`��)Vm9�^���U텪��c	��i�4=�����IzNR�m��
�l���Zۥ�-��&�b��.Χ��i���Sx�̹,��fHژd��ʙ?��"U�4��9�m�Z������ӝ�+���
dq|�C�q8��=S�x>����]�'� �	�WɌ|S��\�ۑX4�8�Ot�+�(�=��,8���P�������Dx\���p�m�ӵz+ze�k���I��J�4�s��rr"��WYad|%2�&jk��P�c����2�qeLc��g���\�yX�gM�M�M�`����\2��H}��K�\�{N�۩��-��@�}M�#6j�Ō��`!�y���l�t�(U3"m�e`1-�%?횪�1mR�k�	1�i8>���W��X�"��%�%{3�~��b�T�ʦ
]�w�A��Ib��FB�B0NV��X�vc!#�51�ak&��\ؔe�d�:'MS�U���|��p[y2�D��<��~�F��&Tog��)n��G����s �6�:�l�"�����1�fR8�b3-ց~�h�)۸�P�m�r$����BS���s��5��Ժ�һ�)J.e�p�GYʉ���L9T-A��!��`e����I��Uܴ(�Z��>�G�SadJ"�	�W+�Z��l< ?����υ���(-
�
�8K�l�?V/�ûo����� ��r      =   �
  x��X]o��}N~��h�d��K�v��m��6h���bd�h8�V�Q�O��]Ţc9�bڡ:�,9UZ�Q���{�zf�%E+X����3w�̙3����;�����4~^�_�/�z���\*>1����|�1w�Fָ.6WegrO�.喟���ę)��81žc�FO�CV=�.��eC6:�הӐ��0���Zָ&�rd�q~*;�q���z����U�\��kCx�Fx2��&YYo7���.gq[���y+w��th�<kI���F赣�cDv ���؆쎄�^وv�9Qۖ;#�@{%&|xu�ç�*ct�87����<��)m��6��^��8��Aɽ#��E���O�3��z���`K�'�{�z G�@��r�q���-s.�^����L�b\�v�3��0��;�m1x&;�8�Q͔�ε,�͜�k7M,���7�2� w��@�4qW����t��ܦl���u���n����dc����� @Da��-u��4���#���G����s��W���Q�Q%_��@gBp�-BB�s�ȵp��[xf�I/��N�d��NfE�©|��}`�,�kG9�#��2#��D�ǦOG�<M���Ϣ�m;!8	�������b�Tc�rf�TI!6�P���a�'_l��FGE������s�k�IH8AՑJ�#�=1nㆄ2����Xt*.�n���ho(�Y���.r�!H�)1�]n��a;8f��(��)>�θ=w�PX�?~h|�XzXx�ᒟ�=��A݈^�Q������/�Sv��	*96!��2�m5�*M�I���&J4�����)�[H�����"R�X�*�V��],�?�-��|�AX�����������*`��:���q��Y����D��@�3��cg���2�^%�$�n�97�k-���H�/�-B$��hO�Z���
^VT�|�DbZ��0��A���*������Ţ�U�P��ȅgSh~�Ygu���d�
#�ѡ(T*۵����{6��g���՚��h���C�.��*���}n�h���nBl���j�"��{I>SdPaG��׫�J6�** 2�_{*�I�����#Zb�EuLެף�	!^M!�{� �f�9�ʱ/;��s�����I!YG�����N=�*l#ΐ�ݓ@a���n�6ߺ��]�t�����z�z�z�Z���K�\,.��.N~�:kV�6WH�!'��R��a�o���BNh]��݂դ�ȅo���E�Ɛ��� ��C���h\C��I }&��¡q%]�xCͩ�AF���o�F�����Ưq�D	��3����cq�@Cj�h�	C�q 
*ˏPGu��V�	����K+@� �:�!����=?AB����jʟi�N)χD���0z,oĠ+�<�N4� ۔����$u�73�9�6�X)b��
��������6�[�+�gԔ		,sly�R��y�;��a罖���<�F_��1��m����Ժ�h^u-�u��jw�ًjmM��(���H�C�A�X��\3�ɺ��N�N�?�����u�GoZ�X�{��賒�l�[���>МH
�����5�D�H~��G��a3��ps�4Y���|��)�sP�:����*N��,Q��<o�n�a�h���R��)�d��L���1�$�-��V�A�a���bj�٨V�X���Jѕ�>�D�'�:���Q�[����\XY���.F�z�[����±EIRE��e(iS��Z���f�@y
��$$q'�b�
%K��W�@]Z鴤s��
��$P�А��$�nU�{�=��Nm1(��m�di�l�WȧCz���Y�gR�xI�L��I���p T�����1���t:�[�-=�r:MR�X?�'>�P��V���6{������az��9��@|U}V�ui���zT"�z��$� [�q��m?�|kD�`"؄����͹o
���|������ �T������L[��^�8�z"�L$��o�>�m�1����F���	�c�Z��|�m�L�Q� ����|n>W*�2,��a�AЛ0o�ؤ�4��aO�J&T�%<֝T(.���k�F� ɀ3�5�{�F������>��^K=�E��f�C[��ZL{  ������ /�� ���,���D�8��ɬO7z�Q�;�$��,�ҁX�t�p��+t%m���а���e	t�fo�^ny�T*,/ff��%�]��H� �7�V����O慯Pi��q��`�p�	�x$/���B�����#���"o����po�
��sƃ<_�e.X���i��MQ������i(4���?/~�#ƴ��J���X�u��@s�,_z>bL&Nǎ��|�%z�$���:��C�����]������Ԑ�ɸ�T'���.3QiOu�+:�3'�'�|�IM�q�`�r��U�oXYc:���.��J��I���x�4{|zw�K	Un���լ������оy�q��LL�^i�����k��X��v$*P��Tj�D▮����=�_�� *��Zs������/�,V~��(p:�k.D�o>��ڼщU�n�i�p�FF�i���$&N4D�� v	�L?jH�y��%߳�ţ4}D�Vt� �V9v�'J�`2�k���>���<n�lQ]�������/h l��q��D߃Y�<��z�Z�m"     