extends "res://BaseRoom.gd"

const res_ServerAdvertiser:= preload("res://ServerAdvertiser.tscn")


func _ready():
	Network.init_server()
	
	add_child(res_ServerAdvertiser.instance())
	
	Network.peer.connect("peer_connected", self, "_on_peer_connected")
	Network.peer.connect("peer_disconnected", self, "_on_peer_disconnected")


func _on_peer_connected(id: int):
	output_print("peer connected, id: "+str(id))
	Network.rpc("player_has_joined_msg", id)

func _on_peer_disconnected(id: int):
	output_print("peer disconnected, id: "+str(id))
	
func _on_BtnSayHi_pressed():
	Network.rpc("recieve_message", id, "hi, I'm the server")
