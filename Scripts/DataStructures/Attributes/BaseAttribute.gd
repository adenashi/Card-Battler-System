class_name BaseAttribute
extends Node

@export var AttributeID : String
@export var ModifiedEffect : String
@export_enum("Nullify: -1", "Minimize: 0", "Augment: 1") var Modifier : int
@export var ModifierAmount : int 

# State of being that a target can have
# Determines how effects used against the target will be modified:
# Augment
# Minimize
# Nullify
