/* Cloudy Planet - 29052020
 * Thanks to:
 *
 * thebookofshaders.com, by Patricio Gonzalez Vivo
 * https://thebookofshaders.com/13/
 *
 * Domain Warping and fBM, by Inigo Quilez
 * https://www.iquilezles.org/www/articles/warp/warp.htm
 * https://www.iquilezles.org/www/articles/fbm/fbm.htm
 *
 * Code made, adapted, modified and merged by Giovanni Muzio - Kesson
 * https://kesson.io
 *
 * You can download, adapt, edit, fork and do whatever you want with this code
 * as long as you keep the same license and always put a reference to the original creator(s).
 *
 * Keep the open source spirit alive!
 */

import peasy.*;
PeasyCam cam;

PShader shader;
PShape globe;
float radius = 250;

void settings() {
  size(1000, 1000, P3D);
  smooth(2);
}

void setup() {
  
  cam = new PeasyCam(this, 1000);
  
  shader = loadShader("frag.glsl", "vert.glsl");
  shader.set("time", 0.0f);
  shader.set("radius", radius);
  shader.set("resolution", float(width), float(height));
  shader.set("size", 2.0);
  shader.set("details", 8.0);
  
  noStroke();
  globe = createShape(SPHERE, radius);
}

void draw() {
  background(0);
  
  shader.set("time", millis() / 1000.0f);
  
  cam.rotateY(0.0025);
  
  shader(shader);
  shape(globe);
  
}
