extends VBoxContainer
class_name PlayerDisplay


func setup(player: Player):
	$Name.text = player.name
	$Score.text = str(player.score)
