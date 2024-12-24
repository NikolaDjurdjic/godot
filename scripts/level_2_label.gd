extends Label


func _on_ready() -> void:
	self.text=str(GameManager.getScore(1)) + " coins collected"
	
