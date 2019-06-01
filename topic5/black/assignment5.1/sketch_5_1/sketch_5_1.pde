/* Based on an example by The Nature of Code
 * An algorithm for flocking behaviour.
 * Writen by Daniel Shiffman
 * Build upon by Jesse Visser & Jonathan Matarazzi
 */

Flock flock;
ArrayList<Obstacle> obstacles;

void setup() {
  fullScreen();
  flock = new Flock();
  obstacles = new ArrayList<Obstacle>();
  for (int i = 0; i < 50; i++) {
    Vehicle vehicle = new Vehicle(width/2+random(-i, i), height/2+random(-i, i));
    flock.addVehicle(vehicle);
  }
}

void draw() {
  background(0);
  textSize(20);
  text("left click: add obstacle", 10, 30);
  text("right click: remove obstacle", 10, 60);
  for (Obstacle obstacle : obstacles) {
    obstacle.display();
  }
  fill(255, 255, 255, 25);
  stroke(255, 255, 255, 50);
  beginShape();
    vertex(width/10, height/8);
    vertex(width-width/10, height/8);
    vertex(width-width/10, height-height/8);
    vertex(width/10, height-height/8);
  endShape(CLOSE);
  
  flock.move();
}

void mousePressed() {
  if (mouseButton == LEFT) {
    obstacles.add(new Obstacle(mouseX, mouseY, 50));
  }
  
  if (mouseButton == RIGHT && obstacles.size() > 0) {
    int index = 0;
    for (Obstacle obstacle : obstacles) {
      if (dist(mouseX, mouseY, obstacle.pos.x, obstacle.pos.y) < 50) {
        index = obstacles.indexOf(obstacle);
      }
    }
    obstacles.remove(index);
  }
}
