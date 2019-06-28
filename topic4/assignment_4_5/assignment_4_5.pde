Flowfield flowfield = new Flowfield();
ArrayList<Particle> particles = new ArrayList<Particle>();

void setup() {
  surface.setSize(GRID_WIDTH*CELL_SIZE, GRID_HEIGHT*CELL_SIZE);    
  for(int i = 0; i < PARTICLE_AMOUNT; i++) {
    particles.add(new Particle());
  }
}

void draw() {
  background(255);
  
  flowfield.update();
  
  for(Particle particle : particles) {
    particle.run();
    particle.follow(flowfield);
  }
}
