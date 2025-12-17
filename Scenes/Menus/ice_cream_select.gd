extends Area3D

@export var cost: int

@onready var description = $%IceCreamDesc

signal pressed

func _ready() -> void:
	if Global.score < cost:
		var label = description.get_child(0)
		label.text = "???"
		visible = false
		set_collision_layer_value(1, false)
	else:
		var label = description.get_child(0)
		label.text = "Type: Melee\n" + "& Magic\n\n" + "Press Right Trigger\n"+ "to activate."+"
		Careful, it is only\n" +"temporary!"
#Type: Melee 
#& Magic
#
#Press Right Trigger 
#to activate. 
#Careful, it is only
 #temporary!
