class Particle {
  PVector pos, vel, grav;
  float lifespan, life;
  
  Particle(PVector pos, PVector vel, float lifespan) {
    this.pos = pos;
    this.vel = vel;
    this.lifespan = lifespan;
    this.life = lifespan;
    this.grav = new PVector(0,.1);
  }
  
  void update() {
    vel.add(grav);
    pos.add(vel);
    life-=1;
  }
  
  void display() {
    color col = color(255,125+map(life,lifespan,0,0,200),0,life/lifespan*255);
    stroke(col);
    fill(col);
    ellipse(pos.x,pos.y,10,10);
  }
  
  boolean isDead() {
    return life<0;
  }
  
}
