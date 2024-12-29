extends Button





func _on_pressed() -> void:
	GameManager.setCurrentCharacter(1)
	for c in self.get_parent().get_children():
		c.text="SELECT"
		c.disabled=false
	self.disabled=true
	self.text="SELECTED"
