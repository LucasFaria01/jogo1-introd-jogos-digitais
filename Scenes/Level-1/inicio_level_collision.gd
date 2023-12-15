extends Area2D

var exibir = false
var dialogBox


func _on_body_entered(body):
	exibir = true


func _on_body_exited(body):
	exibir = false
	if dialogBox != null:
		dialogBox.queue_free()


func _process(delta):
	if exibir:
		exibir = false
		
		dialogBox = load("res://Dialog/dialog_box.tscn").instantiate()
		dialogBox.dialogos = ["Não posso voltar agora, preciso resolver isto!"]
		dialogBox.pausar_quando_exibir = false
		$"../CanvasLayer".add_child(dialogBox)
