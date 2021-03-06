PGDMP     9        	            v            pm    9.6.4    9.6.4 ^    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           1262    17440    pm    DATABASE     �   CREATE DATABASE pm WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Vietnamese_Vietnam.1258' LC_CTYPE = 'Vietnamese_Vietnam.1258';
    DROP DATABASE pm;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12387    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1255    17759    vn_unaccent(text)    FUNCTION       CREATE FUNCTION vn_unaccent(text) RETURNS text
    LANGUAGE sql IMMUTABLE
    AS $_$
SELECT lower(translate($1,
'¹²³ÀÁẢẠÂẤẦẨẬẪÃÄÅÆàáảạâấầẩẫậãäåæĀāĂẮẰẲẴẶăắằẳẵặĄąÇçĆćĈĉĊċČčĎďĐđÈÉẸÊẾỀỄỆËèéẹêềếễệëĒēĔĕĖėĘęĚěĜĝĞğĠġĢģĤĥĦħĨÌÍỈỊÎÏìíỉịîïĩĪīĬĭĮįİıĲĳĴĵĶķĸĹĺĻļĽľĿŀŁłÑñŃńŅņŇňŉŊŋÒÓỎỌÔỐỒỔỖỘỐỒỔỖỘƠỚỜỞỠỢÕÖòóỏọôốồổỗộơớờỡợởõöŌōŎŏŐőŒœØøŔŕŖŗŘřßŚśŜŝŞşŠšŢţŤťŦŧÙÚỦỤƯỪỨỬỮỰÛÜùúủụûưứừửữựüŨũŪūŬŭŮůŰűŲųŴŵÝýÿŶŷŸŹźŻżŽžёЁ',
'123AAAAAAAAAAAAAAaaaaaaaaaaaaaaAaAAAAAAaaaaaaAaCcCcCcCcCcDdDdEEEEEEEEEeeeeeeeeeEeEeEeEeEeGgGgGgGgHhHhIIIIIIIiiiiiiiIiIiIiIiIiJjKkkLlLlLlLlLlNnNnNnNnnNnOOOOOOOOOOOOOOOOOOOOOOOooooooooooooooooooOoOoOoEeOoRrRrRrSSsSsSsSsTtTtTtUUUUUUUUUUUUuuuuuuuuuuuuUuUuUuUuUuUuWwYyyYyYZzZzZzеЕ'));
$_$;
 (   DROP FUNCTION public.vn_unaccent(text);
       public       postgres    false    3            �            1255    17760    vn_unaccent(character varying)    FUNCTION     %  CREATE FUNCTION vn_unaccent(character varying) RETURNS character varying
    LANGUAGE sql IMMUTABLE
    AS $_$
SELECT lower(translate($1,
'¹²³ÀÁẢẠÂẤẦẨẬẪÃÄÅÆàáảạâấầẩẫậãäåæĀāĂẮẰẲẴẶăắằẳẵặĄąÇçĆćĈĉĊċČčĎďĐđÈÉẸÊẾỀỄỆËèéẹêềếễệëĒēĔĕĖėĘęĚěĜĝĞğĠġĢģĤĥĦħĨÌÍỈỊÎÏìíỉịîïĩĪīĬĭĮįİıĲĳĴĵĶķĸĹĺĻļĽľĿŀŁłÑñŃńŅņŇňŉŊŋÒÓỎỌÔỐỒỔỖỘỐỒỔỖỘƠỚỜỞỠỢÕÖòóỏọôốồổỗộơớờỡợởõöŌōŎŏŐőŒœØøŔŕŖŗŘřßŚśŜŝŞşŠšŢţŤťŦŧÙÚỦỤƯỪỨỬỮỰÛÜùúủụûưứừửữựüŨũŪūŬŭŮůŰűŲųŴŵÝýÿŶŷŸŹźŻżŽžёЁ',
'123AAAAAAAAAAAAAAaaaaaaaaaaaaaaAaAAAAAAaaaaaaAaCcCcCcCcCcDdDdEEEEEEEEEeeeeeeeeeEeEeEeEeEeGgGgGgGgHhHhIIIIIIIiiiiiiiIiIiIiIiIiJjKkkLlLlLlLlLlNnNnNnNnnNnOOOOOOOOOOOOOOOOOOOOOOOooooooooooooooooooOoOoOoEeOoRrRrRrSSsSsSsSsTtTtTtUUUUUUUUUUUUuuuuuuuuuuuuUuUuUuUuUuUuWwYyyYyYZzZzZzеЕ'));
$_$;
 5   DROP FUNCTION public.vn_unaccent(character varying);
       public       postgres    false    3            �            1259    17599 
   baocaotuan    TABLE     �   CREATE TABLE baocaotuan (
    ma_bct bigint NOT NULL,
    ma_da bigint NOT NULL,
    ma_tt bigint NOT NULL,
    thoi_gian_upload date NOT NULL,
    tep character varying(255),
    ghi_chu text,
    diem numeric(100,0),
    ma_sv character(8) NOT NULL
);
    DROP TABLE public.baocaotuan;
       public         postgres    false    3            �            1259    17597    baocaotuan_ma_bct_seq    SEQUENCE     w   CREATE SEQUENCE baocaotuan_ma_bct_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.baocaotuan_ma_bct_seq;
       public       postgres    false    195    3            �           0    0    baocaotuan_ma_bct_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE baocaotuan_ma_bct_seq OWNED BY baocaotuan.ma_bct;
            public       postgres    false    194            �            1259    17580    doan    TABLE     X  CREATE TABLE doan (
    ma_da bigint NOT NULL,
    ma_sv character(8) NOT NULL,
    ma_gv bigint NOT NULL,
    ma_tt bigint NOT NULL,
    ten_de_tai character varying(1023),
    ki_hoc character varying(8),
    tep_bao_cao character varying(255),
    ghi_chu_sv text,
    ghi_chu_gv text,
    ma_lda bigint NOT NULL,
    diem numeric(100,0)
);
    DROP TABLE public.doan;
       public         postgres    false    3            �            1259    17578    doan_ma_da_seq    SEQUENCE     p   CREATE SEQUENCE doan_ma_da_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.doan_ma_da_seq;
       public       postgres    false    191    3            �           0    0    doan_ma_da_seq    SEQUENCE OWNED BY     3   ALTER SEQUENCE doan_ma_da_seq OWNED BY doan.ma_da;
            public       postgres    false    190            �            1259    17569 	   giangvien    TABLE     �   CREATE TABLE giangvien (
    ma_gv bigint NOT NULL,
    ten_gv character varying(127) NOT NULL,
    sdt character varying(15),
    email character varying(127) NOT NULL,
    mat_khau character varying(255) NOT NULL,
    ma_kv bigint NOT NULL
);
    DROP TABLE public.giangvien;
       public         postgres    false    3            �            1259    17567    giangvien_ma_gv_seq    SEQUENCE     u   CREATE SEQUENCE giangvien_ma_gv_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.giangvien_ma_gv_seq;
       public       postgres    false    3    189            �           0    0    giangvien_ma_gv_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE giangvien_ma_gv_seq OWNED BY giangvien.ma_gv;
            public       postgres    false    188            �            1259    17550    khoavien    TABLE     �   CREATE TABLE khoavien (
    ma_kv bigint NOT NULL,
    ten_kv character varying(127) NOT NULL,
    dia_chi character varying(1023) NOT NULL
);
    DROP TABLE public.khoavien;
       public         postgres    false    3            �            1259    17548    khoavien_ma_kv_seq    SEQUENCE     t   CREATE SEQUENCE khoavien_ma_kv_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.khoavien_ma_kv_seq;
       public       postgres    false    3    186            �           0    0    khoavien_ma_kv_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE khoavien_ma_kv_seq OWNED BY khoavien.ma_kv;
            public       postgres    false    185            �            1259    17630    lienhe    TABLE     �   CREATE TABLE lienhe (
    ma_lh bigint NOT NULL,
    ma_sv character(8) NOT NULL,
    ma_gv bigint NOT NULL,
    noi_dung text,
    thoi_gian date NOT NULL
);
    DROP TABLE public.lienhe;
       public         postgres    false    3            �            1259    17628    lienhe_ma_lh_seq    SEQUENCE     r   CREATE SEQUENCE lienhe_ma_lh_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.lienhe_ma_lh_seq;
       public       postgres    false    3    201            �           0    0    lienhe_ma_lh_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE lienhe_ma_lh_seq OWNED BY lienhe.ma_lh;
            public       postgres    false    200            �            1259    17591    loaidoan    TABLE     b   CREATE TABLE loaidoan (
    ma_lda bigint NOT NULL,
    ten_lda character varying(31) NOT NULL
);
    DROP TABLE public.loaidoan;
       public         postgres    false    3            �            1259    17589    loaidoan_ma_lda_seq    SEQUENCE     u   CREATE SEQUENCE loaidoan_ma_lda_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.loaidoan_ma_lda_seq;
       public       postgres    false    3    193            �           0    0    loaidoan_ma_lda_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE loaidoan_ma_lda_seq OWNED BY loaidoan.ma_lda;
            public       postgres    false    192            �            1259    17611    manguoncuoi    TABLE     �   CREATE TABLE manguoncuoi (
    ma_mnc bigint NOT NULL,
    tep character varying(255),
    che_do smallint NOT NULL,
    ghi_chu text,
    hinh_anh character varying(255),
    ma_doan bigint
);
    DROP TABLE public.manguoncuoi;
       public         postgres    false    3            �            1259    17609    manguoncuoi_ma_mnc_seq    SEQUENCE     x   CREATE SEQUENCE manguoncuoi_ma_mnc_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.manguoncuoi_ma_mnc_seq;
       public       postgres    false    3    197            �           0    0    manguoncuoi_ma_mnc_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE manguoncuoi_ma_mnc_seq OWNED BY manguoncuoi.ma_mnc;
            public       postgres    false    196            �            1259    17641    quantrivien    TABLE       CREATE TABLE quantrivien (
    ma_qtv bigint NOT NULL,
    ten_qtv character varying(127) NOT NULL,
    sdt character varying(15),
    email character varying(127) NOT NULL,
    mat_khau character varying(255) NOT NULL,
    CONSTRAINT "ma_qtvEqualZero" CHECK ((ma_qtv = (0)::bigint))
);
    DROP TABLE public.quantrivien;
       public         postgres    false    3            �            1259    17639    quantrivien_ma_qtv_seq    SEQUENCE     x   CREATE SEQUENCE quantrivien_ma_qtv_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.quantrivien_ma_qtv_seq;
       public       postgres    false    3    203            �           0    0    quantrivien_ma_qtv_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE quantrivien_ma_qtv_seq OWNED BY quantrivien.ma_qtv;
            public       postgres    false    202            �            1259    17559    sinhvien    TABLE       CREATE TABLE sinhvien (
    ma_sv character(8) NOT NULL,
    ten_sv character varying(127) NOT NULL,
    khoa bigint NOT NULL,
    lop character varying(31) NOT NULL,
    mat_khau character varying(255) NOT NULL,
    email character varying(127) NOT NULL
);
    DROP TABLE public.sinhvien;
       public         postgres    false    3            �            1259    17652    thongbao    TABLE     �   CREATE TABLE thongbao (
    tep character varying(255),
    noi_dung text NOT NULL,
    ma_tb bigint NOT NULL,
    hinh_anh character varying(255),
    tieu_de character varying(127) NOT NULL
);
    DROP TABLE public.thongbao;
       public         postgres    false    3            �            1259    17650    thongbao_ma_tb_seq    SEQUENCE     t   CREATE SEQUENCE thongbao_ma_tb_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.thongbao_ma_tb_seq;
       public       postgres    false    205    3            �           0    0    thongbao_ma_tb_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE thongbao_ma_tb_seq OWNED BY thongbao.ma_tb;
            public       postgres    false    204            �            1259    17622 	   trangthai    TABLE     b   CREATE TABLE trangthai (
    ma_tt bigint NOT NULL,
    ten_tt character varying(127) NOT NULL
);
    DROP TABLE public.trangthai;
       public         postgres    false    3            �            1259    17620    trangthai_ma_tt_seq    SEQUENCE     u   CREATE SEQUENCE trangthai_ma_tt_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.trangthai_ma_tt_seq;
       public       postgres    false    3    199            �           0    0    trangthai_ma_tt_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE trangthai_ma_tt_seq OWNED BY trangthai.ma_tt;
            public       postgres    false    198                       2604    17602    baocaotuan ma_bct    DEFAULT     h   ALTER TABLE ONLY baocaotuan ALTER COLUMN ma_bct SET DEFAULT nextval('baocaotuan_ma_bct_seq'::regclass);
 @   ALTER TABLE public.baocaotuan ALTER COLUMN ma_bct DROP DEFAULT;
       public       postgres    false    194    195    195                       2604    17583 
   doan ma_da    DEFAULT     Z   ALTER TABLE ONLY doan ALTER COLUMN ma_da SET DEFAULT nextval('doan_ma_da_seq'::regclass);
 9   ALTER TABLE public.doan ALTER COLUMN ma_da DROP DEFAULT;
       public       postgres    false    190    191    191                       2604    17572    giangvien ma_gv    DEFAULT     d   ALTER TABLE ONLY giangvien ALTER COLUMN ma_gv SET DEFAULT nextval('giangvien_ma_gv_seq'::regclass);
 >   ALTER TABLE public.giangvien ALTER COLUMN ma_gv DROP DEFAULT;
       public       postgres    false    189    188    189                       2604    17553    khoavien ma_kv    DEFAULT     b   ALTER TABLE ONLY khoavien ALTER COLUMN ma_kv SET DEFAULT nextval('khoavien_ma_kv_seq'::regclass);
 =   ALTER TABLE public.khoavien ALTER COLUMN ma_kv DROP DEFAULT;
       public       postgres    false    186    185    186                       2604    17633    lienhe ma_lh    DEFAULT     ^   ALTER TABLE ONLY lienhe ALTER COLUMN ma_lh SET DEFAULT nextval('lienhe_ma_lh_seq'::regclass);
 ;   ALTER TABLE public.lienhe ALTER COLUMN ma_lh DROP DEFAULT;
       public       postgres    false    200    201    201                       2604    17594    loaidoan ma_lda    DEFAULT     d   ALTER TABLE ONLY loaidoan ALTER COLUMN ma_lda SET DEFAULT nextval('loaidoan_ma_lda_seq'::regclass);
 >   ALTER TABLE public.loaidoan ALTER COLUMN ma_lda DROP DEFAULT;
       public       postgres    false    193    192    193                       2604    17614    manguoncuoi ma_mnc    DEFAULT     j   ALTER TABLE ONLY manguoncuoi ALTER COLUMN ma_mnc SET DEFAULT nextval('manguoncuoi_ma_mnc_seq'::regclass);
 A   ALTER TABLE public.manguoncuoi ALTER COLUMN ma_mnc DROP DEFAULT;
       public       postgres    false    196    197    197                       2604    17644    quantrivien ma_qtv    DEFAULT     j   ALTER TABLE ONLY quantrivien ALTER COLUMN ma_qtv SET DEFAULT nextval('quantrivien_ma_qtv_seq'::regclass);
 A   ALTER TABLE public.quantrivien ALTER COLUMN ma_qtv DROP DEFAULT;
       public       postgres    false    202    203    203                        2604    17655    thongbao ma_tb    DEFAULT     b   ALTER TABLE ONLY thongbao ALTER COLUMN ma_tb SET DEFAULT nextval('thongbao_ma_tb_seq'::regclass);
 =   ALTER TABLE public.thongbao ALTER COLUMN ma_tb DROP DEFAULT;
       public       postgres    false    205    204    205                       2604    17625    trangthai ma_tt    DEFAULT     d   ALTER TABLE ONLY trangthai ALTER COLUMN ma_tt SET DEFAULT nextval('trangthai_ma_tt_seq'::regclass);
 >   ALTER TABLE public.trangthai ALTER COLUMN ma_tt DROP DEFAULT;
       public       postgres    false    199    198    199            �          0    17599 
   baocaotuan 
   TABLE DATA               `   COPY baocaotuan (ma_bct, ma_da, ma_tt, thoi_gian_upload, tep, ghi_chu, diem, ma_sv) FROM stdin;
    public       postgres    false    195    n       �           0    0    baocaotuan_ma_bct_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('baocaotuan_ma_bct_seq', 1, true);
            public       postgres    false    194            �          0    17580    doan 
   TABLE DATA               z   COPY doan (ma_da, ma_sv, ma_gv, ma_tt, ten_de_tai, ki_hoc, tep_bao_cao, ghi_chu_sv, ghi_chu_gv, ma_lda, diem) FROM stdin;
    public       postgres    false    191   Sn       �           0    0    doan_ma_da_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('doan_ma_da_seq', 1, true);
            public       postgres    false    190            �          0    17569 	   giangvien 
   TABLE DATA               H   COPY giangvien (ma_gv, ten_gv, sdt, email, mat_khau, ma_kv) FROM stdin;
    public       postgres    false    189   �n       �           0    0    giangvien_ma_gv_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('giangvien_ma_gv_seq', 18, true);
            public       postgres    false    188            �          0    17550    khoavien 
   TABLE DATA               3   COPY khoavien (ma_kv, ten_kv, dia_chi) FROM stdin;
    public       postgres    false    186   o       �           0    0    khoavien_ma_kv_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('khoavien_ma_kv_seq', 42, true);
            public       postgres    false    185            �          0    17630    lienhe 
   TABLE DATA               C   COPY lienhe (ma_lh, ma_sv, ma_gv, noi_dung, thoi_gian) FROM stdin;
    public       postgres    false    201   &p       �           0    0    lienhe_ma_lh_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('lienhe_ma_lh_seq', 1, false);
            public       postgres    false    200            �          0    17591    loaidoan 
   TABLE DATA               ,   COPY loaidoan (ma_lda, ten_lda) FROM stdin;
    public       postgres    false    193   Cp       �           0    0    loaidoan_ma_lda_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('loaidoan_ma_lda_seq', 4, true);
            public       postgres    false    192            �          0    17611    manguoncuoi 
   TABLE DATA               O   COPY manguoncuoi (ma_mnc, tep, che_do, ghi_chu, hinh_anh, ma_doan) FROM stdin;
    public       postgres    false    197   �p       �           0    0    manguoncuoi_ma_mnc_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('manguoncuoi_ma_mnc_seq', 1, false);
            public       postgres    false    196            �          0    17641    quantrivien 
   TABLE DATA               E   COPY quantrivien (ma_qtv, ten_qtv, sdt, email, mat_khau) FROM stdin;
    public       postgres    false    203   �p       �           0    0    quantrivien_ma_qtv_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('quantrivien_ma_qtv_seq', 1, false);
            public       postgres    false    202            �          0    17559    sinhvien 
   TABLE DATA               F   COPY sinhvien (ma_sv, ten_sv, khoa, lop, mat_khau, email) FROM stdin;
    public       postgres    false    187   
q       �          0    17652    thongbao 
   TABLE DATA               D   COPY thongbao (tep, noi_dung, ma_tb, hinh_anh, tieu_de) FROM stdin;
    public       postgres    false    205   r       �           0    0    thongbao_ma_tb_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('thongbao_ma_tb_seq', 7, true);
            public       postgres    false    204            �          0    17622 	   trangthai 
   TABLE DATA               +   COPY trangthai (ma_tt, ten_tt) FROM stdin;
    public       postgres    false    199   ч       �           0    0    trangthai_ma_tt_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('trangthai_ma_tt_seq', 4, true);
            public       postgres    false    198            .           2606    17607    baocaotuan baocaotuan_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY baocaotuan
    ADD CONSTRAINT baocaotuan_pkey PRIMARY KEY (ma_bct);
 D   ALTER TABLE ONLY public.baocaotuan DROP CONSTRAINT baocaotuan_pkey;
       public         postgres    false    195    195            *           2606    17588    doan doan_pkey 
   CONSTRAINT     H   ALTER TABLE ONLY doan
    ADD CONSTRAINT doan_pkey PRIMARY KEY (ma_da);
 8   ALTER TABLE ONLY public.doan DROP CONSTRAINT doan_pkey;
       public         postgres    false    191    191            &           2606    17733    giangvien giangvien_email_key 
   CONSTRAINT     R   ALTER TABLE ONLY giangvien
    ADD CONSTRAINT giangvien_email_key UNIQUE (email);
 G   ALTER TABLE ONLY public.giangvien DROP CONSTRAINT giangvien_email_key;
       public         postgres    false    189    189            (           2606    17577    giangvien giangvien_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY giangvien
    ADD CONSTRAINT giangvien_pkey PRIMARY KEY (ma_gv);
 B   ALTER TABLE ONLY public.giangvien DROP CONSTRAINT giangvien_pkey;
       public         postgres    false    189    189            "           2606    17558    khoavien khoavien_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY khoavien
    ADD CONSTRAINT khoavien_pkey PRIMARY KEY (ma_kv);
 @   ALTER TABLE ONLY public.khoavien DROP CONSTRAINT khoavien_pkey;
       public         postgres    false    186    186            4           2606    17638    lienhe lienhe_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY lienhe
    ADD CONSTRAINT lienhe_pkey PRIMARY KEY (ma_lh);
 <   ALTER TABLE ONLY public.lienhe DROP CONSTRAINT lienhe_pkey;
       public         postgres    false    201    201            ,           2606    17596    loaidoan loaidoan_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY loaidoan
    ADD CONSTRAINT loaidoan_pkey PRIMARY KEY (ma_lda);
 @   ALTER TABLE ONLY public.loaidoan DROP CONSTRAINT loaidoan_pkey;
       public         postgres    false    193    193            0           2606    17619    manguoncuoi manguoncuoi_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY manguoncuoi
    ADD CONSTRAINT manguoncuoi_pkey PRIMARY KEY (ma_mnc);
 F   ALTER TABLE ONLY public.manguoncuoi DROP CONSTRAINT manguoncuoi_pkey;
       public         postgres    false    197    197            6           2606    17735 !   quantrivien quantrivien_email_key 
   CONSTRAINT     V   ALTER TABLE ONLY quantrivien
    ADD CONSTRAINT quantrivien_email_key UNIQUE (email);
 K   ALTER TABLE ONLY public.quantrivien DROP CONSTRAINT quantrivien_email_key;
       public         postgres    false    203    203            8           2606    17649    quantrivien quantrivien_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY quantrivien
    ADD CONSTRAINT quantrivien_pkey PRIMARY KEY (ma_qtv);
 F   ALTER TABLE ONLY public.quantrivien DROP CONSTRAINT quantrivien_pkey;
       public         postgres    false    203    203            $           2606    17566    sinhvien sinhvien_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY sinhvien
    ADD CONSTRAINT sinhvien_pkey PRIMARY KEY (ma_sv);
 @   ALTER TABLE ONLY public.sinhvien DROP CONSTRAINT sinhvien_pkey;
       public         postgres    false    187    187            :           2606    17660    thongbao thongbao_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY thongbao
    ADD CONSTRAINT thongbao_pkey PRIMARY KEY (ma_tb);
 @   ALTER TABLE ONLY public.thongbao DROP CONSTRAINT thongbao_pkey;
       public         postgres    false    205    205            2           2606    17627    trangthai trangthai_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY trangthai
    ADD CONSTRAINT trangthai_pkey PRIMARY KEY (ma_tt);
 B   ALTER TABLE ONLY public.trangthai DROP CONSTRAINT trangthai_pkey;
       public         postgres    false    199    199            @           2606    17701    baocaotuan baocaotuan_fk_doan    FK CONSTRAINT     n   ALTER TABLE ONLY baocaotuan
    ADD CONSTRAINT baocaotuan_fk_doan FOREIGN KEY (ma_da) REFERENCES doan(ma_da);
 G   ALTER TABLE ONLY public.baocaotuan DROP CONSTRAINT baocaotuan_fk_doan;
       public       postgres    false    195    2090    191            A           2606    17706 "   baocaotuan baocaotuan_fk_trangthai    FK CONSTRAINT     x   ALTER TABLE ONLY baocaotuan
    ADD CONSTRAINT baocaotuan_fk_trangthai FOREIGN KEY (ma_tt) REFERENCES trangthai(ma_tt);
 L   ALTER TABLE ONLY public.baocaotuan DROP CONSTRAINT baocaotuan_fk_trangthai;
       public       postgres    false    199    195    2098            =           2606    17681    doan doan_fk_giangvien    FK CONSTRAINT     l   ALTER TABLE ONLY doan
    ADD CONSTRAINT doan_fk_giangvien FOREIGN KEY (ma_gv) REFERENCES giangvien(ma_gv);
 @   ALTER TABLE ONLY public.doan DROP CONSTRAINT doan_fk_giangvien;
       public       postgres    false    191    189    2088            >           2606    17686    doan doan_fk_loaidoan    FK CONSTRAINT     l   ALTER TABLE ONLY doan
    ADD CONSTRAINT doan_fk_loaidoan FOREIGN KEY (ma_lda) REFERENCES loaidoan(ma_lda);
 ?   ALTER TABLE ONLY public.doan DROP CONSTRAINT doan_fk_loaidoan;
       public       postgres    false    2092    193    191            <           2606    17676    doan doan_fk_sinhvien    FK CONSTRAINT     j   ALTER TABLE ONLY doan
    ADD CONSTRAINT doan_fk_sinhvien FOREIGN KEY (ma_sv) REFERENCES sinhvien(ma_sv);
 ?   ALTER TABLE ONLY public.doan DROP CONSTRAINT doan_fk_sinhvien;
       public       postgres    false    191    187    2084            ?           2606    17711    doan doan_fk_trangthai    FK CONSTRAINT     l   ALTER TABLE ONLY doan
    ADD CONSTRAINT doan_fk_trangthai FOREIGN KEY (ma_tt) REFERENCES trangthai(ma_tt);
 @   ALTER TABLE ONLY public.doan DROP CONSTRAINT doan_fk_trangthai;
       public       postgres    false    191    2098    199            ;           2606    17671    giangvien giangvien_fk_khoavien    FK CONSTRAINT     t   ALTER TABLE ONLY giangvien
    ADD CONSTRAINT giangvien_fk_khoavien FOREIGN KEY (ma_kv) REFERENCES khoavien(ma_kv);
 I   ALTER TABLE ONLY public.giangvien DROP CONSTRAINT giangvien_fk_khoavien;
       public       postgres    false    186    189    2082            D           2606    17666    lienhe lienhe_fk_giangvien    FK CONSTRAINT     p   ALTER TABLE ONLY lienhe
    ADD CONSTRAINT lienhe_fk_giangvien FOREIGN KEY (ma_gv) REFERENCES giangvien(ma_gv);
 D   ALTER TABLE ONLY public.lienhe DROP CONSTRAINT lienhe_fk_giangvien;
       public       postgres    false    201    2088    189            C           2606    17661    lienhe lienhe_fk_sinhvien    FK CONSTRAINT     n   ALTER TABLE ONLY lienhe
    ADD CONSTRAINT lienhe_fk_sinhvien FOREIGN KEY (ma_sv) REFERENCES sinhvien(ma_sv);
 C   ALTER TABLE ONLY public.lienhe DROP CONSTRAINT lienhe_fk_sinhvien;
       public       postgres    false    201    2084    187            B           2606    17754    manguoncuoi manguoncuoi_fk_doan    FK CONSTRAINT     r   ALTER TABLE ONLY manguoncuoi
    ADD CONSTRAINT manguoncuoi_fk_doan FOREIGN KEY (ma_doan) REFERENCES doan(ma_da);
 I   ALTER TABLE ONLY public.manguoncuoi DROP CONSTRAINT manguoncuoi_fk_doan;
       public       postgres    false    191    2090    197            �   C   x�3�4B#C]S] �������������0���$�[/=3�3���%�� ��f���\1z\\\ �+�      �   x   x�3�420453���4��4��y�km�BI��5y
�ww'g($=ܵ8O����ٙ
^�e���E�% ��F���F��&&�&�FfF���U%�z�i����)�d �T�!��W� �_+`      �   �   x�3���?� /]�1/C!,����NKc#SS ��H,sH�M���K���L572366L24KM��H2M4�L4J25J
$%%�qrZp��p�t��|/��40436334244��R�P���\��QZ\���R�W�G�`c�=... �q5      �   �   x�3�t>�%/]!/=���v�������)�>�ݘ��qx����1�wF~�PAo�B�ᅕ
%���e@卹L8�J�/ �`�J2󠲆\f�!E��@�e@�܇��XL3��~�{'Pm��]kK0U�rqz��Zt�D�e�v��qqq �N[      �      x������ � �      �   8   x�3�<2����
��)r!�L�x%wO,Q�K��|�����Iʘ+F��� �C       �      x������ � �      �   R   x��1�  ��}iA���.Ђ!Y��7�n�?ǜ/���	���5r���kRTj$+���W%�V�%���C��G#      �   �   x�e�=j�0�Z>�N�����I�M�*��ن�a]l�"U�!r�@J�{�$
��B�y���ƕVΑ���TF�OX�f��{&��$��S�"F����*���k�Xkq<��O�]�s#.�-�崭���~����v5�J�O��`1�!1m-F���挌�	���;�_����}�*�m���i�֟����H���` \e �NXH����Js2�7�ˮi�_U_�      �      x��\�oWzV��>�
X�Bx�)�J)��m��� ��#�D����,?����X�,� ]l�M����@��<ث'��_��;g.g��H�n���93s��n��r>JȦ��L&�L�3yA�Y��xG�_��[�%S���5�C��$I�-�I/�N����K��7dmI���C�F���?�H���{���5�){K�ޠw�7��Do����Ƃ� �LH	B*�U�� �����b����e���83	�L*��g�ǂ���|^����@N�儬��u��}e�ƢjY��J"qttߗde�4ⲩ'dɲT�P?���:�%I�]S�]�*ݹ��+���Z�x��y�*o�b�����ڱf���'�l�Z�_M������Nco]���U��r����mi7�\�(d3�d:�ɤs�2]6��ƍNߴ{�����Ǌq=!�2��K6c*�f|�����Y}�̲%�-Y�C�B�dwFDؚO桫;��'ò��!�I����l�6��]��3�%�p����ںf���ۋ��k�@�8{���}fb��\ҵv۴ff�����d+�S���Ռ�D*��ds�b:YL撰�EbI��b�X\\�J@7���d�+�dVRy�M�򵋳��b	)7�u��NU_�8}Ճ��?ڈ%.�����ߔ��UnP&�NZ�P�ڒ��,_�� ����I9�����¢�Jq��?��9�|nt&0�d_7�S{��7���ҥ_�n��mɴ$3NyW�W�6"�bthi��������׎최�|t��Z)�y����Y��������[�t]�n������^;Y�ʢ��^��w���o��f���<6kz�~=/~qW�������y��]O�����;���n�nJ�}�V���v����f��Kxw�+��H�<�_��?e�>}uL,E�u%K�.)��a3(�����c�a�T@�c ֿ��I�<#�{�}q�
�&��6^����HD���ٷޛ�Q�%����0�t�jf��s��F���&����ୗA������Tb6(�?��{�a4��I�݆���(9@��/�|?�i�^��{%�Zj�A������9*���{��=��*�O$�Γ!�I��w�T!�/dB����һB>UL&�B2�k�ȥN	�n[�l�w/�7� =F|��s�!��D�<�@��?���\p��k���=����_�������@���[2��0H��itV�8���܅Y^˸��R���m���4K�}�5B>Y��=5�{���u�����Z��M �?5�L�G��a>}�s��ȋ�?��9{��P���}8D[4AR�F~n�Q�ي*@�4=- �]vC����
|=t�����0L�6d�� �`5�T�'��oa��hȘ�Q�r�/���z�GP���D�J�[�\��H����gu�	'g��fKl��˵r�T�bX8>�r(�D��dQf��@;q��.u�Ai ��(�N܍�%xr��ZHc:g����4���$�u4ɘ��I�,bB�DD��"���V�-Y6�ayeD�.m���O��gt�c��荎<����h^�߆���\�w��Z(L�DCz<X���G`��� �����[$e4�tQC^�9I&���fY�����$v`J4N�K�`�4��l2Cք��������� �Z!MB�&����0{[T��������s���i�s�p,hj��Ø���� �1Ǣ�;�G��eޓ��>~逞�E,�bB�O0�Vw��{�%'�s̘c��^�Zqt�Jú�O%��5���P:�\tD������W�n��(^);�Jc��;D�A�Ii���F��Bf��sV5����ð7�N's�d�2�z����e�-*���`���TI��h��m�q?���͆H�w�6��I-���y3���	wk{�t��Xȃrm��A=1|ك�sx"�w<;|*y����'m}Z�9 @G{V!ԙ��]��Ϊ���8;�
��c\Xgx��~�M�gl��*��=�����P"��Q��ܧhEipU!1b~�CzW���G6���D=G�qws�~P���<�R�(�f`����T{���0;2d�A�b�#E�ArY����K��4���AH�8���!��O�A��� �%����������s�f��h�s��mt�cL�@g�P^�)[|�o7�/EG|�����)g��1��S#�I���ְHt�u(m8�9���7�&	�,�}?�N���R<�4�eE��v�8'��":�nqt��������'g~����Q"��5-�!l���+\��m�����Z�@'yЎ�j��*�8\�b��*N�K ������Ȟ�YNHpHk#X�x�K�r�hwp�q2�@���E�!�����s�(�Ee�`C��K�(-M�vpo
$ԺP���;��α�бb�H~��8��{?OWB�;�mVv�
��������Gy�T�t^hl_��3���-�Y���Q�q�~��r�;�
d0�?�&�*����t �,�y>tk��ScR�%l����ɞ��C�{��X�rIQ�K�����jP�ՔF@,R�n��+!�6n���:8��\�H*9n�#E5��o�q2�#��ݽ�Qi��Nc;�}����I$�����Bڮ.G���d
�;FiM7�-���<vQ�<4��x�� w{�	=�ɚV<�V�5�����Y}4��@	u
�*�(�9x����4�P�}�.�>T�H�qs+�q<iW�ݭIZZ������N�C)p��m�[�`��Ҍ	;Oř,Ol�yΊl����)��6���~��iצYy,��k�v�@s��`�Wn�B��������D��k S*{�  �b�@剋~���!���!�D��O�K��8Ά%{����c����Ӧ�}�])�r�{ɚB󡲟���w��Ϗ�����"����1�Ϗ���3f�??�=�B*W(����؊[K:����dM1d�4� H��\&m�d��D8
:4����У��a5v�$��/ҥ���	��3b7B_ad�b)�@�r�>���kۉ/�zژ���+d��g`�2ݞS`X�e�H�Z]G�"W�%�D�&����iJ�L5dL[�h���#,�OǠ�x��rа7�RLw�\��XB2��'��"ܸw�� 7�4Z�w�k�$�Pљ��f��}��`��������.����$AW�`38�����X��$���>�W��!�J��\��ǚˁ�U��&��!^��2iXj��:�N ��nWX��$��sE�TS-j�͍V�T�"��=8*V	D��k��#^ǃ.i]�\�=W��9�_\�t���p�����)C�i�3F�W���h���쉣^L6K1����R{� ���>Ұ��<2p�9pWV�n����������<k�{�f3(�	�	�z�#d�!�{�iY.�R�8M�.m�a��ь���R���D2�r	�yb�-,��S���,�S��@	ذ%���k��1D\��X���0�=��ayz�t�`������d�Ua���o�5b4�����;�3αQ�ߚ�*&��f�My�f����}��턒n���۵�~�~ik��݇۷�B�� vo����b+�,�~�*孍�[��m�<��ۉCM9�i>����]�Z\u��[m<��`�q0*���!}�&t�`i=;�� ��r����Si�3��;���d,i�����g�����{��텿-<!�"F�1�1�@*��Y^���o%�yBfy�q�W��i�}����	��1KqW��<�F�BJ]�G{ ��iHD��e9ˆ��IF[��$�r��X����:Ā^�)�(�w�g�&�GQ��P� X���I�U"=F�ق��jBv����1�Gl���З������>��a֞8�lR�dS�sg�.o�+����F�f��T/N�k�D$�R}�D��niKzB!JDs��x��#�ɖ�D�����QR�4����}{�=
��W ���O��[`�9N3��qA� _��+� �  �4b(��r��Ͷ�q��Jz ���RD��X�f
.ѳG�w���齮�0Jr����=��%6��	+g>�D>Ę<�.���Ƹ�q�>aRp!}��of£6�=���_�O����S g/5���f�@lGK�h�재E�f�0���+Y�0>D@@=o,�异g��J�5����j�$rk`�[�Sy���������T��_����~4�@)��ԝ�����<��ѹxt�=['�J	F�F�4|V�W'M��Tr��A�K7��u"�����\�O@�5���k�|z��Q���%8�De����}aK`{aş(��'�V+ �r^�䯠���tA�����Gf���� ฆ4��g&���֕t�I�D8!McG����8j����~��I���A��yeT�.#f*�p����Vu�"�!�=�@$�0[<�J*U�re�ޘ�=�Jh�	eŗW��q�s�]�TL�p�6{�Es�UWO�h�Y�hdx^!����F+�=އlJfO{4[�5��#�,b�'��(�9�b?�͔0�&~�'`lM/��!
�C9!��ғ?/;��	��pS(�~H�����?2�
���	��=�l�q[٦D&-7�;��Q�ǰ�n��6|)�+�V�uS��o�0�fGS0_<Z�������/E;�Nz��7�n[1HS�J��9���n�SL���A?�c]�>�A�$�WK�>R�L��+����j��$�$ZB������fj�4��PLढ़����+���3Ж�+�mO7���+�g�m���<v���}�%~������Ƈ�<�W@����&?��o]�(�2�fTv7,R�J`�����A�S$�)04���v�Oi$�O\3o\��.�<��cs3�
�{f���h�J��f���;6�4�����;�D������o;�GJ��RdSe���6��A�&^OɌ��������r �����bG@rMd�~���:�$ˉ]��;��~�G��t��ze�2��������/N�H�m'487��,i�9�o�Z[��וܜaR�Y�k��j����At�tn��E䫉�!�@`hn�O�~�&rX�`H�ܝ��ٓ�]��k��厭V��V"������Z�p1*7� [�$+ɦ�CL��9%?>���>2�Ds�j{O�[:�BD0¬� �Av�e�ߛ��->^u����tXGg ���ؘ��3������;҄��Yg?��������R�-<�|�7���\�
�}���K�q��F�/����N���'�����M�W��j	~���C	��\�=�.�	gM�{�e��C	a}����`ԣҿ�S�D,;m2+3��~C�jb��o���L�Bm������\&���
�|!�.���d!)��l!�)��B1��	��,�����M$��c�5��o�T���#�O����'�B���      �   F   x�3���?� O�$Hfpq:gې���,h�Rtl��݋K�L��w�U82��R�w7�r��qqq �_ U     