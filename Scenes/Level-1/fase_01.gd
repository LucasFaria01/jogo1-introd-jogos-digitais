extends Node2D

@onready var control := $HUD/control

# func _ready() -> void:
	# control.time_is_up.connect(reload_game)
	
# func reload_game():
	# await get_tree().create_timer(1.0).timeout
	# get_tree().reload_current_scene()

func _process(delta):
	$Label.position = Vector2($Jogador_1.position.x - 400, $Jogador_1.position.y - 290)
