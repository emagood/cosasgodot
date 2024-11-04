extends Node

var tiempo
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tiempo = Time.get_unix_time_from_system()
	prints(tiempo)
	prints("tiempo string ", String.num(tiempo,0) )
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
