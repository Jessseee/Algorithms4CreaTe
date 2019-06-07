/* This script creates a similar images to the art piece called red dots by Yayoi Kusama
 * By Jesse Visser and Jonathan Matarazzi
 */

ArrayList<Dot> dots = new ArrayList<Dot>();
int xBorder, yBorder, minSize, maxSize;
boolean running = false;

// setup scene
void setup() {
  xBorder = 300;
  yBorder = 200;
  minSize = 10;
  maxSize = 100;
  fullScreen();
  colorMode(HSB);
  background(255);
  noStroke();
  textSize(20);
  fill(0);
  text("click the screen to toggle the generation of dots", 10, 25);
}

// runs a while loop that draws dots to the screen
void draw() { 
  int count = 0;
  while (running == true && count < 1000) {
    boolean overlap = false;

    // select a random position for the dot within the given borders
    int x = (int) random(xBorder, width-xBorder);
    int y = (int) random(yBorder, height-yBorder);

    // determine the size of the dot
    int size = x;
    if (y < size) size = y;
    if (height-y < size) size = height-y;
    if (width-x < size) size = width-x;
    if (size > maxSize) size = (int)random(minSize, maxSize);

    // check if the dot does not overlap with any other dot
    for (Dot dot : dots) {
      if (dot.overlap(x, y)) {
        overlap = true;
        break;
      }

      //make the dots touch
      int dotDist = dot.distance(x, y)*2;
      if (dotDist < size) size = dotDist;
    }

    // generate new position and size if overlapping, else draw the dot
    count++;
    if (overlap) continue;
    dots.add(new Dot(x, y, size, minSize));
    break;
  }
}

// toggle the generation of dots by clicking on the screen
void mousePressed() {
  running = (running == true) ? false : true;
}
