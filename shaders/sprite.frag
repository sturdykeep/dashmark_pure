#version 460 core

// #include<flutter/runtime_effect.glsl>

// precision highp float;

layout(location=0)uniform sampler2D uTexture;
layout(location=1)uniform vec2 uTextureSize;

out vec4 fragColor;

void main(){
    // vec2 currentPos=FlutterFragCoord().xy/uTextureSize;
    // vec4 color=texture(uTexture,currentPos);
    // fragColor=color;
    fragColor=vec4(1.,0.,0.,1.);
}