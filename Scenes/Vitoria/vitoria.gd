extends CanvasLayer


func _ready():
	AudioManager.play_sound(preload("res://Assets/Sounds/vitoria.wav"))
	

func _on_quit_pressed():
	get_tree().quit()
