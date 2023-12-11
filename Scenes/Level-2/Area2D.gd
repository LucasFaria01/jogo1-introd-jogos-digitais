extends Area2D

var entered = false



func _process(delta):
	if entered:
		if Input.is_action_just_pressed("ui_accept"):
			get_tree().change_scene_to_file("res://Scenes/Level-3/fase_03.tscn")


func _on_body_entered(body):
	entered = true

func _on_body_exited(body):
	entered = false
