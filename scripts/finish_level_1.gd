extends Area2D

func _on_body_entered(_body: Node2D) -> void:
	GameManager.updateScore(GameManager.getCurrentLevel()-1,GameManager.getPoints())
	SaveManager.gameSave()
	GameManager.playAd()
	get_tree().change_scene_to_file("res://scenes/start_menu.tscn")
