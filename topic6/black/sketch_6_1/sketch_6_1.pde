/* Visualization of a rotary mass, spring, damper system
 * By Jesse Visse & Jonathan Matarazzi
 */

RotMSDSystem system;

// Create a rotary mass, spring, damper object
void setup() {
  system = new RotMSDSystem(0.2, 50, 10, PI);
  size(1000,1000);
}

// Update and display mass, spring, damper object
void draw() {
  background(255);
  system.update();
  system.display();
}
