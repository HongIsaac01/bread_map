INSERT INTO public.bread(name_kr, name_world, classification, dough_type, baking_method, 
	bread_style, fermentation_method, detailed_description, country)
	VALUES ('바이스브로트', 'Weissbrot', '바이첸브로트', 'Lean', '직접 굽기', 
	        '식사 빵', '빵효모', 
			'[
				"독일인이 즐겨 먹는 흰 빵<br>밀가루 100%로 만든 흰 빵",
				"Weiss가 희다 라는 의미",
				"원래는 밀 재배가 활발한 독일 남부에서 먹었으나 현재는 전역에서 즐겨 먹음",
				"겉은 바삭하고 고소하며 속은 부드러운 식감",
				"가벼움이 맛의 포인트",
				"식사에 곁들이거나 토스트로 버터, 잼, 치즈를 바르거나 샌드위치용으로도 사용",
				"폭신한 느낌 때문에 씹는 맛이 있는 햄보다는 부드러운 식감의 재료와 잘 어울림",
				"포피시드(PoppySeed/양귀비씨앗)나 깨를 토핑하는 경우도 많고 형태는 둥근형, 반달형, 원로프(One Loaf)형태에 땋은 모양을 얹는등 각양 각색",
				"색이 짙은 밀가루를 사용한 할바이스브로트(Halbweissbrot)라는 빵도 존재",
				"속까지 노릇노릇 굽는 것이 맛의 포인트<br>색이 짙을수록 맛이 좋음"
			]'::json, 'Germany');

INSERT INTO public.bread(name_kr, name_world, classification, dough_type, baking_method, 
	bread_style, fermentation_method, detailed_description, country)
	VALUES ('세이렌', 'Seelen', '바이첸브로트', 'Lean', '팬 굽기', '식사 빵', '빵효모(장시간)', 
			'[
			  "깔끔한 맛과 토핑이 돋보이는 빵",
			  "물을 충분히 사용한 소형 밀빵",
			  "독일 남서부의 슈바벤(Schwaben) 지방에서 위령의 날을 맞이하기 위해 처음 제작",
			  "물의 양을 늘리고 밀 가루를 최소한으로 사용하려고 했던 선인의 지혜가 돋보이는 빵",
			  "수분이 많아서 반죽은 부드럽고 묽기때문에 손에 물을 묻혀서 성형",
			  "길쭉하고 살짝 뒤틀린 형태로 표면에 캐러웨이 시드(Caraway Seed/독일식 양배추 절임인 사우어크라우트(Sauerkraut)를 만들때 쓰이는 향신료)나 굵은 소금을 뿌리는 것이 기본",
			  "겉은 두껍고 바삭하며 속은 쫄깃하고 쫀득",
			  "물을 많이 첨가할수록 전분이 풀처럼 되어 쫀득한 식감을 만듦",
			  "식사에 곁들여도 좋고 와인이나 맥주 안주로 제격",
			  "반으로 갈라서 오픈 샌드위치를 만드는 것도 추천",
			  "캐러웨이 시드나 굴은 소금외에도 깨와 치즈 등 가게마다 다양한 토핑을 얹음"
			]'::json, 'Germany');

INSERT INTO public.bread(name_kr, name_world, classification, dough_type, baking_method, 
	bread_style, fermentation_method, detailed_description, country)
	VALUES ('로젠베켄', 'Rosenwecken', '바이첸브로트', 'Lean', '직접 굽기', '식사빵', '빵효모',
			'[
			  "한 입 크기의 장미꽃 한 송이",
			  "독일이나 오스트리아에서는 주 원료를 밀가루로 사용한 동일한 반죽으로도 다양한 종류의 소형빵을 만들며 대표적인 빵이 카이저 젬멜과 로젠베켄임",
			  "독일 남부에서는 소형 빵을 젬멜(Semmel), 또는 베켄(Wecken)이라 부름",
			  "장미꽃 모양이 특징",
			  "로젠브뢰첸(Rosenbrötchen)이라고도 불림",
			  "갓 구운 빵은 겉이 바삭바삭하고 가벼운 식감",
			  "시간이 지나면 빵 속 수분이 겉으로 이동해 고무처럼 딱딱해짐",
			  "현지에서는 구운지 2~3시간 이내의 빵만 진열",
			  "반으로 갈라 버터와 잼을 바르거나 샌드위치로 만들어 먹는 것을 추천",
			  "맛있게 구워지면 윤이나고 갈색빛이 도는 황금색",
			  "표면에 치즈 같은 토핑을 얹기도 함"
			]'::json, 'Germany');

