extends Node

# dictionaries
var skins_dict = {
	# name : [headpath, bodypath, tailpath, price, icon, type]
	"ginger" : ["res://sprites/petSprites/cat ginger head.png", "res://sprites/petSprites/cat ginger body.png", "res://sprites/petSprites/cat ginger tail.png", 0, "res://buttons/shop/button ginger.png", "cat"],
	"blue" : ["res://sprites/petSprites/cat blue head.png", "res://sprites/petSprites/cat blue body.png", "res://sprites/petSprites/cat blue tail.png", 500, "res://buttons/shop/button blue.png", "cat"],
	"tabby" : ["res://sprites/petSprites/cat tabby head.png", "res://sprites/petSprites/cat tabby body.png", "res://sprites/petSprites/cat tabby tail.png", 500, "res://buttons/shop/button tabby.png", "cat"],
	"tuxedo" : ["res://sprites/petSprites/cat tuxedo head.png", "res://sprites/petSprites/cat tuxedo body.png", "res://sprites/petSprites/cat tuxedo tail.png", 500, "res://buttons/shop/button tuxedo.png", "cat"],
	"white" : ["res://sprites/petSprites/cat white head.png", "res://sprites/petSprites/cat white body.png", "res://sprites/petSprites/cat white tail.png", 500, "res://buttons/shop/button white.png", "cat"],
	"silver" : ["res://sprites/petSprites/cat silver head.png", "res://sprites/petSprites/cat silver body.png", "res://sprites/petSprites/cat silver tail.png", 1000, "res://buttons/shop/button silver.png", "cat"],
	"tortie" : ["res://sprites/petSprites/cat tortie head.png", "res://sprites/petSprites/cat tortie body.png", "res://sprites/petSprites/cat tortie tail.png", 1000, "res://buttons/shop/button tortie.png", "cat"],
	"bengal" : ["res://sprites/petSprites/cat bengal head.png", "res://sprites/petSprites/cat bengal body.png", "res://sprites/petSprites/cat bengal tail.png", 2000, "res://buttons/shop/button bengal.png", "cat"],
	"siamese" : ["res://sprites/petSprites/cat siamese head.png", "res://sprites/petSprites/cat siamese body.png", "res://sprites/petSprites/cat siamese tail.png", 2000, "res://buttons/shop/button siamese.png", "cat"],
	"rainbow" : ["res://sprites/petSprites/cat rainbow head.png", "res://sprites/petSprites/cat rainbow body.png", "res://sprites/petSprites/cat rainbow tail.png", 5000, "res://buttons/shop/button rainbow.png", "cat"],
	"lab" : ["res://sprites/petSprites/dog lab head.png", "res://sprites/petSprites/dog lab body.png", "res://sprites/petSprites/dog lab tail.png", 0, "res://buttons/shop/button lab.png", "dog"],
	"collie" : ["res://sprites/petSprites/dog collie head.png", "res://sprites/petSprites/dog collie body.png", "res://sprites/petSprites/dog collie tail.png", 500, "res://buttons/shop/button collie.png", "dog"],
	"corgi" : ["res://sprites/petSprites/dog corgi head.png", "res://sprites/petSprites/dog corgi body.png", "res://sprites/petSprites/dog corgi tail.png", 500, "res://buttons/shop/button corgi.png", "dog"],
	"beagle" : ["res://sprites/petSprites/dog beagle head.png", "res://sprites/petSprites/dog beagle body.png", "res://sprites/petSprites/dog beagle tail.png", 500, "res://buttons/shop/button beagle.png", "dog"],
	"doberman" : ["res://sprites/petSprites/dog doberman head.png", "res://sprites/petSprites/dog doberman body.png", "res://sprites/petSprites/dog doberman tail.png", 1000, "res://buttons/shop/button doberman.png", "dog"],
	"shepherd" : ["res://sprites/petSprites/dog shepherd head.png", "res://sprites/petSprites/dog shepherd body.png", "res://sprites/petSprites/dog shepherd tail.png", 1000, "res://buttons/shop/button shepherd.png", "dog"],
	"dalmatian" : ["res://sprites/petSprites/dog dalmatian head.png", "res://sprites/petSprites/dog dalmatian body.png", "res://sprites/petSprites/dog dalmatian tail.png", 2000, "res://buttons/shop/button dalmatian.png", "dog"],
	"party" : ["res://sprites/petSprites/dog party head.png", "res://sprites/petSprites/dog party body.png", "res://sprites/petSprites/dog party tail.png", 5000, "res://buttons/shop/button party.png", "dog"]
}

