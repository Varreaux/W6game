extends Panel

var card_data

func set_data(data):
	card_data = data
	$CardContent/title.text = data.name
	$CardContent/description.text = data.description
	
	# Format effects with proper +/- signs
	var money_text = "%+d" % data.money if data.money != 0 else "±0"
	var happiness_text = "%+d" % data.happiness if data.happiness != 0 else "±0"
	var social_text = "%+d" % data.social if data.social != 0 else "±0"
	var energy_text = "%+d" % data.energy if data.energy != 0 else "±0"
	
	$CardContent/effects.text = "💰%s  ❤️%s  👥%s  ⚡%s" % [money_text, happiness_text, social_text, energy_text]
	
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
		$CardContent/description.material = blur_material
		$CardContent/effects.material = blur_material
	elif blur_type == "effects":
		# Blur only effects, keep description clear
		$CardContent/effects.material = blur_material
		$CardContent/description.material = null

func _on_choose_pressed():
	get_parent().get_parent().apply_card(card_data)
	queue_free()