INSERT INTO public.bread(name_kr, name_world, classification, dough_type, baking_method, 
	bread_style, fermentation_method, detailed_description, country)
	VALUES ('라우겐브레첼', 'Laugenbrezel', '바이첸브로트', 'Lean', '팬에 굽기', '식사 빵', '빵효모(단시간)',
			'[
			  "브레첼(Brezel)은 라틴어로 작은 팔이라는 말에서 유래",
			  "모양이 사랑을 의미한다는 설도 존재",
			  "팔짱을 낀 듯한 독특한 형태로 독일에서는 빵집의 상징으로 여겨짐",
			  "최종 발효 후에 반죽을 라우겐 용액(3~4%의 가성 소다를 첨가한 알칼리성 액체)에 담가 두면 광택이 나는 적갈색으로 구워짐",
			  "코팅은 빵이 마르지 않도록 막아주는 역할",
			  "브레첼은 딱딱한 식감으로 알려져 있지만 현지에서는 말랑말랑하고 쫀득한 식감이 일반적",
			  "달콤한 타입이나 둥그런 형태 등 종류와 형태, 크기는 지역과 가게에 따라 천차만별",
			  "샌드위치로 만들 때는 수평으로 자름",
			  "굵은 부분에 칼집을 내어 무염 버터를 바르거나 누텔라 등을 발라도 맛있음"
			]'::json, 'Germany');

INSERT INTO public.bread(name_kr, name_world, classification, dough_type, baking_method, 
	bread_style, fermentation_method, detailed_description, country)
	VALUES ('바이첸미슈브로트', 'Weizenmischbrot', '바이첸미슈브로트', 'Lean', '팬에 굽기', '식사 빵', '빵효모와 호밀 사워종',
			'[
			  "가벼운 산미의 순한 맛",
			  "미슈(Misch)는 섞다라는 뜻",
			  "밀가루 60~80%, 호밀가루 40~20%의 배합률",
			  "독일에서도 가장 소비량이 많은 빵 중 하나",
			  "밀가루가 많이 들어갈수록 색이 하얗고 거칠어짐",
			  "형태는 보통 반달 모양이고 표면에 칼집을 듬성듬성 내거나 생지에 캐러웨이 시드를 넣어 반죽한 경우도 많음",
			  "촉촉한 식감과 무난한 산미로 부담없이 먹을 수 있음",
			  "식사에 곁들여서 그대로 먹는 것이 가장 일반적이지만 페이스트, 또는 리예트(Rillettes)[돼지나 거위 고기에 열을 가해 만든 스프레드]를 바르거나 버터와 치즈, 채소, 안초비 등을 얹어서 오픈 샌드위치로 만들어 먹어도 맛이 좋음",
			  "따듯하게 데우면 향이 짙어지므로 얇게 슬라이스해서 구운 다음, 버터나 잼을 바르는 것을 추천",
			  "오래 보존할 수 있어서 4~5일 동안 먹을 수 있음"
			]'::json, 'Germany');
			
INSERT INTO public.bread(name_kr, name_world, classification, dough_type, baking_method, 
	bread_style, fermentation_method, detailed_description, country)
	VALUES ('슈바르츠발트브로트', 'Schwarzwälderbrot', '바이첸미슈브로트', 'Lean', '직접 굽기', '식사 빵', '빵효모와 밀가루 사워종',
			'[
			  "검은 숲을 의미하는 빵",
			  "독일 나부의 국경 슈바르츠발트(Schwarzwald)지방의 전통 빵",
			  "밀가루가 중심이기 때문에 바이첸미슈브로트로 분류",
			  "둥근형이나 반달형이 일반적",
			  "슈바르츠발트에는 검은 숲이라는 의미가 있음",
			  "검은 숲을 형상화한 빵도 존재",
			  "럼주에 절인 건포도와 무화가를 넣고 반죽한 다음, 표면에 당밀을 발라 검은색으로 굽는 빵도 존재하며 이런 빵은 묵직함과 씹는 맛이 있어, 건포도와 무화과 맛과 더불어 호밀빵 특유의 깊은 풍미를 느낄 수 있음",
			  "아무것도 넣지 않은 타입은 두툼하게 슬라이스해서 아침 대용으로, 또는 얇게 슬라이스하여 짭조름한 치즈나 크림치즈를 발라 먹음",
			  "건포도와 석류가 들어간 것은 레드 와인이나 산미가 적은 커피와 궁합이 좋음",
			  "슈바르츠밸더란드브로트라고도 함",
			  "호밀가루의 배합을 높여서 로겐미슈브로트로 분류하기도 함"
			]'::json, 'Germany');
			
