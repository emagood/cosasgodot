extends Node


func sort_ascending(a, b):
	if a[1] > b[1]:
		return true
	elif a[1] == b[1]:
		prints("hafcer algo")
		pass
		
	return false

func _ready():
	var my_items = [["Tomat2", 6],["Tomato", 5], ["Apple", 9], ["Rice", 4],["Tomato3", 5]]
	my_items.sort_custom(sort_ascending)
	print(my_items) # Prints [["Rice", 4], ["Tomato", 5], ["Apple", 9]]

	# Sort descending, using a lambda function.
	my_items.sort_custom(func(a, b): return a[1] > b[1])
	print(my_items) # Prints [["Apple", 9], ["Tomato", 5], ["Rice", 4]]

	var files = ["newfile1", "newfile2", "newfile10", "newfile11"]
	files.sort_custom(func(a, b): return a.naturalnocasecmp_to(b) < 0)
	print(files[0]) # Prints ["newfile1", "newfile2", "newfile10", "newfile11"]
func _process(delta: float) -> void:
	pass
