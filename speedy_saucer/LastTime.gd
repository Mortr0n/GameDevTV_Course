extends Label


@onready var last_time_node: Label = $"."
@onready var level_1: Node2D = $"../../.."


var last_time = 00.00


func _ready() -> void:
	print(last_time)
	last_time = level_1.level_time
	last_time_node.text = str(last_time)
