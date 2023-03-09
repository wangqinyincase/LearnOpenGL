#version 330 core
out vec4 FragColor;
  
in vec3 ourColor;
in vec2 TexCoord;

uniform sampler2D texture1;
uniform sampler2D texture2;
uniform float texture2_alpha;

void main()
{
    //FragColor = texture(ourTexture, TexCoord) * vec4(ourColor, 1.0);
    //vec2 NewTexCoord = vec2(1 - TexCoord.s, TexCoord.t);
    vec2 NewTexCoord = TexCoord;

    //FragColor = mix(texture(texture1, NewTexCoord), texture(texture2, NewTexCoord), 0.2);
    FragColor = mix(texture(texture1, NewTexCoord), texture(texture2, NewTexCoord), 0.2);
    //FragColor = texture(texture1, TexCoord);
}
