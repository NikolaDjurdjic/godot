extends Button


func _on_pressed() -> void:
		SaveManager.gameSave()
		get_tree().quit(0)
