extends GridContainer

signal inventory_button_pressed(string)

func load_inventory(accessories, owned):
	
	var button
	var item_data
	
	# clears previously generated shop interface
	for n in get_children():
		n.queue_free()
	
	button = Button.new()
	button.text = "Clear accessories"
	button.icon = load("res://button unknown.png")
	button.pressed.connect(self.button_pressed.bind("clear"))
	add_child(button)
	
	for i in owned:
		button = Button.new()
		item_data = accessories[i]
		button.text = i
		button.icon = load(item_data[2])
		button.pressed.connect(self.button_pressed.bind(i))
		add_child(button)
	
func button_pressed(name):
	inventory_button_pressed.emit(name)
