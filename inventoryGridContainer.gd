extends GridContainer

signal equip_item(string)
signal equip_skin(string)

func load_inventory(accessories, owned):
	
	var button
	var item_data
	
	# clears previously generated inventory interface
	for n in get_children():
		n.queue_free()
	
	button = Button.new()
	button.text = "Clear accessories"
	button.icon = load("res://button unknown.png")
	button.pressed.connect(self.equip_item_button_pressed.bind("clear"))
	add_child(button)
	
	for i in owned:
		button = Button.new()
		item_data = accessories[i]
		button.text = i
		button.icon = load(item_data[2])
		button.pressed.connect(self.equip_item_button_pressed.bind(i))
		add_child(button)
		
func load_inventory_skins(skins, owned):
	var button 
	var item_data
	
	# clears previously generated inventory interface
	for n in get_children():
		n.queue_free()
		
	for i in owned:
		button = Button.new()
		item_data = skins[i]
		button.text = i
		button.icon = load(item_data[4])
		button.pressed.connect(self.equip_skin_button_pressed.bind(i))
		add_child(button)
	
func equip_item_button_pressed(name):
	equip_item.emit(name)

func equip_skin_button_pressed(name):
	equip_skin.emit(name)
