extends VBoxContainer

var card_data

func set_data(data):
	card_data = data
	$title.text = data.name
	$description.text = data.description
	$effects.text = "💰%d ❤️%d 👥%d ⚡%d" % [data.money, data.happiness, data.social, data.energy]
	
	# Apply blur effect if card is blurred
	if data.has("blur_type"):
		apply_blur(data.blur_type)

func apply_blur(blur_type = "both"):
	# Create blur effect
	var blur_material = ShaderMaterial.new()
	var blur_shader = preload("res://blur_effect.gdshader")
	blur_material.shader = blur_shader
	
	# Apply blur based on type
	if blur_type == "both":
		# Blur both description and effects
		$description.material = blur_material
		$effects.material = blur_material
	elif blur_type == "effects":
		# Blur only effects, keep description clear
		$effects.material = blur_material
		$description.material = null

func _on_choose_pressed():
	get_parent().get_parent().apply_card(card_data)
	queue_free()
