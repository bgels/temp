RSRC                    VisualShader            ��������                                            '      resource_local_to_scene    resource_name    output_port_for_preview    default_input_values    expanded_output_ports    source    texture    texture_type    script    code    graph_offset    mode    modes/blend    flags/skip_vertex_transform    flags/unshaded    flags/light_only    flags/world_vertex_coords    nodes/vertex/0/position    nodes/vertex/connections    nodes/fragment/0/position    nodes/fragment/2/node    nodes/fragment/2/position    nodes/fragment/connections    nodes/light/0/position    nodes/light/connections    nodes/start/0/position    nodes/start/connections    nodes/process/0/position    nodes/process/connections    nodes/collide/0/position    nodes/collide/connections    nodes/start_custom/0/position    nodes/start_custom/connections     nodes/process_custom/0/position !   nodes/process_custom/connections    nodes/sky/0/position    nodes/sky/connections    nodes/fog/0/position    nodes/fog/connections        &   local://VisualShaderNodeTexture_ktrqo �         local://VisualShader_eaeed �         VisualShaderNodeTexture                             VisualShader    	      �   shader_type canvas_item;
render_mode blend_mix;

uniform sampler2D tex_frg_2;



void fragment() {
// Texture2D:2
	vec4 n_out2p0 = texture(tex_frg_2, UV);


// Output:0
	COLOR.rgb = vec3(n_out2p0.xyz);
	COLOR.a = n_out2p0.x;


}
                                    
      B   C                                             RSRC