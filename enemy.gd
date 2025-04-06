extends CharacterBody2D
#var bContacts = [];
#var fContacts = [];
@onready var domJoint = $FrontLegs/FJoint
@export var speed = 0
@export var ySpeed = 0
var animalID = [0,0,0,0,0]


var maxSpeed = 400
var maxJump = 400
var slowX = 10
var slowY = 10
var damage = 1
var atk = false
var health = 3;
func get_input():
	if(Input.is_action_pressed('MoveRight')):
		speed = maxSpeed;
		#print('Right')
	if(Input.is_action_pressed('MoveLeft')):
		speed = -maxSpeed;
	if(Input.is_action_just_pressed('Jump')):
		ySpeed = -maxJump;
		#print('jump')
	if(Input.is_action_pressed("Attack")):
		$FrontLegs.angular_velocity= -90
		
		#self.scale.x = -1;
	
	
	
func _physics_process(delta):
	$Head.rotation = 0;
	#print('Moving')
	#get_input()
	velocity.x = speed
	velocity.y = ySpeed
	print($FrontLegs.get_contact_count())
	
	if($FrontLegs.get_colliding_bodies().has($Floor)):
		ySpeed =0 
		print('Contact')
	if($BackLegs.get_colliding_bodies().has($Floor)):
		ySpeed =0 
		print('Contact')
		if(health ==0 ):
			get_tree().change_scene_to_file("res://intermission.tscn")
	
		
	else:
		ySpeed += slowY
		if(speed >=0):
			speed -= slowX
		else:
			speed +=slowX
		
		#print('No Contact');
		
	move_and_slide()


func _on_hurt_box_area_entered(area: Area2D) -> void:
	if area.is_in_group("Player"):
		print('Damage Taken Enemy')
		health -= 1;
		
