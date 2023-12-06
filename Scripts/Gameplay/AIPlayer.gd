class_name AIPlayer
extends BasePlayer


func _ready():
	Dispatch.StartAITurn.connect(NewTurn)

