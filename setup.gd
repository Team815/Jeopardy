extends VBoxContainer


func _ready():
	for new_player in %Players.get_children():
		new_player.connect("delete", _on_new_player_deleted)


func _on_start_pressed():
	Globals.players.clear()
	for new_player in %Players.get_children():
		var player: Player = Player.create(new_player.player_name)
		Globals.players.append(player)
	get_tree().change_scene_to_file("res://board.tscn")


func _on_add_player_pressed():
	var new_player = preload("res://new_player.tscn").instantiate()
	%Players.add_child(new_player)


func _on_new_player_deleted(new_player: NewPlayer):
	%Players.remove_child(new_player)
	new_player.queue_free()
