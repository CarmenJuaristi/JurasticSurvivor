extends Node2D



func _on_Area2D_area_entered(area):
	if area.is_in_group("player"):
		get_tree().reload_current_scene()
