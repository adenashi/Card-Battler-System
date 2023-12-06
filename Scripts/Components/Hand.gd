class_name Hand
extends HBoxContainer


func _ready():
	Dispatch.ReparentCard.connect(ReparentCard)


func ReparentCard(card : CardUI):
	card.reparent(self)
