extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Player.PLAYER_PACKAGED:
		var player = Player.PLAYER_PACKAGED
		add_child(player)
		Player.PLAYER_PACKAGED = null
		$Player.position = $SpawnPoint.position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
