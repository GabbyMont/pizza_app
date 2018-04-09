require 'sinatra'
require_relative 'pizza_function.rb'

get '/' do
	session[:pizza_results] = Array.new
	erb :get_name
end

post '/get_name' do
	redirect '/build_pizza'
end

get '/build_pizza' do
	session[:size] = params[:size]
	session[:crust] = params[:crust]
	session[:sauce] = params[:sauce]
	session[:meats] = params[:meats]
	session[:veggies] = params[:veggies]
	session[:special_topping] = params[:special_topping]
	session[:extra] = params[:extra]
 	erb :build_pizza, locals:{size:size,crust:crust,sauce:sauce,meats:meats,veggies:veggies,special_topping:special_topping,extra:extra}
end

post '/build_pizza' do
	redirect '/wings'
end

get '/wings' do
end

# post '/pizza_input' do
# 	redirect '/results'
# end

# get '/results' do
# 	erb :results
# end
