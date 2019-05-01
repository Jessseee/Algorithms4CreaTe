class Panda {
  PVector pos, vel;
  color earColor;
  float size;
  
  // Initialize panda
  Panda(PVector initPos, PVector initVel, float initSize) {
    pos = initPos;
    vel = initVel;
    size = initSize;
  }

  // Draw the panda
  void display() {   
    ellipseMode(CENTER);
    rectMode(CENTER);
    pushMatrix();

    strokeWeight(size * 0.020);

    //ear
    fill(earColor);
    ellipse(pos.x - size * 0.4, pos.y - size * 0.3, size * 0.4, size * 0.4);
    ellipse(pos.x + size * 0.4, pos.y - size * 0.3, size * 0.4, size * 0.4);

    //face
    fill(255);
    stroke(1);
    ellipse(pos.x, pos.y, size, size);

    //eyes
    pushMatrix();
    fill(0);
    translate(pos.x - size * 0.25, pos.y);
    rotate(0.5);
    ellipse(0, 0, size * 0.3, size * 0.4);
    popMatrix();

    pushMatrix();
    translate(pos.x + size * 0.25, pos.y);
    rotate(-0.5);
    ellipse(0, 0, size * 0.3, size * 0.4);
    popMatrix();

    fill(255);
    noStroke();
    ellipse(pos.x + size * 0.15, pos.y - size * 0.025, size * 0.075, size * 0.075);
    ellipse(pos.x - size * 0.15, pos.y - size * 0.025, size * 0.075, size * 0.075);

    //nose
    fill(0);
    ellipse(pos.x, pos.y + size * 0.15, size * 0.2, size * 0.125);

    //mouth
    fill(255);
    stroke(1);
    arc(pos.x, pos.y + size * 0.275, size * 0.2, size * 0.15, 0, PI);

    popMatrix();
  }

  // change the ear colour depending on the panda's position and move the panda.
  void update() {
    earColor = color(pos.x*0.255, pos.y*0.255, (pos.x + pos.y)/2);
    pos.add(vel);
  }

  // make the panda bounce off of other pandas.
  void checkPandaCollision(Panda other) {
    PVector centr = PVector.sub(other.pos, pos);
    float centrMag = centr.mag();
    centrMag -= other.size/2;
    float minDist = size/2;

    if (centrMag < minDist) {
      PVector d = vel.copy();
      PVector comp = centr.copy();
      comp.setMag(centrMag-minDist);
      pos.add(comp);
      vel = comp.copy().div(10);
      update();
      PVector a = centr.copy();
      a.normalize();
      a.setMag(PVector.dot(d, centr.normalize()));
      PVector b = d.sub(a);
      vel = b;
    }
  }

  // make the panda bounce off of walls.
  void checkWallCollision() {
    if (pos.x > width-size/2) {
      vel.x *= -1;
      pos.x = width-size/2;
    }

    if (pos.x < size/2) {
      vel.x *= -1;
      pos.x = size/2;
    }

    if (pos.y < size/2) {
      vel.y *= -1;
      pos.y = size/2;
    }

    if (pos.y > height-size/2) {
      vel.y *= -1;
      pos.y = height-size/2;
    }
  }
}
