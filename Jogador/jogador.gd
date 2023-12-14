extends CharacterBody2D

var velocidade = VELOCIDADE_INICIAL
const VELOCIDADE_INICIAL = 260.0
const VELOCIDADE_MAXIMA = 360.0
const ACELERACAO = 1

signal esta_correndo()

@onready var animacao = $Animacao as AnimatedSprite2D

func _physics_process(_delta):
	var direction_x = Input.get_axis("player_1_esquerda", "player_1_direita") #-1 0 1 
	var direction_y = Input.get_axis("player_1_cima", "player_1_baixo") #-1 0 1
	
	if direction_x == 0 and direction_y == 0:
		velocidade = VELOCIDADE_INICIAL
		animacao.play("idle")
	else:
		if velocidade < VELOCIDADE_MAXIMA:
			velocidade += ACELERACAO
			print("velocidade: " + str(velocidade))
		else:
			emit_signal("esta_correndo")
	
	if direction_x: # -1 ou 1
		if direction_x == -1: # esquerda
			animacao.play("andar_esquerda")
		else:
			animacao.play("andar_direita")#
		velocity.x = direction_x * velocidade # esquerda/direita
	else: # 0
		velocity.x = move_toward(velocity.x, 0, velocidade) # parado
		
		
	if direction_y: # -1 ou 1
		if direction_y == -1:
			animacao.play("andar_cima")
		else:
			animacao.play("andar_baixo")
		velocity.y = direction_y * velocidade # cima/baixo
	else: # 0
		velocity.y = move_toward(velocity.y, 0, velocidade) # parado
	
	move_and_slide()
