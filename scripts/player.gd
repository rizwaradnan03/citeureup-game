extends CharacterBody2D



func _ready() -> void:
	Player.PLAYER_ANIMATION = $AnimatedSprite2D

func _process(delta: float) -> void:
	if Input.is_action_pressed("move_front") || Input.is_action_pressed("move_back"):
		Player.PLAYER_MOVE = true
		velocity.x = 0
		
		if(Input.is_action_pressed("move_front")):
			velocity.y = Player.PLAYER_SPEED * -Player.PLAYER_SPEED_PER_SECOND
			Player.PLAYER_ANIMATION.play("move_front")
		elif(Input.is_action_pressed("move_back")):
			velocity.y = Player.PLAYER_SPEED * Player.PLAYER_SPEED_PER_SECOND
			Player.PLAYER_ANIMATION.play("move_back")
	elif Input.is_action_pressed("move_right") || Input.is_action_pressed("move_left"):
		Player.PLAYER_MOVE = true
		Player.PLAYER_ANIMATION.play("move_side")
		velocity.y = 0
		
		if(Input.is_action_pressed("move_right")):
			velocity.x = Player.PLAYER_SPEED * Player.PLAYER_SPEED_PER_SECOND
			Player.PLAYER_ANIMATION.flip_h = false
		elif(Input.is_action_pressed("move_left")):
			velocity.x = Player.PLAYER_SPEED * -Player.PLAYER_SPEED_PER_SECOND
			Player.PLAYER_ANIMATION.flip_h = true
	else:
		Player.PLAYER_MOVE = false
		
		if Player.PLAYER_ANIMATION.animation == "move_front":
			Player.PLAYER_ANIMATION.play("idle_front")
		elif Player.PLAYER_ANIMATION.animation == "move_back":
			Player.PLAYER_ANIMATION.play("idle_back")
		elif Player.PLAYER_ANIMATION.animation == "move_side":
			Player.PLAYER_ANIMATION.play("idle_side")
	
	if Player.PLAYER_MOVE == true:
		move_and_slide()
