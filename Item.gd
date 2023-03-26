extends Area2D

func _bila_ada_yang_masuk(body):
	$AnimationPlayer.play("Taken")
	pass # Replace with function body.

func _die():
	queue_free()

func _on_Item_body_entered(body):
	pass # Replace with function body.