INSERT INTO public.bread(name_kr, name_world, classification, dough_type, baking_method, 
	bread_style, fermentation_method, detailed_description, country)
	VALUES ('미슈브로트', '', '미슈브로트', 'Lean', '직접 굽기', '식사 빵', '빵효모와 호밀 사워종',
			'[
			  "호밀빵 특유의 산미도 있지만 밀가루가 절반 들어간 만큼 독특한 풍미를 완화시키기 때문에 비교적 먹기 수월",
			  "속이 꽉 찬 묵직함과 쫄깃쫄깃한 식감이 특징",
			  "형태는 반달형 외에 원형도 존재",
			  "겉에 칼집을 내는 방법도 여러 가지가 있는데 보통 사선 칼집을 냄",
			  "가로로 칼집을 내거나 막대기나 파이 롤러로 구멍을 뚫기도 함",
			  "얇게 슬라이스 해서 버터를 바르고 음식과 함께 먹음",
			  "치즈와 햄, 소시지, 채소 등 다양한 재료를 얹어서 오픈 샌드위치로 만드는 것도 추천",
			  "특유의 신맛이 와인이나 맥주 같은 술과도 잘 어울림",
			  "치즈와 햄, 소시지, 감자 등의 반찬에 곁들여 점심이나 저녁 때 즐겨 먹음"
			]'::json, 'Germany');

INSERT INTO public.bread(name_kr, name_world, classification, dough_type, baking_method, 
	bread_style, fermentation_method, detailed_description, country)
	VALUES ('베를리너 란드브로트', 'Berliner Landbrot', '로겐미슈브로트', 'Lean', '직접 굽기', '식사 빵', '빵효모와 호밀 사워종',
			'[
			  "독일 북동부의 베를린 근교에서 만들어진 데서 유래한 이름",
			  "란드브로트(Landbrot)는 시골 빵이라는 의미",
			  "촘촘한 입자와 색깔은 독일빵 특징",
			  "갈라진 모양은 성형을 하고 나서 호밀가루를 뿌리고 최종 발효 단계가 되면 살짝 건조시킨 표면이 갈라지면서 형성",
			  "금이 심하게 갈수록 맛이 좋다고 여김",
			  "속은 촘촘하고 식감은 촉촉함",
			  "얇게 슬라이스하여 맛이 짙은 파테(Pâté,고기나 생선을 곱게 다지고 양념해 식혀 먹는 음식)나 햄, 치즈와 함께 먹거나 찜 요리에 곁들여서 먹는 방법이 일반적",
			  "진한 맛의 요리와 함께 먹으면 산미가 입안을 개운하게 함",
			  "미리 잘라 놓고 파는 경우도 있음",
			  "구운 지 7~8시간 뒤에 먹는 것이 좋으며 완전히 식히고 나서 잘라야 함"
			]'::json, 'Germany');
INSERT INTO public.bread(name_kr, name_world, classification, dough_type, baking_method, 
	bread_style, fermentation_method, detailed_description, country)
	VALUES ('로겐브뢰첸', 'Roggenbrötchen', '로겐미슈브로트', 'Lean', '직접 굽기', '식사 빵', '빵효모와 호밀 사워종',
			'[
			  "호밀가루로 만든 작은 빵",
			  "독일 소형 빵은 모두 브뢰첸(brötchen)이라 부름",
			  "로겐(Roggen)이 붙으면 보통 호밀가루가 중심인 빵을 가리키지만, 소형 빵으로 호밀가루를 많이 배합하면 잘 부풀지 않기 때문에 호밀가루와 밀가루를 50:50 비율로 배합하는 것이 일반적",
			  "가로로 얇게 슬라이스하면 쫄깃한 식감을 즐길 수 있음",
			  "얇게 잘라서 버터나 잼을 바르거나 짭조름한 생 햄과 채소를 넣고 샌드위치를 만들어도 맛있음"
			]'::json, 'Germany');

