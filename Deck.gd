extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
var cards_test

func _ready():
	var card_file = File.new()
	card_file.open("res://cards.json",File.READ)
	var cards_json = JSON.parse(card_file.get_as_text())
	card_file.close()
	cards_test = cards_json.result



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
#	pass

const card = preload("res://Card.tscn")

func _on_Area2D_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton and event.pressed):
		if event.button_index == BUTTON_LEFT :
			print("pressed")
			var newCard = card.instance()
			newCard.position = self.position
			var card_copy = cards_test.cards[randi()%cards_test.cards.size()]
			newCard.get_node("BattleStat").text = String(card_copy.score)
			cards_test.cards.erase(card_copy)
			self.get_parent().get_node("Hand").add_child(newCard)	
				
	pass # Replace with function body.
