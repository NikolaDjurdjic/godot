extends Button





func _on_pressed() -> void:
	SaveManager.resetData()
	SaveManager.gameLoad()
	get_tree().change_scene_to_file("res://scenes/start_menu.tscn")
