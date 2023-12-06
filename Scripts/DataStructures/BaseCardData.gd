class_name BaseCardData
extends Resource

@export var CardID : int
@export var CardName : String
@export_enum("TARGETED", "SELF", "NON_TARGETED") var CardType : String
@export_multiline var CardText : String
@export var CardCost : int
@export var Attack : int
@export var Defense : int
@export_file() var CardImage : String
@export var Effects : Array[String] = []
