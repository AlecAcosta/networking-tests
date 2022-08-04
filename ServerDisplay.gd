extends Control

onready var LblInfo:= $"LblInfo"


var ip_address = "" setget set_ip_address
var info = "" setget set_info

func set_ip_address(value: String):
	ip_address = value
#	LblInfo.text = ip_address

func set_info(text: String):
	info = text
	LblInfo.text = info


func _on_BtnJoin_pressed():
	Network.ip_address = ip_address
	get_tree().change_scene("res://Client.tscn")
