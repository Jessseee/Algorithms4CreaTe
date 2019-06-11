/* Particle system spawning differently shaped particles
 * Based on example from The Nature of Code
 * http://natureofcode.com
 * by Daniel Shiffman
 * extended by Jesse Visser & Jonathan Matarazzi
 */

ArrayList<Particle> particles;

void setup() {
  size(900, 900);
  particles = new ArrayList<Particle>();
  explosion(50, width/2, height/2, color(255, random(100, 180), 0));
}

// draws the scene
void draw() {
  background(255);
  fill(0);
  textSize(18);
  text("click on the screen to create explosion", 10, 20);
  displayParticles();
}

// Create an explosion of particles at the mouse position
void mousePressed() {
  explosion(40, mouseX, mouseY, color(255, random(100, 200), 0));
}

// Create an epxlosion of three shapes of particles.
void explosion(int amount, float x, float y, color pColour) {
  for(int i = 0; i < amount/3; i++) {
    particles.add(new Particle(new PVector(x, y), "round", pColour, random(8, 12)));
    particles.add(new Particle(new PVector(x, y), "square", pColour, random(6, 10)));
    particles.add(new Particle(new PVector(x, y), "triangle", pColour, random(4, 8)));
  }
}

// Loops backwards through arrayList to display particles
void displayParticles() {
  for (int i = particles.size()-1; i >= 0; i--) {
    Particle p = particles.get(i);
    p.run();
    // delete expired particles
    if (p.isDead()) {
      particles.remove(i);
    }
  }
}
