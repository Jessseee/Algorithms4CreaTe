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
  
  float lowerWidth;
  float higherWidth;
  
  float forceToAdd = 0;
  
  
  RotMSDSystem(float stickLength, float maxRot, float speed, float lowerWidth, float higherWidth) {
    this.stickLength = stickLength;
    rotation = random(0,maxRot);
    this.speed = speed;
    speed = 1;
    this.lowerWidth = lowerWidth;
    this.higherWidth = higherWidth;
  }
  
  void update(float velNeighbour, float forceNeighbour) {
   
    float torque = 1/springConst*rotation;
    float friction = dampConst*velocity;
    
    force = torque+friction;
    
    float realForce = forceNeighbour-force+forceToAdd;
    forceToAdd = 0;
    acceleration = realForce/mass;
    velocity+=speed*acceleration;
    rotation+=velocity-velNeighbour;
    
    
  }
  
  void display() {
    fill(0,255,0);
    strokeWeight(0);
    stroke(0,255,0);
    beginShape();
    vertex(-lowerWidth/2,0);
    vertex(lowerWidth/2,0);
    PVector higherPoint = new PVector(0,stickLength).rotate(rotation);
    PVector highLeft = higherPoint.copy().add(new PVector(0,-higherWidth/2,0).rotate(rotation-HALF_PI));
    PVector highRight = higherPoint.copy().add(new PVector(0,higherWidth/2).rotate(rotation-HALF_PI));
    vertex(highRight.x,highRight.y);
    vertex(highLeft.x,highLeft.y);
    endShape(CLOSE);
    
    rotate(rotation);
    translate(0,stickLength);
    //line(0,0,0,stickLength);
  }
  
  float getForce() {
    return force;
  }
  
  float getVel() {
    return velocity;
  }
  
  void addForce(float _force) {
    forceToAdd = _force;
  }
}
