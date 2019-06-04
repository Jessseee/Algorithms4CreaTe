/* Based on an example by The Nature of Code
 * An algorithm for flocking behaviour
 * Example writen by Daniel Shiffman
 * Build upon by Jesse Visser & Jonathan Matarazzi
 * Added obstacles and edge evasion.
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

// draw instruction text and move flock
void draw() {
  background(0);
  textSize(20);
  text("left click: add obstacle", 10, 30);
  text("right click: remove obstacle", 10, 60);
  
  fill(255, 255, 255, 25);
  stroke(255, 255, 255, 50);
  beginShape();
    vertex(width/10, height/8);
    vertex(width-width/10, height/8);
    vertex(width-width/10, height-height/8);
    vertex(width/10, height-height/8);
  endShape(CLOSE);
  
  for (Obstacle obstacle : obstacles) {
    obstacle.display();
  }
  
  flock.move();
}

void mousePressed() {
  // Add a new obstacle when the left mouse button is pressed
  if (mouseButton == LEFT) {
    obstacles.add(new Obstacle(mouseX, mouseY, 50));
  }
  
  // Delete a obstacle in range of the cursor when the right mouse button is pressed  
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
