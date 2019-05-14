// the ball class draws, bounces and move the ball by applying forces.
class Ball {
  PVector pos, vel, acc;
  float m, size;
  boolean shot;
  
  // Initialize ball
  Ball(float mass, PVector initPos, PVector initVel, PVector initAcc) {
    m = mass;
    size = mass*30;
    pos = initPos;
    vel = initVel;
    acc = initAcc;
    shot = false;
  }
  
  // Draw ball
  void display() {
    stroke(200);
    fill(255);
    ellipse(pos.x, pos.y, size, size);
  }
  
  void update() {
    // change position and reset acceleration
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
    
    // Bounce off left wall
    if(pos.x < size/2) {
      // dampens when hitting the edge of the window
      vel.x = vel.x * -0.95;
      pos.x = size/2;
    }
    
    // Bounce off right wall
    if(pos.x > width-size/2) {
      // dampens when hitting the edge of the window
      vel.x = vel.x * -0.95;
      pos.x = width-size/2;
    }
    
    // Bounce off floor
    if(pos.y > height-size/2) {
      // dampens when hitting the edge of the window
      vel.y = vel.y * -0.8; 
      pos.y = height-size/2;
    }
    
    // Bounce off ceiling
    if(pos.y < size/2) {
      vel.y = vel.y * -1; 
      pos.y = size/2;
    }
  }
  
  // Apply force by Newton's 2nd law: F = M * A
  void applyForce(PVector force) {
    PVector f = PVector.div(force, m);
    acc.add(f);
  }
  
  // Reset the velocity and acceleration of the ball
  void reset() {
    vel.mult(0);
    acc.mult(0);
  }
}
