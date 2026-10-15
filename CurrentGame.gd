extends "res://CurrentGame.gd"

func getCourseDestinations(all = false):
	var out:Dictionary = .getCourseDestinations(all)
	var outreg:Dictionary = {}
	var added:bool = false
	for i in out.keys():
		outreg[i] = out[i]
		if not added and i == "DESTINATION_ENCELADUS":
			added = true
			if Tool.claim(playerShip) and playerShip.getConfig("infinite_probability_drive.equipment.type") == "IMPROBDRIVE_SYSTEM_INFINITE_DRIVE":
				outreg["IMPROBDRIVE_DESTINATION_INF_PROBABILITY"] = {
					"vector": Vector2( - 1000000000000, 1500000),
					"time": null
				}
				Tool.release(playerShip)
	return outreg
