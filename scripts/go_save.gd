extends Button




func _on_pressed() -> void:
	SaveManager.gameSave()
	get_tree().change_scene_to_file("res://scenes/save_menu.tscn")
