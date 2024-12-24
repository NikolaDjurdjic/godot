extends Area2D

@onready var timer: Timer = $Timer
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $death


func _on_body_entered(body: Node2D) -> void:
	if not body.get_node("AnimatedSprite2D").animation == "hurt":
		Engine.time_scale = 0.5
		body.get_node("AnimatedSprite2D").play("hurt")
		audio_stream_player_2d.play(0)
		
		timer.start()


func _on_timer_timeout() -> void:
	Engine.time_scale = 0.0
