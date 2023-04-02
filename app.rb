require 'sinatra'
require "sinatra/reloader"

set :bind, '0.0.0.0'

get '/' do
  [
    200,
    { "Access-Control-Allow-Origin" => "*" },
    '<h1>Simple and fast web/api server. using sinatra & thin</h1><h2>Usage: /api/delay?sec=3</h2>'
  ]
end

# fetch("http://localhost:3000/api/delay?sec=1", {headers:{"Content-Type": "application/json"}}).then(a => a.text()).then(console.log)
get '/api/delay' do
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
  ""
end