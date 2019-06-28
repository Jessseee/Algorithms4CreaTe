// particle system which stores the particles in an ArrayList

class ArrayListSystem {
  ArrayList<Particle> particles;
  PVector pos;
  
  // ininitialize a certain amount of particles
  ArrayListSystem(PVector pos) {
    this.pos = pos;
    particles = new ArrayList<Particle>();
    for(int i = 0; i < PARTICLE_AMOUNT; i++) {
      addParticle();
    }
  }
  
  // add a new particle to particles ArrayList
  void addParticle() {
    particles.add(new Particle(pos));
  }
  
  // move particles and add a new particle for every expired particle.
  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle particle = particles.get(i);
      particle.run();
      if (particle.isDead()) {
        particles.remove(particle);
        addParticle();
      }
    }
  }
}
