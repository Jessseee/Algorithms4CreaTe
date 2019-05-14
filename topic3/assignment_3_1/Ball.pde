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
  
  // Move the ball by adding acc to vel and vel to pos and resetting acc.
  void update() {
    // change position and reset acceleration
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
    
    // Bounces off side
    if ((pos.x > width - m*15) || (pos.x < 0)) {
      vel.x = vel.x * -0.9;
    }
    
    // Bounce off floor
    if (pos.y > height - m*15) {
      // dampens when hitting the bottom of the window
      vel.y = vel.y * -0.8; 
      pos.y = height - m*15;
    }
  }
  
  // Apply force with the help of Newton's 2nd law: F = M * A
  void applyForce(PVector force) {
    PVector f = PVector.div(force, m);
    acc.add(f);
  }
}
