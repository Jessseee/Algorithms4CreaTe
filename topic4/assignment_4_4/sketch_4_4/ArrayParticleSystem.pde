// particle system which stores the particles in an Array

class ArraySystem {
  Particle[] particles;
  PVector pos;

  // ininitialize a certain amount of particles
  ArraySystem(PVector pos) {
    this.pos = pos;
    particles = new Particle[PARTICLE_AMOUNT];
    for (int i = 0; i < particles.length; i++) {
      particles[i] = new Particle(pos);
    }
  }

  // move particles and add a new particle for every expired particle.
  void run() {
    for (int i = particles.length-1; i > 0; i--) {
      particles[i].run();
      if (particles[i].isDead()) {
        particles[i] = new Particle(pos);
      }
    }
  }
}
