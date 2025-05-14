extends StaticBody2D

func _process(delta: float) -> void:
	if Player.PLAYER_PACKAGED:
		var player = Player.PLAYER_PACKAGED
		add_child(player)
		Player.PLAYER_PACKAGED = null
		player.position = Vector2(3, -5)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		Player.PLAYER_PACKAGED = body
		body.get_parent().remove_child(body)
		get_tree().change_scene_to_file("res://objects/properties/house.tscn")
