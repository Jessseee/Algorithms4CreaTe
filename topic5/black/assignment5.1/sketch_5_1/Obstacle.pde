/* Obstacle class
 * Object to be evaded by vehicles
 */
 
class Obstacle {
  PVector pos;
  float size;
  color obstacleColor;
  
  // instantiate obstacle
  Obstacle(float _x, float _y, float _size) {
    pos = new PVector(_x, _y);
    size = _size;
    obstacleColor = color(255, 50, 50);
  }
  
  // display obstacle  
  void display() {
    fill(obstacleColor, 100);
    stroke(obstacleColor, 255);
    ellipse(pos.x, pos.y, size*2, size*2);
    ellipse(pos.x, pos.y, size/10, size/10);
  }
}