INSERT INTO public.bread(name_kr, name_world, classification, dough_type, baking_method, 
	bread_style, fermentation_method, detailed_description, country)
	VALUES ('빈슈가우어', 'Vinschgauer', '로겐미슈브로트', 'Lean', '직접 굽기', '식사 빵', '빵효모와 호밀 사워종',
			'[
			  "한입 베어 무는 순간 산뜻한 향이 물씬인 빵",
			  "이탈리아와 오스트리아 사이에 위치한 티롤 지방의 도시 이름",
			  "독일의 지배가 오스트리아까지 영향을 미쳤던 시대에 제작",
			  "호밀가루가 주재료이며 생지에 클로버(티롤 지방에서 채취할 수 있는 허브)나 캐러웨이 시드 등이 들어가기 때문에 향이 강함",
			  "빵 속의 식감은 물이 충분히 들어가서 촉촉함",
			  "클로버를 구할 수 없을 때는 다른 향신료를 첨가하여 만들기도 함"
			]'::json, 'Germany');
INSERT INTO public.bread(name_kr, name_world, classification, dough_type, baking_method, 
	bread_style, fermentation_method, detailed_description, country)
	VALUES ('로겐자프트브로트', 'Roggensaftbrot', '로겐브로트', 'Lean', '틀에 굽기', '식사 빵', '빵효모와 호밀 사워종',
			'[
			  "있는 그대로의 산미",
			  "자프트(Saft)는 주스라는 의미로 반죽에 수분을 많이 배합하는 것이 특징",
			  "호밀가루를 100% 사용하고 산미가 강하여 입자가 빽빽함",
			  "여러 개의 반죽을 하나로 연결해서 굽기 때문에 측면에 크러스트(Crust)가 만들어지지 않고 부드러운 식감으로 완성 됨",
			  "반죽을 연결해서 구운 빵은 수분이 많이 남아 촉촉한 식감을 오래 즐길 수 있음",
			  "호밀가루의 비율이 높은 만큼 사워종의 양도 많아지기 때문에 시큼한 산미가 강하게 느껴지고, 인 같은 술과 제법 잘 어울림",
			  "얇게 슬라이스하여 굽지 않은 채로 잼을 바르거나 진한 치즈와 이탈리아 식 소시지인 살라미(Salami)를 올려 먹으면 맛있음",
			  "소화가 잘 되기 때문에 가볍게 샌드위치로 먹는 것을 추천",
			  "산미가 부담스러울 때는 달콤한 생크림이나 꿀을 바르면 한결 먹기 좋음",
			  "호밀 전립분이 포함되어 있어 섬유질이 풍부하고 소화가 잘 됨",
			  "취향대로 구워먹어도 맛있음"
			]'::json, 'Germany');

INSERT INTO public.bread(name_kr, name_world, classification, dough_type, baking_method, 
	bread_style, fermentation_method, detailed_description, country)
	VALUES ('로겐폴콘브로트', 'Roggenvollkornbrot', '로겐브로트', 'Lean', '틀에 굽기', '식사 빵', '호밀 사워종과 빵효모(소량)',
			'[
			  "오독오독 씹는 맛이 살아있는 곡물의 구수함",
			  "폴(Voll)은 전체, 콘(Korn)은 곡물이라는 뜻",
			  "호밀 전립분을 사용한 빵을 로겐폴콘브로트(Roggenvollkornbrot)라고 부름",
			  "호밀 전립분 100%로 만든 빵이나 밀가루와 통보리, 보리, 조, 피, 대두 등 다양한 곡물을 넣음",
			  "로겐슈로트브로트(Roggenschrotbrot)[굵은 가루를 사용한 빵]의 하나로, 식이 섬유가 풍부하고 건강식을 지향하는 사람에게 인기가 높음",
			  "전립분의 알갱이가 입에 남기 때문에 카페 라테 처럼 부드러운 음료와 잘 어울림",
			  "강한 산미 덕에 와인과 궁합이 좋음",
			  "얇게 슬라이스 하여 훈제 연어나 치즈, 리버 페이스트(Liver Paste)[소나 돼지의 간을 졸여 만든 식품]등 맛이 진한 것을 발라 먹으면 맛있음",
			  "간식으로 크림치즈와 꿀을 발라 먹는 것도 추천",
			  "토스트를 하면 곡물 알갱이의 구수한 맛을 즐길 수 있음",
			  "구운 다음날 먹으면 더 맛있음"
			]'::json, 'Germany');
			
