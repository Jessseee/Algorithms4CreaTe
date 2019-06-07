RotMSDSystem system;

// Create a mass, spring, damper object
void setup() {
  system = new RotMSDSystem(0.2, 50, 10);
  size(1000,1000);
}

// Update and display mass, spring, damper object
void draw() {
  background(255);
  system.update();
  system.display();
}
