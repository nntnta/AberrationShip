shader_type canvas_item;

uniform sampler2D noise : repeat_enable;
uniform sampler2D SCREEN_TEXTURE : hint_normal;
uniform vec2 scroll = vec2(0.05, 0.05);


void fragment() {
	vec4 noise_col = texture(noise, UV + scroll * TIME);
	vec4 screen_col = texture(SCREEN_TEXTURE, UV);
	COLOR = screen_col;
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