INSERT INTO public.bread(name_kr, name_world, classification, dough_type, baking_method, 
	bread_style, fermentation_method, detailed_description, country)
	VALUES ('펌퍼니켈', 'Pumpernickel', '로겐브로트', 'Lean', '틀에 굽기', '식사 빵', '빵효모',
			'[
			  "쪄서 만드는 검은색 전통 빵",
			  "호밀 전립분으로 만드는 로겐슈로트브로트의 하나",
			  "밀가루 알갱이가 들어가기도 함",
			  "원래는 독일 북부의 베스트팔렌(Westfalen)지방에서 만들어진 전통 빵이지만 현재는 독일 전역에서 즐겨 먹음",
			  "뜨거운 물을 부은 오븐에서 보통 4시간, 길게는 20시간 동안 굽는 것이 특징",
			  "쌀밥처럼 촉촉한 수분감을 느낄 수 있음",
			  "쫀득쫀득한 빵 속은 호밀과 캐러멜의 달콤함이 물씬 느껴짐",
			  "호밀가루를 100% 사용하지만 산미가 강하지 않기 때문에 심플하게 버터만 발라먹기 좋음",
			  "얇게 슬라이스하여 햄 또는 연어, 사워 크림, 크림치즈 등을 얹거나 감칠맛이 나는 페이스트를 발라도 잘 어울림",
			  "크림 스튜 등의 찜 요리에 곁들이는 것도 추천",
			  "구운 다음날 먹으면 좋고, 일주일 동안 보존이 가능",
			  "냉동 보관을 하는 것이 좋음"
			]'::json, 'Germany');

INSERT INTO public.bread(name_kr, name_world, classification, dough_type, baking_method, 
	bread_style, fermentation_method, detailed_description, country)
	VALUES ('슈톨렌', 'Stollen', '해당 없음', 'Rich', '팬에 굽기', '발효 과자', '빵효모',
			'[
			  "잘 알려진 크리스마스 대표 과자",
			  "크리스마스 과자로 잘 알려짐",
			  "어원은 예수의 요람 모양 혹은 예수를 감싼 모포의 모양에서 비롯되었다고 함",
			  "럼주와 벌꿀에 절인 건조 과일과 견과류, 살타나 씨없는 건포도가 듬뿍 들어감"
			]'::json, 'Germany');

INSERT INTO public.bread(name_kr, name_world, classification, dough_type, baking_method, 
	bread_style, fermentation_method, detailed_description, country)
	VALUES ('로지넨브뢰첸', 'Rosinenbrötchen', '해당 없음', 'Rich', '팬에 굽기', '과자 빵', '빵효모',
			'[
			  "남녀노소에게 인기 만점, 새콤달콤한 건포도 빵",
			  "밀가루에 달걀이나 버터를 넣은 과자 반죽에 건포도를 섞은 소형 빵",
			  "쉽게 생각하면 건포도 빵",
			  "\"로지넨브로트(Rosinenbrot)\"는 대형 빵(250g)을 말하며, 호밀가루를 사용하는 경우가 많음",
			  "새콤달콤한 건포도 맛",
			  "빵 속의 입자는 거칠지만 부드럽고 촉촉함"
			]'::json, 'Germany');

