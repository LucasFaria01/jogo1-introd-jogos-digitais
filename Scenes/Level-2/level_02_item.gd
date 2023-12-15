extends Area2D

var habilitado = false


func _on_body_entered(body):
	habilitado = true


func _on_body_exited(body):
	habilitado = false


func _process(delta):
	if habilitado:
		
		if Input.is_action_just_pressed("tecla_e"):
			$"../HUD/TimerControl".visible = true
			$"../HUD/TimerControl/ClockTimer".start()