extends KinematicBody2D
var preFireball = preload ("res://assets/LanzaLlamas.gd")
onready var player = get_node("/root/Level/Player")
func _physics_process(delta):
	look_at(player.get_position())
func _on_Timer_timeout():
	var fireball  = preFireball.instance()
	get_parent().call_defearred("add_child", fireball)
	fireball.position.x = self.position.x
	
