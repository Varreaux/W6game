extends Control

var final_stats = {"money": 0, "happiness": 0, "social": 0, "energy": 0}

func _ready():
	if final_stats:
		update_stats_display()

func set_final_stats(stats: Dictionary):
	final_stats = stats
	if is_node_ready():
		update_stats_display()

func update_stats_display():
	$Panel/stats_label.text = "Final Stats:\n💰 Money: %d\n❤️ Happiness: %d\n👥 Social: %d\n⚡ Energy: %d" % [
		final_stats.money,
		final_stats.happiness,
		final_stats.social,
		final_stats.energy
	]

func _on_restart_button_pressed():
	# Return to main game scene
	get_tree().change_scene_to_file("res://main.tscn")

func _on_quit_button_pressed():
	# Quit the game
	get_tree().quit()
