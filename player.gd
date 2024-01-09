extends RefCounted
class_name Player

var name: String
var score: int
var previous_score: int
var color: Color

static func create(p_name: String, p_color: Color) -> Player:
	var player: Player = Player.new()
	player.name = p_name
	player.color = p_color
	player.score = 0
	player.previous_score = 0
	return player
