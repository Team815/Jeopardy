extends VBoxContainer
class_name PlayerDisplay


func setup(player: Player):
	$Name.text = player.name
	$Name.add_theme_color_override("font_color", player.color)
	set_score(player.previous_score)
	if player.score != player.previous_score:
		var tween = create_tween()
		tween.tween_method(set_score, player.previous_score, player.score, 1).set_delay(0.5)


func set_score(score: int):
	$Score.text = str(score)
