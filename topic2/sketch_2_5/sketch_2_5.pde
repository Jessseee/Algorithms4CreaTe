// Random movement by Perlin noise
// By Jonathan Matarazzi
// 
// Based on an example By
// Daniel Shiffman
// The Nature of Code
// http://natureofcode.com

float xoff = 0.0;
float xincrement = 0.01; 

void setup() {
  size(200,200);
  background(0);
  noStroke();
}

void draw() {
  // Create an alpha blended background
  fill(0, 10);
  rect(0,0,width,height);
  
  //float n = random(0,width);  // Try this line instead of noise
  
  // Get a noise value based on xoff and scale it according to the window's width
  float xPos = noise(xoff)*width;
  float yPos = noise(1+xoff)*height;
  
  // With each cycle, increment xoff
  xoff += xincrement;
  
  // Draw the ellipse at the value produced by perlin noise
  fill(200);
  ellipse(xPos,yPos,16,16);
}
