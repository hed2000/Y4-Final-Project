extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	const character_sprites = preload("res://CharacterSprites.gd")
	var character_sprite_script = character_sprites.new()
	
	var tailSprite = $CharacterSprites/tail
	var bodySprite = $CharacterSprites/body
	var bodyAccessorySprite = $CharacterSprites/bodyAccessory
	var headSprite = $CharacterSprites/head
	var headAccessorySprite = $CharacterSprites/headAccessory


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
