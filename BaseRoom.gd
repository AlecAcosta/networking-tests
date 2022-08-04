extends Control


onready var OutputLog:= $"OutputLog"
onready var LblID:= $"LblID"

var id: int


func _ready():
	Network.connect("message_recieved", self, "_on_message_recieved")
	Network.connect("player_has_joined", self, "_on_player_has_joined")
	Network.connect("id_changed", self, "_on_id_changed")


func output_print(text: String):
	OutputLog.text += text + "\n"


func _on_id_changed(id: int):
	LblID.text = str(id)

func _on_BtnBack_pressed():
	get_tree().network_peer = null
	get_tree().change_scene("res://Main.tscn")

func _on_message_recieved(id: int, text: String):
	output_print("      -"+str(id)+ ": "+ text)

func _on_player_has_joined(id: int):
	output_print("   "+str(id)+" has joined")
