extends MarginContainer


var answerer_queue: Array = []
var answerer_index: int = 0


func _ready():
	%Question.text = Globals.question.question
	%Answer.text = Globals.question.answer


func _input(event):
	if event.is_action_pressed("answer"):
		_add_player_to_queue(Globals.players[event.device])
	elif event.is_action_pressed("reveal_answer"):
		%Answer.show()


func _on_return_pressed():
	for i in answerer_index:
		var player = answerer_queue[i]
		player.previous_score = player.score
		player.score -= Globals.question.points
	get_tree().change_scene_to_file("res://board.tscn")


func _add_player_to_queue(player: Player):
	if answerer_queue.has(player):
		return
	answerer_queue.append(player)
	if answerer_queue.size() - 1 == answerer_index:
		%AnswerAttempt.show()
		%Answerer.text = player.name
		%Answerer.add_theme_color_override("font_color", player.color)
	else:
		var label: Label = Label.new()
		label.text = player.name
		label.add_theme_color_override("font_color", player.color)
		%AnswerQueue.add_child(label)
		%AnswerQueue.move_child(label, 0)


func _on_right_pressed():
	var player = answerer_queue[answerer_index]
	player.previous_score = player.score
	player.score += Globals.question.points
	_on_return_pressed()


func _on_wrong_pressed():
	answerer_index += 1
	if answerer_index == answerer_queue.size():
		%AnswerAttempt.hide()
	else:
		var answerer: Player = answerer_queue[answerer_index]
		%Answerer.text = answerer.name
		%Answerer.add_theme_color_override("font_color", answerer.color)
		var to_remove: Node = %AnswerQueue.get_child(%AnswerQueue.get_child_count() - 1)
		%AnswerQueue.remove_child(to_remove)
		to_remove.queue_free()
