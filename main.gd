extends Control

var point = 0

func _ready():
#	$Brain.connect("brain_taken", self, "_on_Add_point")
	var brain_
	brain_ = $Brains.get_children()
		
	for brain in brain_ :
		brain.connect("brain_taken", self, "_on_Add_point")
#		print(brain.name)
	pass

func _on_Add_point(p):
	point += p
	print(point)
