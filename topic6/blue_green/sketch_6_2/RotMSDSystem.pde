class RotMSDSystem {
  
  float stickLength;
  float speed;

  float dampConst = 0.05;
  float springConst = 200;
  float mass = 10;

  float rotation = 0.1;
  float velocity = 0;
  float acceleration = 0;
  
  float force = 0;
  
  
  RotMSDSystem(float stickLength, float maxRot, float speed) {
    this.stickLength = stickLength;
    rotation = random(0,maxRot);
    this.speed = speed;
    speed = 1;
  }
  
  void update(float velNeighbour, float forceNeighbour) {
   
    float torque = 1/springConst*rotation;
    float friction = dampConst*velocity;
    
    force = torque+friction;
    
    float realForce = forceNeighbour-force;
    acceleration = realForce/mass;
    velocity+=speed*acceleration;
    rotation+=velocity-velNeighbour;
    
    
  }
  
  void display() {
    rotate(rotation);
    line(0,0,0,stickLength);
    translate(0,stickLength);
  }
  
  float getForce() {
    return force;
  }
  
  float getVel() {
    return velocity;
  }
}
