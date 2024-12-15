extends GridContainer


func _ready():
	for player in Globals.players:
		var display: PlayerDisplay = preload("res://player_display.tscn").instantiate()
		%Players.add_child(display)
		display.setup(player)
		player.previous_score = player.score
	if not FileAccess.file_exists("questions.json"):
		create_questions_json()
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


func create_questions_json():
	var content = "[
	{
		\"Category\": \"Category 1\",
		\"Questions\":
		[
			{
				\"Question\": \"Category 1 Question 1\",
				\"Answer\": \"Category 1 Answer 1\"
			},
			{
				\"Question\": \"Category 1 Question 2\",
				\"Answer\": \"Category 1 Answer 2\"
			},
			{
				\"Question\": \"Category 1 Question 3\",
				\"Answer\": \"Category 1 Answer 3\"
			},
			{
				\"Question\": \"Category 1 Question 4\",
				\"Answer\": \"Category 1 Answer 4\"
			},
			{
				\"Question\": \"Category 1 Question 5\",
				\"Answer\": \"Category 1 Answer 5\"
			}
		]
	},
	{
		\"Category\": \"Category 2\",
		\"Questions\":
		[
			{
				\"Question\": \"Category 2 Question 1\",
				\"Answer\": \"Category 2 Answer 1\"
			},
			{
				\"Question\": \"Category 2 Question 2\",
				\"Answer\": \"Category 2 Answer 2\"
			},
			{
				\"Question\": \"Category 2 Question 3\",
				\"Answer\": \"Category 2 Answer 3\"
			},
			{
				\"Question\": \"Category 2 Question 4\",
				\"Answer\": \"Category 2 Answer 4\"
			},
			{
				\"Question\": \"Category 2 Question 5\",
				\"Answer\": \"Category 2 Answer 5\"
			}
		]
	},
	{
		\"Category\": \"Category 3\",
		\"Questions\":
		[
			{
				\"Question\": \"Category 3 Question 1\",
				\"Answer\": \"Category 3 Answer 1\"
			},
			{
				\"Question\": \"Category 3 Question 2\",
				\"Answer\": \"Category 3 Answer 2\"
			},
			{
				\"Question\": \"Category 3 Question 3\",
				\"Answer\": \"Category 3 Answer 3\"
			},
			{
				\"Question\": \"Category 3 Question 4\",
				\"Answer\": \"Category 3 Answer 4\"
			},
			{
				\"Question\": \"Category 3 Question 5\",
				\"Answer\": \"Category 3 Answer 5\"
			}
		]
	},
	{
		\"Category\": \"Category 4\",
		\"Questions\":
		[
			{
				\"Question\": \"Category 4 Question 1\",
				\"Answer\": \"Category 4 Answer 1\"
			},
			{
				\"Question\": \"Category 4 Question 2\",
				\"Answer\": \"Category 4 Answer 2\"
			},
			{
				\"Question\": \"Category 4 Question 3\",
				\"Answer\": \"Category 4 Answer 3\"
			},
			{
				\"Question\": \"Category 4 Question 4\",
				\"Answer\": \"Category 4 Answer 4\"
			},
			{
				\"Question\": \"Category 4 Question 5\",
				\"Answer\": \"Category 4 Answer 5\"
			}
		]
	},
	{
		\"Category\": \"Category 5\",
		\"Questions\":
		[
			{
				\"Question\": \"Category 5 Question 1\",
				\"Answer\": \"Category 5 Answer 1\"
			},
			{
				\"Question\": \"Category 5 Question 2\",
				\"Answer\": \"Category 5 Answer 2\"
			},
			{
				\"Question\": \"Category 5 Question 3\",
				\"Answer\": \"Category 5 Answer 3\"
			},
			{
				\"Question\": \"Category 5 Question 4\",
				\"Answer\": \"Category 5 Answer 4\"
			},
			{
				\"Question\": \"Category 5 Question 5\",
				\"Answer\": \"Category 5 Answer 5\"
			}
		]
	}
]
"
	var file = FileAccess.open("questions.json", FileAccess.WRITE)
	file.store_string(content)
