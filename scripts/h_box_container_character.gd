extends HBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.get_child(GameManager.getCurrentCharacter()).text="SELECTED"
	self.get_child(GameManager.getCurrentCharacter()).disabled=true
