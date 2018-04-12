def wings_price(amount)
	if amount == "6 wings"
		8.00
	elsif amount == "12 wings"
		14.00
	elsif amount == "16 wings"
		20.00
	end
end

def cost(size)
	if size == "Small"
		7.00
	elsif size == "Medium"
		9.50
	elsif size == "Large"
		12.00
	end
end

def delivery?(delivery)
	if delivery == "yes"
		6.50
	else delivery == "no"
		0
	end
end


def tip_cost(delivery)
	if delivery == "yes"
		5.00
	else delivery == "no"
		0
	end
end

def drink_choice(drink)
	if drink == "Sprite"
		2.00
	elsif drink == "Lemonade"
		1.00
	elsif drink == "Coke"
		2.00
	end
end

def pasta_choice(pasta)
	if pasta == "Rigatoni"
		2.00
	elsif pasta == "Tortellini"
		2.50
	elsif past == "Fettuccini"
		2.00
	end
end

def salad_choice(salad_type)
	if salad_type == "Caesar"
		1.50
	elsif salad_type == "Cobb"
		1.00
	elsif salad_type == "The House"
		1.00
	elsif salad_type == "Frog Leg"
		3.00
	elsif salad_type == "Chicken"
		2.50
	end
end