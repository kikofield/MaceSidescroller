# NA KRAJ RAZMESAJ SVE, SMENI SE SO MOZES, i ova izbrisigo 
extends CharacterBody2D

@export var brzina : float = 200.0

@onready var sprajt : Sprite2D = $Sprite2D
@onready var animirano_drvo : AnimationTree = $AnimationTree
@onready var makedonska_masina = $MakedonskaMasina

# Get the gravitacija from the project settings to be synced with RigidBody nodes.
var gravitacija = ProjectSettings.get_setting("physics/2d/default_gravity")
var nasoka : Vector2 = Vector2.ZERO

func _ready():
	animirano_drvo.active = true

func _physics_process(delta):
	# Add the gravitacija.
	if not is_on_floor():
		velocity.y += gravitacija * delta

	# Get the input nasoka and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	nasoka = Input.get_vector("levo", "desno", "nagore", "nadole")
	
	# Smeni go ova da nema niso posle "&&"
	if nasoka.x != 0 && proveri_mrda_li():
		velocity.x = nasoka.x * brzina
	else:
		velocity.x = move_toward(velocity.x, 0, brzina)

	move_and_slide()
	update_animation_parameters()
	smeni_nasoka()
######################## smeni "update_animation_parameters" vo "apdejtiraj_animacija"
func update_animation_parameters():
	animirano_drvo.set("parameters/Move/blend_position", nasoka.x)

func smeni_nasoka():
	if nasoka.x > 0:
		sprajt.flip_h = false
	elif nasoka.x < 0:
		sprajt.flip_h = true
