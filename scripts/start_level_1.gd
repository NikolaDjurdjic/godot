extends Button





func _on_pressed() -> void:
	GameManager.resetScore()
	GameManager.update_current_level(1)
	get_tree().change_scene_to_file("res://scenes/game_level_1.tscn")
