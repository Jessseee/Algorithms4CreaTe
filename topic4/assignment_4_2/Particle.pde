/* Particle class
 * Based on example from The Nature of Code
 * http://natureofcode.com
 * by Daniel Shiffman
 * extended by Jesse Visser & Jonathan Matarazzi
 */

class Particle {
  PVector pos, vel, acc;
  float lifespan, size;
  String shape;
  color pColour;

  Particle(PVector l, String _shape, color _pColour, float _size) {
    acc = new PVector(0, 0.04);
    vel = new PVector(random(-1, 1), random(-2, 0));
    pos = l.copy();
    lifespan = 255.0;
    shape = _shape;
    pColour = _pColour;
    size = _size;
  }

  void run() {
    update();
    display();
  }

  // Method to update position
  void update() {
    vel.add(acc);
    pos.add(vel);
    lifespan -= 2.0;
  }

  // Method to display
  void display() {
    stroke(pColour, lifespan);
    strokeWeight(2);
    fill(pColour, lifespan-30);
    switch(shape) {
      case "round" :
        ellipse(pos.x, pos.y, size, size);
        break;
      case "square" :
        rectMode(CENTER);
        rect(pos.x, pos.y, size, size);
        break;
      case "triangle" :
        triangle(pos.x, pos.y-size/1.5, pos.x+size/1.5, pos.y+size/1.5, pos.x-size/1.5, pos.y+size/1.5);
        break;
      default:
        println("ERROR: no particle shape selected");
        exit();
    }
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } 
    else {
      return false;
    }
  }
}