var accessories_dict = {
	# name : [path, price, icon, part]
	"collar green" : ["res://sprites/bodyAccessories/collar green.png", 500, "res://buttons/shop/button collar green.png", "body"],
	"collar purple" : ["res://sprites/bodyAccessories/collar purple.png", 500, "res://buttons/shop/button collar purple.png", "body"],
	"collar pink" : ["res://sprites/bodyAccessories/collar pink.png", 500, "res://buttons/shop/button collar pink.png", "body"],
	"collar blue" : ["res://sprites/bodyAccessories/collar blue.png", 500, "res://buttons/shop/button collar blue.png", "body"],
	"collar red" : ["res://sprites/bodyAccessories/collar red.png", 500, "res://buttons/shop/button collar red.png", "body"],
	"bow red" : ["res://sprites/headAccessories/bow red.png", 500, "res://buttons/shop/button bow red.png", "head"],
	"bow green" : ["res://sprites/headAccessories/bow green.png", 500, "res://buttons/shop/button bow green.png", "head"],
	"bow pink" : ["res://sprites/headAccessories/bow pink.png", 500, "res://buttons/shop/button bow pink.png", "head"],
	"bow blue" : ["res://sprites/headAccessories/bow blue.png", 500, "res://buttons/shop/button bow blue.png", "head"],
	"bow purple" : ["res://sprites/headAccessories/bow purple.png", 500, "res://buttons/shop/button bow purple.png", "head"],
	"hat green" : ["res://sprites/headAccessories/hat green.png", 500, "res://buttons/shop/button hat green.png", "head"],
	"hat blue" : ["res://sprites/headAccessories/hat blue.png", 500, "res://buttons/shop/button hat blue.png", "head"],
	"hat pink" : ["res://sprites/headAccessories/hat pink.png", 500, "res://buttons/shop/button hat pink.png", "head"],
	"bow tie red" : ["res://sprites/bodyAccessories/bow tie red.png", 500, "res://buttons/shop/button bow tie red.png", "body"],
	"bow tie blue" : ["res://sprites/bodyAccessories/bow tie blue.png", 500, "res://buttons/shop/button bow tie blue.png", "body"],
	"bow tie green" : ["res://sprites/bodyAccessories/bow tie green.png", 500, "res://buttons/shop/button bow tie green.png", "body"],
	"bow tie pink" : ["res://sprites/bodyAccessories/bow tie pink.png", 500, "res://buttons/shop/button bow tie pink.png", "body"],
	"bow tie purple" : ["res://sprites/bodyAccessories/bow tie purple.png", 500, "res://buttons/shop/button bow tie purple.png", "body"],
	"sunglasses" : ["res://sprites/headAccessories/sunglasses.png", 1000, "res://buttons/shop/button sunglasses.png", "head"],
	"tie blue" : ["res://sprites/bodyAccessories/tie blue.png", 1000, "res://buttons/shop/button tie blue.png", "body"],
	"tie green" : ["res://sprites/bodyAccessories/tie green.png", 1000, "res://buttons/shop/button tie green.png", "body"],
	"tie red" : ["res://sprites/bodyAccessories/tie red.png", 1000, "res://buttons/shop/button tie red.png", "body"],
	"top hat red" : ["res://sprites/headAccessories/top hat red.png", 1000, "res://buttons/shop/button top hat red.png", "head"],
	"top hat blue" : ["res://sprites/headAccessories/top hat blue.png", 1000, "res://buttons/shop/button top hat blue.png", "head"],
	"bandana red" : ["res://sprites/bodyAccessories/bandana red.png", 1000, "res://buttons/shop/button bandana red.png", "body"],
	"bandana green" : ["res://sprites/bodyAccessories/bandana green.png", 1000, "res://buttons/shop/button bandana green.png", "body"],
	"bandana blue" : ["res://sprites/bodyAccessories/bandana blue.png", 1000, "res://buttons/shop/button bandana blue.png", "body"],
	"flowers pink" : ["res://sprites/headAccessories/flowers pink.png", 1000, "res://buttons/shop/button flowers pink.png", "head"],
	"flowers blue" : ["res://sprites/headAccessories/flowers blue.png", 1000, "res://buttons/shop/button flowers blue.png", "head"],
	"flowers red" : ["res://sprites/headAccessories/flowers red.png", 1000, "res://buttons/shop/button flowers red.png", "head"],
	"necklace red" : ["res://sprites/bodyAccessories/necklace red.png", 2000, "res://buttons/shop/button necklace red.png", "body"],
	"necplace blue" : ["res://sprites/bodyAccessories/necklace blue.png", 2000, "res://buttons/shop/button necklace blue.png", "body"],
	"necklace pink" : ["res://sprites/bodyAccessories/necklace pink.png", 2000, "res://buttons/shop/button necklace pink.png", "body"],
	"crown red" : ["res://sprites/headAccessories/crown red.png", 2000, "res://buttons/shop/button crown red.png", "head"],
	"crown blue" : ["res://sprites/headAccessories/crown blue.png", 2000, "res://buttons/shop/button crown blue.png", "head"]
	}

