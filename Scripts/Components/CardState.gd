class_name CardState
extends Node

@export var SM : CardStateMachine
@export var State : CardStateMachine.State


func EnterState() -> bool:
	var entered = true
	
	return entered


func MouseEnter():
	pass


func MouseExit():
	pass


func Input(event : InputEvent):
	pass


func ExitState() -> bool:
	var exited = true
	
	return exited
