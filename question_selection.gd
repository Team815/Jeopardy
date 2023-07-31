extends MarginContainer


func _ready():
	%Question.text = Globals.question.question
	%Answer.text = Globals.question.answer


func _on_return_pressed():
	get_tree().change_scene_to_file("res://board.tscn")
