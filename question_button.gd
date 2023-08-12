extends Button
class_name QuestionButton


var id: int
var question: Question:
	set(value):
		question = value
		text = str(question.points)


func _on_pressed():
	Globals.question = question
	Globals.questions_asked.append(id)
	get_tree().change_scene_to_file("res://question_selection.tscn")
