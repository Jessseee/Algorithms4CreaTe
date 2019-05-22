//A Particle class updating the particle according to gravity and displaying it
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
  
  //Add gravitational acceleration to the velocity of the particle
  //then move to particle according to its velocity and subtract some of its life
  void update() {
    vel.add(grav);
    pos.add(vel);
    life-=1;
  }
  
  //Display the particle with a colour based on its remaining life
  void display() {
    color col = color(255,125+map(life,lifespan,0,0,200),0,life/lifespan*255);
    stroke(col);
    fill(col);
    ellipse(pos.x,pos.y,10,10);
  }
  
  //Check if the particle is dead/out of life
  boolean isDead() {
    return life<0;
  }
  
}
