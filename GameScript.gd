extends Node

var Money
# Called when the node enters the scene tree for the first time.
func _ready():
	Money = 150;
	%MoneyLabel.text = "%d" % Money
	
func _on_button_2_pressed():
	var catsprite = %catsprite
	catsprite.play("hat")
	
func _on_add_button_pressed():
	Money += 100
	%MoneyLabel.text = "%d" % Money

func _on_button_1_pressed():
	%shop.show()
	
func _on_shop_exit_button_pressed():
	%shop.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
