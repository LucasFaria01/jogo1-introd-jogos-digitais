extends CharacterBody2D

const SPEED = 150.0

@onready var animacao = $Animacao as AnimatedSprite2D

func _physics_process(_delta):
	var direction_x = Input.get_axis("player_2_esquerda", "player_2_direita") #-1 0 1 
	var direction_y = Input.get_axis("player_2_cima", "player_2_baixo") #-1 0 1
	
	if direction_x: # -1 ou 1
		if direction_x == -1: # esquerda
			animacao.play("andar_esquerda")
		else:
			animacao.play("andar_direita")#
		velocity.x = direction_x * SPEED # esquerda/direita
	else: # 0
		velocity.x = move_toward(velocity.x, 0, SPEED) # parado
		
		
	if direction_y: # -1 ou 1
		if direction_y == -1:
			animacao.play("andar_cima")
		else:
			animacao.play("andar_baixo")
		velocity.y = direction_y * SPEED # cima/baixo
	else: # 0
		velocity.y = move_toward(velocity.y, 0, SPEED) # parado
		
	if direction_x == 0 and direction_y == 0:
		animacao.play("idle")
	
	move_and_slide()
