tool
extends Spatial

const TILE_WIDTH := 512.0
const WORLD_TILES_WIDE := 30

func _ready() -> void:
	var tile_size := TILE_WIDTH
	var default_y := -50.0
	var offset := tile_size * WORLD_TILES_WIDE * 0.5
	var red = $SquareRed
	var blue = $SquareBlue

	# Add all the squares
	var is_odd := true
	for z in range(0, WORLD_TILES_WIDE):
		is_odd = not is_odd
		for x in range(0, WORLD_TILES_WIDE):
			is_odd = not is_odd
			var square = red if is_odd else blue

			var new_square = square.duplicate()
			self.add_child(new_square)
			new_square.visible = true
			new_square.transform.origin = Vector3(
				x * tile_size - offset,
				default_y,
				z * tile_size - offset
			)

