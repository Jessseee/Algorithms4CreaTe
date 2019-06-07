/* Origninal example by Daniel Shiffman
 * The Nature of Code, http://natureofcode.com
 * Changed to move over time to create a moving cloud texture.
 * Extended by Jesse Visser and Jonathan Matarazzi
 */

float increment = 0.02;
float time = 0f;
float dtime = 0.01f;

void setup() {
  size(640,360);
}

void draw() {
  background(0);  
  loadPixels();
  
  float xoff = 0.0;
  
  // For every x,y coordinate in a 2D space, calculate a noise value and produce a brightness value
  for (int x = 0; x < width; x++) {
    // increment xoff
    xoff += increment;
    float yoff = 0.0;
    for (int y = 0; y < height; y++) {
      // increment yoff
      yoff += increment;
      
      // Calculate noise with time as the third dimension and scale by 255
      float bright = noise(xoff,yoff, time)*255;
      
      // Set each pixel onscreen to a grayscale value
      pixels[x+y*width] = color(bright);
    }
  }
  
  updatePixels();
  
  time+=dtime;
}
