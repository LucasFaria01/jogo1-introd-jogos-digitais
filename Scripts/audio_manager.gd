extends Node

func play_sound(stream: AudioStream):
	var instance = get_sound(stream)
	instance.finished.connect(remove_node.bind(instance))
	instance.play()
	
	
func remove_node(instance: AudioStreamPlayer):
	instance.queue_free()


func get_sound(stream: AudioStream):
	var instance = AudioStreamPlayer.new()
	instance.process_mode = Node.PROCESS_MODE_ALWAYS
	instance.stream = stream
	add_child(instance)
	return instance
