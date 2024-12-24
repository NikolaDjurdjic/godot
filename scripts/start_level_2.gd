extends Button



func _on_pressed() -> void:
	GameManager.resetScore()
	GameManager.update_current_level(2)
	get_tree().change_scene_to_file("res://scenes/game_level_2.tscn")
	



func _on_ready() -> void:
	if GameManager.getScore(0)>0:
		self.disabled=false
