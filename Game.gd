extends "res://Game.gd"

var improb_drive_pointers:HevLibPointers._ConfigDriver

func _ready():
	improb_drive_pointers = ModLoader._savedObjects[0].ConfigDriver

func initiateFastTravel(to, vector):
	.initiateFastTravel(to,vector)
	var ship = CurrentGame.getPlayerShip()
	if Tool.claim(ship):
		match to:
			"DESTINATION_ENCELADUS": pass
			"IMPROBDRIVE_DESTINATION_INF_PROBABILITY":
				ship.trajectoryTarget.init = Vector2.ZERO
				ship.autopilotDesiredVelocity = Vector2.ZERO
				ship.aiImperativeDirection = Vector2.ZERO
				if randf() < improb_drive_pointers.__get_value("IMPROBDRIVE_NAME","IMPROBDRIVE_CONFIG_SECT_MAIN","improb_drive_enceladus_chance",0.1):
					enceladus = Loader.prepare(enceladus, true)
					ship.trajectoryTarget.name = "DESTINATION_ENCELADUS"
			_:
				if randf() < improb_drive_pointers.__get_value("IMPROBDRIVE_NAME","IMPROBDRIVE_CONFIG_SECT_MAIN","improb_drive_enceladus_chance",0.1) and ship.getConfig("infinite_probability_drive.equipment.type") == "IMPROBDRIVE_SYSTEM_FINITE_DRIVE":
					enceladus = Loader.prepare(enceladus, true)
					ship.trajectoryTarget.name = "DESTINATION_ENCELADUS"
		Tool.release(ship)
	
	
