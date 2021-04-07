#encoding: utf-8

require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, {adapter: "sqlite3", database: "barbershop.db"}

class Client < ActiveRecord::Base

end

class Barber < ActiveRecord::Base

end


get '/' do
	@barbers = Barber.order "created_at DESC"
	erb :index
end

get '/visit' do



	#	<% @barb.each do |x| %>
	#<option <%= @barber == x['name'] ? 'selected' : ''  %>> <%= x['name'] %> </option>
	#<% end %>

	
	erb :visit
end

post '/visit' do

	@user_name = params[:username]
	@user_phone = params[:userphone]
	@date_visit = params[:datevisit]
	@time_visit = params[:timevisit]
	@barber = params[:barbers]
	@colorpicker = params[:colorpicker]


  		Client.create :name => @user_name, :phone => @user_phone, :datestamp => @date_visit, :barber => @barber, :color => @colorpicker

	erb :visit	
end
