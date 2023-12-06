class_name CardUI
extends TextureRect


#region Variables

@export_group("Card Data")
@export var CardData : BaseCardData
@export var StateMachine : CardStateMachine
@export var Player : BasePlayer
@export var CardEffects : Node

@export_group("UI Elements")
@export var CardImageTR : TextureRect
@export var CardNameLabel : Label
@export var AttackLabel : Label
@export var DefenseLabel : Label

#endregion

#region Life Cycle Functions

func _ready():
	Init(CardData, Player)
	StateMachine.RegisterStates()


func Init(data : BaseCardData, player : BasePlayer):
	CardData = data
	Player = player
	CardImageTR.texture = load (CardData.CardImage) as Texture2D
	CardNameLabel.text = CardData.CardName
	AttackLabel.text = str(CardData.Attack)
	DefenseLabel.text = str(CardData.Defense)
	tooltip_text = CardData.CardText
	
	# Instantiate nodes for each effect in the Card Data Effects array
	for i in range(CardData.Effects.size()):
		var effectID = CardData.Effects[i]
		var node = Node.new()
		var effect = EffectsDb.GetEffect(effectID)
		if effect != null:
			node.set_process(true)
			node.set_script(effect)
			node.name = effectID
			CardEffects.add_child(node)
		

#endregion

#region Gameplay Functions

func MouseEnter():
	StateMachine.MouseEnter()


func Input(event : InputEvent):
	StateMachine.Input(event)


func MouseExit():
	StateMachine.MouseExit()


func CanPlay() -> bool:
	return Player.PlayerActionPoints >= CardData.CardCost


func CanEffectTarget() -> bool:
	var allGood : bool = false
	for i in range(CardEffects.get_child_count()):
		var eff = CardEffects.get_child(i) as BaseEffect
		var player = Player as HumanPlayer
		allGood = eff.CanAffect(player.CurrentTarget)
	
	return allGood

func Play():
	for i in range(CardEffects.get_child_count()):
		CardEffects.get_child(i).StartEffect()

#endregion
