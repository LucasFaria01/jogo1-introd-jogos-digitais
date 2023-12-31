extends Control

@onready var _contador_barulho = $Container/BarulhoContainer/BarulhoCounter as Label
@onready var jogador := $"../../Jogador1"

var barulho = 0
var descoberto = false
var habilitado = false


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
	if not habilitado:
		return
	
	if barulho == 0 and incremento > 0:
		if get_tree().current_scene.name == "Level1":
			exibir_dica_barulho()
	
	barulho += incremento
	
	if barulho >= 100:
		barulho = 100
		if !descoberto:
			descoberto = true
			trigger_end()
	
	_contador_barulho.text = str(int(barulho)) + "%"


func exibir_dica_barulho():
	var dialogBox = load("res://Dialog/dialog_box.tscn").instantiate()
	dialogBox.dialogos = [
		"Evite correr, passar por arbustos, árvores, ou terrenos que façam barulho, isso incrementa seu medidor de barulho e alerta o Encourado!"
	]
	$"../../CanvasLayer".add_child(dialogBox)


func trigger_end():
	$"../../Encourado".visible = true
	$"../../Encourado".perseguindo = true
	
	AudioManager.play_sound(preload("res://Assets/Sounds/som_encourado.mp3"))
	await get_tree().create_timer(2).timeout
	$"../../Descoberto".process_mode = Node.PROCESS_MODE_ALWAYS
	$"../../Descoberto".play()
