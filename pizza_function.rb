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