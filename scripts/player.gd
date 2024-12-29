extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0
var is_dead =false
var is_rolling = false


@onready var touch_controls:CanvasLayer=$"../GUI/Control/TouchControls"
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var jump_audio: AudioStreamPlayer2D = $jump
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var player: CharacterBody2D = $"."
@onready var death_label: Label = $"../GUI/DeathLabel"
@onready var death_label2: Label = $"../GUI/DeathLabel2"
@onready var gui: CanvasLayer = $"../GUI"

func _ready() -> void:
	gui.visible = true
	death_label.visible = false
	death_label2.visible = false
	

func _physics_process(delta: float) -> void:
	
	if animated_sprite_2d.is_playing() and animated_sprite_2d.animation.contains("hurt"):
		is_dead=true
		
		death_label.visible = true
		death_label2.visible = true
		touch_controls.visible=false
	

	if not is_on_floor():
		velocity += get_gravity() * delta
		
	

	if Input.is_action_just_pressed("jump") and is_on_floor() and not is_dead and not is_rolling:
		velocity.y = JUMP_VELOCITY
		jump_audio.play(0)
		
	if Input.is_anything_pressed() and Engine.time_scale == 0.0:
		Engine.time_scale = 1.0
		GameManager.playAd()
		get_tree().change_scene_to_file("res://scenes/start_menu.tscn")


	var direction := Input.get_axis("move_left", "move_right")
	

	if not is_dead:
		if direction > 0:
			animated_sprite_2d.flip_h = false
		elif direction < 0:
			animated_sprite_2d.flip_h = true
	
	
	if Input.is_action_just_pressed("roll") and is_on_floor():
		is_rolling=true
		animated_sprite_2d.play("roll")
		player.set_collision_layer_value(2, false)
		player.set_collision_layer_value(3, true)
		
		
	if not animated_sprite_2d.is_playing():
		is_rolling=false
		player.set_collision_layer_value(2, true)
		player.set_collision_layer_value(3, false)
	

	if not is_dead and not is_rolling:
		if is_on_floor():
			if direction == 0:
				animated_sprite_2d.play("idle")
			else:
				animated_sprite_2d.play("run")
		else:				
			animated_sprite_2d.play("jump")
	
	

	if not is_dead:
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
	else:
		velocity.x=0

	move_and_slide()
