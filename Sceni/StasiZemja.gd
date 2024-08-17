extends Zemja

@export var stasi_animacija_se_vika : String = "stasi"
@export var zemja_zemja : Zemja 

func _on_animation_tree_animation_finished(animacija_ime):
	if(animacija_ime == stasi_animacija_se_vika):
		sledna_zemja = zemja_zemja
