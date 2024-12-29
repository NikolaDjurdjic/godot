extends Control

@onready var resumeBut=$Panel/VBoxContainer/Resume
@onready var resetBut=$Panel/VBoxContainer/Restart
@onready var quitBut=$Panel/VBoxContainer/MainMenu

func disableButtons():
	resumeBut.disabled=true
	resetBut.disabled=true
	quitBut.disabled=true

func enableButtons():
	resumeBut.disabled=false
	resetBut.disabled=false
	quitBut.disabled=false

func _ready() -> void:
	$AnimationPlayer.play("RESET")
	disableButtons()


func resume():
	get_tree().paused=false
	$AnimationPlayer.play_backwards("blur")
	disableButtons()
	
func pause():
	get_tree().paused=true
	$AnimationPlayer.play("blur")
	enableButtons()

func testEsc():
	if Input.is_action_just_pressed("esc") and get_tree().paused==false:
		pause()
	elif Input.is_action_just_pressed("esc") and get_tree().paused==true:
		resume()
		


func _on_resume_pressed() -> void:
	$AnimationPlayer.play("RESET")
	resume()


func _on_restart_pressed() -> void:
	resume()
	GameManager.resetScore()
	get_tree().reload_current_scene()


func _on_main_menu_pressed() -> void:
	resume()
	get_tree().change_scene_to_file("res://scenes/start_menu.tscn")

func _process(_delta: float) -> void:
	testEsc()
