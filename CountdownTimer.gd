extends Control

signal timer_finished(int, string)

var time = 1
var difficulty = "easy"
var selected = load("res://money pressed.png")
var not_selected = load("res://money.png")

# Called when the node enters the scene tree for the first time.
func _on_create_timer_button_pressed():
	%NewTimer.hide()
	%CountdownTimer.show()
	var time_seconds = time * 60
	%Timer.start(time_seconds)
	clear_input()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var mins = str(int(%Timer.time_left / 60))
	var secs = str(int(fmod(%Timer.time_left, 60))) # gets remainder of time_left / 60 to get seconds
	if int(secs) < 10:
		secs = "0" + secs
	%TimerLabel.text = mins + ":" + secs
	pass


func _on_timer_timeout():
	%CountdownTimer.hide()
	timer_finished.emit(time, difficulty)


func _on_minus_button_pressed():
	if time > 1:
		time -= 1
		%TimerLength.text = str(time)


func _on_plus_button_pressed():
	time += 1
	%TimerLength.text = str(time)


func _on_t_easy_button_pressed():
	difficulty = "easy"
	%TEasyButton.texture_normal = selected
	%TAvgButton.texture_normal = not_selected
	%THardButton.texture_normal = not_selected


func _on_t_avg_button_pressed():
	difficulty = "normal"
	%TEasyButton.texture_normal = not_selected
	%TAvgButton.texture_normal = selected
	%THardButton.texture_normal = not_selected


func _on_t_hard_button_pressed():
	difficulty = "hard"
	%TEasyButton.texture_normal = not_selected
	%TAvgButton.texture_normal = not_selected
	%THardButton.texture_normal = selected


func _on_cancel_timer_pressed():
	var time_left = %Timer.time_left
	var mins_left = int(time_left/60)
	if int(fmod(time_left, 60)) > 30: # rounds to nearest minute
		mins_left += 1
	var total_time = time - mins_left
	%Timer.stop()
	%CountdownTimer.hide()
	timer_finished.emit(total_time, difficulty)


func _on_cancel_create_timer_button_2_pressed():
	%NewTimer.hide()
	clear_input()
	
func clear_input():
	time = 1
	%TimerLength.text = "1"
	difficulty = "easy"
