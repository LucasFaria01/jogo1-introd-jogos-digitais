extends Control

var dialogos = [
	'Essa é a primeira frase da caixa de diálogo',
	'Aqui será preenchido com detalhes da história',
	'Esses textos ajudarão o player a compreender o background do jogo'
]

var pausar_quando_exibir = true
var _index_dialogo = 0

@export var stream: AudioStream


func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS
	AudioManager.play_sound(stream)
		
	if pausar_quando_exibir:
		get_tree().paused = true
	
	load_dialog()


func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		load_dialog()


func load_dialog():
	if _index_dialogo < dialogos.size():
		$RichTextLabel.text = dialogos[_index_dialogo]
		var tween = create_tween()
	else:
		queue_free()
		get_tree().paused = false
	_index_dialogo += 1
