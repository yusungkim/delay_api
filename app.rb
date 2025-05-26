require 'sinatra'
require "sinatra/reloader"

set :bind, '0.0.0.0'
set :host_authorization, { permitted_hosts: [] }

get '/' do
  [
    200,
    { "Access-Control-Allow-Origin" => "*" },
    '<h1>Simple and fast web/api server. using sinatra & thin</h1><h2>Usage: /api/delay?sec=3</h2>'
  ]
end

get '/journalInfo' do
	# response body
	{
		"status" => 200,
		"params" => params,
		"headers" => request.env.select { |k, v| k.start_with?("HTTP_") }
	}.to_json
end

# {:bbno=>"20240410100875,20240410100866,20240410100863,20240123100576,20240410100860,20240410100857,20240410100855,20240410100253,20240410100851,20240410100807,20240410100927"}
post '/aps_system/getShodan/purchaseList' do
  puts request.env
  content_type 'application/json'
  headers "Access-Control-Allow-Origin" => "*"
  status 200
  {
	"code": "200",
	"count": 3,
	"shodans": [
		{
			"satei": {
				"BB_NO": 20240410100023,
				"SHODAN_KANRI_NO": "NE2024041001730",
				"SHODAN_KANRI_EDA_NO": "2",
				"TEMPO_CD": "G01175",
				"SATEI_UKETSUKE_YMD": "2024-04-10 00:00:00",
				"SATEI_NO": 23,
				"SHODAN_SHUBETSU_CD": "1",
				"SHODAN_BUNRUI_CD": "4",
				"SHODAN_BUNRUI_NAME": "成約",
				"SHODAN_BUNRUI_KIGO": "☆",
				"SHODAN_JOKYO_CD": "8",
				"SHODAN_JOKYO_NAME": "成約",
				"SHODAN_JOKYO_KIGO": "☆",
				"KJ_KEISAI_SHODAKU_FLG": nil,
				"KJ_KEISAI_JIKI_CD": nil,
				"KJ_KIBO_KINGAKU": nil,
				"TEIJI_KINGAKU": nil,
				"KIBO_KINGAKU": nil,
				"TANTO_SHAIN_NO": "191010",
				"SHIMEI": "阿部 竜也",
				"SEIYAKU_KINGAKU": 3201000.0
			},
			"kokyaku_info": {
				"KOKYAKU_NO": "CU2024041000940",
				"KOKYAKU_SHUBETSU_CD": 1,
				"KOKYAKU_KANA_SEI": "トキタ",
				"KOKYAKU_KANA_MEI": "マイ",
				"KOKYAKU_KANJI_SEI": "時田",
				"KOKYAKU_KANJI_MEI": "舞",
				"MAIL": nil,
				"MAIL_KEITAI": nil,
				"TEL": nil,
				"TEL_KEITAI": "090-7947-4974",
				"SEINENGAPPI": "1984-08-18",
				"ZIP": "2993255",
				"TODOFUKEN_CD": "12",
				"JUSHO1": "大網白里市みどりが丘",
				"JUSHO2": "４－３７－２６"
			}
		},
    {
			"satei": {
				"BB_NO": 20240410100023,
				"SHODAN_KANRI_NO": "NE2024041001730",
				"SHODAN_KANRI_EDA_NO": "2",
				"TEMPO_CD": "G01175",
				"SATEI_UKETSUKE_YMD": "2024-04-10 00:00:00",
				"SATEI_NO": 9923,
				"SHODAN_SHUBETSU_CD": "1",
				"SHODAN_BUNRUI_CD": "4",
				"SHODAN_BUNRUI_NAME": "成約",
				"SHODAN_BUNRUI_KIGO": "☆",
				"SHODAN_JOKYO_CD": "8",
				"SHODAN_JOKYO_NAME": "成約",
				"SHODAN_JOKYO_KIGO": "☆",
				"KJ_KEISAI_SHODAKU_FLG": nil,
				"KJ_KEISAI_JIKI_CD": nil,
				"KJ_KIBO_KINGAKU": nil,
				"TEIJI_KINGAKU": nil,
				"KIBO_KINGAKU": nil,
				"TANTO_SHAIN_NO": "191010",
				"SHIMEI": "阿部 竜也",
				"SEIYAKU_KINGAKU": 3201000.0
			},
			"kokyaku_info": {
				"KOKYAKU_NO": "CU2024041000940",
				"KOKYAKU_SHUBETSU_CD": 1,
				"KOKYAKU_KANA_SEI": "トキタ",
				"KOKYAKU_KANA_MEI": "マイ",
				"KOKYAKU_KANJI_SEI": "時田",
				"KOKYAKU_KANJI_MEI": "舞",
				"MAIL": nil,
				"MAIL_KEITAI": nil,
				"TEL": nil,
				"TEL_KEITAI": "090-7947-4974",
				"SEINENGAPPI": "1984-08-18",
				"ZIP": "2993255",
				"TODOFUKEN_CD": "12",
				"JUSHO1": "大網白里市みどりが丘",
				"JUSHO2": "４－３７－２６"
			}
		},
		{
			"satei": {
				"BB_NO": 20240410100026,
				"SHODAN_KANRI_NO": "NE2024041000334",
				"SHODAN_KANRI_EDA_NO": "2",
				"TEMPO_CD": "G01302",
				"SATEI_UKETSUKE_YMD": "2024-04-10 00:00:00",
				"SATEI_NO": 26,
				"SHODAN_SHUBETSU_CD": "1",
				"SHODAN_BUNRUI_CD": "2",
				"SHODAN_BUNRUI_NAME": "商談中",
				"SHODAN_BUNRUI_KIGO": "△",
				"SHODAN_JOKYO_CD": "3",
				"SHODAN_JOKYO_NAME": "商談中(40～21%)",
				"SHODAN_JOKYO_KIGO": "△",
				"KJ_KEISAI_SHODAKU_FLG": 0,
				"KJ_KEISAI_JIKI_CD": nil,
				"KJ_KIBO_KINGAKU": nil,
				"TEIJI_KINGAKU": 250000.0,
				"KIBO_KINGAKU": nil,
				"TANTO_SHAIN_NO": "100072",
				"SHIMEI": "遠藤 幸雄",
				"SEIYAKU_KINGAKU": nil
			},
			"kokyaku_info": {
				"KOKYAKU_NO": "CU2021022000560",
				"KOKYAKU_SHUBETSU_CD": 1,
				"KOKYAKU_KANA_SEI": "ミヤジマ",
				"KOKYAKU_KANA_MEI": "サクジ",
				"KOKYAKU_KANJI_SEI": "宮島",
				"KOKYAKU_KANJI_MEI": "作司",
				"MAIL": nil,
				"MAIL_KEITAI": nil,
				"TEL": "0256-45-4433 ",
				"TEL_KEITAI": nil,
				"SEINENGAPPI": "1944-08-24",
				"ZIP": "9591106",
				"TODOFUKEN_CD": "15",
				"JUSHO1": "三条市吉野屋",
				"JUSHO2": "１０５４－１"
			}
		},
    {
			"satei": {
				"BB_NO": 20240410100026,
				"SHODAN_KANRI_NO": "NE2024041000334",
				"SHODAN_KANRI_EDA_NO": "2",
				"TEMPO_CD": "G01302",
				"SATEI_UKETSUKE_YMD": "2024-04-10 00:00:00",
				"SATEI_NO": 9926,
				"SHODAN_SHUBETSU_CD": "1",
				"SHODAN_BUNRUI_CD": "2",
				"SHODAN_BUNRUI_NAME": "商談中",
				"SHODAN_BUNRUI_KIGO": "△",
				"SHODAN_JOKYO_CD": "3",
				"SHODAN_JOKYO_NAME": "商談中(40～21%)",
				"SHODAN_JOKYO_KIGO": "△",
				"KJ_KEISAI_SHODAKU_FLG": 0,
				"KJ_KEISAI_JIKI_CD": nil,
				"KJ_KIBO_KINGAKU": nil,
				"TEIJI_KINGAKU": 250000.0,
				"KIBO_KINGAKU": nil,
				"TANTO_SHAIN_NO": "100072",
				"SHIMEI": "遠藤 幸雄",
				"SEIYAKU_KINGAKU": nil
			},
			"kokyaku_info": {
				"KOKYAKU_NO": "CU2021022000560",
				"KOKYAKU_SHUBETSU_CD": 1,
				"KOKYAKU_KANA_SEI": "ミヤジマ",
				"KOKYAKU_KANA_MEI": "サクジ",
				"KOKYAKU_KANJI_SEI": "宮島",
				"KOKYAKU_KANJI_MEI": "作司",
				"MAIL": nil,
				"MAIL_KEITAI": nil,
				"TEL": "0256-45-4433 ",
				"TEL_KEITAI": nil,
				"SEINENGAPPI": "1944-08-24",
				"ZIP": "9591106",
				"TODOFUKEN_CD": "15",
				"JUSHO1": "三条市吉野屋",
				"JUSHO2": "１０５４－１"
			}
		},
		{
			"satei": {
				"BB_NO": 20240410100027,
				"SHODAN_KANRI_NO": "NE2024041000102",
				"SHODAN_KANRI_EDA_NO": "2",
				"TEMPO_CD": "G01360",
				"SATEI_UKETSUKE_YMD": "2024-04-10 00:00:00",
				"SATEI_NO": 27,
				"SHODAN_SHUBETSU_CD": "1",
				"SHODAN_BUNRUI_CD": "2",
				"SHODAN_BUNRUI_NAME": "商談中",
				"SHODAN_BUNRUI_KIGO": "△",
				"SHODAN_JOKYO_CD": "3",
				"SHODAN_JOKYO_NAME": "商談中(40～21%)",
				"SHODAN_JOKYO_KIGO": "△",
				"KJ_KEISAI_SHODAKU_FLG": 0,
				"KJ_KEISAI_JIKI_CD": nil,
				"KJ_KIBO_KINGAKU": nil,
				"TEIJI_KINGAKU": 650000.0,
				"KIBO_KINGAKU": nil,
				"TANTO_SHAIN_NO": "240041",
				"SHIMEI": "村田 正憲",
				"SEIYAKU_KINGAKU": nil
			},
			"kokyaku_info": {
				"KOKYAKU_NO": "CU2016092601289",
				"KOKYAKU_SHUBETSU_CD": 1,
				"KOKYAKU_KANA_SEI": "ヨシイ",
				"KOKYAKU_KANA_MEI": "ミツノリ",
				"KOKYAKU_KANJI_SEI": "吉井",
				"KOKYAKU_KANJI_MEI": "充則",
				"MAIL": nil,
				"MAIL_KEITAI": nil,
				"TEL": "0820-52-6292 ",
				"TEL_KEITAI": nil,
				"SEINENGAPPI": "1972-06-24",
				"ZIP": "7421503",
				"TODOFUKEN_CD": "35",
				"JUSHO1": "熊毛郡田布施町宿井",
				"JUSHO2": "２１５７－１"
			}
		}
	]
}.to_json
end

get '/api/health' do
  puts request.env
  content_type 'application/json'
  headers "Access-Control-Allow-Origin" => "*"
  status 200
  {
    "name" => "I am Server B"
  }.to_json
end

# fetch("http://localhost:3000/api/delay?sec=1", {headers:{"Content-Type": "application/json"}}).then(a => a.text()).then(console.log)
get '/api/delay' do
  puts request.env
  # inputs
  delay_sec = params["sec"]&.to_i || 1
  res_status = params["status"]&.to_i || 200

  # headers
  content_type 'application/json'
  headers "Access-Control-Allow-Origin" => "*"

  # delay
  sleep delay_sec

  # response http status
  status res_status

  # response body
  {
    "status" => res_status,
    "delayed_sec" => delay_sec,
    "inputs" => params,
    "usage" => "/api/timeout?sec=1&status=200"
  }.to_json
end

options '/api/delay' do
  status 204
  headers "Access-Control-Allow-Origin" => "*"
  headers "Access-Control-Allow-Headers" => "content-type"
  nil
end