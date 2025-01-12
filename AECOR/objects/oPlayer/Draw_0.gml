//healthbar
draw_self();
draw_healthbar(
	x - (sprite_width / 4),
	y - sprite_height/2,
	x + (sprite_width / 4),
	y - sprite_height/2,
	100 * (currentHP / maxHP),
	c_black,
	c_red,
	c_green,
	0,
	true,
	false
	);