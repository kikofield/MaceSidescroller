extends Zemja

class_name VazdukPozicija

@export var stasi_zemja : Zemja = null 
@export var dva_skoka_jacina : float = -100
@export var dva_skoka_animacija : String = "dva_skoka"
@export var stasi_animacija : String = "stasi"

var vise_dva_skoka = false

func zemja_process(delta):
	if(karakter.is_on_floor()):
		sledna_zemja = stasi_zemja
		
func zemja_input(slucaj : InputEvent):
	# smeni "!" vo "not"
	if(slucaj.is_action_pressed("skok") && not vise_dva_skoka):
		dva_skoka()

func na_izlez():
	if(sledna_zemja == stasi_zemja):
		playback.travel(stasi_animacija)
		vise_dva_skoka = false

func dva_skoka():
	karakter.velocity.y = dva_skoka_jacina
	playback.travel(dva_skoka_animacija)
	vise_dva_skoka = true


func _on_animation_tree_animation_finished(anim_name):
	pass # Replace with function body.
