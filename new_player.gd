extends HBoxContainer
class_name NewPlayer


static var _colors: PackedColorArray = PackedColorArray([
	Color.WHITE,
	Color.BLACK,
	Color.RED,
	Color.BLUE,
	Color.GREEN,
	Color.YELLOW,
	Color.PURPLE,
	Color.ORANGE,
	Color.SADDLE_BROWN,
	Color.HOT_PINK
])


signal delete(new_player: NewPlayer)

var player_name: String:
	get:
		return $Name.text

var _color_index: int = 0:
	set(value):
		_color_index = posmod(value, _colors.size())
		$Color.text = str("Color ", _color_index + 1)
		$Color.add_theme_color_override("font_color", color)

var color: Color:
	get:
		return _colors[_color_index]


func next_color():
	_color_index += 1


func previous_color():
	_color_index -= 1


func _on_delete_pressed():
	delete.emit(self)
