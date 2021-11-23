extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var dragged = false;
var cardName = "TestCard"
var trumpValue = 10;
# Called when the node enters the scene tree for the first time.
func _ready():
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_released("click"):
		dragged = false		
		
		
	if dragged == true:
		self.global_position = self.global_position.linear_interpolate(get_global_mouse_position(), 8 * delta) 


#	pass


func _on_Area2D_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton and event.pressed):
		if event.button_index == BUTTON_LEFT :
			dragged = true

