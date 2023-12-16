extends Node2D


func _ready():
	$HUD/BarulhoControl.habilitado = true
	$HUD/TimerControl/ClockTimer.start()
	
