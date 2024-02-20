extends Node

# dictionaries
var skins = {
	# format: name : [headpath, bodypath, tailpath, price]
	"ginger" : '["res://sprites/petSprites/cat ginger head.png", "res://sprites/petSprites/cat ginger body.png", "res://sprites/petSprites/cat ginger tail.png", 0]',
	"blue" : '["res://sprites/petSprites/cat blue head.png", "res://sprites/petSprites/cat blue body.png", "res://sprites/petSprites/cat blue tail.png", 500]'
}

var Money
var ownedSkins
var activeSkin
#var database_script = load("res://main.cs")
#var database = database_script.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	Money = 500
	ownedSkins = ["ginger", "blue"]
	activeSkin = "ginger"
	load_sprite(activeSkin)
	%MoneyLabel.text = "%d" % Money
	
	%shopGridContainer.shop_button_pressed.connect(_shop_button)
	%taskGridContainer.task_completed.connect(task_completed)
	
	save_game()
	var loaded = load_game()
	print(loaded)
	var loaded_dict = str_to_var(loaded)
	print(loaded_dict["money"])
	
func array_to_string(array): # used for saving game data
	var newstr = "["
	for i in array:
		print(i)
		newstr += '"' + str(i) + '"'
		if i != array[-1]: # checks last element of array
			newstr += ", "
	newstr += "]"
	return(newstr)
	

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
		%MoneyLabel.text = "%d" % Money
	else: 
		print("Not enough money")
	
	
func _on_add_button_pressed():
	update_money(100)

func _on_button_1_pressed():
	%shop.show()
	
func _on_button_2_pressed():
	#database.get_tasks()
	#%taskGridContainer.generate_tasks(database.taskId, database.taskName, database.taskMoney)
	$tasks.show()
	
func _on_shop_exit_button_pressed():
	%shop.hide()
	
func _on_task_exit_button_pressed():
	%tasks.hide()
	
func shop_button_pressed(string):
	print(string)

func task_completed(taskId):
	print("e")
	#database.complete_task(taskId)
	#%MoneyLabel.text = "%d" % database.userMoney
	
func load_sprite(string):
	var string_array = skins[string]
	var array = str_to_var(string_array)
	%head.texture = load(array[0])
	%body.texture = load(array[1])
	%tail.texture = load(array[2])

func update_money(amount):
	Money += amount
	%MoneyLabel.text = "%d" % Money
	
func _on_username_text_submitted(new_text):
	#database.userName = new_text
	pass
	
func _on_password_text_submitted(new_text):
	#new_text = new_text.sha256_text()
	#database.set_password(new_text)
	pass

func _on_login_button_pressed():
	#var string = database.login()
	#print(string)
	#if (string == "login successful"):
	#	%Login.hide()
	#	database.get_user_info()
	#	database.get_pet_skin()
	#	load_sprite()
	#	%MoneyLabel.text = "%d" % database.userMoney
	pass

func make_save():
	var save_dict = {
		"money" : Money,
		"ownedskins" : ownedSkins,
		"activeskin" : activeSkin
	}
	return save_dict
		
func save_game(): 
	var file = FileAccess.open("user://save_game.dat", FileAccess.WRITE)
	var save_string = make_save()
	file.store_string(str(save_string))
	
func load_game():
	var file = FileAccess.open("user://save_game.dat", FileAccess.READ)
	var content = file.get_as_text()
	return content
