//A class for visualization of a rotary mass, spring, damper object
class TransMSDSystem {

  float dampConst, springConst, mass, location;
  float velocity = 0;
  float acceleration = 0;
  
  // instantiate mass, spring, damper constants and initial rotation
  TransMSDSystem(float dampConst, float springConst, float mass, float location) {
    this.dampConst = dampConst;
    this.springConst = springConst;
    this.mass = mass;
    this.location = location;
  }
  
  // calculate force and apply angular acceleration and velocity
  void update() {
    float transForce = 1/springConst*location;
    float friction = dampConst*velocity;
    acceleration = (transForce+friction)/-mass;
    velocity+=acceleration;
    location+=velocity;
    println(location);
  }
  
  // Display mass, spring, damper system
  void display() {
    pushMatrix();
    translate(width/2,height/2);
    line(0,0,location,0);
    ellipse(location,0,mass,mass);
    popMatrix();
  }
}
