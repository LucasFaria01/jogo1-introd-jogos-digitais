extends CharacterBody2D

@export var velocidade = 400

var posicao_jogador
var posicao_alvo
var perseguindo = false

@onready var jogador := $"../Jogador1"


func _physics_process(delta):
	if not perseguindo:
		return
	
	posicao_jogador = jogador.position
	posicao_alvo = (posicao_jogador - position).normalized()
	
	if position.distance_to(posicao_jogador) > 3:
		
		
		var collision = move_and_collide((posicao_alvo * velocidade) * delta)
		if collision:
			var collider = collision.get_collider()
		
			if collider is Jogador:
				get_tree().change_scene_to_file("res://Scenes/Game-over/game_over.tscn")
