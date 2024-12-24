extends Node2D

const SPEED = 60

var direction = 1
var is_dead = false

@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var ray_cast_up: RayCast2D = $RayCastUp
@onready var slime: Node2D = $"."
@onready var collision_shape_2d: CollisionShape2D = $Killzone/CollisionShape2D
@onready var death: AudioStreamPlayer2D = $death
@onready var ray_cast_up2: RayCast2D = $RayCastUp2
@onready var ray_cast_up3: RayCast2D = $RayCastUp3

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (ray_cast_up.is_colliding() or ray_cast_up2.is_colliding() or ray_cast_up3.is_colliding()) and not is_dead:
		is_dead = true
		death.play()
		collision_shape_2d.disabled = true
		animated_sprite_2d.play("death")
		
	if is_dead and not death.playing and not animated_sprite_2d.is_playing():
		slime.queue_free()
	
	if not is_dead:	
		if ray_cast_right.is_colliding():
			animated_sprite_2d.flip_h = true
			direction = -1
		if ray_cast_left.is_colliding():
			animated_sprite_2d.flip_h = false
			direction = 1
		
		position.x += direction * SPEED * delta
