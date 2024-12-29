extends Node2D

@onready var player: CharacterBody2D=$Player

var current_player=load(str("res://scenes/player_",GameManager.getCurrentCharacter(),".tscn"))

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var new_player=current_player.instantiate()
	new_player.position=Vector2(36,46)
	for c in player.get_children():
		if c is not Camera2D:
			c.free()
	player.replace_by(new_player)
