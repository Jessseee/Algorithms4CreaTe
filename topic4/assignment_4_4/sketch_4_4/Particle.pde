// displays and moves particle

class Particle {
  PVector pos, vel, acc;
  float value;
  
  float size = 8;
  float alpha = 1000;
  
  // initialize particle with random velocity and acceleration
  Particle(PVector pos) {
    this.pos = pos.copy();
    this.vel = new PVector(random(-1, 1), random(-1, 1));
    this.acc = new PVector(random(-0.01, 0.01), random(-0.01, 0.01));
    value = random(0, 255);
    colorMode(HSB);
    noStroke();
  }
  
  // update and display particle
  void run() {
    update();
    display();
  }
  
  // accelerate particle and exponentialy decay it's alpha value
  void update() {
    vel.add(acc);
    pos.add(vel);
    alpha *= exp(DECAY);
  }
  
  // display particle
  void display() {
    fill(value, 255, 255, alpha);
    ellipse(pos.x, pos.y, size, size);
  }
  
  // check if particle has expired
  boolean isDead() {
    return alpha < 1;
  }
}
