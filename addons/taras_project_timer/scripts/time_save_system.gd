class_name SaveManager
extends Node

var time_save_path: String = "user://project-time.save"
var settings_path: String = "user://settings.save"

func save_time(time: float):
	var save_time = FileAccess.open(time_save_path, FileAccess.WRITE)
	#var json = JSON.stringify(save_time())
	save_time.store_float(time)
	
func save_settings():
	pass

func load_time():
	if not FileAccess.file_exists(time_save_path):
		return 0.0
	
	var save_time = FileAccess.open(time_save_path, FileAccess.READ)
	var time: float = save_time.get_float()
	save_time.close()
	print(time)
	return time

func load_settings():
	pass

func delete_time_save():
	if not FileAccess.file_exists(time_save_path):
		return
	DirAccess.remove_absolute(time_save_path)
