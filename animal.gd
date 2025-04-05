extends CharacterBody2D

@export var speed = 0
@export var ySpeed = 0
func get_input():
	if(Input.is_action_pressed('MoveRight')):
		speed = 400;
		#print('Right')
	if(Input.is_action_pressed('MoveLeft')):
		speed = -400;
	if(Input.is_action_just_pressed('Jump')):
		ySpeed = -400;
		#print('jump')
	
func _physics_process(delta):
	#print('Moving')
	get_input()
	velocity.x = speed
	velocity.y = ySpeed
	print($FrontLegs.get_contact_count())
	if($FrontLegs.get_contact_count() !=0):
		ySpeed = 0
		#print('Contact F')
	elif($BackLegs.get_contact_count() !=0):
		ySpeed = 0
		#print('Contact B')
	else:
		ySpeed += 10
		print('No Contact');
		
	move_and_slide()
