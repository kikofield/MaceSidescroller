extends Label

@export var makedonska_masina : MakedonskaMasina = null

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text = "Zemja : " + makedonska_masina.sega_zemja.name
