require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb :index
end

get '/contact_new' do
  erb :form
end

post '/contacts' do
  @name = params[:name]
  erb :result
end
