extends Area2D

@onready var map = $"../TileMap"
@onready var timer: Timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	map.set_layer_enabled(2,true)
	timer.start()




func _on_timer_timeout() -> void:
	map.set_layer_enabled(2,false)
