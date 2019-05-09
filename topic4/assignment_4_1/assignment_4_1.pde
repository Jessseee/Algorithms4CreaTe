Rocket rocket;

void setup() {
  rocket = new Rocket(width/2,height, new ParticleSystem());
}

void draw() {
  rocket.update();
  rocket.display();
}
