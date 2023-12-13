extends Area2D

var exibir = false
var dialogBox

func _on_body_entered(body):
	exibir = true
	$"../Label".visible = true

func _on_body_exited(body):
	exibir = false
	$"../Label".visible = false

func _process(delta):
	if exibir:
		
		if Input.is_action_just_pressed("tecla_e"):
			dialogBox = load("res://Dialog/DialogBox.tscn").instantiate()
			dialogBox.dialog = [
				"Primeira frase de história",
				"Segunda frase de história",
				"AAAAAAAAAAAAAAAAAA"
			]
			$"../CanvasLayer".add_child(dialogBox)
			get_tree().paused = true
