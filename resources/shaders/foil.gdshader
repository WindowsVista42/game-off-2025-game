shader_type spatial;

uniform sampler2D rainbow_noise;
uniform sampler2D noise_uv_tex;
uniform sampler2D base_color_tex;

//void vertex() {
//	// Called for every vertex the material is visible on.
//}

float fresnel(float amount, vec3 normal, vec3 view)
{
	return pow((1.0 - clamp(dot(normalize(normal), normalize(view)), 0.0, 1.0)), amount);
}

void fragment()
{
	float basic_fresnel = fresnel(1.0, NORMAL, VIEW);
	vec3 base_color = texture(base_color_tex, UV.xy).xyz;
	float uv_noise = texture(noise_uv_tex, UV.xy).x;
	vec3 rainbow = basic_fresnel * texture(rainbow_noise, vec2(abs(sin(pow(fresnel(5.0, NORMAL, VIEW) * 10000.0, 0.18))) + uv_noise, 0.0)).xyz;;
	ALBEDO = mix(base_color, (rainbow * basic_fresnel * 2.0), 0.6);
	ROUGHNESS = 0.4 - basic_fresnel * 0.2;
	METALLIC = 1.0;
}
