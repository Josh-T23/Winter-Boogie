extends Node3D

var weapons = [
	{"name": "Pistol", "scene": "res://weapons/baseball_bat.tscn"},
	{"name": "Shotgun", "scene": "res://weapons/ice_cream.tscn"},
	{"name": "Rifle", "scene": "res://weapons/pillow.tscn"}
]

var current_weapon_index = 0
var current_weapon = null

@onready var weapon_mount = $XROrigin3D/XRController3DRight/WeaponMount
@onready var menu = $WeaponMenu3D

func _ready():
	# Initialize XR
	var xr_interface = XRServer.find_interface("OpenXR")
	if xr_interface and xr_interface.initialize():
		print("OpenXR initialized successfully")
		get_viewport().use_xr = true
	else:
		print("Failed to initialize OpenXR")
	
	menu.visible = true
	spawn_weapon()
	
	for i in range(weapons.size()):
		var button = menu.get_node("Button" + str(i))
		if button:
			button.pressed.connect(func(): switch_weapon(i))

func switch_weapon(index):
	current_weapon_index = index
	spawn_weapon()

func spawn_weapon():
	if current_weapon:
		current_weapon.queue_free()
	
	current_weapon = load(weapons[current_weapon_index]["scene"]).instantiate()
	weapon_mount.add_child(current_weapon)