# used to add these stored tasks to the active_tasks list daily
var daily_tasks = {
	# name : [type, money]
}

var active_tasks = {
	# name : [type, money]
}

var Pet_Name 
var Pet_Type # which animal the pet is
var Owned_Skins
var Active_Skin # currently equipped skin
var Money
var Shop_Include = [] # non-owned items to include in shop
var Skins_Include = [] # non-owned skins to include in shop
var Owned_Accessories
var Active_Accessories # currently equipped accessories
var Last_Login

var Save_Data

# global variables to pass data around
var remove_daily
var selected_task
var new_name = ""
var new_type = ""
var selected = load("res://money pressed.png")
var not_selected = load("res://money.png")

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
	
	%shopGridContainer.item_bought.connect(buy_accessory)
	%shopGridContainer.skin_bought.connect(buy_skin)
	%taskGridContainer.task_completed.connect(task_completed)
	%taskGridContainer.task_cancelled.connect(task_cancelled)
	%inventoryGridContainer.equip_item.connect(equip_item)
	%inventoryGridContainer.equip_skin.connect(equip_skin)
	%CountdownTimer.timer_finished.connect(timer_finished)
		
func equip_skin(name):
	Active_Skin = name
	load_sprite(name) # reloads sprite with appropriate skin
	save_game()

func equip_item(name):
	if name == "clear":
		%headAccessory.texture = null
		%bodyAccessory.texture = null
		Active_Accessories[0] = ""
		Active_Accessories[1] = ""
		save_game()
	else:
		var itemdata = accessories_dict[name]
		match itemdata[3]:
			"head":
				%headAccessory.texture = load(itemdata[0])
				Active_Accessories[0] = name
				save_game()
			"body":
				%bodyAccessory.texture = load(itemdata[0])
				Active_Accessories[1] = name
				save_game()
		
func buy_accessory(name, price):
	if Money >= price:
		update_money(-price)
		Owned_Accessories.append(name)
		var i = 0
		while i < len(Shop_Include): # iterate through accessories to show in shop and remove the one that was just bought
			if Shop_Include[i] == name:
				Shop_Include.remove_at(i)
			i += 1
		%shopGridContainer.load_shop(accessories_dict, Shop_Include)
		save_game()
	else: 
		print("Not enough money")
		
func buy_skin(name, price):
	if Money >= price:
		update_money(-price)
		Owned_Skins.append(name)
		var i = 0
		while i < len(Skins_Include):
			if Skins_Include[i] == name:
				Skins_Include.remove_at(i)
			i += 1
		%shopGridContainer.load_shop_skins(skins_dict, Skins_Include, Pet_Type)
		save_game()
	else:
		print("Not enough money")
	

