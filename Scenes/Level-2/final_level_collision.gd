extends Area2D

var habilitado = false
var pegou_item = false


func _process(delta):
	if habilitado and pegou_item:
		if Input.is_action_just_pressed("ui_accept"):
			get_tree().change_scene_to_file("res://Scenes/Level-3/level_03.tscn")


func _on_body_entered(body):
	habilitado = true


func _on_body_exited(body):
	habilitado = false
