/*
#version 330 core
layout (location = 0) in vec3 aPos;
layout (location = 1) in vec3 aNormal;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

out vec3 Normal;
out vec3 FragPos;

void main()
{
    gl_Position = projection * view * model * vec4(aPos, 1.0);


    Normal = mat3(transpose(inverse(view * model))) * aNormal;

    FragPos = vec3(view * model * vec4(aPos, 1.0));
}
*/

#version 330 core
layout (location = 0) in vec3 aPos;
layout (location = 1) in vec3 aNormal;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

uniform vec3 objectColor;
uniform vec3 lightColor;
uniform vec3 lightPos;

out vec3 Color_fs;

void main()
{
    gl_Position = projection * view * model * vec4(aPos, 1.0);

    vec3 Normal = mat3(transpose(inverse(view * model))) * aNormal;
    vec3 FragPos = vec3(view * model * vec4(aPos, 1.0));
    vec3 viewPos = vec3(0.0, 0.0, 0.0);

    //calc ambient
    float ambientStrength = 0.1;
    vec3 ambient = ambientStrength * lightColor;

    //calc diffuse
    vec3 norm = normalize(Normal);
    vec3 lightDir = normalize(lightPos - FragPos);
    float diff = max(dot(norm, lightDir), 0.0);
    vec3 diffuse = diff * lightColor;

    //calc specular
    float specularStrength = 0.5;
    vec3 viewDir = normalize(viewPos - FragPos);
    vec3 reflectDir = reflect(-lightDir, norm);
    float spec = pow(max(dot(viewDir, reflectDir), 0.0), 32);
    vec3 specular = specularStrength * spec * lightColor;

    //combined
    vec3 result = (ambient + diffuse + specular) * objectColor;
    Color_fs = result;
}
