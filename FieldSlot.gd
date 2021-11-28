extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		if Input.is_action_just_released("click"):
			link_card()
		
		

var connected_card
func _on_FieldSlot_area_entered(area):
	if(area.get_parent().get_parent().name == "Hand"):
		connected_card = area.get_parent()

		

func link_card():	
	#print("trump"+ String(card.trumpValue))
		if(connected_card != null):
			if(connected_card.get_parent().name == "Hand"):
				connected_card.get_parent().remove_child(connected_card)
			connected_card.position.x = 0
			connected_card.position.y = 0
			self.add_child(connected_card)	

			#card.position = self.position

		



	
	

