class Ball {
  PVector pos, vel, acc;
  float m;
  
  // Initialize ball
  Ball(float mass, PVector initPos, PVector initVel, PVector initAcc) {
    m = mass;
    pos = initPos;
    vel = initVel;
    acc = initAcc;
  }
  
  // Draw ball
  void display() {
    stroke(200);
    fill(255);
    ellipse(pos.x, pos.y, m*30, m*30);
  }
  
  void update() {
    // change position and reset acceleration
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
    
    // Bounces off side
    if ((pos.x > width) || (pos.x < 0)) {
      vel.x = vel.x * -1;
    }
    
    // Bounce off floor
    if (pos.y > height) {
      // dampens when hitting the bottom of the window
      vel.y = vel.y * -0.8; 
      pos.y = height;
    }
  }
  
  // Apply force by Newton's 2nd law: F = M * A
  void applyForce(PVector force) {
    PVector f = PVector.div(force, m);
    acc.add(f);
  }
}
