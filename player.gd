extends RefCounted
class_name Player

var name: String
var score: int

static func create(name: String) -> Player:
	var player: Player = Player.new()
	player.name = name
	player.score = 0
	return player
