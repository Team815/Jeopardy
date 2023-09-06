extends Node

var question: Question = Question.create("Sample question", "Sample answer", 100)
var questions_asked: Array = []
var players: Array = [
	Player.create("Alice"),
	Player.create("Bob"),
	Player.create("Charlie")
]
