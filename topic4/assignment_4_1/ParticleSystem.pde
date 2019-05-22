//A particle system class managing and creating particles with randomized position, velocity and ligespan
class ParticleSystem {
  float variance;
  ArrayList<Particle> particles;

  ParticleSystem(float variance) {
    this.variance = variance;
    particles = new ArrayList<Particle>();
  }

  //Create new particles if needed and update existing particles
  void update(PVector pos) {
    for (int i = 0; i < 5; i++) {
      //Use randomized values for particle creation
      PVector vel = new PVector(random(-2, 2), random(0, 1));
      float lifespan = random(10, 60);
      PVector posVariance = new PVector(random(-variance/2, variance/2), 0);
      particles.add(new Particle(pos.copy().add(posVariance), vel, lifespan));
    }
    //Update existing particles
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.update();
      //Remove particle if it is dead
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }

  //Display all existing particles
  void display() {
    for (Particle p : particles) {
      p.display();
    }
  }
}
