class_name PlayState
extends CardState


func EnterState() -> bool:
	PlayCard()
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
					SM.Owner.Play()
					SM.Owner.Player.UpdateActionPoints(-SM.Owner.CardData.CardCost)
				"NON_TARGETED":
					SM.Owner.Play()
					SM.Owner.Player.UpdateActionPoints(-SM.Owner.CardData.CardCost)
	
	DiscardCard()


func DiscardCard():
	# Send SM.Owner.CardData to DeckManager to add to Discard Pile
	print("Card played.")
	SM.Owner.queue_free()
