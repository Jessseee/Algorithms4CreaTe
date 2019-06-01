class Vehicle {
  PVector pos, vel, acc;
  float r, maxForce, maxSpeed;

  Vehicle(float x, float y) {
    acc = new PVector(0, 0);
    vel = new PVector(random(-1, 1), random(-1, 1));
    pos = new PVector(x, y);
    r = 3.0;
    maxSpeed = 3.0;
    maxForce = 0.05;
  }

  void display() {
    float theta = vel.heading() + radians(90);
    fill(255);
    stroke(255);
    pushMatrix();
      translate(pos.x, pos.y);
      rotate(theta);
      beginShape(TRIANGLES);
        vertex(0, -r*2);
        vertex(-r, r*2);
        vertex(r, r*2);
      endShape();
    popMatrix();
  }

  void update() {
    vel.add(acc);
    vel.limit(maxSpeed);
    pos.add(vel);
    acc.mult(0);
  }

  void applyForce(PVector force) {
    acc.add(force);
  }
  
  PVector seek(PVector target) {
    PVector desired = PVector.sub(target, pos);
    desired.normalize();
    desired.mult(maxSpeed);
    PVector steer = PVector.sub(desired, vel);
    steer.limit(maxForce);
    return steer;
  }

  PVector seperate(ArrayList<Vehicle> vehicles) {
    float desiredSeperation = 25.0f;
    PVector steer = new PVector(0, 0, 0);
    int count = 0;

    for (Vehicle other : vehicles) {
      float d = PVector.dist(pos, other.pos);
      if ((d > 0) && (d < desiredSeperation)) {
        PVector diff = PVector.sub(pos, other.pos);
        diff.normalize();
        diff.div(d);
        steer.add(diff);
        count++;
      }
    }

    if (count > 0) {
      steer.div((float)count);
    }

    if (steer.mag() > 0) {
      steer.normalize();
      steer.mult(maxSpeed);
      steer.sub(vel);
      steer.limit(maxForce);
    }

    return steer;
  }
  
  PVector align(ArrayList<Vehicle> vehicles) {
    float neighborDist = 50;
    PVector sum = new PVector(0, 0);
    int count = 0;
    for (Vehicle other : vehicles) {
      float d = PVector.dist(pos, other.pos);
      if((d > 0) && (d < neighborDist)) {
        sum.add(other.vel);
        count++;
      }
    }
    if(count > 0) {
      sum.div((float)count);
      sum.normalize();
      sum.mult(maxSpeed);
      PVector steer = PVector.sub(sum, vel);
      steer.limit(maxForce);
      return steer;
    } else {
      return new PVector(0, 0);
    }
  }
  
  PVector cohesion (ArrayList<Vehicle> vehicles) {
    float neighborDist = 50;
    PVector sum = new PVector(0, 0);
    int count = 0;
    for (Vehicle other : vehicles) {
      float d = PVector.dist(pos, other.pos);
      if((d > 0) && (d < neighborDist)) {
        sum.add(other.pos);
        count++;
      }
    }
    if(count > 0) {
      sum.div(count);
      return seek(sum);
    } else {
      return new PVector(0, 0);
    }
  }

  void flock(ArrayList<Vehicle> vehicles) {
    PVector sep = seperate(vehicles);  // Seperation
    PVector ali = align(vehicles);  // Alignment
    PVector coh = cohesion(vehicles); //Cohesion
    sep.mult(1.5);
    ali.mult(1.0);
    coh.mult(1.0);
    applyForce(sep);
    applyForce(ali);
    applyForce(coh);
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

  void move(ArrayList<Vehicle> vehicles) {
    display();
    update();
    evadeEdge();
    flock(vehicles);
  }
}
