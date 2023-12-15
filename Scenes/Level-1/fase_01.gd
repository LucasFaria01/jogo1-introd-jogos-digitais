extends Node2D

@onready var barulho_manager := "res://Scenes/Level-1/barulho_manager.gd"
var arbusto_sound = preload("res://Assets/Sounds/arbusto.wav")
var agua_sound = preload("res://Assets/Sounds/agua.wav")

# func _ready() -> void:
	# barulho_manager.trigger_end.connect(reload_game)
	
# func reload_game():
	# await get_tree().create_timer(1.0).timeout
	# get_tree().reload_current_scene()

func _process(delta):
	$Label.position = Vector2($Jogador_1.position.x - 400, $Jogador_1.position.y - 290)

func _on_arbusto_body_entered(body):
	play_arbusto_sound()

func _on_arvore_body_entered(body):
	play_arbusto_sound()

func _on_arvoremenor_1_body_entered(body):
	play_arbusto_sound()

func _on_arvoremenor_2_body_entered(body):
	play_arbusto_sound()

func play_arbusto_sound():
	AudioManager.play_sound(arbusto_sound)

func _on_agua_body_entered(body):
	AudioManager.play_sound(agua_sound)
