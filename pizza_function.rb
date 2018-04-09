def size
	size = ["small", "medium", "large"].sample
end

def crust
	crust = ["flatbread","thin","deep dish","Focaccia", "stuffed"].sample
end

def sauce
	sauce = ["marinara","pesto","olive oil","hummus"].sample
end

def meats
	meats = ["sausage", "pepperoni","ham", "bacon"].sample
end

def veggies
	veggies = ["bell peppers","banana peppers","onion","spinach"].sample
end

def special_topping
	special_topping = ["pineapple","carrot","olives","plantains", "frog legs"].sample
end

def extra
	extra = ["cheese","pepperoni", "bell peppers","sausage"].sample
end

def delivery
	delivery = [true,false].sample
end

def wings
	wings = ["6 wings","12 wings","18 wings"].sample
end

def flavors_of_wings
	flavors_of_wings = ["bbq", "honey bbq", "hot", "mild", "garlic parmesan", "bacon ranch", "honey mustard"].sample
end

def drink_choice
	drink_choice = ["sprite", "lemonade", "coke"].sample
end

def salad_type
	salad_type = ["caesar", "cobb", "the house", "frog leg", "fruit", "chicken"].sample
end

def pasta_type
	pasta_type = ["rigatoni", "tortellini", "fettuccine"].sample
end

tax = 0.09

def wings_price(amount)
	if amount == "6 wings"
		8.00
	elsif amount == "12 wings"
		14.00
	else amount == "16 wings"
		20.00
	end
end

def cost(size)
	if size == "small"
		7.00
	elsif size == "medium"
		9.50
	elsif size == "large"
		12.00
	end
end

def delivery?(delivery)
	if delivery == true
		6.50
	else delivery == false
		0
	end
end

def tip_cost(delivery)
	if delivery == true
		5.00
	else delivery == false
		0
	end
end

# # puts "Welcome to The Pizza Shack"

# puts "Our menu consists of Pizzas with:"
# puts "#{size}, #{size}, #{size} size."
# puts "#{crust}, #{crust}, #{crust}, #{crust} crust."
# puts "#{meats}, #{meats}, #{meats}, #{meats} meats."
# puts "#{veggies}, #{veggies}, #{veggies}, #{veggies} veggies."
# puts "#{special_topping}, #{special_topping}, #{special_topping}, #{special_topping}, #{special_topping} special toppings."
# puts "#{sauce}, #{sauce}, #{sauce}, #{sauce} sauce."
# puts "#{extra}, #{extra}, #{extra}, #{extra}, #{extra} extras."

# puts "\nWings in sizes of: 6, 12, and 16.
# \nWing flavors: bbq, honey bbq, hot, mild, garlic parmesan, bacon ranch, and honey mustard.
# \nDrink choices: sprite, lemonade, coke.
# Salad types: caesar, cobb, The House, frog leg, fruit, chicken.
# Pasta rigatoni, tortellini, and tortellini."

# puts "How many pizzas are you ordering?"
# pizzas = gets.chomp.to_i

# puts "Okay, you will have #{pizzas} pizzas"

# delivery_choice = delivery
# delivery_cost = delivery?(delivery_choice)
# tip = tip_cost(delivery_choice)
# pizza = 1
# subtotal = 0
# while pizza <= pizzas do
# 	pizza_size = size
# 	pizza_cost = cost(pizza_size)
	
	
# 	puts "Pizza #{pizza}"
# 	puts "Okay, so you're ordering a #{pizza_size} pizza which costs $#{sprintf("%.02f", pizza_cost)}."
# 	puts "Alright, you will have #{crust} crust, #{sauce} for your sauce, #{meats} as your meat, #{veggies}, #{special_topping} as your special topping, and the extra is #{extra}."
# 	subtotal += pizza_cost
# 	total_cost = subtotal*tax
# 	pizza +=1
# end

# puts "Would you like wings? (yes or no)"
# wing_choice = gets.chomp

# if wing_choice == "yes"
# 	wings_amount = wings
# 	wings_cost =  wings_price(wings_amount)
# 	puts "Alright, so you ordered #{wings_amount}, with #{flavors_of_wings} for #{sprintf("%.02f", wings_price(wings_amount))}"
# else
# 	wings_cost = 0
# end

# puts "Would you like a drink? (yes or no)"
# drink = gets.chomp

# if drink == "yes"
# 	# puts "Alright, so your drink choice is #{drink_choice}"
# 	drink_cost = 1.50
# else
# 	drink_cost = 0
# end

# puts "Would you like salad? (yes or no)"
# salad_choice = gets.chomp

# if salad_choice == "yes"
# 	# puts "Alright, your salad choice is #{salad_type}"
# 	salad_cost = 2
# else
# 	salad_cost = 0
# end

# puts "would you like pasta? (yes or no)"
# pasta_choice = gets.chomp

# if pasta_choice == "yes"
# 	# puts "Your pasta choice is #{pasta_type}"
# 	pasta_cost = 3.50
# else
# 	pasta_cost = 0
# # end

# total_cost += wings_cost + drink_cost + salad_cost + pasta_cost + pizza_cost

# puts "The total cost with tax is $#{sprintf("%.02f", total_cost)}"
# puts "The delivery cost is $#{sprintf("%.02f", delivery_cost)}"
# puts "The tip cost is $#{sprintf("%.02f", tip)}"