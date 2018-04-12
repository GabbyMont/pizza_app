require 'sinatra'
require_relative 'pizza_function.rb'
enable :sessions

get '/' do
	session[:pizza_input] = [] # Creates new array for pizza, toppings & sides
	session[:total_cost] = 0 # Sets total cost at zero then adds on later
	erb :enter
end

post '/pizza' do
	redirect '/menu'
end

# clears sessions to prevent runover from added pizzas
get '/menu' do
	session[:size] = ""
	session[:crust] = ""
	session[:sauce] = ""
	session[:meats] = ""
	session[:veggies] = ""
	session[:special_topping] = ""
	session[:salad_type] = ""
	session[:pasta_type] = ""
	session[:drink_choice] = ""
	session[:choice] = ""
	erb :build_pizza
end

# Creates sessions for pizza ingredients
post '/pizza_menu' do
	session[:size] = params[:size] 
	session[:crust] = params[:crust]
	session[:sauce] = params[:sauce]
	session[:meats] = params[:meats] 
	session[:veggies] = params[:veggies]
	session[:special_topping] = params[:special_topping]
	session[:salad_type] = params[:salad_type]
	session[:pasta_type] = params[:pasta_type]
	session[:drink_choice] = params[:drink_choice]
	redirect '/confirmation'
end

get '/confirmation' do
	erb :confirmation
end

post '/confirm' do
	session[:meats] = params[:meats] || [] # If nothing chosen then session[:meats] becomes an empty array
	session[:veggies] = params[:veggies] || []
	session[:special_topping] = params[:special_topping] || []
	session[:salad_type] = params[:salad_type] || []
	session[:pasta_type] = params[:pasta_type] || []
	session[:drink_choice] = params[:drink_choice] || []
	session[:choice] = params[:confirm]
	if session[:choice] == "More"
		pizza_cost = cost(session[:size])
		####################################
		salad_cost = 0
		session[:salad_type].each do |salad|
			salad_cost += salad_choice(salad)
		end
		####################################
		pasta_cost = 0
		session[:pasta_type].each do |pasta|
			pasta_cost += pasta_choice(pasta)
		end
		####################################
		drink_cost = 0
		session[:drink_choice].each do |drink|
			drink_cost += drink_choice(drink)
		end
		####################################
		# wing_cost = 0
		# session[:wings_price].each do |amount|
		# 	wing_cost += wings_price(amount)
		# end
		####################################
		session[:total_cost] += pizza_cost.to_i + salad_cost.to_i + pasta_cost.to_i + drink_cost.to_i
		session[:pizza_input] << [session[:size], session[:crust], session[:sauce], session[:meats], session[:veggies], session[:special_topping], session[:salad_type], session[:pasta_type], session[:drink_choice]]
		redirect '/menu'
	else session[:choice] == "Next"
		pizza_cost = cost(session[:size])
		####################################
		salad_cost = 0
		session[:salad_type].each do |salad|
			salad_cost += salad_choice(salad)
		end
		###################################
		pasta_cost = 0
		session[:pasta_type].each do |pasta|
			pasta_cost += pasta_choice(pasta)
		end
		###################################
			drink_cost = 0
		session[:drink_choice].each do |drink|
			drink_cost += drink_choice(drink)
		end
		####################################
		# wing_cost = 0
		# session[:wings_price].each do |amount|
		# 	wing_cost += wings_price(amount)
		# end
		####################################
		session[:total_cost] += pizza_cost.to_i + salad_cost.to_i + pasta_cost.to_i + drink_cost.to_i

		session[:pizza_input] << [session[:size], session[:crust], session[:sauce], session[:meats], session[:veggies], session[:special_topping], session[:salad_type], session[:pasta_type], session[:drink_choice]]
		redirect '/delivery'
	end
end

get '/delivery' do
	erb :delivery
end

post '/delivery_input' do
	address = params[:address]
	delivery_name = params[:name]
	session[:total_cost] += 5.00 # Adds five dollars to total cost for delivery
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
	session[:total_cost] += session[:pizza_input].length * 0.09
	erb :final_page
end

post '/reset' do
	redirect '/'
end

get '/contact' do
	erb :contact
end

get '/about' do
	erb :about
end