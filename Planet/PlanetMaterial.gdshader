shader_type spatial;

uniform float min_height;
uniform float max_height;
uniform sampler2D height_color;

varying float height;

void fragment(){
	float t = height / (max_height - min_height) - (min_height / (max_height - min_height));
	vec3 color = texture(height_color, vec2(t, 0.1)).rgb;
	ALBEDO = color;
}

void vertex(){
	height = length(VERTEX);
}