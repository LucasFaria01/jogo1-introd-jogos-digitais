extends Node2D


func _process(delta):
	var new_sb = StyleBoxFlat.new()
	new_sb.bg_color = Color.BLACK
	$Label.add_theme_stylebox_override("normal", new_sb)
	$Label.position = Vector2($Jogador1.position.x - 55, $Jogador1.position.y - 55)
