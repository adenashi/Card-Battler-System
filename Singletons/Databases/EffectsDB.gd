extends Node

@export var Effects : Dictionary = {
	"Attack": preload("res://Scripts/DataStructures/Effects/AttackEffect.gd"),
	"Heal": preload("res://Scripts/DataStructures/Effects/HealEffect.gd"),
	"Poison": preload("res://Scripts/DataStructures/Effects/PoisonEffect.gd"),
}


func GetEffect(id : String) -> Object:
	if Effects.has(id):
		var effectPath : Object = Effects[id]
		return effectPath
	else:
		return null
