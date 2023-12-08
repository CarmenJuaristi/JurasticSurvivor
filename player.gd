extends KinematicBody2D

var velocity = Vector2(0,0)
const SPEED  = 120
const GRAVITY = 10
const JUMPFORCE = -360



func _physics_process(delta):
	
	if Input.is_action_pressed("a"):
		velocity.x = -SPEED
		$AnimatedSprite.play("Walk")
		$AnimatedSprite.flip_h = true
	elif Input.is_action_pressed("d"):
		velocity.x = SPEED
		$AnimatedSprite.play("Walk")
		$AnimatedSprite.flip_h = false
	else:
		$AnimatedSprite.play("Idle")
		
	if not is_on_floor():
		$AnimatedSprite.play("Jump")
	if Input.is_action_just_pressed("w") and is_on_floor():
		 #usamos just pressed porque sino si mantienes pulsada la tecla no para de subir y el is on floor para que no puedas saltar en el aire
		velocity.y = JUMPFORCE
		
	velocity.y += GRAVITY
	
	velocity = move_and_slide(velocity, Vector2.UP)
	velocity.x = lerp(velocity.x,0,0.2) #Aquí lo que hacemos es que después de leer las teclas vuelva 
	# la velocidad a 0 por tanto no se mueve, aunque hacemos que resbale un poco
