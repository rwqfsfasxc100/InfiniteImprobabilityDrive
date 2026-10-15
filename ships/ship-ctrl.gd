extends "res://ships/ship-ctrl.gd"

var improb_drive_pointers:HevLibPointers._ConfigDriver

func _ready():
	improb_drive_pointers = ModLoader._savedObjects[0].ConfigDriver

func fastTravelTo(target):
	if target.name != "DESTINATION_ENCELADUS":
		match getConfig("infinite_probability_drive.equipment.type"):
			"IMPROBDRIVE_SYSTEM_FINITE_DRIVE":
				if randf() < improb_drive_pointers.__get_value("IMPROBDRIVE_NAME","IMPROBDRIVE_CONFIG_SECT_MAIN","improb_drive_finite_chance",0.5):
					target.vector = Vector2(rand_range(20_000.0,30_000_000.0),rand_range(0.0,30_000_000.0))
			"IMPROBDRIVE_SYSTEM_INFINITE_DRIVE":
				if target.name == "IMPROBDRIVE_DESTINATION_INF_PROBABILITY":
					target.vector = Vector2(
						rand_range(20_000.0,30_000_000.0),
						rand_range(0.0,30_000_000.0)
					)
	return .fastTravelTo(target)
