extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var connected_card
var hovered = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

		if Input.is_action_just_released("click"):
			link_card()
		#Interpolate the card to the FieldSlot
		if(connected_card!= null and connected_card.get_parent() == self):
			connected_card.global_position = connected_card.global_position.linear_interpolate(self.position, 5 * delta) 
#checks if cards are hovered

func _on_FieldSlot_area_entered(area):
	hovered = true
	if(area.get_parent().get_parent().name == "Hand"):
		connected_card = area.get_parent()
		
func _on_FieldSlot_area_exited(area):
	hovered = false
	#if(area.get_parent().get_parent().name == "Hand"):
	#connected_card = null
		
		
		

func link_card():	
	#print("trump"+ String(card.trumpValue))

		if(connected_card != null and hovered ==true):
			var position_helper = connected_card.global_position#saves the position of the card
			if(connected_card.get_parent().name == "Hand"):
				connected_card.get_parent().remove_child(connected_card)
			self.add_child(connected_card)	
			connected_card.global_position = position_helper
			

		



	
	




