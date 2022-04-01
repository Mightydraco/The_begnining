extends KinematicBody2D

var velocitat_base = 200
var velocitat = Vector2.ZERO
var gravetat = Vector2.DOWN * 980
var salt = Vector2.UP * 500
var salts_disponibles = 2
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	velocitat.x = 0
	if salts_disponibles <= 0 and is_on_floor():
		salts_disponibles = 2
	if Input.is_action_pressed("mou_dreta"):
		velocitat += Vector2.RIGHT * velocitat_base
	if Input.is_action_pressed("mou_esquerra"):
		velocitat += Vector2.LEFT * velocitat_base
	if Input.is_action_just_pressed("mou_adalt") and salts_disponibles > 0:
		velocitat.y = 0
		velocitat += salt
		salts_disponibles -= 1
	velocitat += gravetat * delta
	velocitat = move_and_slide(velocitat,Vector2.UP)
	
	if position.y >= 1000:
		position = Vector2(0,0)
	
	anima(velocitat)

func anima(velocitat: Vector2):
	var animacio : AnimatedSprite = $AnimatedSprite
	
	if velocitat.x > 0:
		animacio.flip_h = false
		animacio.play("walk")
		
	elif velocitat.x < 0:
		animacio.flip_h = true
		animacio.play("walk")
		
	if velocitat.y < -1:
		animacio.play("jump")
		return
		
	if abs(velocitat.x) < 0.1:
		animacio.play("stand")


func _on_DoorOpenMid_body_entered(body):
	get_tree().change_scene("res://Escena_2.tscn")
		


func _on_Area2D_body_entered(body):
	get_tree().change_scene("res://Escena_3.tscn")


func _on_Star_body_entered(body):
	get_tree().change_scene("res://Victory.tscn")
