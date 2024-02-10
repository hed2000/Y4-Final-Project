extends GridContainer

signal shop_button_pressed(string)

# Called when the node enters the scene tree for the first time.
func _ready():
	var button = Button.new()
	button.text = "500"
	button.icon = load("res://button hat.png")
	button.pressed.connect(self.button_pressed.bind("hat"))
	add_child(button)
	
	button = Button.new()
	button.text = "1000"
	button.icon = load("res://button unknown.png")
	button.pressed.connect(self.button_pressed.bind("? 1000"))
	add_child(button)
	
	button = Button.new()
	button.text = "2000"
	button.icon = load("res://button unknown.png")
	button.pressed.connect(self.button_pressed.bind("? 2000"))
	add_child(button)
	
	button = Button.new()
	button.text = "10000"
	button.icon = load("res://button unknown.png")
	button.pressed.connect(self.button_pressed.bind("? 10000"))
	add_child(button)
	
func button_pressed(string):
	print(string)
	shop_button_pressed.emit(string)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
