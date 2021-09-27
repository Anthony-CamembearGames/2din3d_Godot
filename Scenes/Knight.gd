extends KinematicBody

export (int) var speed = 1

var directionfaced = 0

var velocity = Vector3()

func get_input():
	velocity = Vector3()
	if Input.is_action_pressed("ui_right"):
		velocity.z -= 1
	if Input.is_action_pressed("ui_left"):
		velocity.z += 1
	if Input.is_action_pressed("ui_down"):
		velocity.x += 1
	if Input.is_action_pressed("ui_up"):
		velocity.x -= 1
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	if velocity == Vector3.ZERO:
		$AnimatedSprite3D.play('default')

	else:
		$AnimatedSprite3D.play('Walk')

		if velocity.z < 0:
			if directionfaced != 0 :
				$AnimationPlayer.play_backwards("flip")
				directionfaced = 0
		elif velocity.z > 0:
			if directionfaced == 0 :
				$AnimationPlayer.play("flip")
				directionfaced = 1
	velocity = move_and_slide(velocity)
