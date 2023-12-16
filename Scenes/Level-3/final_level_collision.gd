extends Area2D

var habilitado = false
var pegou_item = false
var dialogBox


func _process(delta):
	if habilitado:
		if Input.is_action_just_pressed("tecla_e"):
			if pegou_item:
				get_tree().change_scene_to_file("res://Scenes/Vitoria/vitoria.tscn")
			else:
				dialogBox = load("res://Dialog/dialog_box.tscn").instantiate()
				dialogBox.dialogos = [
					"Alguém estava tentando realizar um ritual aqui.",
					"Para conclui-lo, eu preciso de mais alguma coisa..."
				]
				$"../CanvasLayer".add_child(dialogBox)


func _on_body_entered(body):
	habilitado = true
	$"../Label".visible = true


func _on_body_exited(body):
	habilitado = false
	$"../Label".visible = false
