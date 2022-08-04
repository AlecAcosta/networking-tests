extends Control

const res_ServerBrowser = preload("res://ServerBrowser.tscn")


func _on_Host_pressed():
	get_tree().change_scene("res://Server.tscn")


func _on_Join_pressed():
	add_child(res_ServerBrowser.instance())
