extends Area2D

signal brain_taken

export var point = 10

func _bila_ada_yang_masuk(body):
	$AnimationPlayer.play("Taken")

func _die():
	emit_signal("brain_taken", point)
#	get_tree().call_group("main", "_on_Add_point", point)
	queue_free()

