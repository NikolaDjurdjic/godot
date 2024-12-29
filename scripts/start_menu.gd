extends Node2D

@onready var admob = $Admob

var is_initialized: bool = false

func _ready() -> void:
	admob.initialize()
	await admob.initialization_completed
	if GameManager.isAdReady() and admob.initialization_completed:
		get_tree().paused=true
		admob.load_interstitial_ad()
		await admob.interstitial_ad_loaded
		admob.show_interstitial_ad()
		GameManager.stopAd()
		get_tree().paused=false
