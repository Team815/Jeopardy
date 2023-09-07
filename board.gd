extends GridContainer


func _ready():
	for player in Globals.players:
		var display: PlayerDisplay = preload("res://player_display.tscn").instantiate()
		display.setup(player)
		%Players.add_child(display)
	var json: String = FileAccess.get_file_as_string("questions.json")
	var categories: Array = JSON.parse_string(json)
	columns = categories.size()
	for row in categories.size():
		var label: Label = Label.new()
		label.text = categories[row].Category
		label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		add_child(label)
	for col in categories[0].Questions.size():
		for row in categories.size():
			var question_answer: Dictionary = categories[row].Questions[col]
			var question: Question = Question.create(
				question_answer.Question, question_answer.Answer, (col + 1) * 100)
			var button: QuestionButton = preload("res://question_button.tscn").instantiate()
			button.id = col * categories.size() + row
			button.question = question
			if Globals.questions_asked.has(button.id):
				button.disabled = true
			add_child(button)
