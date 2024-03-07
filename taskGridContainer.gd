extends VBoxContainer

signal task_completed(string)
signal task_cancelled(string)

# Called when the node enters the scene tree for the first time.
func load_tasks(active):
	var task = %Task
	
	# clears previously generated tasks
	for n in get_children():
		n.queue_free()
	
	for i in active:
		var newtask = task.duplicate()
		var task_data = active[i]
		var text = newtask.get_node("Label")
		text.text = i + " - " + str(task_data[1]) + " coins"
		var complete_button = newtask.get_node("CompleteTaskButton")
		complete_button.pressed.connect(self.button_pressed.bind(i))
		var cancel_button = newtask.get_node("CancelTaskButton")
		cancel_button.pressed.connect(self.cancel_pressed.bind(i))
		newtask.show()
		add_child(newtask)


func button_pressed(name):
	task_completed.emit(name)

func cancel_pressed(name):
	print(name + " cancelled")
	task_cancelled.emit(name)
