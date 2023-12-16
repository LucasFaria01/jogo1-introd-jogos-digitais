extends Area2D

var habilitado = false
var dialogBox


func _on_body_entered(body: CharacterBody2D):
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
				"Um livro foi deixado para trás, mas parece importante. Seu dono tentou protegê-lo.",
				"Recentemente ouvi rumores de um ser das trevas que vive ameaçando a população dessa região. 

 O ser das trevas se trata de um homem que possui olhos rubros como sangue, veste roupas de couro pretas como uma noite sem luar, garras e presas sempre prontas para derramar sangue e uma língua tão enganadora quanto a língua da Serpente. ",
				" “Encourado” é o nome dado a essa criatura pela população local.  Ele é um devorador de gente, entrando em casa em casa, matando seus moradores e devorando os seus cadáveres.  Felizmente, o Encourado só pode entrar nas casas de suas vítimas pela porta da frente e com a permissão do anfitrião.",
				" Entretanto, ele é capaz de superar essa fraqueza uma vez que é capaz de enganar e persuadir as suas vítimas para convidá-lo a entrar em sua casa, seja com sua grande capacidade de persuasão ou com o uso de seus poderes sombrios. ",
				"Caso se depare com o Encourado e o mesmo já tiver sido convidado a entrar em sua casa, esconda-se, seja mais silencioso possível e espere pelo melhor momento para fugir. Caso não consiga, abandone toda---",
				"A última frase foi riscada. Abaixo dela, uma anotação foi feita às pressas: 'Água benta, Sal grosso e Crucifixo.' O que isso quer dizer?"
			]
			$"../CanvasLayer".add_child(dialogBox)
			
			$"../HUD/BarulhoControl".visible = true
			$"../HUD/BarulhoControl".habilitado = true
			
			$"../HUD/TimerControl".visible = true
			$"../HUD/TimerControl/ClockTimer".start()
