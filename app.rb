require 'sinatra'
require_relative 'pizza_function.rb'
enable :sessions

get '/' do
	session[:pizza_input] = [] # Creates new array for pizza, toppings & sides
	session[:total_cost] = 0
	erb :enter # Going to page "enter"/ page 1
end

post '/pizza' do
	redirect '/menu' # Redirects to build_pizza get
end

# clears sessions to prevent runover from other pizza
get '/menu' do
	session[:size] = ""
	session[:crust] = ""
	session[:sauce] = ""
	session[:meats] = ""
	session[:veggies] = ""
	session[:special_topping] = ""
	session[:extra] = ""
	session[:salad_type] = ""
	session[:pasta_type] = ""
	session[:drink_choice] = ""
	session[:choice] = ""
	erb :build_pizza
end

post '/pizza_menu' do
	session[:size] = params[:size] 
	session[:crust] = params[:crust]
	session[:sauce] = params[:sauce]
	session[:meats] = params[:meats] 
	session[:veggies] = params[:veggies]
	session[:special_topping] = params[:special_topping]
	session[:extra] = params[:extra]
	session[:salad_type] = params[:salad_type]
	session[:pasta_type] = params[:pasta_type]
	session[:drink_choice] = params[:drink_choice]
	session[:choice] = params[:choice]

	if session[:choice] == "More"
		pizza_cost = cost(session[:size])
		session[:total_cost] += pizza_cost

		session[:pizza_input] << [session[:size], session[:crust], session[:sauce], session[:meats], session[:veggies], session[:special_topping], session[:extra], session[:salad_type], session[:pasta_type], session[:drink_choice]]
		redirect '/menu'
	else session[:choice] == "Next"
		pizza_cost = cost(session[:size])
		session[:total_cost] += pizza_cost

		session[:pizza_input] << [session[:size], session[:crust], session[:sauce], session[:meats], session[:veggies], session[:special_topping], session[:extra], session[:salad_type], session[:pasta_type], session[:drink_choice]]
		redirect '/delivery'
	end
end

get '/delivery' do
	erb :delivery
end

post '/delivery_input' do
	address = params[:address]
	delivery_name = params[:name]
	session[:total_cost] += 5.00
	session[:address] = "#{address} is the address of delivery."
	session[:name] = "#{delivery_name} is the name of the order."
	redirect '/final'
end

post '/no_delivery' do
	delivery_name = params[:name]
	session[:name] = "#{delivery_name} is the name of the order."
	session[:address] = ""
	redirect '/final'
end

get '/final' do
	erb :final_page
end

post '/reset' do
	redirect '/'
end