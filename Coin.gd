extends Sprite


func _on_Area2D_area_entered(area):
	if area.is_in_group("player"):
		Singleton.coins += 1
		print(Singleton.coins)
		queue_free()

