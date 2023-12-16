extends Control

@onready var timer_counter = $Container/TimerContainer/TimerCounter as Label
@onready var clock_timer = $ClockTimer as Timer # é usado?

var timeout = false
var minutes = 0
var seconds = 0
@export_range(0, 5) var default_minutes := 1
@export_range(0, 59) var default_seconds := 0

signal time_is_up()


func _ready():
	timer_counter.text = str(Globals.timer)
	timer_counter.text = str("%02d" % default_minutes) + ":" + str("%02d" % default_seconds)
	reset_clock_timer()


func _process(delta):
	if minutes == 0 and seconds == 0 and not timeout:
		timeout = true
		$"../../Encourado".visible = true
		$"../../Encourado".perseguindo = true
	
		AudioManager.play_sound(preload("res://Assets/Sounds/som_encourado.mp3"))
		await get_tree().create_timer(2).timeout
		$"../../Descoberto".process_mode = Node.PROCESS_MODE_ALWAYS
		$"../../Descoberto".play()


func _on_clock_timer_timeout():
	if seconds == 0:
		if minutes > 0:
			minutes -= 1
			seconds = 60
		else: return
	seconds -= 1
	
	timer_counter.text = str("%02d" % minutes) + ":" + str("%02d" % seconds)


func reset_clock_timer():
	minutes = default_minutes
	seconds = default_seconds
