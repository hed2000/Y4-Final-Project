extends GridContainer

var database_script = load("res://main.cs")
var database = database_script.new()


# Called when the node enters the scene tree for the first time.
func _ready():
	database.init()
	
	database.get_tasks()
		
	var button
	
	for x in database.taskName:	
		button = Button.new()
		button.text = x
		button.icon = load("res://button unknown.png")
		button.pressed.connect(database.button_pressed)
		add_child(button)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
