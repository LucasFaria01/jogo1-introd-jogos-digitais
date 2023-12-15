extends Node2D

var _som_arbusto = preload("res://Assets/Sounds/arbusto.wav")
var _som_agua = preload("res://Assets/Sounds/agua.wav")
var _passos = preload("res://Assets/Sounds/passos.mp3")
var _risada_demoniaca = preload("res://Assets/Sounds/risada_demoniaca.mp3")

# func _ready() -> void:
	# barulho_manager.trigger_end.connect(reload_game)
	
# func reload_game():
	# await get_tree().create_timer(1.0).timeout
	# get_tree().reload_current_scene()


func _process(delta):
	$Label.position = Vector2($Jogador1.position.x - 400, $Jogador1.position.y - 290)


func _on_arbusto_body_entered(body):
	play_arbusto_sound()


func _on_arvore_body_entered(body):
	play_arbusto_sound()


func _on_arvoremenor_1_body_entered(body):
	play_arbusto_sound()


func _on_arvoremenor_2_body_entered(body):
	play_arbusto_sound()


func play_arbusto_sound():
	AudioManager.play_sound(_som_arbusto)


func _on_agua_body_entered(body):
	AudioManager.play_sound(_som_agua)


func _on_som_cenario_1_body_entered(body):
	AudioManager.play_sound(_passos)


func _on_som_cenario_2_body_entered(body):
	AudioManager.play_sound(_risada_demoniaca)
