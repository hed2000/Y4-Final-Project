extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _on_button_2_pressed():
	var catsprite = %catsprite
	catsprite.play("hat")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
