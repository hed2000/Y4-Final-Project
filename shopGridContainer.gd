extends GridContainer

signal shop_button_pressed(string)

func load_shop(accessories, include):
	
	var button
	var item_data
	
	# clears previously generated shop interface
	for n in get_children():
		n.queue_free()
	
	for i in include:
		button = Button.new()
		item_data = accessories[i]
		button.text = str(item_data[1]) # sets button text to price
		button.icon = load(item_data[2]) # sets icon to accessory's icon
		button.pressed.connect(self.button_pressed.bind(i, item_data[1])) # connects button's pressed signal to script's button pressed function, passing name and price as variables
		add_child(button) # adds button to shop interface
		
func load_shop_skins(skins, include):
	var button 
	var item_data
	
	# clears previously generated shop interface
	for n in get_children():
		n.queue_free()
		
	for i in include:
		button = Button.new()
		item_data = skins[i]
		button.text = str(item_data[3]) # sets button text to price
		button.icon = load(item_data[4]) # sets icon to skin's icon
		button.pressed.connect(self.button_pressed.bind(i, item_data[3])) # connects button's pressed signal to script's button pressed function, passing name and price as variables
		add_child(button) # adds button to shop interface
	
func button_pressed(name, price):
	shop_button_pressed.emit(name, price)
