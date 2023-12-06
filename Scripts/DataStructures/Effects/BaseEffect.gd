class_name BaseEffect
extends Node


@export var EffectID : String

var IsModified : bool = false
var Modifier : int = 0


func CanAffect(target : BaseTarget) -> bool:
	var canAffect : bool = true
	
	for i in range(target.Attributes.size()):
		var attr : BaseAttribute = target.Attributes[i]
		if attr.ModifiedEffect == EffectID:
			match attr.Modifier:
				-1:
					return false
				0:
					IsModified = true
					Modifier = attr.ModifierAmount
					return true
				1:
					return true
	
	return canAffect


func StartEffect():
	pass


func RunEffect():
	pass


func FinishEffect():
	pass
