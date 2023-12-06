extends Node

enum GameState {PLAYER_TURN, AI_TURN}

@export var CurrentState : GameState
@export var MaxActionPoints : int = 5


func _ready():
	UpdateGameState(GameState.PLAYER_TURN)


func UpdateGameState(newState : GameState):
	CurrentState = newState
	match CurrentState:
		GameState.PLAYER_TURN:
			Dispatch.StartPlayerTurn.emit()
		GameState.AI_TURN:
			Dispatch.StartAITurn.emit()


func EndTurn():
	match CurrentState:
		GameState.PLAYER_TURN:
			UpdateGameState(GameState.AI_TURN)
		GameState.AI_TURN:
			UpdateGameState(GameState.PLAYER_TURN)
