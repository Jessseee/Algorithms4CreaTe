// class to display and update particle

class Particle {
  PVector pos, vel, acc;
  float maxSpeed;

  Particle() {
    maxSpeed = 1;
    this.pos = new PVector(random(0, width), random(0, height));
    this.vel = new PVector(0, 0);
    this.acc = new PVector(0, 0);
  }
  
  void run() {
    display();
    update();
    loopEdge();
  }

  // apply a force based on the vector in the current flow field cell
  void follow(Flowfield flowfield) {
    int x = floor(pos.x / CELL_SIZE);
    int y = floor(pos.y / CELL_SIZE);
    int index = x + y * GRID_WIDTH;
    index = constrain(index, 0, GRID_WIDTH*GRID_HEIGHT-1);
    PVector force = flowfield.getVector(index);
    applyForce(force);
  }

  // display particle
  void display() {
    fill(40, 255, 255);
    strokeWeight(10);
    stroke(45, 200, 255, 100);
    ellipse(pos.x, pos.y, CELL_SIZE, CELL_SIZE);
  }
  
  // update velocity and position and reset acceleration
  void update() {
    vel.add(acc);
    vel.limit(maxSpeed);
    pos.add(vel);
    acc.mult(0);
  }
  
  // apply a force by adding it to the acceleration
  void applyForce(PVector force) {
    acc.add(force);
  }
  
  // move particle from one side of the screen to the other, when moving over the edge of the screen
  void loopEdge() {
    if (pos.x > width) pos.x = 0;
    if (pos.x < 0) pos.x = width;
    if (pos.y > height) pos.y = 0;
    if (pos.y < 0) pos.y = height;
  }
}
