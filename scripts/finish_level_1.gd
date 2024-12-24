extends Area2D

func _on_body_entered(body: Node2D) -> void:
	GameManager.updateScore(GameManager.getCurrentLevel()-1,GameManager.getPoints())
	SaveManager.gameSave()
	get_tree().change_scene_to_file("res://scenes/start_menu.tscn")
