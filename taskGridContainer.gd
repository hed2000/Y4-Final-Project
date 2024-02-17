extends GridContainer

var database_script = load("res://main.cs")
var database = database_script.new()

func _ready():
	database.init()

func generate_tasks(taskId, taskName, taskMoney):
	
	# clears previously generated tasks
	for n in get_children():
		n.queue_free()
		
	var button
	var i = 0
	while i < taskId.size():	
		button = Button.new()
		button.text = taskName[i] + " " + str(taskMoney[i])
		button.icon = load("res://button unknown.png")
		button.pressed.connect(database.complete_task.bind(taskId[i]))
		add_child(button)
		i += 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
