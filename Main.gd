extends Control


func _on_Host_pressed():
	get_tree().change_scene("res://Server.tscn")


func _on_Join_pressed():
	get_tree().change_scene("res://Client.tscn")
