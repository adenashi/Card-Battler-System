class_name PlayState
extends CardState


func EnterState() -> bool:
	return true



func PlayCard():
	match SM.Owner.CardData.CardType:
				"TARGETED":
					if SM.Owner.CanEffectTarget():
						SM.Owner.Play()
						SM.Owner.Player.UpdateActionPoints(-SM.Owner.CardData.CardCost)
					else:
						SM.UpdateState(CardStateMachine.State.HAND)
				"SELF":
					SM.UpdateState(CardStateMachine.State.PLAYED)
				"NON_TARGETED":
					SM.UpdateState(CardStateMachine.State.PLAYED)
	
	DiscardCard()


func DiscardCard():
	# Send SM.Owner.CardData to DeckManager to add to Discard Pile
	SM.Owner.queue_free()
