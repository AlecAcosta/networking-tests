extends Node

var peer
var ip_address
var id

signal connection_succeeded
signal connection_failed
signal peer_connected
signal peer_disconnected
signal server_disconnected
signal message_recieved


func init_server():
	peer = NetworkedMultiplayerENet.new()
	peer.create_server(28960, 2)
	get_tree().set_network_peer(peer)
	
	update_id()
	
	peer.connect("connection_succeeded", self, "_on_connection_succeeded")
	peer.connect("connection_failed", self, "_on_connection_failed")
	peer.connect("peer_connected", self, "_on_peer_connected")
	peer.connect("peer_disconnected", self, "_on_peer_disconnected")

func init_client():
	for ip in IP.get_local_addresses():
		if ip.begins_with("192.168.") and not ip.ends_with(".1"):
			ip_address = ip
	
	peer = NetworkedMultiplayerENet.new()
	peer.create_client(ip_address, 28960)
	get_tree().set_network_peer(peer)
	
	update_id()
	
	peer.connect("connection_succeeded", self, "_on_connection_succeeded")
	peer.connect("connection_failed", self, "_on_connection_failed")
	peer.connect("server_disconnected", self, "_on_server_disconnected")

func update_id():
	id = get_tree().get_network_unique_id()


remote func recieve_message(id: int, text: String):
	emit_signal("message_recieved", id, text)


func _on_connection_succeeded():
	emit_signal("connection_succeeded")

func _on_connection_failed():
	emit_signal("connection_failed")

func _on_peer_connected(id: int):
	emit_signal("peer_connected", id)

func _on_peer_disconnected(id: int):
	emit_signal("peer_disconnected", id)

func _on_server_disconnected():
	emit_signal("server_disconnected")
