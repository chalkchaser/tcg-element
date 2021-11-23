extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var first_card_x = 960
var first_card_y = 900
var distanceBetweenCards = 150

var xPos
var yPos
# Called when the node enters the scene tree for the first time.
func _ready():
	pass




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var cards = get_children()
	var i = 0
	
	for card in cards:
			xPos = first_card_x + i * distanceBetweenCards -((cards.size()-1)* (distanceBetweenCards/2))
			yPos = first_card_y
			i = i+1
			if(card.dragged == false):
				card.global_position = card.global_position.linear_interpolate(Vector2(xPos, yPos), 5 * delta) 
