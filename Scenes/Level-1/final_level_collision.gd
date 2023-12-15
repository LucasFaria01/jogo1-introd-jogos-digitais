extends Area2D

var habilitado = false


func _on_body_entered(body):
	habilitado = true
	$"../Label".visible = true


func _on_body_exited(body):
	habilitado = false
	$"../Label".visible = false


func _process(delta):
	if habilitado:
		if Input.is_action_just_pressed("tecla_e"):
			get_tree().change_scene_to_file("res://Scenes/Level-2/level_02.tscn")