func _on_button_1_pressed():
	%shopGridContainer.load_shop(accessories_dict, Shop_Include) # loads shop with available accessories
	%shop.show() # unhides shop node
	
func _on_accessories_button_pressed():
	%shopGridContainer.load_shop(accessories_dict, Shop_Include) # loads shop with available accessories

func _on_patterns_button_pressed():
	%shopGridContainer.load_shop_skins(skins_dict, Skins_Include, Pet_Type) # loads shop with available patterns
	
func _on_button_2_pressed():
	%inventoryGridContainer.load_inventory(accessories_dict, Owned_Accessories)
	%inventory.show()
	
func _on_accessories_inv_button_pressed():
	%inventoryGridContainer.load_inventory(accessories_dict, Owned_Accessories)

func _on_patterns_inv_button_pressed():
	%inventoryGridContainer.load_inventory_skins(skins_dict, Owned_Skins, Pet_Type)

func _on_button_3_pressed():
	%taskGridContainer.load_tasks(active_tasks)
	$tasks.show()

func _on_button_4_pressed():
	%TEasyButton.texture_normal = selected
	%TAvgButton.texture_normal = not_selected
	%THardButton.texture_normal = not_selected
	%NewTimer.show()

func _on_button_5_pressed():
	match Pet_Type:
		"cat":
			%UpdateCatButton.texture_normal = selected
			%UpdateDogButton.texture_normal = not_selected
		"dog":
			%UpdateDogButton.texture_normal = selected
			%UpdateCatButton.texture_normal = not_selected
	%Settings.show()
	
func _on_shop_exit_button_pressed():
	%shop.hide()
	
func _on_task_exit_button_pressed():
	%tasks.hide()
	
func _on_inventory_exit_button_pressed():
	%inventory.hide()

func task_completed(taskName):
	var taskdata = active_tasks[taskName]
	update_money(taskdata[1])
	active_tasks.erase(taskName)
	%taskGridContainer.load_tasks(active_tasks)
	save_game()

func task_cancelled(taskName):
	%CancelTask.show()
	selected_task = taskName
	
func load_sprite(string):
	var array = skins_dict[string]
	%head.texture = load(array[0])
	%body.texture = load(array[1])
	%tail.texture = load(array[2])
	if Active_Accessories[0] != "":
		var itemdata = accessories_dict[Active_Accessories[0]]
		%headAccessory.texture = load(itemdata[0])
	if Active_Accessories[1] != "":
		var itemdata = accessories_dict[Active_Accessories[1]]
		%bodyAccessory.texture = load(itemdata[0])
		
		
func update_money(amount):
	Money += amount
	%MoneyLabel.text = str(Money)
	save_game()

