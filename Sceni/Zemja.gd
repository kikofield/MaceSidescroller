extends Node

class_name Zemja

# smeni go na "!= false" vidi dali e isto
@export var moze_da_mrda = true

var karakter : CharacterBody2D 
var playback : AnimationNodeStateMachinePlayback 
#mozebi treba da se "= null"
var sledna_zemja : Zemja = null

func zemja_process(delta):
	pass

func zemja_input(slucaj : InputEvent):
	pass

func na_vlez():
	pass

func na_izlez():
	pass
