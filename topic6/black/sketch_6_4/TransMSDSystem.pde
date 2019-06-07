class TransMSDSystem {

  float dampConst = 0.1;
  float springConst = 100;
  float mass = 10;

  float location = 200;
  float velocity = 0;
  float acceleration = 0;
  
  
  TransMSDSystem() {
    
  }
  
  void update() {
    float transForce = 1/springConst*location;
    float friction = dampConst*velocity;
    acceleration = (transForce+friction)/-mass;
    velocity+=acceleration;
    location+=velocity;
    println(location);
  }
  
  void display() {
    pushMatrix();
    translate(width/2,height/2);
    line(0,0,location,0);
    ellipse(location,0,mass,mass);
    popMatrix();
  }
}
