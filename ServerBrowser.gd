extends Panel

const res_ServerDisplay = preload("res://ServerDisplay.tscn")


onready var ServerListener:= $"ServerListener"
onready var ServerList:= $"ServerList"
 


func _on_ServerListener_new_server(server_info):
	var server = res_ServerDisplay.instance()
	ServerList.add_child(server)
	
	server.ip_address = str(server_info.ip)
	server.info = server_info.name
	
	print("added server")


func _on_ServerListener_remove_server(ip):
	for server in get_tree().get_nodes_in_group("server display"):
		if server.ip_address == ip:
			server.queue_free()
			break



func _on_BtnBack_pressed():
	queue_free()
