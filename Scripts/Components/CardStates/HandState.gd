class_name HandState
extends CardState


func EnterState() -> bool:
	Dispatch.ReparentCard.emit(SM.Owner)
	return true


func MouseEnter():
	SM.Owner.position.y -= 100


func MouseExit():
	SM.Owner.position.y += 100


func Input(event : InputEvent):
	if event is InputEventMouseButton:
		if event.pressed && event.button_index == MOUSE_BUTTON_LEFT:
			match SM.Owner.CardData.CardType:
				"TARGETED":
					SM.UpdateState(CardStateMachine.State.AIMING)
				"SELF":
					SM.UpdateState(CardStateMachine.State.PLAYED)
				"NON_TARGETED":
					SM.UpdateState(CardStateMachine.State.PLAYED)


func ExitState() -> bool:
	return true
