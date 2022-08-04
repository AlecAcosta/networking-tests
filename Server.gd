extends "res://BaseRoom.gd"


func _ready():
	Network.init_server()
	
	Network.peer.connect("peer_connected", self, "_on_peer_connected")
	Network.peer.connect("peer_disconnected", self, "_on_peer_disconnected")
	
func _input(event):
	if event.is_action_pressed("ui_accept"):
		Network.rpc("recieve_message", id, "hi, I'm the server")
#		_on_message_recieved(Network.id, "hi, I'm the server")

func _on_peer_connected(id: int):
	output_print("peer connected, id: "+str(id))
	Network.rpc("player_has_joined_msg", id)

func _on_peer_disconnected(id: int):
	output_print("peer disconnected, id: "+str(id))
