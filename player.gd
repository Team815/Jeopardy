extends RefCounted
class_name Player

var name: String
var score: int

static func create(p_name: String) -> Player:
	var player: Player = Player.new()
	player.name = p_name
	player.score = 0
	return player
