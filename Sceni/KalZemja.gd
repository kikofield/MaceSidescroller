extends Zemja
# smeni "KalZemja" vo "KalZemja"
class_name KalZemja

@export var skok_jacina : float = -150.0
@export var vazduk_zemja : Zemja = null
@export var skok_animacija : String = "skok_pocetok"

func zemja_process(delta):
	if(!karakter.is_on_floor()):
		sledna_zemja = vazduk_zemja

func zemja_input(slucaj : InputEvent):
	if(slucaj.is_action_pressed("skok")):
		skok()
		
func skok():
	karakter.velocity.y = skok_jacina
	sledna_zemja = vazduk_zemja
	#mozes da go smenis "skok animacija" vo "skok_pocetok" i da izbrises "var skok_animacija"
	playback.travel(skok_animacija)
