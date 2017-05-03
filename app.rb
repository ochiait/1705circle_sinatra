require 'rubygems'
require 'bundler'

Bundler.require

set :database, {adapter: "sqlite3", database: "messages.sqlite3"}

class Message < ActiveRecord::Base
  validates_presence_of :content
end

get '/' do

  erb :index
end

get '/message_new' do
  erb :form
end

post '/messages' do
  content = params[:content]
  message = Message.new({content: content})
  message.save
  redirect :result
end

get '/result' do
  @messages = Message.all
  erb :result
end
