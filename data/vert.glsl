uniform mat4 transformMatrix;
attribute vec4 position;

precision mediump float;

varying vec3 vPosition;

void main(void) {

    gl_Position = transformMatrix * vec4(position.xyz, 1.0);
    
    vPosition = position.xyz;

}