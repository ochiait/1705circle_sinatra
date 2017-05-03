require 'rubygems'
require 'bundler'

Bundler.require

set :database, {adapter: "sqlite3", database: "messages.sqlite3"}

class Message < ActiveRecord::Base
  validates_presence_of :content
end

get '/' do
  @messages = Message.all
  erb :index
end

post '/new' do
    Message.create({:content => params[:content]})
    redirect '/'
end
