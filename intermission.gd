extends Control

var selected;
var choice1Ico = randi_range(0,4)
var choice2Ico = randi_range(0,4)

func _ready() -> void:
	var animalID = AnimalController.playerAnimal
	match animalID[0]: #Head
		0:
			$Head.icon = preload("res://AnimalSprites/Dog/PurePNGDog.png_0000_Layer-2.png")
		1:
			$Head.icon = preload("res://AnimalSprites/Cat/PurePNGCat_0000_Layer-2.png")
		2:
			$Head.icon = preload("res://AnimalSprites/Bird/bird_0000_Layer-2.png")
		3:
			$Head.icon = preload("res://AnimalSprites/Hort/hortse_0000_Layer-2.png")
		4:
			$Head.icon = preload("res://AnimalSprites/Turtle/tortoise_0000_Layer-2.png")
		
	match animalID[1]: #Body
		0:
			$Body.icon = preload("res://AnimalSprites/Dog/PurePNGDog.png_0001_Layer-3.png")
		1:
			$Body.icon = preload("res://AnimalSprites/Cat/PurePNGCat_0001_Layer-3.png")
		2:
			$Body.icon = preload("res://AnimalSprites/Bird/bird_0001_Layer-3.png")
		3:
			$Body.icon = preload("res://AnimalSprites/Hort/hortse_0002_Layer-3.png")
		4:
			$Body.icon = preload("res://AnimalSprites/Turtle/tortoise_0003_Layer-5.png")
			
	match animalID[2]: #Tail
		0:
			$Tail.icon = preload("res://AnimalSprites/Dog/PurePNGDog.png_0003_Layer-5.png")
		1:
			$Tail.icon = preload("res://AnimalSprites/Cat/PurePNGCat_0002_Layer-4.png")
		2:
			$Tail.icon = preload("res://AnimalSprites/Bird/bird_0003_Layer-5.png")
		3:
			$Tail.icon = preload("res://AnimalSprites/Hort/hortse_0003_Layer-5.png")
		4:
			$Tail.icon = preload("res://AnimalSprites/Turtle/tortoise_0001_Layer-4.png")
	
	match animalID[3]:
		0:
			$FLeg.icon = preload("res://AnimalSprites/Dog/PurePNGDog.png_0002_Layer-4.png")
		1:
			$FLeg.icon = preload("res://AnimalSprites/Cat/PurePNGCat_0003_Layer-5.png")
		2:
			$FLeg.icon = preload("res://AnimalSprites/Bird/bird_0002_Layer-4.png")
		3:
			$FLeg.icon = preload("res://AnimalSprites/Hort/hortse_0003_Layer-5.png")
		4:
			$FLeg/Label.icon = preload("res://AnimalSprites/Turtle/tortoise_0003_Layer-5.png")
			
	match animalID[4]:
		0:
			$BLeg.icon = preload("res://AnimalSprites/Dog/PurePNGDog.png_0002_Layer-4.png")
		1:
			$BLeg.icon = preload("res://AnimalSprites/Cat/PurePNGCat_0003_Layer-5.png")
		2:
			$BLeg.icon = preload("res://AnimalSprites/Bird/bird_0002_Layer-4.png")
		3:
			$BLeg.icon = preload("res://AnimalSprites/Hort/hortse_0003_Layer-5.png")
		4:
			$BLeg.icon = preload("res://AnimalSprites/Turtle/tortoise_0003_Layer-5.png")
			

	
	
	
	
	match choice1Ico:
		0:
			$Choice1.icon = preload("res://AnimalSprites/Dog/PurePNGDog.png_0004_Layer-1.png")
		1:
			$Choice1.icon = preload("res://AnimalSprites/Cat/PurePNGCat_0004_Layer-1.png")
		2:
			$Choice1.icon = preload("res://AnimalSprites/Bird/bird_0004_Layer-1.png")
		3:
			$Choice1.icon = preload("res://AnimalSprites/Hort/hortse_0004_Layer-1.png")
		4:
			$Choice1.icon = preload("res://AnimalSprites/Turtle/tortoise_0004_Layer-1.png")
			
		
			
	match choice2Ico:
		0:
			$Choice2.icon = preload("res://AnimalSprites/Dog/PurePNGDog.png_0004_Layer-1.png")
		1:
			$Choice2.icon = preload("res://AnimalSprites/Cat/PurePNGCat_0004_Layer-1.png")
		2:
			$Choice2.icon = preload("res://AnimalSprites/Bird/bird_0004_Layer-1.png")
		3:
			$Choice2.icon = preload("res://AnimalSprites/Hort/hortse_0004_Layer-1.png")
		4:
			$Choice2.icon = preload("res://AnimalSprites/Turtle/tortoise_0004_Layer-1.png")
			
		

func _on_continue_pressed() -> void:
	get_tree().change_scene_to_file("res://level.tscn")
	



func _on_head_pressed() -> void:
	if(selected != null):
		AnimalController.playerAnimal[0] = selected
		get_tree().change_scene_to_file("res://level.tscn")
		


func _on_body_pressed() -> void:
	if(selected != null):
		AnimalController.playerAnimal[1] = selected
		get_tree().change_scene_to_file("res://level.tscn")
	


func _on_b_leg_pressed() -> void:
	if(selected != null):
		AnimalController.playerAnimal[4] = selected
		get_tree().change_scene_to_file("res://level.tscn")



func _on_f_leg_pressed() -> void:
	if(selected != null):
		AnimalController.playerAnimal[3] = selected
		get_tree().change_scene_to_file("res://level.tscn")

func _on_tail_pressed() -> void:
	if(selected != null):
		AnimalController.playerAnimal[2] = selected
		get_tree().change_scene_to_file("res://level.tscn")


func _on_choice_1_pressed() -> void:
	selected = choice1Ico


func _on_choice_2_pressed() -> void:
	selected = choice2Ico
