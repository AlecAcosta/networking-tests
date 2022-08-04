extends Node

signal player_has_joined
signal message_recieved
signal id_changed


var peer
var ip_address
var id setget set_id


func set_id(value: int):
	id = value
	emit_signal("id_changed", id)


func init_server():
	peer = NetworkedMultiplayerENet.new()
	peer.create_server(28960, 10)
	get_tree().set_network_peer(peer)
	
	update_id()
	
#	peer.connect("connection_succeeded", self, "_on_connection_succeeded")
#	peer.connect("connection_failed", self, "_on_connection_failed")
#	peer.connect("peer_connected", self, "_on_peer_connected")
#	peer.connect("peer_disconnected", self, "_on_peer_disconnected")

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
	set_id(get_tree().get_network_unique_id())


remotesync func recieve_message(id: int, text: String):
	emit_signal("message_recieved", id, text)

remotesync func player_has_joined_msg(id: int):
	emit_signal("player_has_joined", id)
