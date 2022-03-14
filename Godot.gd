
extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var velocitat : int = 300
var direccio = Vector2(0,0)
# Called when the node enters the scene tree for the first time.
func _ready():
	rotation_degrees = 90
	position = Vector2(0,0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += direccio.normalized() * velocitat * delta
	direccio = Vector2(0,0)
	if Input.is_action_pressed("mou_dreta"):
		direccio += Vector2(1,0)
	if Input.is_action_pressed("mou_abaix"):
		direccio += Vector2(0,1)
	if Input.is_action_pressed("mou_adalt"):
		direccio += Vector2(0,-1)
	if Input.is_action_pressed("mou_esquerra"):
		direccio += Vector2(-1,0)


func _on_Personatge_area_entered(area):
	modulate = Color(1,0,0)
