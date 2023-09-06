extends HBoxContainer
class_name NewPlayer


signal delete(new_player: NewPlayer)


var player_name: String:
	get:
		return $Name.text


func _on_delete_pressed():
	delete.emit(self)
