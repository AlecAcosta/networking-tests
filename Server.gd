extends "res://BaseRoom.gd"


func _ready():
	Network.init_server()
	
	Network.connect("peer_connected", self, "_on_peer_connected")
	Network.connect("peer_disconnected", self, "_on_peer_disconnected")
	Network.connect("message_recieved", self, "_on_message_recieved")

#func _input(event):
#	if event.is_action_pressed("ui_accept"):
#		Network.rpc("message", id, "hi, im the server")


func _on_peer_connected(id: int):
	output_print("peer connected, id: "+str(id))
	rpc("message", "welcome "+ str(id))

func _on_peer_disconnected(id: int):
	output_print("peer disconnected, id: "+str(id))

func _on_message_recieved(id: int, text: String):
	output_print(str(id)+ ": "+ text)
