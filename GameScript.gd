extends Node

var Money
# Called when the node enters the scene tree for the first time.
func _ready():
	Money = 150;
	%MoneyLabel.text = "%d" % Money
	
	var shop = %shopGridContainer
	shop.shop_button_pressed.connect(_shop_button)

func _shop_button(string):
	match string:
		"collar green":
			%bodyAccessory.texture = load("res://sprites/bodyAccessories/collar green.png")
		"hat green":
			%headAccessory.texture = load("res://sprites/headAccessories/hat green.png")
		"flowers pink":
			%headAccessory.texture = load("res://sprites/headAccessories/flowers pink.png")
		"? 10000":
			%headAccessory.texture = null
			%bodyAccessory.texture = null
		
func _on_button_2_pressed():
	%catsprite.play("hat")
	
func _on_add_button_pressed():
	Money += 100
	%MoneyLabel.text = "%d" % Money

func _on_button_1_pressed():
	%shop.show()
	
func _on_shop_exit_button_pressed():
	%shop.hide()
	
func shop_button_pressed(string):
	print(string)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
