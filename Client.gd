extends "res://BaseRoom.gd"


func _ready():
	Network.init_client()
	
	Network.connect("server_disconnected", self, "_on_server_disconnected")
	Network.connect("connection_succeeded", self, "_on_connection_succeeded")
	Network.connect("connection_failed", self, "_on_connection_failed")

func _input(event):
	if event.is_action_pressed("ui_accept"):
		Network.rpc("recieve_message", Network.id, "hi, im connected")


func _on_server_disconnected():
	output_print("server disconnected")

func _on_connection_succeeded():
	output_print("connection succeeded")
	rpc_id(1, "test", "Hello")

func _on_connection_failed():
	output_print("connection failed")