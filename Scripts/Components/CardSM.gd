class_name CardStateMachine
extends Node

enum State {HAND, AIMING, PLAYED}

@export var Owner : CardUI
@export var CurrentState : CardState
@export var States : Dictionary = {}


func RegisterStates():
	for state : CardState in get_children():
		state.SM = self
		States[state.State] = state
	
	CurrentState = States[State.HAND]


func UpdateState(newState : State):
	if !States.has(newState):
		return
	
	var exited = CurrentState.ExitState()
	if exited:
		var entered = States[newState].EnterState()
		if entered:
			CurrentState = States[newState]
		else:
			CurrentState.EnterState()


func MouseEnter():
	CurrentState.MouseEnter()


func Input(event : InputEvent):
	CurrentState.Input(event)


func MouseExit():
	CurrentState.MouseExit()
