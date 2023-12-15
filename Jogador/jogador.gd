extends CharacterBody2D

var _velocidade = VELOCIDADE_INICIAL
const VELOCIDADE_INICIAL = 260.0
const VELOCIDADE_MAXIMA = 360.0
const ACELERACAO = 1

var andando = false

signal esta_correndo()

@onready var animacao = $Animacao as AnimatedSprite2D


func _physics_process(_delta):
	var direcao_x = Input.get_axis("player_1_esquerda", "player_1_direita") #-1 0 1 
	var direcao_y = Input.get_axis("player_1_cima", "player_1_baixo") #-1 0 1
	
	if direcao_x == 0 and direcao_y == 0:
		_velocidade = VELOCIDADE_INICIAL
		animacao.play("idle")
		$"Som-passos".volume_db = 15
		stop_footstep_sound()
	else:
		configure_footstep_sound()
		if _velocidade < VELOCIDADE_MAXIMA:
			_velocidade += ACELERACAO
		else:
			emit_signal("esta_correndo")
			$"Som-passos".volume_db = 20
	
	if direcao_x: # -1 ou 1
		if direcao_x == -1: # esquerda
			animacao.play("andar_esquerda")
		else:
			animacao.play("andar_direita")#
		velocity.x = direcao_x * _velocidade # esquerda/direita
	else: # 0
		velocity.x = move_toward(velocity.x, 0, _velocidade) # parado
		
		
	if direcao_y: # -1 ou 1
		if direcao_y == -1:
			animacao.play("andar_cima")
		else:
			animacao.play("andar_baixo")
		velocity.y = direcao_y * _velocidade # cima/baixo
	else: # 0
		velocity.y = move_toward(velocity.y, 0, _velocidade) # parado
	
	move_and_slide()


func configure_footstep_sound():
	if andando: return
	andando = true
	$"Som-passos".play()


func stop_footstep_sound():
	if !andando: return
	andando = false
	$"Som-passos".stop()
	
