extends Node3D

var xr_interface: XRInterface

@onready var pillowAudio = $%PillowAudio

signal playSound

func _ready():
	playSound.connect(_play_sound)
	xr_interface = XRServer.find_interface("OpenXR")
	if xr_interface and xr_interface.is_initialized():
		print("OpenXR initialized successfully")

		# Turn off v-sync!
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)

		# Change our main viewport to output to the HMD
		get_viewport().use_xr = true
	else:
		print("OpenXR not initialized, please check if your headset is connected")

func _play_sound(soundName):
	if soundName == "Pillow":
		pillowAudio.play()
