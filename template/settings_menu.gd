extends CanvasLayer


@onready var music_slider: HSlider = $InteractiveElements/MusicSlider
@onready var sound_fx_slider: HSlider = $InteractiveElements/SoundFXSlider
@onready var enable_shake_checkbox: CheckButton = $InteractiveElements/EnableShakeCheckbox


var musicBus = AudioServer.get_bus_index("Music")
var soundFXBus = AudioServer.get_bus_index("SoundFX")
var musicVolume
var soundFxVolume


func _ready() -> void:
	Global.settingsMenuOpen = true
	musicVolume = Global.musicVol
	music_slider.value = musicVolume
	soundFxVolume = Global.soundFxVol
	sound_fx_slider.value = soundFxVolume
	if Global.shakeEnabled == true:
		enable_shake_checkbox.button_pressed = true
	else:
		enable_shake_checkbox.button_pressed = false


func _on_music_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(musicBus, value)
	musicVolume = value
	

func _on_sound_fx_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(soundFXBus, value)
	soundFxVolume = value


func _on_enable_shake_checkbox_toggled(toggled_on: bool) -> void:
	if enable_shake_checkbox.button_pressed == true:
		Global.shakeEnabled = true
	else:
		Global.shakeEnabled = false
	print(Global.shakeEnabled)


func _on_close_settings_pressed() -> void:
	Global.settingsMenuOpen = false
	save_settings()
	queue_free()
	

func save_settings():
	print(musicVolume)
	Global.settingsConfig.set_value("Settings", "music_volume", musicVolume)
	Global.settingsConfig.set_value("Settings", "soundFx_volume", soundFxVolume)
	Global.settingsConfig.set_value("Settings", "shake_enabled", Global.shakeEnabled)
	print("MUSIC VOLUME IS " + str(Global.settingsConfig.get_value("Settings", "music_volume")))
	print("SOUNDFX VOLUME IS " + str(Global.settingsConfig.get_value("Settings", "soundFx_volume")))
	print("SHAKE ENABLED STATUS " + str(Global.settingsConfig.get_value("Settings", "shake_enabled")))
	Global.settingsConfig.save("user://settings.cfg")
	
