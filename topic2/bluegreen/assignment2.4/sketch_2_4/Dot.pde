/* Dot class to display dot and save its position
 * contains functions to calculate distance and check for overlap
 */

class Dot {
  int x, y, size, minSize;
  color dColor;
  
  // Instantiate dot class
  Dot(int x, int y, int size, int minSize) {
    this.x = x;
    this.y = y;
    this.size = size;
    this.minSize = minSize;
    this.dColor = color(random(0, 255), 255, 255);
    fill(dColor);
    ellipse(x, y, size, size);
  }

  // Checks for overlap with new point
  boolean overlap(int x, int y) {
    return (dist(x, y, this.x, this.y) <= this.size/2+minSize);
  }

  // Calculate from dot to new point
  int distance(int x, int y) {
    return (int) dist(x, y, this.x, this.y) - this.size/2;
  }
}
