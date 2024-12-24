extends AnimatableBody2D


@onready var sword: AnimatableBody2D = $"."
@onready var animation_player: AnimationPlayer = $AnimationPlayer
	
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("roll"):
		animation_player.play("swing")
		


func _on_hitbox_body_entered(body: Node2D) -> void:
	sword.reparent(body)
	print("sworded up")
