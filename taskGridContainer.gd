extends GridContainer

signal task_completed(taskId)

func generate_tasks(taskId, taskName, taskMoney):
	
	# clears previously generated tasks
	for n in get_children():
		print("queue freed")
		n.queue_free()
		
	var button
	var i = 0
	while i < taskId.size():	
		button = Button.new()
		button.text = taskName[i] + " " + str(taskMoney[i])
		button.icon = load("res://button unknown.png")
		button.pressed.connect(self.button_pressed.bind(taskId[i]))
		add_child(button)
		i += 1

func button_pressed(taskId):
	task_completed.emit(taskId)
