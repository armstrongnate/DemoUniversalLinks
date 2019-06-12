require 'sinatra'

set :bind, '0.0.0.0'
set :port, 8080

get '/hello' do
  'Put this in your pipe & smoke it!'
end

get '/redirect' do
  redirect 'https://sso.canvaslms.com/canvas/login'
end
