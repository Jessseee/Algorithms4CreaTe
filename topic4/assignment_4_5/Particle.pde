class Particle {
  PVector pos, vel, acc;
  float maxSpeed = 1;
  float size = CELL_SIZE/2;
  
  Particle() {
    this.pos = new PVector(random(0, width), random(0, height));
    this.vel = new PVector(0, 0);
    this.acc = new PVector(0, 0);
  }
  
  void run() {
    display();
    update();
    evadeEdge();
  }
  
  void follow(Flowfield flowfield) {
    int x = floor(pos.x / CELL_SIZE);
    int y = floor(pos.y / CELL_SIZE);
    int index = x + y * GRID_WIDTH;
    PVector force = flowfield.getVector(index);
    applyForce(force);
  }
  
  void display() {
    stroke(0, 100);
    strokeWeight(10);
    fill(0);
    ellipse(pos.x, pos.y, size, size);
  }
  
  void update() {
    vel.add(acc);
    vel.limit(maxSpeed);
    pos.add(vel);
    acc.mult(0);
  }
  
  void applyForce(PVector force) {
    acc.add(force);
  }
  
  void evadeEdge() {
    if (pos.x > width) pos.x = 0;
    if (pos.x < 0) pos.x = width;
    if (pos.y > height) pos.y = 0;
    if (pos.y < 0) pos.y = height;
  }
}
