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

get '/:id' do
  @message = Message.find(params[:id])
  p "#################"
  p params[:id]
  p "#################"
  erb :edit
end

put '/:id' do
  message = Message.find(params[:id])
  message.content = params[:content]
  message.save
  erb :complete
end

get '/:id/delete' do
  Message.find(params[:id]).destroy
  erb :complete
end
