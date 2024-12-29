extends Button




func _on_pressed() -> void:
	GameManager.setCurrentCharacter(0)
	for c in self.get_parent().get_children():
		c.text="SELECT"
		c.disabled=false
	self.disabled=true
	self.text="SELECTED"
