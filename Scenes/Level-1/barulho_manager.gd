extends Control

@onready var barulho_counter = $container/barulho_container/barulho_counter as Label
@onready var jogador := $"../../Jogador_1"

var barulho = 0

func _ready():
	jogador.esta_correndo.connect(update_barulho_correndo)
	update_barulho_counter(0)

func update_barulho_correndo():
	update_barulho_counter(0.3)

func _on_arbusto_body_entered(body):
	update_barulho_counter(20)

func _on_arvore_body_entered(body):
	update_barulho_counter(15)

func _on_arvoremenor_1_body_entered(body):
	update_barulho_counter(10)

func _on_arvoremenor_2_body_entered(body):
	update_barulho_counter(10)
	
func _on_agua_body_entered(body):
	update_barulho_counter(40)
	
func update_barulho_counter(incremento: float):
	if barulho == 0 and incremento > 0:
		exibir_dica_barulho()
	
	barulho += incremento
	barulho_counter.text = str(int(barulho)) + "%"
	
	if barulho >= 100:
		print("GAME OVER!")

func exibir_dica_barulho():
	var dialogBox = load("res://Dialog/DialogBox.tscn").instantiate()
	dialogBox.dialog = [
		"Evite correr, passar por arbustos, árvores, ou terrenos que façam barulho, isso incrementa seu medidor de barulho e alerta o Encourado!"
	]
	$"../../CanvasLayer".add_child(dialogBox)
	get_tree().paused = true
