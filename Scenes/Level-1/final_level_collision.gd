extends Area2D

var habilitado = false
var pegou_item = false
var dialogBox


func _on_body_entered(body):
	habilitado = true
	$"../Label".visible = true


func _on_body_exited(body):
	habilitado = false
	$"../Label".visible = false


func _process(delta):
	if habilitado:
		if Input.is_action_just_pressed("tecla_e"):
			if pegou_item:
				get_tree().change_scene_to_file("res://Scenes/Level-2/level_02.tscn")
			else:
				dialogBox = load("res://Dialog/dialog_box.tscn").instantiate()
				dialogBox.dialogos = [
					"Não posso sair sem pegar um item importante!"
				]
				$"../CanvasLayer".add_child(dialogBox)
