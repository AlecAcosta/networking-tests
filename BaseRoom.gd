extends Control

onready var OutputLog:= $"OutputLog"
onready var LblIP:= $"LblIP"

var id: int


func output_print(text: String):
	OutputLog.text += text + "\n"


func _on_BtnBack_pressed():
	get_tree().network_peer = null
	get_tree().change_scene("res://Main.tscn")
