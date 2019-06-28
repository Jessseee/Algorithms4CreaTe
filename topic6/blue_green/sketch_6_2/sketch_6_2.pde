System system;

void setup() {
  system = new System(10);
  size(1000,1000);
}

void draw() {
  background(255);
  system.update();
  system.display();
}
