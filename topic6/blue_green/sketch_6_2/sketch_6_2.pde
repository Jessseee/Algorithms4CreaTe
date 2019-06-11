System system;

void setup() {
  system = new System(5);
  size(1000,1000);
}

void draw() {
  background(255);
  system.update();
  system.display();
}
