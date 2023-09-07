extends VBoxContainer
class_name PlayerDisplay


func setup(player: Player):
	$Name.text = player.name
	$Name.add_theme_color_override("font_color", player.color)
	$Score.text = str(player.score)
