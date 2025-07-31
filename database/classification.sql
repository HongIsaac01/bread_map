INSERT INTO public.classification(name_kr, name_en, standard, detailed_description, country_id)
	VALUES ('바이첸브로트', 'Weizenbrot', 'Mixing Ratio', '["밀가루", "90~100%"]'::json, 1);
INSERT INTO public.classification(name_kr, name_en, standard, detailed_description, country_id)
	VALUES ('미슈브로트', 'Mischbrot', 'Mixing Ratio', '["밀가루, 호밀가루", "50:50"]'::json, 1);
INSERT INTO public.classification(name_kr, name_en, standard, detailed_description, country_id)
	VALUES ('로겐미슈브로트', 'Roggenmischbrot', 'Mixing Ratio', '["밀가루, 호밀가루", "호밀가루 위주"]'::json, 1);
INSERT INTO public.classification(name_kr, name_en, standard, detailed_description, country_id)
	VALUES ('로겐브로트', 'Roggenbrot', 'Mixing Ratio', '["호밀가루", "90~100%"]'::json, 1);
INSERT INTO public.classification(name_kr, name_en, standard, detailed_description, country_id)
	VALUES ('바이첸미슈브로트', 'Weizenmischbrot', 'Mixing Ratio', '[]'::json, 1);

INSERT INTO public.classification(name_kr, name_en, standard, detailed_description, country_id)
	VALUES ('해당 없음', 'None', 'None', '[]'::json, 7);

INSERT INTO public.classification(name_kr, name_en, standard, detailed_description, country_id)
	VALUES ('슈로트브로트', 'Schrotbrot', 'Powder type','["굵은 가루"]'::json, 1);

INSERT INTO public.classification(name_kr, name_en, standard, detailed_description, country_id)
	VALUES ('폴콘브로트', 'Vollkornbrot', 'Powder type', '["전립분"]'::json, 1);

INSERT INTO public.classification(name_kr, name_en, standard, detailed_description, country_id)
	VALUES ('브뢰첸', 'Brötchen', 'Powder type','["그 외"]'::json, 1);

INSERT INTO public.classification(name_kr, name_en, standard, detailed_description, country_id)
	VALUES (
	'바게트/바타르/팽 오 트래디셔널', 
	'Baguette/Batard/Pain au Traditionnel',
	'Mixing Ratio',
	'["밀가루, 빵효모, 물, 소금만을 사용", "바삭바삭한 식감과 밀가루의 풍미를 즐길 수 있음"]'::json, 2);
INSERT INTO public.classification(name_kr, name_en, standard, detailed_description, country_id)
	VALUES (
	'비에누아즈리', 
	'Viennoiserie',
	'Mixing Ratio',
	'["버터를 층층이 넣은 크루아상과 브리오슈 같은 리치 타입의 빵", "비엔나 풍 과자라는 뜻"]'::json, 2);
INSERT INTO public.classification(name_kr, name_en, standard, detailed_description, country_id)
	VALUES (
	'팽 드 캉파뉴', 
	'Pain de Campagne',
	'Mixing Ratio',
	'["호밀가루를 섞음", "골빵이라 불림",
	  "제조법이나 형태는 지방마다 다름",
	  "천연 발효를 하고, 장시간 발효시키기 때문에 발효에 따른 향, 산미, 그리고 촉촉한 식감이 특징",
	  "바게트나 크루아상보다 오래 보존할 수 있음"]'::json, 
	2);