shader_type canvas_item;

uniform sampler2D screen_texture : hint_screen_texture, filter_linear_mipmap;
uniform float amount: hint_range(0.0, 1.0);

void fragment() {
	COLOR.rgb = textureLod(screen_texture, SCREEN_UV, 0.0).rgb;
	vec4 c = COLOR;
	COLOR.r = c.g - amount;
	COLOR.g = c.b - amount;
	COLOR.b = c.r - amount;
	
}