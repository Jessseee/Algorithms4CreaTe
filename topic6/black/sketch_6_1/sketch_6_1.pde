RotMSDSystem system;

void setup() {
  system = new RotMSDSystem();
  size(1000,1000);
}

void draw() {
  background(255);
  system.update();
  system.display();
}
