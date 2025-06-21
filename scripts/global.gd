extends Node

var settingsMenuOpen = false

var settings_data = {}
var settingsConfig = ConfigFile.new()
var musicVol = 0
var soundFxVol = 0
var musicBus = AudioServer.get_bus_index("Music")
var soundFxBus = AudioServer.get_bus_index("SoundFX")
var shakeEnabled = true


func _ready() -> void:
	load_settings()
	
	

func load_settings() -> void:
	var err = settingsConfig.load("user://settings.cfg")
	#print(OS.get_data_dir())
	if err != OK:
		print("no config file found... loading defaults")
		settings_to_default()
	else:	
		musicVol = settingsConfig.get_value("Settings", "music_volume")
		soundFxVol = settingsConfig.get_value("Settings", "soundFx_volume")
		shakeEnabled = settingsConfig.get_value("Settings", "shake_enabled")
		print("Music Volume on load is: " + str(musicVol))
		print("SoundFX Volume on load is " + str (soundFxVol))
		print("Shake Enabled on load is " + str(shakeEnabled))
		AudioServer.set_bus_volume_db(musicBus, musicVol)
		AudioServer.set_bus_volume_db(soundFxBus, soundFxVol)
	print("MUSIC " + str(AudioServer.get_bus_volume_db(musicBus)))
	print("SOUNDFX " + str(AudioServer.get_bus_volume_db(soundFxBus)))
	
	
func settings_to_default() -> void:
	settingsConfig.set_value("Settings", "soundFx_volume", 0)
	settingsConfig.set_value("Settings", "music_volume", 0)
	settingsConfig.save("user://settings.cfg")
	
