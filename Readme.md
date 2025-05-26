# Simple Api server for delayed response

遅延する時間とレスポンス（http status codeとbody）を簡単に変更できるAPI

ローカルで遅延を起こせるAPIサーバーを立てて、[ngrok](https://ngrok.com/)を使ってインターネット経由で呼べるような仕組みを作った。


## 利用方法
当時作成したAPIサーバーは python flaskで作成したが、ここでは、rubyのsinatraを紹介します。（個人的にはこっちの方が直感的に色々設定しやすい）
利用方法は、[Source code (git)](https://github.com/yusungkim/delay_api)をダウンロードし、docker-composeで起動するだけ。
### ローカル起動
```bash
# api start
$ docker-compose up
```

### インターネットからアクセス
ローカルではなく、クラウド環境など運用中のサーバーで確認したい場合は、ngrokを使うと便利です。
ローカルで起動したサーバーをインターネットからアクセスできます。

```bash
# ローカルの6000ポートをインターネットに公開
$ ngrok http 6000

# ...(中略)
# Forwarding                    https://fc70-119-173-192-139.jp.ngrok.io -> http://localhost:6000

# 上の「Forwarding」に記載されているurlを使ってローカルのAPIサーバーにrequest
$ curl https://fc70-119-173-192-139.jp.ngrok.io/api/delay
# {"status":200,"delayed_sec":1,"inputs":{},"usage":"/api/timeout?sec=1&status=200"}
```

## その他

### APIの設定
GET リクエストとqueryから遅延する時間、返すhttp status codeを決めていますが、お好みに合わせて簡単に修正可能です。
POSTリクエストへの変更や headerの追加も直感的にできます。
文法は[sinatraのdoc](https://github.com/sinatra/sinatra#routes)を参照してください。

```bash
# 遅延API
get '/api/delay' do
  # inputs
  delay_sec = params["sec"]&.to_i || 1
  res_status = params["status"]&.to_i || 200

  # headers
  content_type 'application/json'
  headers "Access-Control-Allow-Origin" => "https://yusungkim.com"

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
```

```bash
# API 応答例
# /api/delay?sec=2&status=504
{
  "status": 504,
  "delayed_sec": 2,
  "inputs": {
    "sec": "2",
    "status": "504"
  },
  "usage": "/api/delay?sec=1&status=200"
}
```

### ポート番号の変更

ローカルで利用するときにポート番号を他のにしたい場合は、docker-compose.ymlを変更してくだい。
例えばポート3001を使いたい場合は、下記のように変更してください。

```bash
# docker-compose.yml
# ...中略
services:
  app:
    build:
      context: .
    ports:
#      - 6000:6000  # original
      - 3001:6000   # 3001を利用したい場合
```
