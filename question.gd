extends RefCounted
class_name Question

var question: String
var answer: String
var points: int

static func create(p_question: String, p_answer: String, p_points: int):
	var question_to_create: Question = Question.new()
	question_to_create.question = p_question
	question_to_create.answer = p_answer
	question_to_create.points = p_points
	return question_to_create
