class RotMSDSystem {

  float dampConst = 0.1;
  float springConst = 100;
  float mass = 10;

  float rotation = PI;
  float velocity = 0;
  float acceleration = 0;
  
  
  RotMSDSystem() {
    
  }
  
  void update() {
    float torque = 1/springConst*rotation;
    float friction = dampConst*velocity;
    acceleration = (torque+friction)/-mass;
    velocity+=acceleration;
    rotation+=velocity;
    println(rotation);
  }
  
  void display() {
    pushMatrix();
    translate(width/2,height/2);
    rotate(PI+rotation);
    line(0,0,0,100);
    popMatrix();
  }
}
