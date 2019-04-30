/*Gaussian size and location distribution of dots
 *By Jonathan Matarazzi
 *
 *Based on the Guassian example by Daniel Shiffman: https://github.com/nature-of-code/noc-examples-processing/blob/master/introduction/NOC_I_4_Gaussian/NOC_I_4_Gaussian.pde
 *
 *
 */

void setup() {
  size(1000, 1000);
  background(255);
}

void draw() {

  // Get a gaussian random number w/ mean of 0 and standard deviation of 1.0
  float xloc = randomGaussian();
  float yloc = randomGaussian();
  float size = randomGaussian();

  float sdPos = .4*(width<height ? width : height);                   // Define a standard deviation for the position
  float sdSize = 8*(width<height ? width*.2 : height*.2);                   // Define a standard deviation for the size
  xloc = ( xloc * sdPos ) + width/2;  // Scale the gaussian random number by standard deviation and mean
  yloc = ( yloc * sdPos ) + height/2;  // Scale the gaussian random number by standard deviation and mean
  size = ((size*sdSize)+sdSize)/dist(xloc, yloc, width/2, height/2);
  if (size > .05*sdSize) size = .05*sdSize;
  fill(0, 0, 255);
  stroke(0, 0, 255);
  ellipse(xloc, yloc, size, size);   // Draw an ellipse at our "normal" random position
}
