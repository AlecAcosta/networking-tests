extends "res://BaseRoom.gd"


func _ready():
	Network.join_server()
	
	Network.peer.connect("server_disconnected", self, "_on_server_disconnected")
	Network.peer.connect("connection_succeeded", self, "_on_connection_succeeded")
	Network.peer.connect("connection_failed", self, "_on_connection_failed")


func _on_server_disconnected():
	output_print("server disconnected")

func _on_connection_succeeded():
	output_print("connection succeeded")

func _on_connection_failed():
	output_print("connection failed")

func _on_BtnSayHi_pressed():
	Network.rpc("recieve_message", Network.id, "hi, I'm a client")
