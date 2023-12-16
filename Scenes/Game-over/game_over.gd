extends CanvasLayer


func _ready():
	AudioManager.play_sound(preload("res://Assets/Sounds/sangue.mp3"))
	await get_tree().create_timer(1).timeout
	AudioManager.play_sound(preload("res://Assets/Sounds/risada_demoniaca.mp3"))


func _on_restart_pressed():
	get_tree().change_scene_to_file("res://Scenes/Level-1/level_01.tscn")


func _on_quit_pressed():
	get_tree().quit()
