extends Label


func _on_ready() -> void:
	self.text=str(GameManager.getScore(0)) + " coins collected"
	
