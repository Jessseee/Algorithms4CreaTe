/* Particle system spawning differently shaped particles
 * Based on example from The Nature of Code
 * http://natureofcode.com
 * by Daniel Shiffman
 * extended by Jesse Visser & Jonathan Matarazzi
 */

ArrayList<Particle> particles;

void setup() {
  size(640, 360);
  particles = new ArrayList<Particle>();
  explosion(30, width/2, 50);
}

void draw() {
  background(255);

  // Looping through backwards to delete
  for (int i = particles.size()-1; i >= 0; i--) {
    Particle p = particles.get(i);
    p.run();
    if (p.isDead()) {
      particles.remove(i);
    }
  }
}

void mousePressed() {
  explosion(25, mouseX, mouseY);
}

void explosion(int amount, float x, float y) {
  for(int i = 0; i < amount/3; i++) {
    particles.add(new Particle(new PVector(x, y), "round", color(255, random(100, 180), 0), random(8, 12)));
    particles.add(new Particle(new PVector(x, y), "square", color(255, random(100, 180), 0), random(6, 10)));
    particles.add(new Particle(new PVector(x, y), "triangle", color(255, random(100, 180), 0), random(4, 8)));
  }
}
