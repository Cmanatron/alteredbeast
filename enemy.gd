extends CharacterBody2D
#var bContacts = [];
#var fContacts = [];
@onready var domJoint = $FrontLegs/FJoint
@export var speed = -300
@export var ySpeed = 0
var animalID = [0,0,0,0,0]


var distance = 0;


var maxSpeed = 400
var maxJump = 400
var slowX = 10
var slowY = 10
var damage = 1
var atk = false
var health = 3;

func _ready() -> void:
	add_to_group("Enemy")
	
	match animalID[0]: #Head
		0:
			$Head/CollisionShape2D/Sprite2D.texture = preload("res://AnimalSprites/Dog/PurePNGDog.png_0000_Layer-2.png")
		1:
			$Head/CollisionShape2D/Sprite2D.texture = preload("res://AnimalSprites/Cat/PurePNGCat_0000_Layer-2.png")
		2:
			$Head/CollisionShape2D/Sprite2D.texture = preload("res://AnimalSprites/Bird/bird_0000_Layer-2.png")
		3:
			$Head/CollisionShape2D/Sprite2D.texture = preload("res://AnimalSprites/Hort/hortse_0000_Layer-2.png")
		4:
			$Head/CollisionShape2D/Sprite2D.texture = preload("res://AnimalSprites/Turtle/tortoise_0000_Layer-2.png")
		
	match animalID[1]:
		0:
			$BodyShape/Sprite2D.texture = preload("res://AnimalSprites/Dog/PurePNGDog.png_0001_Layer-3.png")
		1:
			$BodyShape/Sprite2D.texture = preload("res://AnimalSprites/Cat/PurePNGCat_0001_Layer-3.png")
		2:
			$BodyShape/Sprite2D.texture = preload("res://AnimalSprites/Bird/bird_0001_Layer-3.png")
		3:
			$BodyShape/Sprite2D.texture = preload("res://AnimalSprites/Hort/hortse_0002_Layer-3.png")
		4:
			$BodyShape/Sprite2D.texture = preload("res://AnimalSprites/Turtle/tortoise_0003_Layer-5.png")
			
	match animalID[2]:
		0:
			$Tail/CollisionShape2D/Sprite2D.texture = preload("res://AnimalSprites/Dog/PurePNGDog.png_0003_Layer-5.png")
		1:
			$Tail/CollisionShape2D/Sprite2D.texture = preload("res://AnimalSprites/Cat/PurePNGCat_0002_Layer-4.png")
		2:
			$Tail/CollisionShape2D/Sprite2D.texture = preload("res://AnimalSprites/Bird/bird_0003_Layer-5.png")
		3:
			$Tail/CollisionShape2D/Sprite2D.texture = preload("res://AnimalSprites/Hort/hortse_0003_Layer-5.png")
		4:
			$Tail/CollisionShape2D/Sprite2D.texture = preload("res://AnimalSprites/Turtle/tortoise_0001_Layer-4.png")
	
	match animalID[3]:
		0:
			$FrontLegs/CollisionShape2D/Sprite2D.texture = preload("res://AnimalSprites/Dog/PurePNGDog.png_0002_Layer-4.png")
		1:
			$FrontLegs/CollisionShape2D/Sprite2D.texture = preload("res://AnimalSprites/Cat/PurePNGCat_0003_Layer-5.png")
		2:
			$FrontLegs/CollisionShape2D/Sprite2D.texture = preload("res://AnimalSprites/Bird/bird_0002_Layer-4.png")
		3:
			$FrontLegs/CollisionShape2D/Sprite2D.texture = preload("res://AnimalSprites/Hort/hortse_0003_Layer-5.png")
		4:
			$FrontLegs/CollisionShape2D/Sprite2D.texture = preload("res://AnimalSprites/Turtle/tortoise_0003_Layer-5.png")
			
	match animalID[4]:
		0:
			$BackLegs/CollisionShape2D/Sprite2D.texture = preload("res://AnimalSprites/Dog/PurePNGDog.png_0002_Layer-4.png")
		1:
			$BackLegs/CollisionShape2D/Sprite2D.texture = preload("res://AnimalSprites/Cat/PurePNGCat_0003_Layer-5.png")
		2:
			$BackLegs/CollisionShape2D/Sprite2D.texture = preload("res://AnimalSprites/Bird/bird_0002_Layer-4.png")
		3:
			$BackLegs/CollisionShape2D/Sprite2D.texture = preload("res://AnimalSprites/Hort/hortse_0003_Layer-5.png")
		4:
			$BackLegs/CollisionShape2D/Sprite2D.texture = preload("res://AnimalSprites/Turtle/tortoise_0003_Layer-5.png")
			
	
	$BodyShape/Sprite2D.scale.x = ($BodyShape.shape.size.x/$BodyShape/Sprite2D.texture.get_width())
	$BodyShape/Sprite2D.scale.y = ($BodyShape.shape.size.y/$BodyShape/Sprite2D.texture.get_height())
	
	$FrontLegs/CollisionShape2D/Sprite2D.scale.x = ($FrontLegs/CollisionShape2D.shape.size.x/$FrontLegs/CollisionShape2D/Sprite2D.texture.get_width())
	$FrontLegs/CollisionShape2D/Sprite2D.scale.y = ($FrontLegs/CollisionShape2D.shape.size.y/$FrontLegs/CollisionShape2D/Sprite2D.texture.get_height())
	
	$BackLegs/CollisionShape2D/Sprite2D.scale.x = ($BackLegs/CollisionShape2D.shape.size.x/$BackLegs/CollisionShape2D/Sprite2D.texture.get_width())
	$BackLegs/CollisionShape2D/Sprite2D.scale.y = ($BackLegs/CollisionShape2D.shape.size.x/$BackLegs/CollisionShape2D/Sprite2D.texture.get_height())
	
	#$Head/CollisionShape2D/Sprite2D.scale.x = ($Head/CollisionShape2D.shape.radius*$Head/CollisionShape2D/Sprite2D.texture.get_width())
	#$Head/CollisionShape2D/Sprite2D.scale.y = ($Head/CollisionShape2D.shape.radius*$Head/CollisionShape2D/Sprite2D.texture.get_height())
	
	$Tail/CollisionShape2D/Sprite2D.scale.x = ($Tail/CollisionShape2D.shape.size.x/$Tail/CollisionShape2D/Sprite2D.texture.get_width())
	$Tail/CollisionShape2D/Sprite2D.scale.y = ($Tail/CollisionShape2D.shape.size.y/$Tail/CollisionShape2D/Sprite2D.texture.get_height())


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
	

	
	print(Player.instance.get_node('Body').position.x)
	
	
	
	if(velocity.x < 10 && $BackLegs.get_contact_count()>2):
		ySpeed = -400
	
	$Head.rotation = 0;
	#print('Moving')
	#get_input()
	velocity.x = speed
	velocity.y = ySpeed
	
	$BackLegs.angular_velocity = randi_range(-90,90)
	
	if($FrontLegs.get_colliding_bodies().has($Floor)):
		ySpeed =0 
		print('Contact')
	if($BackLegs.get_colliding_bodies().has($Floor)):
		ySpeed =0 
		print('Contact')
	
	
	
		
	else:
		ySpeed += slowY
		if(speed >=0):
			speed -= slowX
		else:
			speed +=slowX
		
		#print('No Contact');
	if(health ==0 ):
		get_tree().change_scene_to_file("res://intermission.tscn")
		
	move_and_slide()


func _on_hurt_box_area_entered(area: Area2D) -> void:
	if area.is_in_group("Player"):
		print('Damage Taken Enemy')
		health -= 1;
		
