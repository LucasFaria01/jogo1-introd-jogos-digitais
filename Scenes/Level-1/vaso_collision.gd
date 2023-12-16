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
			$"../FinalFase".pegou_item = true
			
			dialogBox = load("res://Dialog/dialog_box.tscn").instantiate()
			dialogBox.dialogos = [
				"Uma carta ensanguentada está caída no chão.",
				"Vossa Santidade, 
Um monstro das trevas nos enganou e não tenho dúvidas que os atos de crueldade não se limitarão a nossa igreja. 

 Alguns dos nossos desapareceram depois do ataque, espero que estejam em segurança e não só isso, mas também realizado o mesmo pedido que irei fazer. ",
				"Peço que Vossa Santidade envie seus homens de fé para banir o monstro que assola nosso templo de volta pra as trevas, para nunca mais voltar. 

Assinado,                         

Padre Gustavo Silva",
				"Ao lado da carta, você vê um pequeno frasco de vidro. Ele deve ser importante."
			]
			$"../CanvasLayer".add_child(dialogBox)
