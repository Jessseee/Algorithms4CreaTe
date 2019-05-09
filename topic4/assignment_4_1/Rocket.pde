class Rocket {
  
  float x, y, speed, size;
  ParticleSystem particles;
  
  Rocket(float x, float y, float speed, float size, ParticleSystem particles) {
    this.x = x;
    this.y = y;
    this.size = size;
    this.particles = particles;
  }
  
  void update() {
    particles.update(x,y);
    this.y-=speed;
  }
  
  void display() {
    particles.display();
    rect(x,y,size/2,size);
  }
  
}
