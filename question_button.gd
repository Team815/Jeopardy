extends Button
class_name QuestionButton


var question : Question
var points : int:
	set(value):
		text = str(value)


func _on_pressed():
	print(str(question.question, "\n", question.answer))
