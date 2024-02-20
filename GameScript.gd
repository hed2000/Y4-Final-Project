extends Node

var Money
var database_script = load("res://main.cs")
var database = database_script.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	
	database.init()
	if !database.userName:
		%Login.show()
	else:
		database.get_user_info()
		database.get_pet_skin()
		load_sprite()
		%MoneyLabel.text = "%d" % database.userMoney
	
	%shopGridContainer.shop_button_pressed.connect(_shop_button)
	%taskGridContainer.task_completed.connect(task_completed)

func _shop_button(name, price):
	if int(%MoneyLabel.text) >= price:
		match name:
			"collar green":
				%bodyAccessory.texture = load("res://sprites/bodyAccessories/collar green.png")
			"hat green":
				%headAccessory.texture = load("res://sprites/headAccessories/hat green.png")
			"flowers pink":
				%headAccessory.texture = load("res://sprites/headAccessories/flowers pink.png")
			"? 10000":
				%headAccessory.texture = null
				%bodyAccessory.texture = null
		update_money(-price)
		%MoneyLabel.text = "%d" % database.userMoney
	else: 
		print("Not enough money")
	
	
func _on_add_button_pressed():
	update_money(100)

func _on_button_1_pressed():
	%shop.show()
	
func _on_button_2_pressed():
	database.get_tasks()
	%taskGridContainer.generate_tasks(database.taskId, database.taskName, database.taskMoney)
	$tasks.show()
	
func _on_shop_exit_button_pressed():
	%shop.hide()
	
func _on_task_exit_button_pressed():
	%tasks.hide()
	
func shop_button_pressed(string):
	print(string)

func task_completed(taskId):
	print("e")
	database.complete_task(taskId)
	%MoneyLabel.text = "%d" % database.userMoney
	
func load_sprite():
	%head.texture = load(database.headPath)
	%body.texture = load(database.bodyPath)
	%tail.texture = load(database.tailPath)

func update_money(amount):
	database.update_money(amount)
	%MoneyLabel.text = "%d" % database.userMoney
	
func _on_username_text_submitted(new_text):
	database.userName = new_text
	
func _on_password_text_submitted(new_text):
	new_text = new_text.sha256_text()
	database.set_password(new_text)

func _on_login_button_pressed():
	var string = database.login()
	print(string)
	if (string == "login successful"):
		%Login.hide()
		database.get_user_info()
		database.get_pet_skin()
		load_sprite()
		%MoneyLabel.text = "%d" % database.userMoney
		