func make_save():
	var save_dict = {
		"petname" : Pet_Name,
		"pettype" : Pet_Type,
		"ownedskins" : Owned_Skins,
		"activeskin" : Active_Skin,
		"money" : Money,
		"shopinclude" : Shop_Include,
		"skinsinclude" : Skins_Include,
		"ownedaccessories" : Owned_Accessories,
		"activeaccessories" : Active_Accessories,
		"lastlogin" : Last_Login,
		"dailytasks" : daily_tasks,
		"activetasks" : active_tasks,
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
	
	var save_dict = str_to_var(Save_Data)
	
	Pet_Name = save_dict["petname"]
	Pet_Type = save_dict["pettype"]
	Owned_Skins = save_dict["ownedskins"]
	Active_Skin = save_dict["activeskin"]
	Money = save_dict["money"]
	Shop_Include = save_dict["shopinclude"]
	Skins_Include = save_dict["skinsinclude"]
	Owned_Accessories = save_dict["ownedaccessories"]
	Active_Accessories = save_dict["activeaccessories"]
	daily_tasks = save_dict["dailytasks"]
	active_tasks = save_dict["activetasks"]
	
	
	Last_Login = save_dict["lastlogin"]
	var currentlogin = Time.get_date_dict_from_system()
	if currentlogin != Last_Login:
		for k in daily_tasks:
			if !active_tasks.has(k):
				active_tasks[k] = daily_tasks[k]
	Last_Login = currentlogin
	
	load_sprite(Active_Skin)
	%MoneyLabel.text = "%d" % Money
	%NameLabel.text = Pet_Name
	
	
func reset_save():
	var file = FileAccess.open("user://save_game.dat", FileAccess.WRITE)
	file.store_string("")
	
func new_game():
	# initialising variables to be saved
	Money = 500
	Pet_Type = "cat"
	%CatButton.texture_normal = selected
	# initialise default daily tasks
	daily_tasks = {
		"brush teeth" : ["daily", 50],
		"drink water" : ["daily", 50]
	}
	active_tasks = daily_tasks.duplicate() # adds all daily tasks to new dictionary
	# adds all items to unbought items array
	for key in accessories_dict:
		Shop_Include.append(key)
	# adds all non-default skins to unbought skins array
	for key in skins_dict:
		if key != "ginger" && key != "lab": # FUTURE NOTE: add all default skins here
			Skins_Include.append(key)
	Owned_Accessories = []
	Active_Accessories = ["", ""] # head, body
	Last_Login = Time.get_date_dict_from_system()
	%NewGame.show()

func _on_pet_name_text_changed(new_text):
	Pet_Name = new_text

func _on_cat_button_pressed():
	Pet_Type = "cat"
	Active_Skin = "ginger"
	Owned_Skins = ["ginger", "lab"] # FUTURE NOTE add all default pet skins here
	%CatButton.texture_normal = selected
	%DogButton.texture_normal = not_selected

func _on_dog_button_pressed():
	Pet_Type = "dog"
	Active_Skin = "lab"
	Owned_Skins = ["ginger", "lab"] # FUTURE NOTE add all default pet skins here
	%CatButton.texture_normal = not_selected
	%DogButton.texture_normal = selected
	
func _on_new_game_start_button_pressed():
	save_game()
	load_game()
	%NewGame.hide()


func _on_create_task_button_pressed():
	var new_task = %NewTask.get_task_data()
	if new_task != null:
		active_tasks[new_task[0]] = [new_task[1], new_task[2]]
		if new_task[1] == "daily":
			daily_tasks[new_task[0]] = [new_task[1], new_task[2]]
		save_game()
		%NewTask.hide()
		%NewTask.clear_input()
		%taskGridContainer.load_tasks(active_tasks)


func _on_new_task_button_pressed():
	%EasyButton.texture_normal = selected
	%AvgButton.texture_normal = not_selected
	%HardButton.texture_normal = not_selected
	%NewTask.show()


func _on_remove_daily_toggled(toggled_on):
	remove_daily = toggled_on


func _on_confirm_remove_button_pressed():
	var taskdata = active_tasks[selected_task]
	%CancelTask.hide()
	active_tasks.erase(selected_task)
	if remove_daily && daily_tasks.has(selected_task):
		daily_tasks.erase(selected_task)
	%taskGridContainer.load_tasks(active_tasks)
	save_game()


func _on_cancel_remove_button_pressed():
	%CancelTask.hide()
	
func timer_finished(time, difficulty):
	var money_earned
	match difficulty:
		"easy":
			money_earned = time * 2
		"normal": 
			money_earned = time * 4
		"hard": 
			money_earned = time * 6
	update_money(money_earned)


func _on_cancel_create_task_button_2_pressed():
	%NewTask.hide()
	%NewTask.clear_input()


func _on_update_name_text_changed(new_text):
	new_name = new_text
	
	
func _on_update_cat_button_pressed():
	new_type = "cat"
	%UpdateCatButton.texture_normal = selected
	%UpdateDogButton.texture_normal = not_selected
	
func _on_update_dog_button_pressed():
	new_type = "dog"
	%UpdateCatButton.texture_normal = not_selected
	%UpdateDogButton.texture_normal = selected


func _on_confirm_settings_button_pressed():
	if new_name != "":
		Pet_Name = new_name
		%NameLabel.text = Pet_Name
	if new_type != Pet_Type && new_type != "":
		Pet_Type = new_type
		match Pet_Type:
			"cat":
				load_sprite("ginger") # default cat sprite
			"dog":
				load_sprite("lab")
	%Settings.hide()
	save_game()
