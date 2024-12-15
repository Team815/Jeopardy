extends VBoxContainer


func _ready():
	for new_player in %Players.get_children():
		new_player.connect("delete", _on_new_player_deleted)


func _input(event):
	if event.is_action_pressed("next"):
		if event.device >= %Players.get_child_count():
			return
		var new_player: NewPlayer = %Players.get_child(event.device)
		new_player.next_color()
	elif event.is_action_pressed("previous"):
		if event.device >= %Players.get_child_count():
			return
		var new_player: NewPlayer = %Players.get_child(event.device)
		new_player.previous_color()


func _on_start_pressed():
	Globals.players.clear()
	for new_player in %Players.get_children():
		var player: Player = Player.create(new_player.player_name, new_player.color)
		Globals.players.append(player)
	get_tree().change_scene_to_file("res://board.tscn")


func _on_add_player_pressed():
	var new_player = preload("res://new_player.tscn").instantiate()
	new_player.connect("delete", _on_new_player_deleted)
	%Players.add_child(new_player)


func _on_new_player_deleted(new_player: NewPlayer):
	%Players.remove_child(new_player)
	new_player.queue_free()
