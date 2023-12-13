extends Control

var dialog = [
	'Essa é a primeira frase da caixa de diálogo',
	'Aqui será preenchido com detalhes da história',
	'Esses textos ajudarão o player a compreender o background do jogo'
]

var dialog_index = 0
var finished = false

func _ready():
	load_dialog()

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		load_dialog()

func load_dialog():
	if dialog_index < dialog.size():
		$RichTextLabel.text = dialog[dialog_index]
		var tween = create_tween()
	else:
		queue_free()
	dialog_index += 1
