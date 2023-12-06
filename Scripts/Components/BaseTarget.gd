class_name BaseTarget
extends Node


@export var Listen : bool = false
@export var Attributes : Array[BaseAttribute] = []


func _ready():
	Dispatch.StartAiming.connect(func(): Listen = true)


func OnClick(_viewport : Node, event : InputEvent, _shape_idx : int):
	if !Listen:
		return
	if event is InputEventMouseButton:
		if event.pressed && event.button_index == MOUSE_BUTTON_LEFT:
			Dispatch.TargetAcquired.emit(self)
			Listen = false
