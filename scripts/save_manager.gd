class_name SaveManager
extends Node

static func gameSave() -> void:
	var config = ConfigFile.new()
	config.set_value("Sound", "Master", db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master"))))
	config.set_value("Sound", "Music", db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Music"))))
	config.set_value("Sound", "SFX", db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("SFX"))))
	config.set_value("Score", "Level1", GameManager.getScore(0))
	config.save("user://save.cfg")
	
static func gameLoad() -> void:
	var config = ConfigFile.new()
	var err = config.load("user://save.cfg")
	if err != OK:
		return

	var masterVolume = config.get_value("Sound", "Master")
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear_to_db(masterVolume))
	var musicVolume = config.get_value("Sound", "Music")
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), linear_to_db(musicVolume))
	var SFXVolume = config.get_value("Sound", "SFX")
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), linear_to_db(SFXVolume))
	var Level1Score = config.get_value("Score", "Level1")
	GameManager.updateScore(0,int(Level1Score))
	
static func loadThing(section:String,key:String) -> String:
	var config = ConfigFile.new()
	var err = config.load("user://save.cfg")
	if err != OK:
		return ""
	return str(config.get_value(section, key))

static func resetData()->void:
	var config = ConfigFile.new()
	config.set_value("Sound", "Master", 0)
	config.set_value("Sound", "Music", 0)
	config.set_value("Sound", "SFX", 0)
	config.set_value("Score", "Level1", 0)
	config.save("user://save.cfg")
