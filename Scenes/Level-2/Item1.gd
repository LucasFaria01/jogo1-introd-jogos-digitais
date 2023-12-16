extends Area2D

var habilitado = false
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
			dialogBox = load("res://Dialog/dialog_box.tscn").instantiate()
			dialogBox.dialogos = [
				"Você pegou uma bolsa de sal grosso. "
			]
			$"../CanvasLayer".add_child(dialogBox)
			$"../FinalFase".pegou_item = true
