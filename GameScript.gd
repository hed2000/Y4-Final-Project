extends Node

# dictionaries
var skins = {
	# format: name : [headpath, bodypath, tailpath, price]
	"ginger" : '["res://sprites/petSprites/cat ginger head.png", "res://sprites/petSprites/cat ginger body.png", "res://sprites/petSprites/cat ginger tail.png", 0]',
	"blue" : '["res://sprites/petSprites/cat blue head.png", "res://sprites/petSprites/cat blue body.png", "res://sprites/petSprites/cat blue tail.png", 500]'
}

var Pet_Name
var Pet_Type
var Owned_Skins
var Active_Skin
var Money
var Active_Tasks

var Save_Data
#var database_script = load("res://main.cs")
#var database = database_script.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	#reset_save()
	
	if not FileAccess.file_exists("user://save_game.dat"):
		print("File does not exist")
		new_game()
	else: 
		var file = FileAccess.open("user://save_game.dat", FileAccess.READ)
		var content = file.get_as_text()
		if content == "":
			print("File is empty")
			new_game()
		else: 
			load_game()
	
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
	save_game()

func make_save():
	var save_dict = {
		"petname" : Pet_Name,
		"pettype" : Pet_Type,
		"ownedskins" : Owned_Skins,
		"activeskin" : Active_Skin,
		"money" : Money,
		"activetasks" : Active_Tasks
	}
	return save_dict
		
func save_game(): 
	var file = FileAccess.open("user://save_game.dat", FileAccess.WRITE)
	var save_string = make_save()
	file.store_string(str(save_string))
	
func load_game():
	var file = FileAccess.open("user://save_game.dat", FileAccess.READ)
	var content = file.get_as_text()
	Save_Data = content
	
	print(Save_Data)
	var save_dict = str_to_var(Save_Data)
	
	Money = save_dict["money"]
	Active_Skin = save_dict["activeskin"]
	load_sprite(Active_Skin)
	%MoneyLabel.text = "%d" % Money
	
func reset_save():
	var file = FileAccess.open("user://save_game.dat", FileAccess.WRITE)
	file.store_string("")
	
func new_game():
	Money = 500
	Pet_Type = "cat"
	Active_Tasks = []
	%NewGame.show()

func _on_pet_name_text_changed(new_text):
	Pet_Name = new_text

func _on_cat_button_pressed():
	Pet_Type = "cat"
	Active_Skin = "ginger"
	Owned_Skins = ["ginger"]

func _on_dog_button_pressed():
	Pet_Type = "dog"
	Active_Skin = "blue"
	Owned_Skins = ["ginger", "blue"]

func _on_new_game_start_button_pressed():
	save_game()
	load_game()
	%NewGame.hide()
