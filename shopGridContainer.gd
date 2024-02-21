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
		button.text = str(item_data[1])
		button.icon = load(item_data[2])
		button.pressed.connect(self.button_pressed.bind(i, item_data[1]))
		add_child(button)
	
func button_pressed(name, price):
	shop_button_pressed.emit(name, price)
