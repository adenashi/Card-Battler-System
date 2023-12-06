class_name HumanPlayer
extends BasePlayer

@export var CurrentTarget : BaseTarget

func _ready():
	NewTurn()
	Dispatch.StartPlayerTurn.connect(NewTurn)
	Dispatch.TargetAcquired.connect(SetTarget)


func SetTarget(target : BaseTarget):
	CurrentTarget = target
	print("Current Target is {target}".format({"target": CurrentTarget.name}))
