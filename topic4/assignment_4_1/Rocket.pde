class Rocket {
  
  PVector pos;
  float speed, size;
  ParticleSystem particles;
  
  Rocket(float x, float y, float speed, float size) {
    this.pos = new PVector(x,y);
    this.speed = speed;
    this.size = size;
    this.particles = new ParticleSystem(size/2);
  }
  
  void update() {
    particles.update(pos.copy());
    pos.y-=speed;
  }
  
  void display() {
    particles.display();
    stroke(0);
    fill(255,0,0);
    rect(pos.x-size/4,pos.y-size,size/2,size);
    triangle(pos.x-size/4,pos.y-size,pos.x+size/4,pos.y-size,pos.x,pos.y-size*1.5);
  }
  
}
