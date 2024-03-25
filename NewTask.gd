extends Control

var task_name
var task_type = "custom" # initial value, toggled by checkbox
var task_difficulty

var selected = load("res://money pressed.png")
var not_selected = load("res://money.png")

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
	%EasyButton.texture_normal = selected
	%AvgButton.texture_normal = not_selected
	%HardButton.texture_normal = not_selected


func _on_avg_button_pressed():
	task_difficulty = "avg"
	%EasyButton.texture_normal = not_selected
	%AvgButton.texture_normal = selected
	%HardButton.texture_normal = not_selected


func _on_hard_button_pressed():
	task_difficulty = "hard"
	%EasyButton.texture_normal = not_selected
	%AvgButton.texture_normal = not_selected
	%HardButton.texture_normal = selected

func clear_input():
	task_name = null
	task_difficulty = null
	task_type = "custom"
	%TaskName.text = ""
	%CheckBox.button_pressed = false
