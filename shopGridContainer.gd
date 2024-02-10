extends GridContainer

signal shop_button_pressed(string)

# Called when the node enters the scene tree for the first time.
func _ready():
	
	# var gameScriptResource = preload("res://GameScript.gd")
	# var gameScript = gameScriptResource.new()
	
	var button = Button.new()
	button.text = "500"
	button.icon = load("res://buttons/shop/button collar green.png")
	button.pressed.connect(self.button_pressed.bind("collar green"))
	add_child(button)
	
	button = Button.new()
	button.text = "500"
	button.icon = load("res://buttons/shop/button hat green.png")
	button.pressed.connect(self.button_pressed.bind("hat green"))
	add_child(button)
	
	button = Button.new()
	button.text = "1000"
	button.icon = load("res://buttons/shop/button flowers pink.png")
	button.pressed.connect(self.button_pressed.bind("flowers pink"))
	add_child(button)
	
	button = Button.new()
	button.text = "10000"
	button.icon = load("res://button unknown.png")
	button.pressed.connect(self.button_pressed.bind("? 10000"))
	add_child(button)
	
func button_pressed(string):
	shop_button_pressed.emit(string)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
