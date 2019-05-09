/* Random movement by Perlin noise
 * By Jonathan Matarazzi and Jesse Visser
 * 
 * Based on an example By
 * Daniel Shiffman
 * The Nature of Code
 * http://natureofcode.com
 */

float offset = 0.0;
float offsetIncrement = 0.01; 

void setup() {
  size(200,200);
  background(0);
  noStroke();
}

void draw() {
  // Create an alpha blended background
  fill(0, 10);
  rect(0,0,width,height);
  
  // Get noise values based on offset and scale it according to the window's width or height
  float xPos = noise(offset)*width;
  float yPos = noise(1+offset)*height;
  
  // With each cycle, increment offset
  offset += offsetIncrement;
  
  // Draw the ellipse at the value produced by perlin noise
  fill(200);
  ellipse(xPos,yPos,16,16);
}
