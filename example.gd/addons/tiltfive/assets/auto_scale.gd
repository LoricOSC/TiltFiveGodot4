extends Node3D

var origin : T5Origin3D
var gameboard_scale : float = 1.0

func _find_origin():
	var parent = get_parent()
	while parent and !origin:
		if parent is T5Origin3D:
			origin = parent
			return
		
		parent = parent.get_parent()


# Called when the node enters the scene tree for the first time.
func _ready():
	_find_origin()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if origin and origin.gameboard_scale != gameboard_scale:
		gameboard_scale = origin.gameboard_scale
		scale = Vector3(gameboard_scale, gameboard_scale, gameboard_scale)
