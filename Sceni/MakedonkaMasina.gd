extends Node

class_name MakedonskaMasina

@export var karakter : CharacterBody2D = null
@export var animirano_drvo : AnimationTree = null
@export var sega_zemja : Zemja = null 

var zemji : Array[Zemja]

func _ready():
	zemji = []
	for x in get_children():
		if(x is Zemja):
			zemji.append(x)
			
			# Set the zemji up with what they need to function
			x.karakter = karakter
			x.playback = animirano_drvo["parameters/playback"]
			
		else:
			push_warning("Child " + x.name + " is not a Zemja for MakedonskaMasina")

func _physics_process(delta):
	if(sega_zemja.sledna_zemja != null):
		smeni_zemja(sega_zemja.sledna_zemja)
		
	sega_zemja.zemja_process(delta)

func proveri_mrda_li():
	return sega_zemja.moze_da_mrda


func smeni_zemja(nova_zemja : Zemja):
	if(sega_zemja != null):
		sega_zemja.na_izlez()
		sega_zemja.sledna_zemja = null
	
	sega_zemja = nova_zemja
	
	sega_zemja.na_vlez()

func _input(slucaj : InputEvent):
	sega_zemja.zemja_input(slucaj)
