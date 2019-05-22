Rocket rocket;

void setup() {
  size(1000,1000);
  rocket = new Rocket(width/2,height, 1, 50);
}

void draw() {
  background(0);
  rocket.update();
  rocket.display();
  println(rocket.pos.y);
}
