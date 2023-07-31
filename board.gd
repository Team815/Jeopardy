extends GridContainer


func _ready():
	var json : String = FileAccess.get_file_as_string("questions.json")
	var categories : Array = JSON.parse_string(json)
	columns = categories.size()
	for row in categories.size():
		var label : Label = Label.new()
		label.text = categories[row].Category
		add_child(label)
	for col in categories[0].Questions.size():
		for row in categories.size():
			var question_answer : Dictionary = categories[row].Questions[col]
			var question : Question = Question.new()
			question.question = question_answer.Question
			question.answer = question_answer.Answer
			question.points = (col + 1) * 100
			var button : QuestionButton = preload("res://question_button.tscn").instantiate()
			button.id = col * categories.size() + row
			button.question = question
			if Globals.questions_asked.has(button.id):
				button.disabled = true
			add_child(button)
