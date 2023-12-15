extends Area2D

var habilitado = false


func _process(delta):
	if habilitado:
		if Input.is_action_just_pressed("ui_accept"):
			get_tree().change_scene_to_file("res://Scenes/Level-4-Game Over/level_04.tscn")


func _on_body_entered(body):
	habilitado = true


func _on_body_exited(body):
	habilitado = false
