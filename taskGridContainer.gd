extends GridContainer

var database_script = load("res://main.cs")
var database = database_script.new()


# Called when the node enters the scene tree for the first time.
func _ready():
	database.init()
	
	database.get_tasks()
		
	var button
	var i = 0
	while i < database.taskId.size():	
		button = Button.new()
		button.text = database.taskName[i] + " " + str(database.taskMoney[i])
		button.icon = load("res://button unknown.png")
		button.pressed.connect(database.button_pressed.bind(database.taskId[i]))
		add_child(button)
		i += 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
