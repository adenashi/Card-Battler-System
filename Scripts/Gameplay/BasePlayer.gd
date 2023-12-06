class_name BasePlayer
extends Node


@export var PlayerID : int
@export var PlayerActionPoints : int


func NewTurn():
	PlayerActionPoints = GameManager.MaxActionPoints


func UpdateActionPoints(amount : int):
	PlayerActionPoints += amount
	if PlayerActionPoints <= 0:
		EndTurn()


func EndTurn():
	GameManager.EndTurn()
