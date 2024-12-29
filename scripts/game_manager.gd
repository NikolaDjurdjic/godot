extends Node

var score = 0

var current_character=0

var levels=[0,0]

var adReady=false

var current_level = 1

var current_save_slot=0

func updateScore(level:int,sc:int)->void:
	levels[level]=sc

func getScore(level:int) -> int:
	return levels[level]
	
func add_point():
	score += 1

func getPoints() -> int:
	return score
	
func resetScore():
	score=0
	
func getCurrentLevel() -> int:
	return current_level
	
func update_current_level(level:int):
	current_level=level
	
func setCurrentCharacter(character:int):
	current_character=character
	
func getCurrentCharacter() ->int:
	return current_character
	
func playAd():
	adReady=true

func stopAd():
	adReady=false
	
func isAdReady()->bool:
	return adReady
	
func getSaveSlot()->int:
	return current_save_slot
	
func setSaveSlot(slot:int):
	current_save_slot=slot
	
func _ready() -> void:
	get_tree().change_scene_to_file("res://scenes/save_start_menu.tscn")
