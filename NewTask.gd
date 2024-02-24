extends Control

var task_name
var task_type = "custom" # initial value, toggled by checkbox
var task_difficulty

func get_task_data():
	if task_name == null:
		print("please enter a task name")
	elif task_difficulty == null:
		print ("please choose a difficulty")
	else:
		var money
		match task_difficulty:
			"easy":
				money = 50
			"avg":
				money = 125
			"hard": 
				money = 250
		return [task_name, task_type, money]
		

func _on_task_name_text_changed(new_text):
	task_name = new_text


func _on_check_box_toggled(toggled_on):
	match toggled_on:
		true:
			task_type = "daily"
		false:
			task_type = "custom"


func _on_easy_button_pressed():
	task_difficulty = "easy"


func _on_avg_button_pressed():
	task_difficulty = "avg"


func _on_hard_button_pressed():
	task_difficulty = "hard"

func clear_input():
	task_name = null
	task_difficulty = null
	task_type = "custom"
	%TaskName.text = ""
	%CheckBox.button_pressed = false
