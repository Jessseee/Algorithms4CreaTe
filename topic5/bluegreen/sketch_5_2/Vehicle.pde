class Vehicle {
  PVector pos, vel, acc;
  float size, maxForce, maxSpeed;
  color vehicleColor;

  Vehicle(float _x, float _y, float _size) {
    acc = new PVector(0, 0);
    vel = new PVector(random(-1, 1), random(-1, 1));
    pos = new PVector(_x, _y);
    size = _size;
    maxSpeed = 3.0;
    maxForce = 0.05;
    vehicleColor = color(100, 255, 100);
  }

  void display() {
    float theta = vel.heading() + radians(90);
    fill(vehicleColor, 200);
    stroke(vehicleColor, 255);
    pushMatrix();
      translate(pos.x, pos.y);
      rotate(theta);
      beginShape();
        vertex(0, -size*2);
        vertex(-size, size*2);
        vertex(0, size);
        vertex(size, size*2);
      endShape(CLOSE);
    popMatrix();
  }

  void update() {
    vel.add(acc);
    vel.limit(maxSpeed);
    pos.add(vel);
    acc.mult(0);
  }

  void applyForce(PVector _force) {
    acc.add(_force);
  }
  
  PVector seek(PVector target) {
    PVector desired = PVector.sub(target, pos);
    desired.normalize();
    desired.mult(maxSpeed);
    PVector steer = PVector.sub(desired, vel);
    steer.limit(maxForce);
    return steer;
  }

  PVector limitForce(PVector force) {
    force.normalize();
    force.mult(maxSpeed);
    force.sub(vel);
    force.limit(maxForce);
    return force;
  }

  void move() {
    display();
    update();
    evadeEdge();
  }
  
  void evadeEdge() {
    if(pos.x < width/10) {
      PVector desired = new PVector(maxSpeed, vel.y);
      PVector steer = PVector.sub(desired, vel);
      steer.limit(maxForce);
      applyForce(steer);
    }
    
    if(pos.x > width-width/10) {
      PVector desired = new PVector(-maxSpeed, vel.y);
      PVector steer = PVector.sub(desired, vel);
      steer.limit(maxForce);
      applyForce(steer);
    }
    
    if(pos.y < height/8) {
      PVector desired = new PVector(vel.x, maxSpeed);
      PVector steer = PVector.sub(desired, vel);
      steer.limit(maxForce);
      applyForce(steer);
    }
    
    if(pos.y > height-height/8) {
      PVector desired = new PVector(vel.x, -maxSpeed);
      PVector steer = PVector.sub(desired, vel);
      steer.limit(maxForce);
      applyForce(steer);
    }
  }
}
