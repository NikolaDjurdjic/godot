extends Button





func _on_pressed() -> void:
	GameManager.setSaveSlot(2)
	get_tree().change_scene_to_file("res://scenes/start_menu.tscn")


func _on_ready() -> void:
	var save_exists=FileAccess.file_exists("user://save_2.cfg")
	if save_exists:
		var char=int(SaveManager.loadThingExact("Character","Current",2))
		var current_char="Knight"
		match char:
			1:
				current_char="Merlin"
			2:
				current_char="Morgan"
		self.text=str("SLOT 3 - ",current_char)
	else:
		self.text="SLOT 3 - NEW GAME"
