class Obstacle {
  PVector pos;
  float size;
  color obstacleColor;
  
  Obstacle(float _x, float _y, float _size) {
    pos = new PVector(_x, _y);
    size = _size;
    obstacleColor = color(255, 50, 50);
  }
  
  void display() {
    fill(obstacleColor, 100);
    stroke(obstacleColor, 255);
    ellipse(pos.x, pos.y, size, size);
    ellipse(pos.x, pos.y, size/2, size/2);
  }
}
