class RotMSDSystem {
  float dampConst, springConst, mass;
  
  float rotation = PI;
  float velocity = 0;
  float acceleration = 0;

  // instantiate mass, spring, damper constants
  RotMSDSystem(float dampConst, float springConst, float mass) {
    this.dampConst = dampConst;
    this.springConst = springConst;
    this.mass = mass;
  }

  // calculate torque and apply angular acceleration and velocity
  void update() {
    float torque = 1/springConst * rotation;
    float friction = dampConst*velocity;
    acceleration = (torque+friction)/-mass;
    velocity+=acceleration;
    rotation+=velocity;
  }

  // Display mass, spring, damper system
  void display() {
    line(width/2-50, height/2, width/2+50, height/2);
    line(width/2, height/2, width/2, height/2+50);
    
    pushMatrix();
    //draw mass and rotate it
    translate(width/2, height/2);
    rotate(PI + rotation);
    line(0, 0, 0, 100);
    fill(255);
    rectMode(CENTER);
    rect(0, 80, 20, 40);
    
    //draw damper
    translate(35, 20);
    rotate(-4);
    rect(0, 0, 20-rotation*2, 20);
    rect(-2, 0, rotation*2+5, 20);
    popMatrix();
    
    noFill();
    arc(width/2, height/2, 80, 80, HALF_PI, PI+HALF_PI+rotation);
    
    // draw spring and rotate it
    arc(width/2, height/2, 50, 50, rotation-HALF_PI, HALF_PI);
    arc(width/2, height/2+5, 40, 40, HALF_PI, PI+HALF_PI);
    arc(width/2, height/2, 30, 30, -HALF_PI, HALF_PI);
  }
}
