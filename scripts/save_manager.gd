class_name SaveManager
extends Node



static func gameSave() -> void:
	var save_path=str("user://save_",GameManager.getSaveSlot(),".cfg")
	var config = ConfigFile.new()
	config.set_value("Sound", "Master", db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master"))))
	config.set_value("Sound", "Music", db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Music"))))
	config.set_value("Sound", "SFX", db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("SFX"))))
	config.set_value("Score", "Level1", GameManager.getScore(0))
	config.set_value("Score", "Level2", GameManager.getScore(1))
	config.set_value("Character", "Current", GameManager.getCurrentCharacter())
	config.save(save_path)
	
static func gameLoad() -> void:
	var save_path=str("user://save_",GameManager.getSaveSlot(),".cfg")
	var config = ConfigFile.new()
	var err = config.load(save_path)
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
	var Level2Score = config.get_value("Score", "Level2")
	GameManager.updateScore(1,int(Level2Score))
	var CurrentCharacter = config.get_value("Character", "Current")
	GameManager.setCurrentCharacter(int(CurrentCharacter))
	
static func loadThing(section:String,key:String) -> String:
	var save_path=str("user://save_",GameManager.getSaveSlot(),".cfg")
	var config = ConfigFile.new()
	var err = config.load(save_path)
	if err != OK:
		return ""
	return str(config.get_value(section, key))
	
static func loadThingExact(section:String,key:String,save:int) -> String:
	var save_path=str("user://save_",save,".cfg")
	var config = ConfigFile.new()
	var err = config.load(save_path)
	if err != OK:
		return ""
	return str(config.get_value(section, key))

static func resetData()->void:
	var save_path=str("user://save_",GameManager.getSaveSlot(),".cfg")
	var config = ConfigFile.new()
	config.set_value("Sound", "Master", 1)
	config.set_value("Sound", "Music", 0.5)
	config.set_value("Sound", "SFX", 0.5)
	config.set_value("Score", "Level1", 0)
	config.set_value("Score", "Level2", 0)
	config.set_value("Character", "Current", 0)
	config.save(save_path)
