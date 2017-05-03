require 'rubygems'
require 'bundler'

Bundler.require

get '/' do
  erb :index
end

get '/message_new' do
  erb :form
end

post '/messages' do
  @name = params[:name]
  erb :result
end
