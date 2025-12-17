extends Node3D

var xr_interface: XRInterface
@onready var pillowAudio = $%PillowAudio
@onready var creamAudio = $%CreamAudio
@onready var batAudio = $%BatAudio
@onready var cannonAudio = $%CannonAudio
@onready var HealthBar = $%HealthBar

signal playSound

var hits = 0
const MAX_HITS = 3
const MAX_ROUNDS = 3
var health = MAX_HITS

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
	#print("Sound should be playing.")
	if soundName == "Pillow":
		pillowAudio.play()
	if soundName == "Ice Cream":
		creamAudio.play()
	if soundName == "Bat":
		batAudio.play()
	if soundName == "Cannon":
		cannonAudio.play()

func snowman_hit():
	hits += 1
	health -= 1
	if health == 2:
		HealthBar.text = "❤️❤️"
	if health == 1:
		HealthBar.text = "❤️"
	if hits >= MAX_HITS:
		round_over()
		
func round_over():
	if Global.round < MAX_ROUNDS:
		Global.round += 1
		hits = 0
		get_tree().change_scene_to_file("res://Scenes/Gameplay/owen_human_joystick.tscn")
	else:
		Leaderboard.add_score(int(Global.score))
		get_tree().change_scene_to_file("res://Scenes/Menus/GameOver.tscn")
