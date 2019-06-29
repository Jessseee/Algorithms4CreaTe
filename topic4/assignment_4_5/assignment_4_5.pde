/* Particles that move through a vector field based on 3D Perlin noise.
 * Based on Coding Callenge #24 by the Coding Train. 
 * https://www.youtube.com/watch?v=BjoM9oKOAKY
 *
 * Added upon by Jesse Visser and Jonathan Matarazzi
 */

Flowfield flowfield = new Flowfield();
ArrayList<Particle> particles = new ArrayList<Particle>();

boolean debug = true;

void setup() {
  colorMode(HSB);
  // instantiate screen based on size of the grid
  surface.setSize(GRID_WIDTH*CELL_SIZE, GRID_HEIGHT*CELL_SIZE);    
  
  // instantiate an ArrayList of particles
  for (int i = 0; i < PARTICLE_AMOUNT; i++) {
    particles.add(new Particle());
  }
}

// display and update particles and flowfield
void draw() {
  background(0);
  flowfield.update();
  if (debug) flowfield.display();
  for (Particle particle : particles) {
    particle.run();
    particle.follow(flowfield);
  }
}

// reset flowfield on mouse press
void mousePressed() {
  flowfield.reset();
}