INSERT INTO public.bread(name_kr, name_world, classification, dough_type, baking_method, 
	bread_style, fermentation_method, detailed_description, country)
	VALUES ('슈트로이젤쿠헨', 'Streuselkuchen', '해당 없음', 'Rich', '팬에 굽기', '과자 빵', '빵효모',
			'[
			  "바삭바삭한 소보로가 핵심",
			  "커스터드 크림과 버터, 밀가루, 설탕으로 만든 소보로를 빵 위에 뿌린 달콤한 빵",
			  "슈트로이젤(Streusel)은 소보로를 의미",
			  "쿠헨(Kuchen)은 과자, 케이크를 의미",
			  "제과용 밀가루 반죽을 팬에 크게 구워서 먹기 쉬운 크기로 자름",
			  "팬에 굽는 형태의 과자는 독일 북부에서 발달",
			  "부슬부슬한 소보로의 식감이 매력적"
			]'::json, 'Germany');

INSERT INTO public.bread(name_kr, name_world, classification, dough_type, baking_method, 
	bread_style, fermentation_method, detailed_description, country)
	VALUES ('베를리너 판쿠헨', 'Berliner Pfannkuchen', '해당 없음', 'Rich', '', '도넛 과자', '빵효모',
			'[
			  "잼이 들어간 독일의 튀김 과자",
			  "판쿠헨(Pfannkuchen)은 도넛의 원형으로도 불리며, 건포도가 들어간 반죽을 기름에 튀겨서 안에 잼을 넣는 것이 대표적인데 지역에 따라 종류는 다양함",
			  "베를리너 판쿠헨은 베를린 지방에서 만들어진 튀김 과자로, 1756년에 베를린의 제빵사에 의해 만들어짐",
			  "전쟁이 한창일 때 신체적인 이유로 군인으로서 나라에 공헌할 수 없던 제빵사는 군인들을 위해 오븐이 없는 환경에서도 냄비만 있으면 만들 수 있는 빵을 개발",
			  "큰 냄비(팬)로 튀겼다고 하여 판쿠헨(Pfannkuchen)으로 불리게 됨",
			  "밀가루 반죽을 기름에 튀긴 다음 빵 안에 잼을 주입하고 슈거 파우더를 듬뿍 뿌려서 완성",
			  "안에 들어가는 잼은 라즈베리나 크랜베리, 살구 잼 등"
			]'::json, 'Germany');


INSERT INTO public.bread(name_kr, name_world, classification, dough_type, baking_method, 
	bread_style, fermentation_method, detailed_description, country)
	VALUES ('몬슈네켄', 'Mohnschnecken', '해당 없음', 'Rich', '팬에 굽기', '과자 빵', '빵효모',
			'[
			  "한국에 단팥빵이 있다면 독일은 몬슈네켄",
			  "포피 시드와 우유를 달짝지근하게 조려서 만든 몬 페이스트(Mohn Paste)를 반죽 속에 넣고 돌돌 말아서 구운 과자 빵",
			  "슈네켄(Schnecken)은 달팽이를 의미",
			  "보통 아이싱(Icing)으로 표면을 코팅하며, 우리나라의 단팥처럼 몬 페이스트에 호두가 들어가기도 함",
			  "바삭바삭한 식감과 포피 시드의 풍미가 고소함",
			  "빵을 구운 직후 바삭바삭할 때 먹어야 맛이 좋음"
			]'::json, 'Germany');
			
INSERT INTO public.bread(name_kr, name_world, classification, dough_type, baking_method, 
	bread_style, fermentation_method, detailed_description, country)
	VALUES ('누스슈네켄', 'Nussschnecken', '해당 없음', 'Rich', '팬에 굽기', '과자 빵', '빵효모',
			'[
			  "견과류의 고소함이 커피에 딱",
			  "독일어로 누스(Nuss)는 나무 열매를 의미",
			  "호두나 헤이즐넛 등의 견과류 페이스트를 제과용 반죽 또는 데니시(Danish) 반죽에 넣어 소용돌이 모양으로 성형",
			  "바삭바삭 고소한 빵의 식감, 시나몬과 버터 향 속의 씁쓰레한 견과류는 제법 어른스러운 맛",
			  "씀쓰레한 견과류와 달콤한 빵의 조화는 블랙 커피나 우유가 듬뿍 들어간 카페 라테와 찰떡 궁합"
			]'::json, 'Germany');

